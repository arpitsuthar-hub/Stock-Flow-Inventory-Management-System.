using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inventory_Management_System
{
    public partial class CustomerDetails : System.Web.UI.Page
    {
        SqlConnection con=new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Invantory;Integrated Security=True");
        SqlDataAdapter da=new SqlDataAdapter();
        protected void Page_Load(object sender, EventArgs e)
        {
            string id=Request.QueryString["cid"];
            string s = "select * from customer where cid=" + id;
            da = new SqlDataAdapter(s, con);
            DataSet ds = new DataSet();
            da.Fill(ds);

            Label1.Text = ds.Tables[0].Rows[0][0].ToString();
            Label2.Text = ds.Tables[0].Rows[0][1].ToString();
            Label3.Text = ds.Tables[0].Rows[0][2].ToString();
            Label4.Text = ds.Tables[0].Rows[0][3].ToString();
            Label5.Text = ds.Tables[0].Rows[0][4].ToString();
            Label6.Text = ds.Tables[0].Rows[0][5].ToString();
            Label7.Text = ds.Tables[0].Rows[0][6].ToString();
            Image1.ImageUrl = "~/Links" + ds.Tables[0].Rows[0][7].ToString();
            Label8.Text = ds.Tables[0].Rows[0][8].ToString();
            Label9.Text = ds.Tables[0].Rows[0][9].ToString();
        }
    }
}