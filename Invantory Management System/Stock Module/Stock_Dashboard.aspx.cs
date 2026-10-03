using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inventory_Management_System.Stock_Module
{
    public partial class Stock_Dashboard : System.Web.UI.Page
    {
        string cs = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Inventory;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                LoadAllStock();
            }
        }

        private void LoadAllStock()
        {
            using(SqlConnection con =new SqlConnection(cs))
            {
                con.Open();

                string product = @"SELECT COUNT(*) FROM product";
                using(SqlCommand cmd1 = new SqlCommand(product, con))
                {
                    lblTotalProducts.Text = Convert.ToInt32(cmd1.ExecuteScalar()).ToString();
                }

                string stock = @"SELECT ISNULL(SUM(quantity),0) FROM stock";
                using(SqlCommand cmd2 = new SqlCommand(stock, con))
                {
                    lblTotalStock.Text = Convert.ToInt32(cmd2.ExecuteScalar()).ToString();
                }

                string lowstock = @"SELECT COUNT(*) FROM stock WHERE status IN('Low Stock','Very Low','Very Low Stock')";
                using( SqlCommand cmd3 = new SqlCommand(lowstock, con))
                {
                    lblTotalLowStock.Text=Convert.ToInt32(cmd3.ExecuteScalar()).ToString();
                }

                string instock = @"SELECT COUNT(*) FROM stock";
                using(SqlCommand cmd4= new SqlCommand(instock, con))
                {
                    lblInStock.Text=Convert.ToInt32(cmd4.ExecuteScalar()).ToString();
                }

                string stocklow = @"SELECT COUNT(*) FROM stock WHERE status IN('Low Stock','Very Low','Very Low Stock')";
                using(SqlCommand cmd5= new SqlCommand(stocklow, con))
                {
                    lblOverviewLowStock.Text=Convert.ToInt32(cmd5.ExecuteScalar()).ToString();
                }

                string outstock = @"SELECT COUNT(*) FROM stock WHERE quantity=0";
                using(SqlCommand cmd6 =  new SqlCommand(outstock, con))
                {
                    lblOutOfStock.Text=Convert.ToInt32(cmd6.ExecuteScalar()).ToString();
                }
            }
        }
    }
}