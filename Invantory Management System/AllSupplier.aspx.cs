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
    public partial class AllSupplier : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Invantory;Integrated Security=True");
        SqlDataAdapter da=new SqlDataAdapter();
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            string s = "select * from supplier order by sid";
            da = new SqlDataAdapter(s,con);
            DataSet ds=new DataSet();
            da.Fill(ds);

            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        public void more(object sender, CommandEventArgs e)
        {
            string s = e.CommandName;
            Response.Redirect("SupplierDetails.aspx?sid=" + s);
        }

        public void Link(object sender,CommandEventArgs e)
        {
            string s = "delete from supplier where sid=" + e.CommandName;
            SqlCommand cmd = new SqlCommand(s,con);
            cmd.ExecuteNonQuery();
            Response.Redirect("AllSupplier.aspx");
        }
    }
}