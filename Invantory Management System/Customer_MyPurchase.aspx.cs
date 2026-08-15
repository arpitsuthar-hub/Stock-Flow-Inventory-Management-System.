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
    public partial class Customer_MyPurchase : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Invantory;Integrated Security=True");
        SqlDataAdapter da = new SqlDataAdapter();
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            int id=Convert.ToInt32(Session["cid"]);
            string s = "select * from sell where cid=" + id;
            da=new SqlDataAdapter(s,con);
            DataSet ds = new DataSet();
            da.Fill(ds);        

            Gridview1.DataSource = ds;
            Gridview1.DataBind();   
        }
    }
}