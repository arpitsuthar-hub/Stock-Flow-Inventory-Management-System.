using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inventory_Management_System.Supplier_Module
{
    public partial class Supplier_Edit : System.Web.UI.Page
    {
        string cs = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Inventory;Integrated Security=True;";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string supplierid = Request.QueryString["sup_id"];

                if (string.IsNullOrEmpty(supplierid))
                {
                    lblMessage.Text = "Supplier ID not found.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    btnUpdate.Enabled = false;
                    return;
                }

                LoadSupplier(supplierid);
            }
        }

        private void LoadSupplier(string supplierid)
        {
            string s = @"SELECT sup_id,
                    sup_name,
                    sup_age,
                    sup_gender,
                    sup_category,
                    sup_contact,
                    sup_email,
                    sup_address,
                    sup_userid,
                    sup_password
                    FROM supplier WHERE sup_id=@sup_id";

            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand(s, con))
                {
                    cmd.Parameters.AddWithValue("@sup_id", supplierid);

                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.Read())
                    {
                        txtSupplierId.Text = dr["sup_id"].ToString();
                        txtSupplierName.Text = dr["sup_name"].ToString();
                        txtAge.Text = dr["sup_age"].ToString();
                        ddlGender.SelectedValue = dr["sup_gender"].ToString();
                        ddlCategory.SelectedValue = dr["sup_category"].ToString();
                        txtContact.Text = dr["sup_contact"].ToString();
                        txtEmail.Text = dr["sup_email"].ToString();
                        txtAddress.Text = dr["sup_address"].ToString();
                        txtUserId.Text = dr["sup_userid"].ToString();
                        txtPassword.Attributes["value"] = dr["sup_password"].ToString();
                    }
                    else
                    {
                        lblMessage.Text = "Supplier not found.";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        btnUpdate.Enabled = false;
                    }

                    dr.Close();
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtSupplierName.Text))
            {
                lblMessage.Text = "Please enter supplier name.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string query = @"UPDATE supplier SET
                    sup_name = @sup_name,
                    sup_age = @sup_age,
                    sup_gender = @sup_gender,
                    sup_category = @sup_category,
                    sup_contact = @sup_contact,
                    sup_email = @sup_email,
                    sup_address = @sup_address,
                    sup_userid = @sup_userid,
                    sup_password = @sup_password
                    WHERE sup_id=@sup_id";

            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@sup_id", txtSupplierId.Text.Trim());
                    cmd.Parameters.AddWithValue("@sup_name", txtSupplierName.Text.Trim());
                    cmd.Parameters.AddWithValue("@sup_age", txtAge.Text.Trim());
                    cmd.Parameters.AddWithValue("@sup_gender", ddlGender.SelectedValue);
                    cmd.Parameters.AddWithValue("@sup_category", ddlCategory.SelectedValue);
                    cmd.Parameters.AddWithValue("@sup_contact", txtContact.Text.Trim());
                    cmd.Parameters.AddWithValue("@sup_email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@sup_address", txtAddress.Text.Trim());
                    cmd.Parameters.AddWithValue("@sup_userid", txtUserId.Text.Trim());
                    cmd.Parameters.AddWithValue("@sup_password", txtPassword.Text);

                    con.Open();
                    int rows = cmd.ExecuteNonQuery();

                    if (rows > 0)
                    {
                        lblMessage.Text = "Supplier updated successfully.";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                        Response.Redirect("Supplier_Search.aspx");

                    }
                    else
                    {
                        lblMessage.Text = "Supplier could not be updated.";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Supplier_Search.aspx");
        }
    }
}