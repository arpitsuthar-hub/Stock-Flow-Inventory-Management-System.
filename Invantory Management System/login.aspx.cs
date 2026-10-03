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
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Inventory;Integrated Security=True");
        SqlDataAdapter da;
        protected void Page_Load(object sender, EventArgs e)
        {

            con.Open();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string type = Request.QueryString["type"];
            if(type =="Admin")
            {
                string s = "select * from login where logid='" + TextBox1.Text + "'and logpassword='" + TextBox2.Text + "'";

                da = new SqlDataAdapter(s, con);
                DataSet ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    Response.Write("<script>alert('Admin Login Successfully');</script>");
                    Response.Redirect("Admin_Dashboard.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid ID Or Password');</script>");
                    TextBox1.Text = "";
                    TextBox2.Text = "";

                    TextBox1.Focus();
                }
            }
            
            else if(type == "Supplier")
            {
                string s1 = "select * from supplier where sup_userid='" + TextBox1.Text + "'and sup_password='" + TextBox2.Text + "'";
                da = new SqlDataAdapter(s1, con);
                DataSet ds1 = new DataSet();
                da.Fill(ds1);

                if (ds1.Tables[0].Rows.Count > 0)
                {
                    Session["sup_id"] = ds1.Tables[0].Rows[0]["sup_id"].ToString();
                    Response.Write("<script>alert('Supplier Login Successfully');</script>");
                    Response.Redirect("~/Supplier_Master/SupplierMaster_Dashboard.aspx?sup_id=" + Session["sup_id"]);
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