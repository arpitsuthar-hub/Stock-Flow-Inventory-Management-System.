using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Inventory_Management_System
{
    public partial class Supplier_MySell : System.Web.UI.Page
    {
        string cs = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Inventory;Integrated Security=True";
        SqlDataAdapter da = new SqlDataAdapter(); 
        protected void Page_Load(object sender, EventArgs e) 
        { 
            if (!IsPostBack) 
            {
                if (Session["sup_id"]==null)
                {
                    Response.Redirect("~/Supplier_Master/Supplier_Login.aspx");
                    return;
                }

                LoadTodaysSell();
            } 
        }

        void LoadTodaysSell()
        {
            string supplierid = Session["sup_id"].ToString();
            string query = @"SELECT product_name,
                    brand,
                    quantity,
                    selling_price,
                    grossamount,
                    discountpercent,
                    discountamount,
                    netamount,
                    sell_date 
FROM supplier_sell WHERE sup_id=@sup_id AND sell_date >= CAST(GETDATE() AS DATE)
AND sell_date <= DATEADD(DAY, 1, CAST(GETDATE() AS DATE)) ORDER BY sell_date DESC";

            DataTable dt = GetSales(query, supplierid, "", "");
            GridView1.DataSource = dt;
            GridView1.DataBind();

            CalculateTotals(dt);

            lblResultTitle.Text = "Today's Sales";
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string supplierid = Session["sup_id"].ToString();

            string productname = txtProductName.Text.Trim();
            string datetext = txtDate.Text.Trim();

            string query = @"SELECT product_name,
                    brand,
                    quantity,
                    selling_price,
                    grossamount,
                    discountpercent,
                    discountamount,
                    netamount,
                    sell_date
                FROM supplier_sell
                WHERE sup_id = @sup_id";

            if(!string.IsNullOrEmpty(productname))
            {
                query += @" AND product_name LIKE @product_name";
            }
            if (!string.IsNullOrEmpty(datetext))
            {
                query += @" AND CAST(sell_date AS DATE)=@sell_date";
            }

            query += @" ORDER BY sell_date DESC";

            DataTable dt;

            using(SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@sup_id", supplierid);

                    if(!string.IsNullOrEmpty(productname))
                    {
                        cmd.Parameters.AddWithValue("@product_name","%" + productname + "%");
                    }

                    if(!string.IsNullOrEmpty(datetext))
                    {
                        DateTime searchDate;

                        if(!DateTime.TryParse(datetext ,out searchDate))
                        {
                            ScriptManager.RegisterStartupScript(this, GetType(), "dateerror",
                                "alert('Please Select a valid date');",true);
                            return;
                        }
                        cmd.Parameters.AddWithValue("@sell_date", searchDate);
                    }
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    dt = new DataTable();
                    da.Fill(dt);
                }
            }
            GridView1.DataSource = dt;
            GridView1.DataBind();

            CalculateTotals(dt);

            if(!string.IsNullOrEmpty(productname)  && !string.IsNullOrEmpty(datetext)) 
            {
                DateTime selectDate;

                if(DateTime.TryParse(datetext, out selectDate))
                {
                    lblResultTitle.Text = "Sales -" + productname + "-" + selectDate.ToString("dd-MM-yyyy");
                }
                else
                {
                    lblResultTitle.Text = "Search Result";
                }
            }

            else if(!string.IsNullOrEmpty(productname))
            {
                lblResultTitle.Text ="Sales - " + productname;
            }
            else if(!string.IsNullOrEmpty (datetext))
            {
                DateTime selectedDate;

                if(DateTime.TryParse(datetext,out selectedDate))
                {
                    lblResultTitle.Text = "Sales for " + selectedDate.ToString("dd-MM-yyyy");
                }
                else
                {
                    lblResultTitle.Text = "Search Result";
                }
            }
            else
            {
                lblResultTitle.Text = "All Sales";
            }
        }

        DataTable GetSales(string query,string supplierid,string productName,string dateText)
        {
            DataTable dt = new DataTable();
            using(SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@sup_id",supplierid);

                    if(!string.IsNullOrEmpty(productName))
                    {
                        cmd.Parameters.AddWithValue("@product_name","%" + productName + "%");
                    }

                    if(!string.IsNullOrEmpty(dateText))
                    {
                        DateTime searchDate;

                        if(DateTime.TryParse(dateText,out searchDate))
                        {
                            cmd.Parameters.AddWithValue("@sell_date",searchDate.Date);
                        }
                    }

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                }
            }

            return dt;
        }

        void CalculateTotals(DataTable dt)
        {
            decimal totalgross = 0;
            decimal totaldiscount = 0;
            decimal totalnet = 0;

            foreach (DataRow dr in dt.Rows)
            {
                if (dr["grossamount"]!=DBNull.Value)
                {
                    totalgross += Convert.ToDecimal(dr["grossamount"]);
                }
                if (dr["discountamount"] != DBNull.Value)
                {
                    totaldiscount += Convert.ToDecimal(dr["discountamount"]);
                }
                if (dr["netamount"] != DBNull.Value)
                {
                    totalnet += Convert.ToDecimal(dr["netamount"]);
                }
            }
            lblOverallGross.Text=totalgross.ToString("N2");
            lblOverallDiscount.Text=totaldiscount.ToString("N2");
            lblOverallNet.Text=totalnet.ToString("N2");
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtProductName.Text = "";
            txtDate.Text = "";

        }
    }
}