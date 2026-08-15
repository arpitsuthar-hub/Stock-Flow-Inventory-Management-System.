using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Invantory_Management_System
{
    public partial class Bills : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Invantory;Integrated Security=True");
        SqlDataAdapter da;
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
        }
        protected void LinkButton1_Click1(object sender, EventArgs e)
        {
            string dt = Convert.ToDateTime(TextBox1.Text).ToString("dd-MM-yyyy");
            Response.Redirect("AllBill.aspx?date=" + dt);
        }
    }
}