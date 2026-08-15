using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Invantory_Management_System
{
    public partial class Supplier_MySell : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Invantory;Integrated Security=True");
        SqlDataAdapter da=new SqlDataAdapter();
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open(); 
            int id=Convert.ToInt32(Session["sid"]);
            string s = "select * from purchase where sid=" + id;
            da=new SqlDataAdapter(s,con);
            DataSet ds=new DataSet();
            da.Fill(ds);

            GridView1.DataSource= ds;
            GridView1.DataBind();
        }
    }
}