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
    public partial class Purchase : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Invantory;Integrated Security=True");
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter da = new SqlDataAdapter();
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            Label4.Text=DateTime.Now.ToShortDateString();
            if (!IsPostBack)
            {
                int i;
                string s = "select sid from supplier";
                da = new SqlDataAdapter(s, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                for (i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    DropList1.Items.Add(ds.Tables[0].Rows[i][0].ToString());
                }
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            int qty = Convert.ToInt32(TextBox2.Text);
            int price = Convert.ToInt32(TextBox3.Text);
            int gross = qty * price;
            Label1.Text = gross.ToString();

            int discount = 0;

            if(RadioButton1.Checked)
            {
                discount = 5;
            }
            else if(RadioButton2.Checked)
            {
                discount = 10;
            }
            else if(RadioButton3.Checked)
            {
                discount = 15;
            }
            else if(RadioButton4.Checked)
            {
                discount = 20;
            }

            double disamount=gross * discount/100.0;
            Label2.Text = disamount.ToString();

            double netamount = gross - disamount;
            Label3.Text = netamount.ToString();
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            int discount = 0;
            if (RadioButton1.Checked)
            {
                discount = 5;
            }
            else if (RadioButton2.Checked)
            {
                discount = 10;
            }
            else if (RadioButton3.Checked)
            {
                discount = 15;
            }
            else if (RadioButton4.Checked)
            {
                discount = 20;
            }
            File1.SaveAs(Server.MapPath("~/Links/") + File1.FileName);
            string s = "insert into purchase values(" +
                DropList1.Text + ",'" + 
                TextBox1.Text + "'," + 
                TextBox2.Text + "," + 
                TextBox3.Text + "," +
                discount + "," + 
                Label1.Text + "," + 
                Label2.Text + "," + 
                Label3.Text + ",'" + 
                Label4.Text + "','"+
                File1.FileName+"')";

            cmd = new SqlCommand(s, con);
            cmd.ExecuteNonQuery();

            string item = TextBox1.Text;
            int qty = Convert.ToInt32(TextBox2.Text);

            string check = "select * from stock where item='" + item + "'";
            da = new SqlDataAdapter(check, con);
            DataSet ds=new DataSet();
            da.Fill(ds);


            if (ds.Tables[0].Rows.Count >0)
            {
                string u = "update stock set quantity = quantity + " + qty + 
                    " where item= '" + item + "'";
                cmd= new SqlCommand(u,con);
                cmd.ExecuteNonQuery();
            }
            else
            {
                string n = "insert into stock values('" + item + "'," + qty + ")";
                cmd= new SqlCommand(n,con);
                cmd.ExecuteNonQuery();
            }

            DropList1.SelectedIndex = 0;
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";

            Label1.Text = "";
            Label2.Text = "";
            Label3.Text = "";

            RadioButton1.Checked = false;
            RadioButton2.Checked = false;
            RadioButton3.Checked = false;
            RadioButton4.Checked = false;

            File1.Attributes.Clear();

            Response.Write("<script>alert('Item Purchased Successfully');</script>");
            DropList1.Focus();

        }

        protected void LinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("AllPurchase.aspx");
        }
    }
}