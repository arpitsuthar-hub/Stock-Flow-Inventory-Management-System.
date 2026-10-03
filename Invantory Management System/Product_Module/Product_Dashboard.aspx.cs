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
    public partial class Product_Dashboard : System.Web.UI.Page
    {
        string cs = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Inventory;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                LoadTotalProducts();
                LoadProductCategories();
            }
        }

        private void LoadTotalProducts()
        {
            using(SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                string query1 = @"SELECT COUNT(*) FROM product";
                using(SqlCommand cmd1 = new SqlCommand(query1,con))
                {
                    lblTotalProducts.Text = Convert.ToInt32(cmd1.ExecuteScalar()).ToString();
                    lblStatusTotalProducts.Text=Convert.ToInt32(cmd1.ExecuteScalar()).ToString();
                }

                string query2 = @"SELECT COUNT(DISTINCT pro_category) FROM product 
                                  WHERE pro_category IS NOT NULL AND LTRIM(RTRIM(pro_category)) <> ''";
                using(SqlCommand cmd2 = new SqlCommand(query2,con))
                {
                    lblTotalCategories.Text=Convert.ToInt32(cmd2.ExecuteScalar()).ToString();
                    lblStatusCategories.Text=Convert.ToInt32(cmd2.ExecuteScalar()).ToString();
                }

                string query3 = @"SELECT COUNT(DISTINCT product_name) FROM stock WHERE quantity > 0";
                using(SqlCommand cmd3 = new SqlCommand(query3,con))
                {
                    lblAvailableProducts.Text=Convert.ToInt32(cmd3.ExecuteScalar()).ToString();
                }

                string query4 = @"SELECT ISNULL(SUM(quantity),0) FROM stock";
                using(SqlCommand cmd4 = new SqlCommand(query4 ,con))
                {
                    lblStatusAvailableProducts.Text=Convert.ToInt32(cmd4 .ExecuteScalar()).ToString();
                }

                string query5 = @"SELECT COUNT(*) FROM stock WHERE status IN('Low Stock','Very Low','Very Low Stock')";
                using(SqlCommand cmd5 = new SqlCommand(query5 ,con))
                {
                    lblStatusLowStockProducts.Text=Convert.ToInt32(cmd5.ExecuteScalar()).ToString();
                }
            } 
        }

        private void LoadProductCategories()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                string query = @"SELECT p.pro_category , SUM(ISNULL(st.quantity, 0)) AS TotalQuantity FROM product p
                               LEFT JOIN stock st ON p.pro_name=st.product_name
                               WHERE p.pro_category IS NOT NULL AND p.pro_category <> '' 
                               GROUP BY p.pro_category ORDER BY TotalQuantity DESC";

                using(SqlCommand cmd = new SqlCommand(query,con))
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds);

                    rptProductCategories.DataSource = ds;
                    rptProductCategories.DataBind();
                }
            }
        }
    }
}