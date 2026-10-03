using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inventory_Management_System.Stock_Module
{
    public partial class Stock_Report : System.Web.UI.Page
    {
        string cs = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Inventory;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtFromDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
                txtToDate.Text = DateTime.Now.ToString("yyyy-MM-dd");

                LoadReport();
            }
        }

        protected void btnGenerateReport_Click(object sender, EventArgs e)
        {
            LoadReport();
        }

        private void LoadReport()
        {
            DateTime fromdate;
            DateTime todate;

            if (!DateTime.TryParse(txtFromDate.Text, out fromdate))
            {
                fromdate = DateTime.Today;
            }
            if (!DateTime.TryParse(txtToDate.Text, out todate))
            {
                todate = DateTime.Today;
            }

            if(fromdate.Date > todate.Date)
            {
                todate = fromdate;
                txtFromDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            }

            DateTime nextdate = todate.Date.AddDays(1);

            DataTable dt = new DataTable();

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"SELECT 'Stock In' AS TransactionType,
                                pd.purchasedetailid AS TransactionID , p.pro_id AS ProductID, 
                                pd.product_name AS ProductName, p.pro_brand AS Brand, pd.quantity AS Quantity, 
                                pd.purchaseprice AS Price, pd.netamount AS TotalAmount, pu.purchasedate AS TransactionDate
                                FROM purchasedetails pd
                                INNER JOIN purchase pu ON pd.purchaseid = pu.purchaseid
                                INNER JOIN product p ON pd.product_name = p.pro_name
                                WHERE pu.purchasedate >= @fromdate AND pu.purchasedate <= @todate";

                if (ddlTransactionType.SelectedValue == "OUT")
                {
                    query += " AND 1 = 0";
                }
                query += @" ORDER BY pu.purchasedate DESC , pd.purchasedetailid DESC";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@fromdate", fromdate.Date);
                    cmd.Parameters.AddWithValue("@todate", todate.Date);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                }
            }

            gvStockReport.DataSource = dt;
            gvStockReport.DataBind();

            CalculateSummary(dt);
        }

        private void CalculateSummary(DataTable dt)
        {
            int TotalTranscation = dt.Rows.Count;
            int stockIn = 0;
            int stockOut = 0;
            int totalQuantity = 0;
            decimal totalAmount = 0;

            foreach (DataRow dr in dt.Rows)
            {
                string transctiontype = dr["TransactionType"].ToString();
                int quantity = 0;
                decimal amount = 0;

                if(dr["Quantity"] !=DBNull.Value)
                {
                     quantity = Convert.ToInt32(dr["Quantity"]);
                }

                if (dr["TotalAmount"] != DBNull.Value)
                {
                    amount = Convert.ToDecimal(dr["TotalAmount"]);
                }

                totalQuantity += quantity;
                totalAmount += amount;

                if (transctiontype == "Stock In")
                { 
                    stockIn++; 
                }
                if (transctiontype == "Stock Out")
                {
                    stockOut++;
                }
            }

            lblTotalTransactions.Text = TotalTranscation.ToString(); 
            lblStockIn.Text = stockIn.ToString(); 
            lblStockOut.Text = stockOut.ToString(); 
            lblCurrentStock.Text = GetCurrentStock().ToString(); 
            lblTotalQuantity.Text = totalQuantity.ToString(); 
            lblTotalAmount.Text = totalAmount.ToString("N2");
        }

        private int GetCurrentStock()
        {
            int totalStock = 0;

            using(SqlConnection con = new SqlConnection(cs))
            {
                string query = @"SELECT ISNULL(SUM(quantity),0) FROM stock";

                using(SqlCommand cmd= new SqlCommand(query, con))
                {
                   con.Open();

                    object result= cmd.ExecuteScalar();
                    if(result != DBNull.Value && result!=null)
                    {
                        totalStock = Convert.ToInt32(result);
                    }
                }
            }
            return totalStock;
        }
    }
}