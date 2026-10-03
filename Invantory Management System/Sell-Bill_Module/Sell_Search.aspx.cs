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
    public partial class Sell_Search : System.Web.UI.Page
    {
        string cs = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Inventory;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        void LoadSales()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                string query = @"
            SELECT
                ts.invoice_id,
                ts.customer_id,
                c.cust_name,
                ts.sale_date,
                ts.totalgross,
                ts.totaldiscount,
                ts.totalnet,
                COUNT(a.invoice_id) AS item_count
            FROM totalsale ts
            LEFT JOIN customer c
                ON ts.customer_id = c.cust_id
            LEFT JOIN allsale a
                ON ts.invoice_id = a.invoice_id
            WHERE 1 = 1";

                if (!string.IsNullOrWhiteSpace(txtSellID.Text))
                {
                    query += " AND ts.invoice_id LIKE @invoice_id";
                }

                if (!string.IsNullOrWhiteSpace(txtCustomer.Text))
                {
                    query += " AND c.cust_name LIKE @cust_name";
                }

                if (!string.IsNullOrWhiteSpace(txtSellDate.Text))
                {
                    query += " AND CAST(ts.sale_date AS DATE) = @sale_date";
                }

                query += @" GROUP BY
        ts.invoice_id,
        ts.customer_id,
        c.cust_name,
        ts.sale_date,
        ts.totalgross,
        ts.totaldiscount,
        ts.totalnet ORDER BY ts.sale_date DESC, ts.invoice_id DESC";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    if (!string.IsNullOrWhiteSpace(txtSellID.Text))
                    {
                        cmd.Parameters.AddWithValue(
                            "@invoice_id",
                            "%" + txtSellID.Text.Trim() + "%"
                        );
                    }

                    if (!string.IsNullOrWhiteSpace(txtCustomer.Text))
                    {
                        cmd.Parameters.AddWithValue(
                            "@cust_name",
                            "%" + txtCustomer.Text.Trim() + "%"
                        );
                    }

                    if (!string.IsNullOrWhiteSpace(txtSellDate.Text))
                    {
                        DateTime selectedDate;

                        if (DateTime.TryParse(txtSellDate.Text, out selectedDate))
                        {
                            cmd.Parameters.AddWithValue(
                                "@sale_date",
                                selectedDate.Date
                            );
                        }
                    }

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
            }
        }

        protected void btnSearch_Click1(object sender, EventArgs e)
        {
            LoadSales();
        }

        protected void btnClear_Click1(object sender, EventArgs e)
        {
            txtCustomer.Text = "";
            txtSellID.Text = "";
            txtSellDate.Text = "";

            GridView1.DataSource = null;
            GridView1.DataBind();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName =="ViewInvoice")
            {
                string invoiceid=e.CommandArgument.ToString();

                Response.Redirect("~/Sell-Bill_Module/Sell_Invoice.aspx?invoice_Id="+Server.UrlEncode(invoiceid));
            }
        }
    }
}