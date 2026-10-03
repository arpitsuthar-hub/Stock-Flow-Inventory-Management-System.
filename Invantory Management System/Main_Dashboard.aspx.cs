using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inventory_Management_System
{ 
    public partial class Main_Dashboard : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Inventory;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();

            LoadDashboard();
        }

        protected void btnAdminLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx?type=Admin");
        }

        protected void btnSupplierLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx?type=Supplier");
        }


        private void LoadDashboard()
        {
            SqlCommand cmd1 = new SqlCommand("SELECT COUNT(*) FROM product", con);
            lblTotalProducts.Text = Convert.ToInt32(cmd1.ExecuteScalar()).ToString();

            SqlCommand cmd2 = new SqlCommand("SELECT COUNT(*) FROM supplier", con);
            lblTotalSuppliers.Text = Convert.ToInt32(cmd2.ExecuteScalar()).ToString();

            SqlCommand cmd3 = new SqlCommand("SELECT COUNT(*) FROM customer", con);
            lblTotalCustomers.Text = Convert.ToInt32(cmd3.ExecuteScalar()).ToString();

            SqlCommand cmd4 = new SqlCommand("SELECT ISNULL(SUM(totalnet), 0) FROM totalsale " +
                                             "WHERE CAST(sale_date AS DATE) = CAST(GETDATE() AS DATE);",con);
            lblTotalSales.Text = Convert.ToInt32(cmd4.ExecuteScalar()).ToString();
        }
    }
}