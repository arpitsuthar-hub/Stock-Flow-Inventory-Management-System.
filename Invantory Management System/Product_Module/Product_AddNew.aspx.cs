using Inventory_Management_System.Supplier_Master;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inventory_Management_System.Product_Module
{
    public partial class Product_AddNew : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Inventory;Integrated Security=True");
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CreateTable();
                ProductID();
                lblProductDate.Text = DateTime.Now.ToString("dd-MM-yyyy");
                ShowProduct();
            }
        }

        void ProductID()
        {
            con.Open(); cmd = new SqlCommand("SELECT ISNULL(MAX(CAST(SUBSTRING(pro_id,5,LEN(pro_id)) AS INT)),100)+1 AS pro_id FROM product", con);
            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds);
            lblProductID.Text = "PRO-" + ds.Tables[0].Rows[0]["pro_id"].ToString();
            con.Close();
        }
        void CreateTable()
        {
            DataTable dt = new DataTable();

            dt.Columns.Add("Product ID");
            dt.Columns.Add("Product Date");
            dt.Columns.Add("Supplier ID");
            dt.Columns.Add("Supplier");
            dt.Columns.Add("Category");
            dt.Columns.Add("Product Name");
            dt.Columns.Add("Brand");
            dt.Columns.Add("Unit");
            dt.Columns.Add("Purchase Price");
            dt.Columns.Add("Selling Price");
            dt.Columns.Add("Maximum Stock");

            ViewState["ProductTable"] = dt;
        }


        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlSupplier.Items.Clear();
            ddlSupplier.Items.Add(new ListItem("-- Select Supplier --", ""));

            ddlProduct.Items.Clear();
            ddlProduct.Items.Add(new ListItem("-- Select Product --", ""));

            ddlBrand.Items.Clear();
            ddlBrand.Items.Add(new ListItem("-- Select Brand --", ""));

            txtUnit.Text = "";
            txtPurchasePrice.Text = "";

            if (ddlCategory.SelectedValue == "")
            {
                return;
            }

            LoadSupplier();
        }

        void LoadSupplier()
        {
            
            using(SqlConnection con=new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Inventory;Integrated Security=True"))
            {
                string query = @"SELECT sup_id, sup_name FROM supplier WHERE sup_category= @category ORDER BY sup_name";

                cmd=new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@category",ddlCategory.SelectedValue);
                da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);

                ddlSupplier.Items.Clear();
                ddlSupplier.Items.Add(new ListItem("-- Select Supplier --", ""));


                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    string supplierID = dr["sup_id"].ToString();
                    string supplierName = dr["sup_name"].ToString();
                    ddlSupplier.Items.Add(new ListItem(supplierID + "-" + supplierName, supplierID));
                }
            }
        }

        protected void ddlSupplier_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlProduct.Items.Clear();
            ddlProduct.Items.Add(new ListItem("-- Select Product --",""));

            ddlBrand.Items.Clear();
            ddlBrand.Items.Add(new ListItem("-- Select Brand --", ""));

            txtUnit.Text = "";
            txtPurchasePrice.Text = "";

            if(ddlSupplier.SelectedValue  == "")
            {
                return;
            }

            if(ddlCategory.SelectedValue == "")
            {
                return;
            }

            LoadProduct();
        }

        void LoadProduct()
        {
            using (SqlConnection con = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Inventory;Integrated Security=True"))
            {
                string query =@"SELECT DISTINCT product_name FROM supplier_products WHERE sup_id=@sup_id ORDER BY product_name";

                SqlCommand cmd = new SqlCommand(query,con);
                cmd.Parameters.AddWithValue("@sup_id",ddlSupplier.SelectedValue);

                da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);

                ddlProduct.Items.Clear();
                ddlProduct.Items.Add(new ListItem("-- Select Product --", ""));

                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    string productName = dr["product_name"].ToString();
                    ddlProduct.Items.Add(new ListItem(productName, productName));
                }
            }
        }

        protected void ddlProduct_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlBrand.Items.Clear();
            ddlBrand.Items.Add(new ListItem("-- Select Brand --",""));

            txtUnit.Text = "";
            txtPurchasePrice.Text = "";

            if(ddlProduct.SelectedValue == "")
            {
                return;
            }

            LoadBrand();
        }

        void LoadBrand()
        {
            using (SqlConnection con = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Inventory;Integrated Security=True"))
            {
                string query =@"SELECT DISTINCT brand FROM supplier_products WHERE sup_id= @sup_id " +
                               "AND product_name= @product_name ORDER BY brand";

                SqlCommand cmd = new SqlCommand(query,con);
                cmd.Parameters.AddWithValue("@sup_id", ddlSupplier.SelectedValue);
                cmd.Parameters.AddWithValue("@product_name", ddlProduct.SelectedValue);

                da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);

                ddlBrand.Items.Clear();
                ddlBrand.Items.Add(new ListItem("-- Select Brand --", ""));

                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    string brand = dr["brand"].ToString();
                    ddlBrand.Items.Add(new ListItem(brand, brand));
                }
            }
        }

        protected void ddlBrand_SelectedIndexChanged(object sender , EventArgs e)
        {
            txtUnit.Text = "";
            txtPurchasePrice.Text = "";

            if(ddlBrand.SelectedValue == "")
            {
                return;
            }

            LoadProductDetails();
        }

        void LoadProductDetails()
        {
            using (SqlConnection con = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Inventory;Integrated Security=True"))
            {
                string query = @"SELECT unit, selling_price FROM supplier_products WHERE sup_id=@sup_id AND 
                                 product_name= @product_name AND brand=@brand";

                SqlCommand cmd = new SqlCommand(query,con);
                cmd.Parameters.AddWithValue("@sup_id",ddlSupplier.SelectedValue);
                cmd.Parameters.AddWithValue("@product_name",ddlProduct.SelectedValue);
                cmd.Parameters.AddWithValue("@brand",ddlBrand.SelectedValue);

                da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    txtUnit.Text = ds.Tables[0].Rows[0]["unit"].ToString();
                    txtPurchasePrice.Text = ds.Tables[0].Rows[0]["selling_price"].ToString();
                }

            }

        } 
        

        void NextProduct()
        {
            string id = lblProductID.Text.Replace("PRO-", "");
            int number = Convert.ToInt32(id);
            number++;
            lblProductID.Text = "PRO-" + number;
        }

        void ShowProduct()
        {
            DataTable dt = (DataTable)ViewState["ProductTable"];
            productTablebody.InnerHtml = "";
            if (dt == null || dt.Rows.Count == 0)
            {
                productTablebody.InnerHtml =
                    "<tr>" +
                    "<td colspan='10' " +
                    "style='text-align:center; padding:25px; color:#999;'>" +
                    "No products added yet." +
                    "</td>" +
                    "</tr>";
                return;
            }
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                productTablebody.InnerHtml +=
                    "<tr>" +
                    "<td>" + dt.Rows[i]["Product ID"] + "</td>" +
                    "<td>" + dt.Rows[i]["Product Date"] + "</td>" +
                    "<td>" + dt.Rows[i]["Supplier"] + "</td>" +
                    "<td>" + dt.Rows[i]["Category"] + "</td>" +
                    "<td>" + dt.Rows[i]["Product Name"] + "</td>" +
                    "<td>" + dt.Rows[i]["Brand"] + "</td>" +
                    "<td>" + dt.Rows[i]["Unit"] + "</td>" +
                    "<td>₹ " + dt.Rows[i]["Selling Price"] + "</td>" +
                    "<td>" + dt.Rows[i]["Maximum Stock"] + "</td>" +
                    "<td>" +
                    "<button type='button' " + "class='btn-remove' " + "disabled>" + "×" + "</button>" +
                    "</td>" +
                    "</tr>";
            }
        }

        protected void btnAddProduct_Click1(object sender, EventArgs e)
        {
            if (ddlCategory.SelectedValue == "")
            {
                lblMessage.Text = "Please Select Category.";
                return;
            }
            if (ddlSupplier.SelectedValue == "")
            {
                lblMessage.Text = "Please Select Supplier.";
                return;
            }
            if (ddlProduct.SelectedValue == "")
            {
                lblMessage.Text = "Please Enter Product Name.";
                return;
            }
            if (ddlBrand.SelectedValue == "")
            {
                lblMessage.Text = "Please Select Brand.";
                return;
            }
            if (txtUnit.Text.Trim() == "")
            {
                lblMessage.Text = "Product Unit is not available.";
                return;
            }
            if (txtPurchasePrice.Text.Trim() == "")
            {
                lblMessage.Text = "Purchase Price is not available.";
                return;
            }
            if (txtSellingPrice.Text.Trim() == "")
            {
                lblMessage.Text = "Please Enter Selling Price.";
                return;
            }

            decimal sellingprice;
            if (!decimal.TryParse(txtSellingPrice.Text.Trim(), out sellingprice))
            {
                lblMessage.Text = "Please Enter a Valid Selling Price.";
                return;
            }

            if (sellingprice < 0)
            {
                lblMessage.Text = "Selling Price must be greater than 0.";
                return;
            }

            if (txtMaximumStock.Text.Trim() == "")
            {
                lblMessage.Text = "Please Enter Maximum Stock.";
                return;
            }

            int maximumStock;
            if (!int.TryParse(txtMaximumStock.Text.Trim(), out maximumStock))
            {
                lblMessage.Text = "Please Enter a Valid Maximum Stock.";
                return;
            }

            if (maximumStock < 0)
            {
                lblMessage.Text = "Maximum Stock must be greater than 0.";
                return;
            }

            DataTable dt = (DataTable)ViewState["ProductTable"];
            if (dt == null)
            {
                CreateTable();
                dt = (DataTable)ViewState["ProductTable"];
            }

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (dt.Rows[i]["Supplier ID"].ToString() == ddlSupplier.SelectedValue &&
                    dt.Rows[i]["Product Name"].ToString() == ddlProduct.SelectedValue &&
                    dt.Rows[i]["Brand"].ToString() == ddlBrand.SelectedValue)
                {
                    lblMessage.Text = "This product and brand is already added.";
                    return;
                }
            }
            DataRow row = dt.NewRow();

            row["Product ID"] = lblProductID.Text;
            row["Product Date"] = DateTime.Now.ToString("dd-MM-yyyy");
            row["Supplier ID"] = ddlSupplier.SelectedValue;
            row["Supplier"] = ddlSupplier.SelectedItem.Text;
            row["Category"] = ddlCategory.SelectedItem.Text;
            row["Product Name"] = ddlProduct.SelectedValue;
            row["Brand"] = ddlBrand.SelectedValue;
            row["Unit"] = txtUnit.Text;
            row["Purchase Price"] = txtPurchasePrice.Text.Trim();
            row["Selling Price"] = sellingprice.ToString("0.00");
            row["Maximum Stock"] = maximumStock.ToString();

            dt.Rows.Add(row);
            ViewState["ProductTable"] = dt;

            ShowProduct();
            NextProduct();

            ddlProduct.SelectedIndex = 0;
            ddlBrand.Items.Clear();
            ddlBrand.Items.Add(new ListItem("-- Select Brand --", ""));

            txtUnit.Text = "";
            txtPurchasePrice.Text = "";
            txtSellingPrice.Text = "";
            txtMaximumStock.Text = "";

            lblMessage.Text = "Product Added Successfully.";
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            CreateTable();
            ddlCategory.SelectedIndex = 0;

            ddlSupplier.Items.Clear();
            ddlSupplier.Items.Add(new ListItem("-- Select Supplier --", ""));

            ddlProduct.SelectedIndex = 0;
            ddlProduct.Items.Add(new ListItem("-- Select Product --", ""));

            ddlBrand.SelectedIndex = 0;
            ddlBrand.Items.Add(new ListItem("-- Select Brand --", ""));

            txtUnit.Text = "";
            txtPurchasePrice.Text = "";
            txtSellingPrice.Text = "";
            txtMaximumStock.Text = "";

            lblProductDate.Text = DateTime.Now.ToString("dd-MM-yyyy");

            ProductID();
            ShowProduct();

            lblMessage.Text = "";
        }

        protected void btnSaveAll_Click(object sender, EventArgs e)
        {
            DataTable dt = (DataTable)ViewState["ProductTable"];

            if (dt == null || dt.Rows.Count == 0)
            {
                lblMessage.Text = "Please add at least one product.";
                return;
            }
            try
            {
                con.Open();

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    string query = @"INSERT INTO Product " +
                                    "(pro_id, pro_name, pro_brand, " + "pro_category, pro_supplier, " +
                                     "pro_unit, pro_sellingprice, " + "pro_maxstock, pro_createdate) " +
                                    "VALUES " +
                                    "(@pro_id, @pro_name, @pro_brand,@pro_category, @pro_supplier," +
                                     "@pro_unit, @pro_sellingprice,@pro_maxstock, @pro_createdate)";

                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@pro_id", dt.Rows[i]["Product ID"]);
                    cmd.Parameters.AddWithValue("@pro_name", dt.Rows[i]["Product Name"]);
                    cmd.Parameters.AddWithValue("@pro_brand", dt.Rows[i]["Brand"]);
                    cmd.Parameters.AddWithValue("@pro_category", dt.Rows[i]["Category"]);
                    cmd.Parameters.AddWithValue("@pro_supplier", dt.Rows[i]["supplier ID"]);
                    cmd.Parameters.AddWithValue("@pro_unit", dt.Rows[i]["Unit"]);
                    cmd.Parameters.AddWithValue("@pro_sellingprice", dt.Rows[i]["Selling Price"]);
                    cmd.Parameters.AddWithValue("@pro_maxstock", dt.Rows[i]["Maximum Stock"]);
                    cmd.Parameters.AddWithValue("@pro_createdate", DateTime.Now);
                        
                    cmd.ExecuteNonQuery();
                }

                con.Close();

                CreateTable();
                ShowProduct();
                ProductID();
                lblProductDate.Text = DateTime.Now.ToString("dd-MM-yyyy");

                ddlCategory.SelectedIndex = 0;

                ddlSupplier.Items.Clear();
                ddlSupplier.Items.Add(new ListItem("-- Select Supplier --", ""));

                ddlProduct.SelectedIndex = 0;
                ddlProduct.Items.Add(new ListItem("-- Select Product --", ""));

                ddlBrand.SelectedIndex = 0;
                ddlBrand.Items.Add(new ListItem("-- Select Brand --", ""));

                txtUnit.Text = "";
                txtPurchasePrice.Text = "";
                txtSellingPrice.Text = "";
                txtMaximumStock.Text = "";

                lblMessage.Text = "All products saved successfully.";
            }
            catch (Exception ex)
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
                lblMessage.Text = "Error: " + ex.Message;
            }
        }
    }
}