using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inventory_Management_System
{
    public partial class Admin_Dashboard : System.Web.UI.Page
    {
        string cs = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Inventory;Integrated Security=True;";
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                LoadDashboardCount();
            }
        }

        private void LoadDashboardCount()
        {
            using(SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                using(SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM product",con))
                {
                    lblTotalProducts.Text=Convert.ToInt32(cmd.ExecuteScalar()).ToString("N0");
                }
                using (SqlCommand cmd = new SqlCommand(
                    "SELECT COUNT(*) FROM supplier", con))
                {
                    lblTotalSuppliers.Text =
                        Convert.ToInt32(cmd.ExecuteScalar()).ToString("N0");
                }
                using (SqlCommand cmd = new SqlCommand(
                    "SELECT COUNT(*) FROM customer", con))
                {
                    lblTotalCustomers.Text =
                        Convert.ToInt32(cmd.ExecuteScalar()).ToString("N0");
                }
                using (SqlCommand cmd = new SqlCommand(
                    "SELECT COUNT(*) FROM purchase", con))
                {
                    lblTotalPurchases.Text =
                        Convert.ToInt32(cmd.ExecuteScalar()).ToString("N0");
                }
                using (SqlCommand cmd = new SqlCommand(
                    "SELECT COUNT(*) FROM allsale", con))
                {
                    lblTotalSell.Text =
                        Convert.ToInt32(cmd.ExecuteScalar()).ToString("N0");
                }
            }
        }
    }
}