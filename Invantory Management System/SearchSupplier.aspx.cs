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
    public partial class SearchSupplier : System.Web.UI.Page
    {
        
        SqlConnection con = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Invantory;Integrated Security=True");
        SqlDataAdapter da=new SqlDataAdapter();
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string s = "select * from supplier where sid=" + TextBox1.Text;
            da = new SqlDataAdapter(s, con);
            DataSet ds=new DataSet();
            da.Fill(ds);

            if(ds.Tables[0].Rows.Count > 0  )
            {
                Label1.Text = ds.Tables[0].Rows[0][0].ToString();
                Label2.Text = ds.Tables[0].Rows[0][1].ToString();
                Label3.Text = ds.Tables[0].Rows[0][2].ToString();
                Label4.Text = ds.Tables[0].Rows[0][3].ToString();
                Label5.Text = ds.Tables[0].Rows[0][4].ToString();
                Label6.Text = ds.Tables[0].Rows[0][5].ToString();
                Label7.Text = ds.Tables[0].Rows[0][6].ToString();
                Image1.ImageUrl = "~/Links/" + ds.Tables[0].Rows[0][7].ToString();
                Label8.Text = ds.Tables[0].Rows[0][8].ToString();
                Label9.Text = ds.Tables[0].Rows[0][9].ToString();
            }
            else
            {
                Response.Write("<script>alert('Supplier Details Not Found');</script>");
                TextBox1.Text = "";
                TextBox1.Focus();
                Label1.Text = "";
                Label2.Text = "";
                Label3.Text = "";
                Label4.Text = "";
                Label5.Text = "";
                Label6.Text = "";
                Label7.Text = "";
                Image1.Attributes.Clear();
            }
        }
    }
}