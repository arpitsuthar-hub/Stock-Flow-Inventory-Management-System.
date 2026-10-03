using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Inventory_Management_System.Stock_Module
{
    public partial class Stock_Low : System.Web.UI.Page
    {
        string cs = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Inventory;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStockLow();
            }
        }

        private void LoadStockLow()
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
                            WHEN ISNULL(st.quantity, 0) = 0
                                THEN 'Unavailable'

                            WHEN ISNULL(st.quantity, 0) < 20
                                THEN 'Very Low Stock'

                            WHEN ISNULL(st.quantity, 0) <=50
                                THEN 'Low Stock'

                        END AS status,

                        ISNULL(st.last_update, GETDATE()) AS last_update

                    FROM product p

                    LEFT JOIN stock st
                        ON p.pro_name = st.product_name

                    WHERE
                        ISNULL(st.quantity, 0) <= 12
                        OR
                        (
                            ISNULL(st.quantity, 0) > 12
                            AND ISNULL(st.quantity, 0) < p.pro_maxstock * 0.40
                        )
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

                    gvStockLow.DataSource = dt;
                    gvStockLow.DataBind();

                    LoadSummary(dt);
                }
            }
        }

        private void LoadSummary(DataTable dt)
        {
            int lowStockItems = 0;
            int lowStockQuantity = 0;
            int unavailableItems = 0;

            foreach (DataRow dr in dt.Rows)
            {
                int quantity = Convert.ToInt32(dr["quantity"]);

                string status = dr["status"].ToString();

                if (status == "Very Low Stock" ||
                    status == "Low Stock")
                {
                    lowStockItems++;

                    lowStockQuantity += quantity;
                }

                if (status == "Unavailable")
                {
                    unavailableItems++;
                }
            }

            lblLowStockItems.Text = lowStockItems.ToString();

            lblLowStockQuantity.Text = lowStockQuantity.ToString();

            lblUnavailableItems.Text = unavailableItems.ToString();
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadStockLow();
        }
    }
}