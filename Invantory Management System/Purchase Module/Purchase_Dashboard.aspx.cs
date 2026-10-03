using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inventory_Management_System.Purchase_Module
{
    public partial class Purchase_Dashboard : System.Web.UI.Page
    {
        string cs = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Inventory;Integrated Security=True;";
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                LoadAllPurchases();
                LoadRecentPurchase();
            }
        }

        private void LoadAllPurchases()
        {
            using(SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                string category = @"SELECT COUNT(DISTINCT category) FROM purchase WHERE category IS NOT NULL
                                AND LTRIM(RTRIM(category)) <> ''";
                using (SqlCommand cmd1 = new SqlCommand(category, con))
                {
                    lblTotalCategory.Text = Convert.ToInt32(cmd1.ExecuteScalar()).ToString("N0");
                }

                string product = @"SELECT ISNULL(SUM(quantity),0) FROM purchasedetails";
                using(SqlCommand cmd2 = new SqlCommand(product, con))
                {
                    lblTotalProduct.Text = Convert.ToInt32(cmd2.ExecuteScalar()).ToString("N0");
                }

                string amount = @"SELECT ISNULL(SUM(netamount),0) FROM purchasedetails";
                using(SqlCommand cmd3= new SqlCommand(amount, con))
                {
                    lblTotalAmount.Text = "₹" + Convert.ToInt32(cmd3.ExecuteScalar()).ToString("N0");
                }

                string todays = @"SELECT COUNT(*) FROM purchase WHERE CAST(purchasedate AS DATE) = CAST(GETDATE() AS DATE)";
                using(SqlCommand cmd4 = new SqlCommand(todays, con))
                {
                    lblTodayPurchase.Text = Convert.ToInt32(cmd4.ExecuteScalar()).ToString("N0");
                }
            }
        }

        private void LoadRecentPurchase()
        {
            using(SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                string query = @"SELECT TOP 5
                                 pu.purchaseid, pu.purchasedate, s.sup_name, pd.product_name, pd.quantity, pd.netamount
                                 FROM purchase pu
                                 INNER JOIN purchasedetails pd ON pu.purchaseid = pd.purchaseid
                                 INNER JOIN supplier s ON pu.supplierid=s.sup_id
                                 ORDER BY pu.purchasedate DESC, pu.purchaseid DESC";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    rptRecentPurchases.DataSource = dt;
                    rptRecentPurchases.DataBind();
                }
            }
        }
    }
}