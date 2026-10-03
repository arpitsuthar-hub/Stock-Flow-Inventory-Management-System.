using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inventory_Management_System.Supplier_Module
{
    public partial class Supplier_Dashboard : System.Web.UI.Page
    {
        string cs = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Inventory;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                LoadSupplierSummary();
                LoadSupplierCategory();
                LoadRecentSupplier();
            }
        }

        private void LoadSupplierSummary()
        {
            using(SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                string query1 = @"SELECT COUNT(*) FROM supplier";
                using(SqlCommand cmd1 = new SqlCommand(query1, con))
                {
                    lblTotalSuppliers.Text=Convert.ToInt32(cmd1.ExecuteScalar()).ToString();
                }

                string query2 = @"SELECT COUNT(DISTINCT sup_category) FROM supplier
                                 WHERE sup_category IS NOT NULL 
                                 AND LTRIM(RTRIM(sup_category)) <> ''";

                using(SqlCommand cmd2= new SqlCommand(query2, con))
                {
                    lblTotalCategories.Text=Convert.ToInt32(cmd2.ExecuteScalar()).ToString();
                }


                string query3 = @"SELECT COUNT(*) FROM supplier 
                                 WHERE sup_registerdate >= DATEADD(DAY , -2 , GETDATE())";
                using(SqlCommand cmd3= new SqlCommand(query3, con))
                {
                    lblNewSuppliers.Text=Convert.ToInt32(cmd3.ExecuteScalar()).ToString();
                }
            }
        }

        private void LoadSupplierCategory()
        {
            using(SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                string query = @"
                    SELECT TOP 6
                        sup_category,
                        COUNT(*) AS SupplierCount
                    FROM supplier
                    WHERE sup_category IS NOT NULL
                    AND sup_category <> ''
                    GROUP BY sup_category
                    ORDER BY SupplierCount DESC";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds);

                    rptSupplierCategories.DataSource = ds;
                    rptSupplierCategories.DataBind();
                }
            }
        }

        private void LoadRecentSupplier()
        {
            using(SqlConnection conn = new SqlConnection(cs))
            {
                conn.Open();

                string query = @"
                    SELECT TOP 4

                        s.sup_name,

                        s.sup_category,

                        s.sup_registerdate,

                        ISNULL(
                            STUFF(
                                (
                                    SELECT TOP 3
                                        ', ' + sp.product_name

                                    FROM supplier_products sp

                                    WHERE sp.sup_id = s.sup_id

                                    FOR XML PATH('')
                                ),
                                1,
                                2,
                                ''
                            ),
                            'No Products'
                        ) AS products

                    FROM supplier s

                    ORDER BY s.sup_registerdate DESC";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    rptRecentSuppliers.DataSource = dt;
                    rptRecentSuppliers.DataBind();
                }
            }
        }
    }
}