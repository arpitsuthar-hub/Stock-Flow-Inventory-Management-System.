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
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Invantory;Integrated Security=True");
        SqlDataAdapter da;
        protected void Page_Load(object sender, EventArgs e)
        {

            con.Open();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string s = "select * from login where logid='" + TextBox1.Text + "'and logpass='" + TextBox2.Text + "'";

            da = new SqlDataAdapter(s, con);
            DataSet ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                Response.Write("<script>alert('Admin Login Successfully');</script>");
                Response.Redirect("InHome.aspx");
            }
            else
            {
                string s1 = "select * from supplier where userid='" + TextBox1.Text + "'and password='" + TextBox2.Text + "'";
                da = new SqlDataAdapter(s1, con);
                DataSet ds1 = new DataSet();
                da.Fill(ds1);

                if (ds1.Tables[0].Rows.Count > 0)
                {
                    Session["sid"] = ds1.Tables[0].Rows[0]["sid"].ToString();
                    Response.Write("<script>alert('Supplier Login Successfully');</script>");
                    Response.Redirect("SupplierProfile.aspx?sid=" + Session["sid"]);
                }
                else
                {
                    string s2 = "select * from customer where userid='" + TextBox1.Text + "' and password='" + TextBox2.Text + "'";
                    da=new SqlDataAdapter(s2, con);
                    DataSet ds2=new DataSet();
                    da.Fill(ds2);

                    if(ds2.Tables[0].Rows.Count > 0)
                    {
                        Session["cid"] = ds2.Tables[0].Rows[0]["cid"].ToString();
                        Response.Write("<script>alert('Customer Login Successfully');</script>");
                        Response.Redirect("CustomerProfile.aspx?cid=" + Session["cid"]);
                    }
                    else
                    {
                        Response.Write("<script>alert('Invalid ID Or Password');</script>");
                        TextBox1.Text = "";
                        TextBox2.Text = "";

                        TextBox1.Focus();
                    }
                }
            }
        }
    }
}