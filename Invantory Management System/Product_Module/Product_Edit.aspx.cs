using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inventory_Management_System.Product_Module
{
    public partial class Product_Edit : System.Web.UI.Page
    {
        string connectionString = @"Data Source=(localdb)\MSSQLLocalDB; Initial Catalog=Inventory; Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string productid = Request.QueryString["pro_id"];

                if (!string.IsNullOrEmpty(productid))
                {
                    LoadProduct(productid);
                }
                else
                {
                    lblMessage.Text = "Product ID not found.";
                }
            }
        }

        private void LoadProduct(string productid)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"SELECT 
                                 pro_id, pro_name, pro_brand, pro_category, pro_supplier, 
                                 pro_unit, pro_sellingprice, pro_maxstock, pro_createdate
                                 FROM product WHERE pro_id=@pro_id";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@pro_id", productid);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    DataRow row = ds.Tables[0].Rows[0];

                    txtProductId.Text = row["pro_id"].ToString();
                    txtProductName.Text = row["pro_name"].ToString();
                    txtProductBrand.Text = row["pro_brand"].ToString();

                    string category = row["pro_category"].ToString();

                    if (ddlCategory.Items.FindByValue(category) != null)
                    {
                        ddlCategory.SelectedValue = category;
                    }
                    else
                    {
                        ddlCategory.SelectedIndex = 0;
                    }

                    txtSupplier.Text = row["pro_supplier"].ToString();
                    txtUnit.Text = row["pro_unit"].ToString();
                    txtSellingPrice.Text = row["pro_sellingprice"].ToString();
                    txtMaximumStock.Text = row["pro_maxstock"].ToString();

                    if (row["pro_createdate"] != DBNull.Value)
                    {
                        txtCreateDate.Text = Convert.ToDateTime(row["pro_createdate"]).ToString("dd-MM-yyyy");
                    }
                    lblMessage.Text = "";
                }
                else
                {
                    lblMessage.Text = "Product not found.";
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string productid = txtProductId.Text.Trim();
            string productName = txtProductName.Text.Trim();
            string brand = txtProductBrand.Text.Trim();
            string category = ddlCategory.SelectedValue;
            string supplier = txtSupplier.Text.Trim();
            string unit = txtUnit.Text.Trim();
            string sellingPrice = txtSellingPrice.Text.Trim();
            string maximumStock = txtMaximumStock.Text.Trim();

            if (productid == "")
            {
                lblMessage.Text = "Product ID Is Required";
            }
            if (productName == "")
            { 
                lblMessage.Text = "Please enter Product Name."; 
                return; 
            }
            if (brand == "") 
            { 
                lblMessage.Text = "Please enter Brand."; 
                return; 
            }
            if (category == "") 
            { 
                lblMessage.Text = "Please select Category."; 
                return; 
            }
            if (supplier == "") 
            { 
                lblMessage.Text = "Please enter Supplier."; 
                return; 
            }
            if (unit == "") 
            { 
                lblMessage.Text = "Please enter Unit."; 
                return; 
            }

            decimal price;
            if(!decimal.TryParse(sellingPrice, out price))
            {
                lblMessage.Text = "Please enter a valid Selling Price."; 
                return;
            }

            int ministock;
            if(!int.TryParse(maximumStock, out ministock))
            {
                lblMessage.Text = "Please enter a valid Minimum Stock.";
                return;
            }

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string update = @"UPDATE product SET
                                  pro_name = @pro_name, pro_brand = @pro_brand, 
                                  pro_category = @pro_category, pro_supplier = @pro_supplier, 
                                  pro_unit = @pro_unit, pro_sellingprice = @pro_sellingprice, 
                                  pro_maxstock = @pro_maxstock  WHERE pro_id = @pro_id";

                SqlCommand cmd = new SqlCommand(update, con);

                cmd.Parameters.AddWithValue("@pro_id", productid);
                cmd.Parameters.AddWithValue("@pro_name", productName);
                cmd.Parameters.AddWithValue("@pro_brand", brand);
                cmd.Parameters.AddWithValue("@pro_category", category);
                cmd.Parameters.AddWithValue("@pro_supplier", supplier);
                cmd.Parameters.AddWithValue("@pro_unit", unit);
                cmd.Parameters.AddWithValue("@pro_sellingprice", sellingPrice);
                cmd.Parameters.AddWithValue("@pro_maxstock", ministock);

                con.Open();
                int result = cmd.ExecuteNonQuery();
                con.Close();

                if (result > 0)
                {
                    lblMessage.Text = "Product updated successfully.";
                    Response.Redirect("~/Product_Module/Product_Search.aspx");
                    LoadProduct(productid);
                }
                else
                {
                    lblMessage.Text = "Product could not be updated.";
                }
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string productid = txtProductId.Text.Trim();

            if (productid== "") 
            { 
                lblMessage.Text = "Product ID not found."; 
                return; 
            }

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string delete = @"DELETE FROM product WHERE pro_id=@pro_id";
                SqlCommand cmd = new SqlCommand(delete, con);
                cmd.Parameters.AddWithValue("@pro_id", productid);

                con.Open();
                int result = cmd.ExecuteNonQuery();
                con.Close();

                if(result > 0)
                {
                    Response.Redirect("Product_Search.aspx");
                }
                else
                {
                    lblMessage.Text = "Product could not be deleted.";
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Product_Search.aspx");
        }
    }
}