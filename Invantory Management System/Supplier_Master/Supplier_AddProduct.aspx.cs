using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inventory_Management_System.Supplier_Master
{
    public partial class Supplier_AddProduct : System.Web.UI.Page
    {
        string cs = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Inventory;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                LoadProducts();
            }
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "";
            lblMessage.CssClass = "message";

            if (Session["sup_id"]==null)
            {
                lblMessage.Text = "Supplier Session Not Found Please Login Again";
                lblMessage.CssClass = "message error";

                return;
            }

            string supplierID = Session["sup_id"].ToString();

            if(txtProductName.Text.Trim()=="")
            {
                lblMessage.Text = "Please Enter Produt Name";
                lblMessage.CssClass= "message error";

                return;
            }

            if(txtBrand.Text.Trim()=="")
            {
                lblMessage.Text = "Please Enter Brand Name";
                lblMessage.CssClass = "message errror";

                return;
            }

            if(ddlUnit.SelectedValue=="")
            {
                lblMessage.Text = "Please Select Product Unit";
                lblMessage.CssClass = "message error";

                return;
            }

            if(txtQuantity.Text.Trim()=="")
            {
                lblMessage.Text = "Please Enter Product Quantitu";
                lblMessage.CssClass = "message error";

                return;
            }

            int quantity;
            if(!int.TryParse(txtQuantity.Text.Trim(), out quantity))
            {
                lblMessage.Text = "Please Enter A  Valie Product Quantity";
                lblMessage.CssClass = "message error";

                return;
            }

            if(quantity < 0)
            {
                lblMessage.Text = "Quantity Musst Be Greater Than 0 ";
                lblMessage.CssClass = "message error";

                return;
            }

            if(txtSellingPrice.Text.Trim()=="")
            {
                lblMessage.Text = "Please Enter Product Selling Price";
                lblMessage.CssClass = "message error";

                return;
            }

            decimal sellingprice;
            if(!decimal.TryParse(txtSellingPrice.Text.Trim(),out sellingprice))
            {
                lblMessage.Text = "Please Enter A Valid Selling Price";
                lblMessage.CssClass = "message error";

                return;
            }

            if(sellingprice < 0)
            {
                lblMessage.Text = "Sellling Price Must Be Greater Than 0";
                lblMessage.CssClass = "message error";

                return;
            }

            using(SqlConnection con=new SqlConnection(cs))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM supplier_products WHERE sup_id=@sup_id AND " +
                                                "product_name=@product_name AND brand=@brand",con);

                cmd.Parameters.AddWithValue("@sup_id", supplierID);
                cmd.Parameters.AddWithValue("@product_name", txtProductName.Text.Trim());
                cmd.Parameters.AddWithValue("@brand", txtBrand.Text.Trim());

                int count=Convert.ToInt32(cmd.ExecuteScalar());

                if(count > 0)
                {
                    lblMessage.Text = "This product with the same brand already exists.";
                    lblMessage.CssClass = "message error";

                    return;
                }

                string supplierProductId;
                SqlCommand cmd1 = new SqlCommand("SELECT MAX(TRY_CONVERT(INT, SUBSTRING(supplier_product_id,5,LEN(supplier_product_id))))" +
                                                 "FROM supplier_products WHERE supplier_product_id LIKE 'SPR-%'",con);

                object maxId=cmd1.ExecuteScalar();
                int nextnumber;
                if(maxId==DBNull.Value || maxId==null)
                {
                    nextnumber = 101;
                }
                else
                {
                    nextnumber = Convert.ToInt32(maxId) + 1;
                }
                supplierProductId = "SPR-" + nextnumber;

                SqlCommand cmd2 = new SqlCommand("INSERT INTO supplier_products" +
                    "(supplier_product_id,sup_id,product_name,brand,unit,quantity,selling_price,created_date)" +
                    "VALUES (@supplier_product_id,@sup_id,@product_name,@brand,@unit,@quantity,@selling_price,@created_date)", con);

                cmd2.Parameters.AddWithValue("@supplier_product_id", supplierProductId);
                cmd2.Parameters.AddWithValue("@sup_id", supplierID);
                cmd2.Parameters.AddWithValue("@product_name", txtProductName.Text.Trim());
                cmd2.Parameters.AddWithValue("@brand", txtBrand.Text.Trim());
                cmd2.Parameters.AddWithValue("@unit", ddlUnit.SelectedValue);
                cmd2.Parameters.AddWithValue("@quantity", quantity);
                cmd2.Parameters.AddWithValue("@selling_price", sellingprice);
                cmd2.Parameters.AddWithValue("@created_date", DateTime.Now);

                int result=cmd2.ExecuteNonQuery();

                if(result > 0)
                {
                    lblMessage.Text = "Product added successfully.";
                    lblMessage.CssClass = "message success";

                    ClearFields();
                    LoadProducts();
                }
                else
                {
                    lblMessage.Text = "Product Could Not Found.";
                    lblMessage.CssClass = "message error";
                }
            }
        }

        void ClearFields()
        {
            ddlUnit.SelectedIndex = 0;
            txtProductName.Text = "";
            txtBrand.Text = "";
            txtQuantity.Text = "";
            txtSellingPrice.Text = "";
        }

        void LoadProducts()
        {
            if (Session["sup_id"]==null)
            {
                return;
            }

            string supplierID = Session["sup_id"].ToString();

            using(SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("SELECT product_name,brand,unit,quantity,selling_price,created_date " +
                                                "FROM supplier_products WHERE sup_id=@sup_id ORDER BY created_date DESC",con);

                cmd.Parameters.AddWithValue("@sup_id", supplierID);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);

                con.Close();
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ClearFields();

            lblMessage.Text = "";
        }
    }
}