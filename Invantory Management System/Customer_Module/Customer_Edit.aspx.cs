using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inventory_Management_System.Customer_Module
{
    public partial class Customer_Edit : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Inventory;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string id = Request.QueryString["cust_id"];

                if (!string.IsNullOrEmpty(id))
                {
                    LoadCustomer(id);
                }
                else
                {
                    Response.Redirect("Customer_Search.asxp");
                }
            }
        }
        private void LoadCustomer(string cust_id)
        {
            SqlCommand cmd = new SqlCommand(@"SELECT cust_id, cust_name, cust_age, cust_gender, cust_contact, cust_address, cust_registerdate 
                                              FROM customer WHERE cust_id = @cust_id", con);

            cmd.Parameters.AddWithValue("@cust_id", cust_id);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                DataRow row = ds.Tables[0].Rows[0];

                lblCustomerID.Text = row["cust_id"].ToString(); 
                lblRegisterDate.Text = Convert.ToDateTime(row["cust_registerdate"]).ToString("dd-MM-yyyy");

                txtCustomerName.Text = row["cust_name"].ToString();
                txtAge.Text = row["cust_age"].ToString();
                string gender = row["cust_gender"].ToString();

                if (gender == "Male")
                {
                    rbMale.Checked = true;
                }
                else if (gender == "Female")
                {
                    rbFemale.Checked = true;
                }
                else if(gender == "Other")
                { 
                    rbOther.Checked = false; 
                }

                txtContact.Text = row["cust_contact"].ToString(); 
                txtAddress.Text = row["cust_address"].ToString();
            }

            else
            {
                Response.Write("<script>alert('Customer Not Found')" + "window.location='Customer_Search.aspx';</script>");
            }
        }


        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string cust_id = Request.QueryString["cust_id"]; if (string.IsNullOrEmpty(cust_id)) { Response.Redirect("Customer_Search.aspx"); return; }  string gender = ""; if (rbMale.Checked) { gender = "Male"; } else if (rbFemale.Checked) { gender = "Female"; } else if (rbOther.Checked) { gender = "Other"; } SqlCommand cmd = new SqlCommand( @"UPDATE customer SET cust_name = @cust_name, cust_age = @cust_age, cust_gender = @cust_gender, cust_contact = @cust_contact, cust_address = @cust_address WHERE cust_id = @cust_id", con); cmd.Parameters.AddWithValue( "@cust_id", cust_id ); cmd.Parameters.AddWithValue( "@cust_name", txtCustomerName.Text.Trim() ); cmd.Parameters.AddWithValue( "@cust_age", Convert.ToInt32(txtAge.Text.Trim()) ); cmd.Parameters.AddWithValue( "@cust_gender", gender ); cmd.Parameters.AddWithValue( "@cust_contact", txtContact.Text.Trim() ); cmd.Parameters.AddWithValue( "@cust_address", txtAddress.Text.Trim() ); con.Open(); int result = cmd.ExecuteNonQuery(); con.Close(); if (result > 0) { Response.Write( "<script>alert('Customer Updated Successfully');" + "window.location='Customer_Search.aspx';</script>" ); } else { Response.Write( "<script>alert('Customer Update Failed');</script>" ); }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string cust_id = Request.QueryString["cust_id"]; 

            if (string.IsNullOrEmpty(cust_id)) 
            { 
                Response.Redirect("Customer_Search.aspx"); 
                return; 
            }
            SqlCommand cmd = new SqlCommand("DELETE FROM customer WHERE cust_id = @cust_id", con); 
            cmd.Parameters.AddWithValue("@cust_id", cust_id); 
            con.Open(); 
            int result = cmd.ExecuteNonQuery(); 
            con.Close(); 
            if (result > 0) 
            { 
                Response.Write("<script>alert('Customer Deleted Successfully');" + 
                    "window.location='Customer_Search.aspx';</script>");
            } 
            else 
            {
                Response.Write("<script>alert('Customer Delete Failed');</script>"); 
            }
        }
    }
}