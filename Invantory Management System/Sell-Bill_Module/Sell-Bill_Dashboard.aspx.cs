using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inventory_Management_System.Sell_Bill_Module
{
    public partial class Sell_Bill_Dashboard : System.Web.UI.Page
    {
        string cs = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Inventory;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                LoadSellBill();
                LoadRecentSales();
            }
        }

        private void LoadSellBill()
        {
            using(SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                string sell = @"SELECT COUNT(*) FROM allsale";
                using(SqlCommand cmd1 = new SqlCommand(sell,con))
                {
                   lblTotalProducts.Text=Convert.ToInt32(cmd1.ExecuteScalar()).ToString();
                }

                string invoice = @"SELECT COUNT(*) FROM totalsale";
                using (SqlCommand cmd2 = new SqlCommand(invoice, con))
                {
                    lblTotalCustomers.Text = Convert.ToInt32(cmd2.ExecuteScalar()).ToString();
                }

                string revenue = @"SELECT ISNULL(SUM(totalnet), 0) FROM totalsale";
                using(SqlCommand cmd3 = new SqlCommand(revenue,con))
                {
                   lblTotalSales.Text=Convert.ToDecimal(cmd3.ExecuteScalar()).ToString();
                }

                string today = @"SELECT COUNT(*) FROM totalsale WHERE CAST(sale_date AS DATE) = CAST(GETDATE() AS DATE)";
                using( SqlCommand cmd4 = new SqlCommand(today,con))
                {
                    lblTodaySales.Text=Convert.ToInt32(cmd4.ExecuteScalar()).ToString();
                }
            }
        }

        
        private void LoadRecentSales()
        {
            using( SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                string recent = @"SELECT TOP 5
                                  t.invoice_id , t.sale_date, t.customer_id AS customer_name, a.product_name , a.quantity , t.totalnet
                                  FROM totalsale t INNER JOIN allsale a ON t.invoice_id = a.invoice_id
                                  ORDER BY sale_date DESC, invoice_id DESC";

                using (SqlCommand cmd = new SqlCommand(recent, con))
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    rptRecentSales.DataSource = dt;
                    rptRecentSales.DataBind();
                }
            }
        }
    }
}