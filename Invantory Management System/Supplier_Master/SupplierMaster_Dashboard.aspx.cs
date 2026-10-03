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
    public partial class SupplierMaster_Dashboard : System.Web.UI.Page
    {
        string cs = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Inventory;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                LoadSupplierDashboard();
            }
        }

        private void LoadSupplierDashboard()
        {
            using(SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                string supplierid = "";
                if(Session[supplierid] != null)
                {
                    supplierid = Session["sup_id"].ToString();
                }
                else
                {
                    supplierid = "SUP-101";
                }

                string supplierquery = @"SELECT sup_id , sup_name FROM supplier WHERE  sup_id='" + supplierid + "'";
                using(SqlCommand  cmd1 = new SqlCommand(supplierquery, con))
                {
                    SqlDataReader dr = cmd1.ExecuteReader();
                    if(dr.Read())
                    {
                        lblSupplierID.Text = dr["sup_id"].ToString();
                        lblSupplierName.Text = dr["sup_name"].ToString();
                    }
                    dr.Close();
                }

                string productquery=@"SELECT COUNT(*) FROM supplier_products WHERE sup_id='"+supplierid+"'";   
                using(SqlCommand cmd2 = new SqlCommand(productquery, con))
                {
                    lblMyProducts.Text=Convert.ToInt32(cmd2.ExecuteScalar()).ToString();
                }

                string stockquery = @"SELECT ISNULL(SUM(quantity), 0)
                    FROM supplier_products
                    WHERE sup_id = '" + supplierid + "'";
                using (SqlCommand cmd3 = new SqlCommand(stockquery, con))
                {
                    lblTotalStock.Text = Convert.ToInt32(cmd3.ExecuteScalar()).ToString();
                }

                string lowstockquery = @"SELECT COUNT(*) FROM supplier_products WHERE sup_id='" + supplierid + "' AND quantity <= 50";
                using( SqlCommand cmd4 = new SqlCommand(lowstockquery, con))
                {
                    lblLowStock.Text=Convert.ToInt32(cmd4.ExecuteScalar()).ToString();
                }

                string recentproduct= @"SELECT TOP 4 product_name,
                        brand,
                        unit,
                        quantity,
                        selling_price FROM supplier_products WHERE sup_id='"+supplierid + "' ORDER BY supplier_product_id DESC";
                using(SqlCommand cmd5 = new SqlCommand(recentproduct, con))
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd5);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    rptRecentProducts.DataSource = dt;
                    rptRecentProducts.DataBind();
                }
            }
        }
    }
}