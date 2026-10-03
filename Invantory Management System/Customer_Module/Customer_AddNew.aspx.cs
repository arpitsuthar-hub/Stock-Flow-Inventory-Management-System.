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
    public partial class NewCustomer : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Inventory;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        { 
            if(!IsPostBack)
            {
                CustomerID();

                lblRegisterDate.Text = DateTime.Now.ToString("dd-MM-yyyy");
            }
        }

        private void CustomerID()
        {
            SqlCommand cmd = new SqlCommand("SELECT TOP 1 cust_id FROM customer ORDER BY cust_id DESC", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            string cust_id = "";
            if (ds.Tables[0].Rows.Count == 0)
            {
                cust_id = "CUST-101";
            }
            else
            {
                string old_id = ds.Tables[0].Rows[0][0].ToString();
                int number = Convert.ToInt32(old_id.Replace("CUST-", ""));

                number++;
                cust_id = "CUST-" + number;
            }

            lblCustomerID.Text = cust_id;
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            

            string cust_id = lblCustomerID.Text;

            string gender = "";

            if (RadioButton1.Checked)
            {
                gender = "Male";
            }
            else if (RadioButton2.Checked)
            {
                gender = "Female";
            }
            else if (RadioButton3.Checked)
            {
                gender = "Other";
            }

            SqlCommand cmd = new SqlCommand(@"INSERT INTO customer ( cust_id, cust_name, cust_age, cust_gender, cust_contact, cust_address, cust_registerdate ) 
                                            VALUES ( @cust_id, @cust_name, @cust_age, @cust_gender, @cust_contact, @cust_address, @cust_registerdate )", con);
            
            cmd.Parameters.AddWithValue("@cust_id", cust_id); 
            cmd.Parameters.AddWithValue("@cust_name", TextBox2.Text); 
            if (TextBox3.Text == "") 
            { 
                cmd.Parameters.AddWithValue("@cust_age", DBNull.Value); 
            }
            else 
            { 
                cmd.Parameters.AddWithValue("@cust_age", Convert.ToInt32(TextBox3.Text)); 
            }
            cmd.Parameters.AddWithValue("@cust_gender", gender); 
            cmd.Parameters.AddWithValue("@cust_contact", TextBox4.Text); 
            cmd.Parameters.AddWithValue("@cust_address", TextBox5.Text); 
            cmd.Parameters.AddWithValue("@cust_registerdate", DateTime.Now);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            Response.Write("<script>alert('Customer Registered Successfully');</script>");


            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";

            RadioButton1.Checked = false;
            RadioButton2.Checked = false;
            RadioButton3.Checked = false;

            CustomerID();

            lblRegisterDate.Text = DateTime.Now.ToString("dd-MM-yyyy");
             
        }
    }
}