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
    public partial class SearchProduct : System.Web.UI.Page
    {
        string connectionString = @"Data Source=(localdb)\MSSQLLocalDB; Initial Catalog=Inventory; Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pnlProductDetails.Visible = false;
                pnlCategoryResults.Visible = false;

                lblMessage.Text = "";
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchby = ddlSearchBy.SelectedValue;
            string searchvalue = txtSearch.Text.Trim();

            lblMessage.Text = "";

            if (string.IsNullOrEmpty(searchby))
            {
                pnlProductDetails.Visible = false;
                pnlCategoryResults.Visible = false;

                lblMessage.Text = "Please Enter Something To Search.";
                return;
            }
            if (searchby == "ProductID")
            {
                SearchByProductID(searchvalue);
            }
            else if (searchby == "ProductName")
            {
                SearchByProductName(searchvalue);
            }
            else if (searchby == "Category")
            {
                SearchByCategory(searchvalue);
            }
        }

        private void SearchByProductID(string ProductID)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"SELECT pro_id, pro_name, pro_brand, 
                                 pro_category, pro_supplier, pro_unit, 
                                 pro_sellingprice, pro_maxstock, pro_createdate 
                                 FROM product WHERE pro_id = @pro_id";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@pro_id", ProductID);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    DataRow row = ds.Tables[0].Rows[0];

                    lblProductID.Text = row["pro_id"].ToString();
                    lblProductName.Text = row["pro_name"].ToString();
                    lblCategory.Text = row["pro_category"].ToString();
                    lblBrand.Text = row["pro_brand"].ToString();
                    lblUnit.Text = row["pro_unit"].ToString();
                    lblSellingPrice.Text = "₹ " + Convert.ToDecimal(row["pro_sellingprice"]).ToString("N2");
                    lblMinimumStock.Text = row["pro_maxstock"].ToString();

                    pnlProductDetails.Visible = true;
                    pnlCategoryResults.Visible = true;

                    lblMessage.Text = "Product ID Not Found";
                }
            }
        }

        private void SearchByProductName(string ProductName)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string name = @"SELECT pro_id, pro_name, pro_brand, 
                                 pro_category, pro_supplier, pro_unit, 
                                 pro_sellingprice, pro_maxstock, pro_createdate 
                                 FROM product WHERE pro_name LIKE @pro_name ORDER BY pro_name";

                SqlCommand cmd = new SqlCommand(name, con);
                cmd.Parameters.AddWithValue("@pro_name", "%" + ProductName + "%");
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);

                if(ds.Tables[0].Rows.Count > 0)
                {
                    DataRow row = ds.Tables[0].Rows[0];

                    lblProductID.Text = row["pro_id"].ToString();
                    lblProductName.Text = row["pro_name"].ToString();
                    lblCategory.Text = row["pro_category"].ToString();
                    lblBrand.Text = row["pro_brand"].ToString();
                    lblUnit.Text = row["pro_unit"].ToString();
                    lblSellingPrice.Text = "₹ " + Convert.ToDecimal(row["pro_sellingprice"]).ToString("N2");
                    lblMinimumStock.Text = row["pro_maxstock"].ToString();

                    pnlProductDetails.Visible = true;
                    pnlCategoryResults.Visible = true;

                    lblResultCount.Text = "Product Found";
                    lblMessage.Text = "";
                }
                else
                {
                    pnlProductDetails.Visible = false;
                    pnlCategoryResults.Visible = false;

                    lblMessage.Text = "Product name not found.";
                }
            }
        }

        private void SearchByCategory(string Category)
        {
            using(SqlConnection  con = new SqlConnection(connectionString))
            {
                string cat = @"SELECT 
                            pro_id AS ProductID, pro_name AS ProductName, 
                            pro_category AS Category, pro_brand AS Brand, 
                            pro_supplier AS Supplier, pro_unit AS Unit, 
                            pro_sellingprice AS SellingPrice, 
                            pro_maxstock AS MaximumStock, 
                            pro_createdate AS CreateDate 
                            FROM product WHERE pro_category LIKE @pro_category ORDER BY pro_id";

                SqlCommand cmd = new SqlCommand(cat, con);
                cmd.Parameters.AddWithValue("@pro_category","%"+Category+"%");
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);

                if(ds.Tables[0].Rows.Count > 0 )
                {
                    gvCategoryProducts.DataSource = ds.Tables[0];
                    gvCategoryProducts.DataBind();
                    lblCategoryCount.Text = ds.Tables[0].Rows.ToString() + "Product(s) Found";

                    pnlCategoryResults.Visible = true;
                    pnlProductDetails.Visible= false;

                    lblMessage.Text = "";
                }
                else 
                { 
                    pnlCategoryResults.Visible = false; 
                    pnlProductDetails.Visible = false; 

                    lblMessage.Text = "No products found in this category."; 
                }
            }
        }

        protected void gvCategoryProducts_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string productid=e.CommandArgument.ToString();

            if(e.CommandName=="EditProduct")
            {
                Response.Redirect("Product_Edit.aspx?pro_id=" + Server.UrlEncode(productid));
            }

            if(e.CommandName=="DeleteProduct")
            {
                DeleteProduct(productid);

                SearchByCategory(txtSearch.Text.Trim());
            }
        }

        private void DeleteProduct(string productid)
        {
            using(SqlConnection con=new SqlConnection(connectionString))
            {
                string delete = @"DELETE FROM product WHERE pro_id = @pro_id";
                SqlCommand cmd = new SqlCommand(delete, con);
                cmd.Parameters.AddWithValue("@pro_id", productid);

                con.Open(); 
                cmd.ExecuteNonQuery(); 
                con.Close();
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            string productid=lblProductID.Text.Trim();

            if(productid=="" || productid=="-")
            {
                lblMessage.Text = "Please search a product first."; 
                return;
            }

            Response.Redirect("Product_Edit.aspx?pro_id=" + Server.UrlEncode(productid));
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string productid=lblProductID.Text.Trim();

            if(productid == "" || productid =="-")
            {
                lblMessage.Text = "Please search a product first.";
                return;
            }

            DeleteProduct(productid);
            pnlProductDetails.Visible = false; 
            lblMessage.Text = "Product deleted successfully.";
        }
    }
}