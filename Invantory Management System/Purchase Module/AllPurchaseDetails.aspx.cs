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
    public partial class AllPurchaseDetails : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Inventory;Integrated Security=True");
        SqlDataAdapter da = new SqlDataAdapter();
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            string purchaseid=Request.QueryString["purchaseid"];
            string id = @"SELECT
                pd.purchasedetailid,
                pd.purchaseid,
                p.pro_id,
                p.pro_name,
                p.pro_brand,
                p.pro_category,
                p.pro_unit,
                pd.quantity,
                pd.purchaseprice,
                pd.discountpercent,
                pd.grossamount,
                pd.discountamount,
                pd.netamount 
                FROM purchasedetails pd 
                INNER JOIN product p ON pd.product_name = p.pro_name 
                WHERE pd.purchaseid=@purchaseid ORDER BY purchasedetailid";


            da = new SqlDataAdapter(id,con);
            da.SelectCommand.Parameters.AddWithValue("@purchaseid", purchaseid);
            DataSet ds = new DataSet();
            da.Fill(ds);

            GridView1.DataSource = ds;
            GridView1.DataBind();
            
        }
    }
}