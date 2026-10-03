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
    public partial class Customer_Dashboard : System.Web.UI.Page
    {
        string cs = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Inventory;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCustomer();
                LoadRecentCustomer();
                LoadCustomerStatus();
            }
        }

        private void LoadCustomer()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                string total = @"SELECT COUNT(*) FROM customer";
                using (SqlCommand cmd1 = new SqlCommand(total, con))
                {
                    lblTotalCustomers.Text = Convert.ToInt32(cmd1.ExecuteScalar()).ToString();
                }

                string newcust = @"SELECT COUNT(*) FROM customer WHERE cust_registerdate > DATEADD(DAY, -2, GETDATE())";
                using (SqlCommand cmd2 = new SqlCommand(newcust, con))
                {
                    lblNewCustomers.Text = Convert.ToInt32(cmd2.ExecuteScalar()).ToString();
                }

                string regular = @"SELECT COUNT(*) FROM (SELECT customer_id FROM allsale GROUP BY customer_id HAVING COUNT(DISTINCT invoice_id)>1) AS RegularCustomer";
                using (SqlCommand cmd3 = new SqlCommand(regular, con))
                {
                    lblRegularCustomers.Text = Convert.ToInt32(cmd3.ExecuteScalar()).ToString();
                }
            }
        }

        private void LoadRecentCustomer()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                string query = @"SELECT TOP 3 cust_name,cust_contact,cust_registerdate 
                                FROM customer c ORDER BY cust_registerdate DESC";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    rptRecentCustomers.DataSource = dt;
                    rptRecentCustomers.DataBind();
                }
            }
        }

        private void LoadCustomerStatus()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                string totalcustomer = @"SELECT COUNT(*) FROM customer";
                using (SqlCommand cmd1 = new SqlCommand(totalcustomer, con))
                {
                    lblStatusTotalCustomers.Text = Convert.ToInt32(cmd1.ExecuteScalar()).ToString();
                }

                string customerthsmonth = @"SELECT COUNT(*) FROM customer 
                                          WHERE MONTH(cust_registerdate) = MONTH(GETDATE())
                                          AND YEAR(cust_registerdate) = YEAR(GETDATE())";
                using (SqlCommand cmd2 = new SqlCommand(customerthsmonth, con))
                {
                    lblCustomersThisMonth.Text = Convert.ToInt32(cmd2.ExecuteScalar()).ToString();
                }

                string customertoday = @"SELECT COUNT(*) FROM customer
                                         WHERE CAST(cust_registerdate AS DATE) = CAST(GETDATE() AS DATE)";
                using (SqlCommand cmd3 = new SqlCommand(customertoday, con))
                {
                    lblCustomersToday.Text = Convert.ToInt32(cmd3.ExecuteScalar()).ToString();
                }

                string latestcustomer = @"SELECT TOP 1 cust_name FROM customer ORDER BY cust_registerdate DESC";
                using (SqlCommand cmd4 = new SqlCommand(latestcustomer, con))
                {
                    object result = cmd4.ExecuteScalar();
                    if (result != null)
                    {
                        lblLatestCustomer.Text = result.ToString();
                    }
                    else
                    {
                        lblLatestCustomer.Text = "-";
                    }
                }
            }
        }
    }
}