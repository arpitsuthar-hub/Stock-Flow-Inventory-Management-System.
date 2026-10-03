using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inventory_Management_System.Purchase_Module
{
    public partial class Purchase_Invoice : System.Web.UI.Page
    {
        string cs = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Inventory;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string purchaseid = Request.QueryString["purchaseid"];

                if (string.IsNullOrEmpty(purchaseid))
                {
                    Response.Redirect("<script>alert('Purchase ID Not Found');window.location=AllPurchase.aspx';</script>");
                    return;
                }

                LoadPurchaseInvoice(purchaseid);
                LoadPurchaseProducts(purchaseid);
            }
        }

        void LoadPurchaseInvoice(string purchaseid)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                string query = @"SELECT 
                                 p.purchaseid,p.purchasedate,p.supplierid,p.category,p.totalgross,p.totaldiscount,p.totalnet," +
                                 "s.sup_name,s.sup_contact,s.sup_address FROM purchase p " +
                                 "INNER JOIN supplier s ON p.supplierid = s.sup_id WHERE p.purchaseid=@purchaseid";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@purchaseid", purchaseid);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    lblSupplierName.Text = dr["sup_name"].ToString();
                    lblSupplierPhone.Text = dr["sup_contact"].ToString();
                    lblSupplierAddress.Text = dr["sup_address"].ToString();

                    lblInvoiceNo.Text = dr["purchaseid"].ToString();
                    lblPurchaseId.Text = dr["purchaseid"].ToString();
                    DateTime purchasedate = Convert.ToDateTime(dr["purchasedate"]);
                    lblPurchaseDate.Text = purchasedate.ToString("dd-MM-yyyy");

                    lblSupplierName2.Text = dr["sup_name"].ToString();

                    decimal totalGross = Convert.ToDecimal(dr["totalgross"]);
                    decimal totalDiscount = Convert.ToDecimal(dr["totaldiscount"]);
                    decimal totalNet = Convert.ToDecimal(dr["totalnet"]);

                    lblTotalGross.Text = totalGross.ToString("N2");
                    lblTotalDiscount.Text = totalDiscount.ToString("N2");
                    lblTotalNet.Text = totalNet.ToString("N2");
                }
                else
                {
                    Response.Write("<script>alert('Purchase Not Found');window.location=AllPurchase.aspx;</script>");
                    return;
                }
            }

            LoadTotalPurchase(purchaseid);
        }

        void LoadTotalPurchase(string purchaseid)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                string query = @"SELECT COUNT(*) FROM purchasedetails WHERE purchaseid=@purchaseid";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@purchaseid", purchaseid);

                int totalproducts = Convert.ToInt32(cmd.ExecuteScalar());

                lblTotalProducts.Text = totalproducts.ToString();
            }
        }

        void LoadPurchaseProducts(string purchaseid)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                string query = @"SELECT 
                        p.pro_category AS Category,
                        p.pro_name AS ProductName,
                        p.pro_id AS ProductID,
                        p.pro_brand AS Brand,
                        pd.quantity AS Quantity,
                        p.pro_unit AS Unit,
                        pd.grossamount AS GrossAmount,
                        pd.discountamount AS DiscountAmount,
                        pd.netamount AS NetAmount 

                        FROM purchasedetails pd INNER JOIN product p ON pd.product_name = p.pro_name
                        WHERE pd.purchaseid=@purchaseid ORDER BY p.pro_name";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@purchaseid", purchaseid);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvPurchaseProducts.DataSource = dt;
                gvPurchaseProducts.DataBind();
            }
        }
    }
}