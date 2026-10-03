using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inventory_Management_System.Sell_Bill_Module
{
    public partial class Sell_Invoice : System.Web.UI.Page
    {
        string cs = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Inventory;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string invoiceId = Request.QueryString["invoice_id"];

                if (string.IsNullOrEmpty(invoiceId))
                {
                    ShowMessage("Invoice number is missing.");
                    return;
                }

                LoadInvoice(invoiceId);
            }
        }

        void LoadInvoice(string invoiceId)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                string headerquery = @"SELECT ts.invoice_id,
                                       ts.sale_date,
                                       ts.customer_id,
                                       ts.totalgross,
                                       ts.totaldiscount,
                                       ts.totalnet,

                                       c.cust_name,
                                       c.cust_contact,
                                       c.cust_address
                                       FROM totalsale ts 
                                       LEFT JOIN customer c ON ts.customer_id = c.cust_id
                                       WHERE ts.invoice_id=@invoice_id";

                using (SqlCommand cmd = new SqlCommand(headerquery, con))
                {
                    cmd.Parameters.AddWithValue("@invoice_id", invoiceId);

                    using(SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            lblInvoiceNo.Text = dr["invoice_id"].ToString();
                            if (dr["sale_date"]!=DBNull.Value)
                            {
                                DateTime SaleDate = Convert.ToDateTime(dr["sale_date"]);

                                lblInvoiceDate.Text = SaleDate.ToString();
                                lblCustomerName.Text = GetValue(dr, "cust_name");
                                lblCustomerMobile.Text = GetValue(dr, "cust_contact");
                                lblCustomerAddress.Text = GetValue(dr, "cust_address");

                                lblTotalGross.Text = FormatAmount(dr["totalgross"]);
                                lblTotalDiscount.Text = FormatAmount(dr["totaldiscount"]);
                                lblTotalNet.Text = FormatAmount(dr["totalNet"]);
                            }
                            else
                            {
                                ShowMessage("Invoice not found: "+invoiceId);
                                return;
                            }
                        }
                    }
                }
                LoadSaleProducts(con, invoiceId);
            }
        }

        void LoadSaleProducts(SqlConnection con, string invoiceId)
        {
            string query = @"SELECT product_name,
    brand,
    quantity,
    selling_price,
    grossamount,
    discountpercent,
    discountamount,
    netamount 
FROM allsale WHERE invoice_id=@invoice_id ORDER BY product_name";

            using(SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@invoice_id", invoiceId);

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    if (dt.Rows.Count==0)
                    {
                        ShowMessage("No products found for invoice " + invoiceId);
                        return;
                    }

                    rptSaleItems.DataSource = dt;
                    rptSaleItems.DataBind();
                }
            }
        }

        protected string GetValue(SqlDataReader dr , string column)
        {
            if (dr[column]==DBNull.Value)
            {
                return "-";
            }

            string value = dr[column].ToString();

            if(string.IsNullOrWhiteSpace(value))
            {
                return "-";
            }

            return value;
        }

        protected string FormatAmount(object value)
        {
            if (value == null || value == DBNull.Value)
            {
                return "0.00";
            }

            return Convert.ToDecimal(value).ToString("N2");
        }
        protected string FormatQuantity(object value)
        {
            if(value == null || value == DBNull.Value)
            {
                return "0";
            }

            decimal quantity = Convert.ToDecimal(value);

            return quantity.ToString("0.##");
        }

        protected string FormatDiscount(object value)
        {
            if (value == null || value == DBNull.Value)
            {
                return "0%";
            }

            decimal discount = Convert.ToDecimal(value);

            return discount.ToString("0.##") + "%";
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Sell-Bill_Module/AllSells.aspx");
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "PrintInvoice", "window.print();", true);
        }

        void ShowMessage(string message)
        {
            string safeMessage=Server.HtmlEncode(message);

            ScriptManager.RegisterStartupScript(this, GetType(), "InoiceMessage", 
                                                "alert('" + safeMessage.Replace("'", "\\") + "');", true);
        }
    }
}