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
    public partial class SearchPurchase : System.Web.UI.Page
    {
        string cs = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Inventory;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HiddenResults();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            HiddenResults();

            string supplier = txtSupplier.Text.Trim();
            string product = txtProduct.Text.Trim();
            string category = txtCategory.Text.Trim();
            string date = txtDate.Text.Trim();

            if (supplier != "")
            {
                SearchBySupplier(supplier);
                return;
            }

            if (product != "")
            {
                SearchByProduct(product);
                return;
            }

            if (category != "")
            {
                SearchByCategory(category);
                return;
            }

            if (date != "")
            {
                SearchByDate(date);
                return;
            }

            pnlInitial.Visible = true;
        }


        private void SearchBySupplier(string supplier)
        {
            string s = @"SELECT 
                    pu.purchaseid,
                    p.pro_id,
                    p.pro_name,
                    p.pro_category,
                    p.pro_unit,
                    pd.quantity,
                    pd.purchaseprice,
                    pd.netamount
                    FROM purchasedetails pd 
                    INNER JOIN purchase pu ON pd.purchaseid = pu.purchaseid
                    INNER JOIN product p ON pd.product_name = p.pro_name
                    INNER JOIN supplier s ON pu.supplierid = s.sup_id
                    WHERE s.sup_name LIKE @supplier ORDER BY pu.purchaseid";

            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlDataAdapter da = new SqlDataAdapter(s, con))
                {
                    da.SelectCommand.Parameters.AddWithValue("@supplier", "%" + supplier + "%");
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvSupplier.DataSource = dt;
                    gvSupplier.DataBind();

                    pnlSupplierResult.Visible = true;
                }
            }
        }

        private void SearchByProduct(string product)
        {
            string p = @"SELECT 
                    pu.purchaseid,
                    p.pro_id,
                    p.pro_name,
                    p.pro_brand,
                    p.pro_category,
                    p.pro_unit,

                    s.sup_id,
                    s.sup_name,

                    pd.quantity,
                    pd.purchaseprice,
                    pd.discountpercent,
                    pd.grossamount,
                    pd.discountamount,
                    pd.netamount

                    FROM purchasedetails pd 
                    INNER JOIN purchase pu ON pd.purchaseid = pu.purchaseid  
                    INNER JOIN product p ON pd.product_name = p.pro_name
                    INNER JOIN supplier s ON pu.supplierid =  s.sup_id
                    WHERE p.pro_name LIKE  @product ORDER BY pu.purchaseid";

            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlDataAdapter da = new SqlDataAdapter(p, con))
                {
                    da.SelectCommand.Parameters.AddWithValue("@product", "%" + product + "%");
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvProduct.DataSource = dt;
                    gvProduct.DataBind();

                    pnlProductResult.Visible = true;
                }
            }
        }

        private void SearchByCategory(string category)
        {
            string c = @"SELECT 
                    p.pro_id,
                    p.pro_name,
                    p.pro_brand,
                    p.pro_category,
                    p.pro_unit,

                    s.sup_id,
                    s.sup_name,

                    pd.quantity,
                    pd.purchaseprice,
                    pd.discountpercent,
                    pd.grossamount,
                    pd.discountamount,
                    pd.netamount
                    FROM purchasedetails pd
                    INNER JOIN product p ON pd.product_name=p.pro_name
                    INNER JOIN purchase pu ON pd.purchaseid=pu.purchaseid
                    INNER JOIN supplier s ON pu.supplierid=s.sup_id
                    WHERE p.pro_category LIKE @category ORDER BY p.pro_id";

            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlDataAdapter da = new SqlDataAdapter(c, con))
                {
                    da.SelectCommand.Parameters.AddWithValue("@category", "%" + category + "%");
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvCategory.DataSource = dt;
                    gvCategory.DataBind();

                    pnlCategoryResult.Visible = true;
                }
            }
        }

        private void SearchByDate(string date)
        {
            string d = @"SELECT 
                    pu.purchaseid,
                    s.sup_id,
                    s.sup_name,
                    pu.category,
                    pu.purchasedate,
                    pu.totalgross,
                    pu.totaldiscount,
                    pu.totalnet
                    FROM purchase pu 
                    INNER JOIN supplier s ON pu.supplierid=s.sup_id
                    WHERE CAST(pu.purchasedate AS DATE)=@date ORDER BY pu.purchaseid";

            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlDataAdapter da = new SqlDataAdapter(d, con))
                {
                    da.SelectCommand.Parameters.AddWithValue("@date",date);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvDate.DataSource = dt;
                    gvDate.DataBind();

                    pnlDateResult.Visible = true;
                }
            }
        }

        private void HiddenResults()
        {
            pnlSupplierResult.Visible = false;
            pnlProductResult.Visible = false;
            pnlCategoryResult.Visible = false;
            pnlDateResult.Visible = false;
            pnlInitial.Visible = false;
        }
    }
}