using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Invantory_Management_System
{
    public partial class Main_Dashboard : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Invantory;Integrated Security=True");
        SqlDataAdapter da;
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
        }

        protected void btnAdminLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx?type=Admin");
        }

        protected void btnSupplierLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx?type=Supplier");
        }
    }
}