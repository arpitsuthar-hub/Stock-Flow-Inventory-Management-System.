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
    public partial class SearchCustomer : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Inventory;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {

        }



        protected void Button1_Click2(object sender, EventArgs e)
        {
            string search = TextBox1.Text.Trim();
            if (search == "")
            {
                return;
            }
            if (ddlSearchType.SelectedValue == "ID")
            {
                SqlCommand cmd = new SqlCommand("SELECT cust_id FROM customer WHERE cust_id = @cust_id", con);
                cmd.Parameters.AddWithValue("@cust_id", search);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    Response.Redirect("Customer_Edit.aspx?cust_id=" + search);
                }
                else
                {
                    Response.Write("<script>alert('Customer ID Not Found');</script>");
                }
            }
            else if (ddlSearchType.SelectedValue == "Name")
            {
                SearchByName(search);
            }
        }
        private void SearchByName(string name)
        {
            SqlCommand cmd = new SqlCommand(@"SELECT cust_id, cust_name, cust_age, cust_gender, cust_contact, cust_address, cust_registerdate FROM customer 
                                              WHERE cust_name LIKE @cust_name ORDER BY cust_id DESC", con);

            cmd.Parameters.AddWithValue("@cust_name", "%" + name + "%");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                GridView1.DataSource = ds.Tables[0];
                GridView1.DataBind(); pnlGrid.Visible = true;
                lblResultCount.Text = ds.Tables[0].Rows.Count + " Customers";
                lblMessage.Visible = false;
            }
            else
            {
                pnlGrid.Visible = false;
                lblMessage.Text = "No Customer Found.";
                lblMessage.Visible = true; lblResultCount.Text = "0 Customers";
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditCustomer")
            {
                string cust_id = e.CommandArgument.ToString();
                Response.Redirect("Customer_Edit.aspx?cust_id=" + cust_id);
            }

            if (e.CommandArgument != null && e.CommandName == "DeleteCustomer")
            {
                string cust_id = e.CommandArgument.ToString();
                SqlCommand cmd = new SqlCommand("DELETE FROM customer WHERE cust_id=@cust_id", con);
                cmd.Parameters.AddWithValue("@cust_id", e.CommandArgument.ToString());

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                SearchByName(TextBox1.Text.Trim());

                Response.Write("<script>alert('Customer Deleted Successfully');</script>");
            }
        }


    }
}