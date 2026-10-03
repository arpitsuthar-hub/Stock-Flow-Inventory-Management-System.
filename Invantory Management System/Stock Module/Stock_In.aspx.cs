using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Inventory_Management_System.Stock_Module
{
    public partial class Stock_In : System.Web.UI.Page
    {
        string cs = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Inventory;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStockIn();
            }
        }

        private void LoadStockIn()
        {
            string category = ddlCategory.SelectedValue;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"
                    SELECT
                        p.pro_id,
                        p.pro_name,
                        p.pro_category,
                        p.pro_maxstock,
                        p.pro_sellingprice,

                        ISNULL(st.quantity, 0) AS quantity,

                        CASE


                            WHEN ISNULL(st.quantity, 0) >=100
                            AND ISNULL(st.quantity, 0) <= p.pro_maxstock
                                THEN 'Full Stock'

                            WHEN ISNULL(st.quantity, 0) >=50
                            AND ISNULL(st.quantity, 0) < 100
                                THEN 'Available'

                            ELSE 'Unavailable'
                        END AS status,

                        ISNULL(st.last_update, GETDATE()) AS last_update

                    FROM product p

                    LEFT JOIN stock st
                        ON p.pro_name = st.product_name

                    WHERE
                        ISNULL(st.quantity, 0) >= 50
                        AND ISNULL(st.quantity, 0) <= p.pro_maxstock
                ";

                if (!string.IsNullOrEmpty(category))
                {
                    query += " AND p.pro_category = @category";
                }

                query += " ORDER BY p.pro_id";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    if (!string.IsNullOrEmpty(category))
                    {
                        cmd.Parameters.AddWithValue("@category", category);
                    }

                    SqlDataAdapter da = new SqlDataAdapter(cmd);

                    DataTable dt = new DataTable();

                    da.Fill(dt);

                    gvStockIn.DataSource = dt;
                    gvStockIn.DataBind();

                    LoadSummary(dt);
                }
            }
        }

        private void LoadSummary(DataTable dt)
        {
            int totalStockIn = dt.Rows.Count;
            int totalQuantity = 0;
            int fullStockItems = 0;
            int availableItems = 0;

            foreach (DataRow dr in dt.Rows)
            {
                int quantity = Convert.ToInt32(dr["quantity"]);

                totalQuantity += quantity;

                string status = dr["status"].ToString();

                if (status == "Full Stock")
                {
                    fullStockItems++;
                }

                if (status == "Available")
                {
                    availableItems++;
                }
            }

            lblTotalQuantity.Text = totalQuantity.ToString();

            lblTotalStockIn.Text = totalStockIn.ToString();

            lblFullStockItem.Text = fullStockItems.ToString();
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadStockIn();
        }
    }
}