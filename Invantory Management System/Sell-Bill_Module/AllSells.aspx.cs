using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inventory_Management_System
{
    public partial class AllSells : System.Web.UI.Page
    {
        string cs = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Inventory;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
           if(!IsPostBack)
            {
                LoadAllSales();
            }
        }

        void LoadAllSales()
        {
            using(SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                string query = @"SELECT DISTINCT ts.invoice_id, ts.customer_id, c.cust_name, 
                                 ts.sale_date, ts.totalgross, ts.totaldiscount, ts.totalnet
                                 FROM totalsale ts 
                                 LEFT JOIN customer c ON ts.customer_id=c.cust_id
                                 LEFT JOIN allsale a ON ts.invoice_id=a.invoice_id
                                 WHERE 1 = 1";
                if(!string.IsNullOrWhiteSpace(txtProductName.Text))
                {
                    query += @" AND a.product_name LIKE @product_name";
                }

                if(!string.IsNullOrWhiteSpace (txtBrand.Text))
                {
                    query += @" AND a.brand LIKE @brand";
                }

                if(!string.IsNullOrWhiteSpace(txtDate.Text))
                {
                    query += @" AND CAST(ts.sale_date AS DATE) = @sale_date";
                }

                query += " ORDER BY ts.sale_date DESC , ts.invoice_id DESC";

                using(SqlCommand cmd = new SqlCommand(query, con))
                {
                    if (!string.IsNullOrWhiteSpace(txtProductName.Text))
                    {
                        cmd.Parameters.AddWithValue("@product_name", "%" + txtProductName.Text.Trim() + "%");
                    }

                    if (!string.IsNullOrWhiteSpace(txtBrand.Text))
                    {
                        cmd.Parameters.AddWithValue("@brand","%"+txtBrand.Text.Trim() + "%");
                    }

                    if (!string.IsNullOrWhiteSpace(txtDate.Text))
                    {
                        DateTime selectedDate;

                        if(DateTime.TryParse(txtDate.Text, out selectedDate))
                        {
                            cmd.Parameters.AddWithValue("@sale_date", selectedDate);
                        }
                    }
                    using(SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadAllSales();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtProductName.Text = "";
            txtBrand.Text = "";
            txtDate.Text = "";
            LoadAllSales();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "ViewInvoice")
            {
                string invoiceId=e.CommandArgument.ToString();

                Response.Redirect("~/Sell-Bill_Module/Sell_Invoice.aspx?invoice_id=" + Server.UrlEncode(invoiceId));
            }
        }
    }
}