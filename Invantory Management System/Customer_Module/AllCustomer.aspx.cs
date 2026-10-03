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
    public partial class AllCustomer : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Inventory;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM customer",con);
            SqlDataAdapter da = new SqlDataAdapter(cmd); 
            DataSet ds = new DataSet();
            da.Fill(ds);

            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "DeleteCustomer")
            {
                string cust_id = e.CommandArgument.ToString();

                DeleteCustomer(cust_id);
            }
        }

        private void DeleteCustomer(string cust_id)
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM customer WHERE cust_id=@cust_id",con);
            cmd.Parameters.AddWithValue("@cust_id", cust_id);

            con.Open();
            int result = cmd.ExecuteNonQuery();
            con.Close();

            if(result > 0)
            {
                Response.Write("<script>alert('Customer Deleted Succesffully');" +
                    "window.location='AllCustomer.aspx';</script>");
            }
            else
            {
                Response.Write("<script>alert('Customer Not Found');</script>");
            }
        }
    }
}