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
    public partial class AllProduct : System.Web.UI.Page
    {
        string connectionString =@"Data Source=(localdb)\MSSQLLocalDB; Initial Catalog=Inventory; Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                LoadTotalProducts();
            }
        }

        private void LoadTotalProducts()
        {
            using(SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"SELECT COUNT(*) FROM product";
                SqlCommand cmd = new SqlCommand(query, con);
                
                con.Open();
                int total = Convert.ToInt32(cmd.ExecuteScalar());
                con.Close();

                lblTotalProducts.Text = total.ToString();
            }
        }

        private void LoadAllProducts()
        {
            using(SqlConnection con = new SqlConnection( connectionString))
            {
                string query = @"SELECT 
                                pro_id AS ProductID, pro_name AS ProductName, pro_category AS Category, pro_brand AS Brand, 
                                pro_unit AS Unit, pro_sellingprice AS SellingPrice, pro_maxstock AS MaximumStock
                                FROM product ORDER BY pro_id";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataSet ds  = new DataSet();
                da.Fill(ds);

                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
        }
        protected void btnTotalProducts_Click(object sender, EventArgs e)
        {
            pnlCategory.Visible = !pnlCategory.Visible;
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            string category = ddlCategory.SelectedValue;

            if (category == "") 
            { 
                lblSelectedCategory.Text = "All Products"; 
                LoadAllProducts(); 
                return; 
            }

            LoadCategoryProduct(category);

            lblSelectedCategory.Text = ddlCategory.SelectedItem.Text;
        }

        private void LoadCategoryProduct(string category)
        {
            using(SqlConnection con = new SqlConnection( connectionString))
            {
                string query = @"SELECT 
                                pro_id AS ProductID, pro_name AS ProductName, pro_category AS Category, 
                                pro_brand AS Brand, pro_unit AS Unit, pro_sellingprice AS SellingPrice, pro_maxstock AS MaximumStock
                                FROM product WHERE pro_category = @pro_category ORDER BY pro_id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@pro_category", category);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds); 

                GridView1.DataSource = ds.Tables[0]; 
                GridView1.DataBind();

            }
        }
    }
}