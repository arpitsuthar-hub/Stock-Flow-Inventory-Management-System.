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
    public partial class AllSupplier : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(
           "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Inventory;Integrated Security=True"
       );

        SqlDataAdapter da = new SqlDataAdapter();

        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();

            string s = "select * from supplier ORDER BY sup_id";
            da = new SqlDataAdapter(s, con);
            DataSet ds = new DataSet();
            da.Fill(ds);

            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        
    }
}