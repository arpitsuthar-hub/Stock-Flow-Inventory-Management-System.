using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inventory_Management_System.Supplier_Master
{
    public partial class Supplier_AllProducts : System.Web.UI.Page
    {
        string cs = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Inventory;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                LoadSupplierProducts("");
            }
        }

        private void LoadSupplierProducts(string searchText)
        {
            if (Session["sup_id"] == null)
            {
                Response.Redirect("~/Supplier_Login.aspx");
                return;
            }

            string supplierid = Session["sup_id"].ToString();

            string query = @"SELECT supplier_product_id, product_name , brand , unit , quantity , selling_price 
                            FROM supplier_products WHERE sup_id=@sup_id 
                            AND(@search ='' OR product_name LIKE '%' + @search + '%' OR brand LIKE '%' + @search + '%')
                            ORDER BY supplier_product_id";

            using(SqlConnection con = new SqlConnection(cs))
            {
                using(SqlCommand cmd =  new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@sup_id", supplierid);
                    cmd.Parameters.AddWithValue("@search", searchText);

                    using(SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        gvProducts.DataSource = dt;
                        gvProducts.DataBind();
                    }
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchText= txtSearch.Text.Trim();
            LoadSupplierProducts(searchText);
        }

        protected void btnClearSearch_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            LoadSupplierProducts("");
        }
    }
}