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
    public partial class NewSupplier : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Invantory;Integrated Security=True");
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter da=new SqlDataAdapter();
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            string s = "select * from supplier order by sid desc";
            da=new SqlDataAdapter(s,con);
            DataSet ds=new DataSet();
            da.Fill(ds);
            if(ds.Tables[0].Rows.Count == 0 )
                TextBox1.Text = "101";
            else
                TextBox1.Text = (Convert.ToInt32(ds.Tables[0].Rows[0][0])+1).ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string g;
            if (RadioButton1.Checked)
            {
                g = "Male";
            }
            else if (RadioButton2.Checked)
            {
                g = "Female";
            }
            else
            {
                g = "Other";
            }
            File1.SaveAs(Server.MapPath("~/Links/") +File1.FileName);
            string n = "insert into supplier values(" + TextBox1.Text + ",'" +
                TextBox2.Text + "'," + TextBox3.Text + ",'" +
                g + "','" + TextBox4.Text + "','" + 
                TextBox5.Text + "','" + TextBox6.Text +"','"+File1.FileName+"','"+
                TextBox7.Text+"','"+TextBox8.Text+"')";

            cmd = new SqlCommand(n, con);
            cmd.ExecuteNonQuery();

            TextBox1.Text=(Convert.ToInt32(TextBox1.Text)+1).ToString();
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
            TextBox8.Text = "";

            RadioButton1.Checked= false;
            RadioButton2.Checked= false;
            RadioButton3.Checked= false;

            File1.Attributes.Clear();

            TextBox2.Focus();
            Response.Write("<script>alert('Supplier Details Saved Successfully');</script>");
        }
    }
}