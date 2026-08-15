using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Invantory_Management_System
{
    public partial class AllBill : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Invantory;Integrated Security=True");
        SqlDataAdapter da;
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            string dt=Request.QueryString["date"];

            string n = "select datesell,cname,cqty,netamount from sell where datesell='" + dt + "'";
            da=new SqlDataAdapter(n,con);
            DataSet ds1=new DataSet();
            da.Fill(ds1);

            GridView1.DataSource = ds1;
            GridView1.DataBind();


            string u = "select datepur,iname,iqty,netamount from purchase where datepur='" + dt + "'";
            da = new SqlDataAdapter(u, con);
            DataSet ds2 = new DataSet();
            da.Fill(ds2);

            GridView2.DataSource = ds2;
            GridView2.DataBind();


            string s = "select sum(netamount) from sell where datesell='" + dt + "'";
            da = new SqlDataAdapter(s, con);
            DataSet ds3 = new DataSet();
            da.Fill(ds3);

            string sell;
            if (ds3.Tables[0].Rows[0][0].ToString() == "")
                sell = "0";
            else
                sell = ds3.Tables[0].Rows[0][0].ToString();

            string s1 = "select sum(netamount) from purchase where datepur='" + dt + "'";
            da = new SqlDataAdapter(s1, con);
            DataSet ds4 = new DataSet();
            da.Fill(ds4);

            string purchase;
            if (ds4.Tables[0].Rows[0][0].ToString() == "")
                purchase = "0";
            else
                purchase = ds4.Tables[0].Rows[0][0].ToString();


            DataTable table= new DataTable();
            table.Columns.Add("Date");
            table.Columns.Add("Total Sell");
            table.Columns.Add("Total Purchase");

            table.Rows.Add(dt, sell, purchase);

            GridView3.DataSource= table;
            GridView3.DataBind();
        }
    }
}