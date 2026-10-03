using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inventory_Management_System.Stock_Module
{
    public partial class Stock_Current : System.Web.UI.Page
    {
        string cs = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Inventory;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCurrentStock();
            }
        }

        private void LoadCurrentStock()
        {
            string category = ddlCategory.SelectedValue;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"SELECT 
                                 p.pro_id, p.pro_name, p.pro_category, p.pro_maxstock, p.pro_sellingprice, 
                                 ISNULL(st.quantity, 0) AS quantity, 
                                 CASE 
                                 WHEN ISNULL(st.quantity, 0) = 0 THEN 'Unavailable' 
                                 WHEN ISNULL(st.quantity, 0) < p.pro_maxstock * 0.20 THEN 'Very Low Stock' 
                                 WHEN ISNULL(st.quantity, 0) < p.pro_maxstock * 0.80 THEN 'Low Stock' 
                                 WHEN ISNULL(st.quantity, 0) < p.pro_maxstock THEN 'Available' 
                                 ELSE 'Full Stock' END AS status, 
                                 ISNULL(st.last_update, GETDATE()) AS last_update 
                                 FROM product p 
                                 LEFT JOIN stock st ON p.pro_name = st.product_name";

                if (!string.IsNullOrEmpty(category))
                {
                    query += " WHERE p.pro_category=@category";
                }
                query += @"
                  ORDER BY p.pro_id";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    if (!string.IsNullOrEmpty(category))
                    {
                        cmd.Parameters.AddWithValue("@category", category);
                    }
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvCurrentStock.DataSource = dt;
                    gvCurrentStock.DataBind();

                    LoadSummary(dt);
                }
            }
        }

        private void LoadSummary(DataTable dt)
        {
            int totalproduct = dt.Rows.Count;
            int totalquantity = 0;
            int lowstockitem = 0;

            foreach (DataRow dr in dt.Rows)
            {
                int quantity = Convert.ToInt32(dr["quantity"]);
                string status = dr["status"].ToString();

                totalquantity += quantity;

                if (status == "Very Low" || status == "Low Stock")
                {
                    lowstockitem++;
                }
            }

            lblTotalProducts.Text = totalproduct.ToString();
            lblTotalQuantity.Text = totalquantity.ToString();
            lblLowStockItems.Text = lowstockitem.ToString();
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadCurrentStock();
        }

    }
}