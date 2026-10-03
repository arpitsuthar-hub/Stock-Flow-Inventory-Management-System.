using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inventory_Management_System
{
    public partial class Sell_New : System.Web.UI.Page
    {
        string cs = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Inventory;Integrated Security=True";

        public class SaleItem
        {
            public string productid { get; set; }
            public string productname { get; set; }
            public string brand { get; set; }
            public decimal quantity { get; set; }
            public decimal sellingprice { get; set; }
            public decimal discountpercent { get; set; }
            public decimal grossamount { get; set; }
            public decimal discountamount { get; set; }
            public decimal netamount { get; set; }
        }

        public class BrandPrice
        {
            public string productid { get; set; }
            public string brand { get; set; }
            public decimal price { get; set; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GenerateInvoice();

                TextBoxDate.Text = DateTime.Now.ToString("yyyy-MM-dd");

                LoadCustomers();

                LoadProducts();

                LoadBrandPrice();
            }
        }

        void GenerateInvoice()
        {
            using (SqlConnection con =
                   new SqlConnection(cs))
            {
                con.Open();

                string query = @"
SELECT
    ISNULL(
        MAX(
            CAST(
                SUBSTRING(invoice_id, 5, 10)
                AS INT
            )
        ),
        100
    ) + 1
FROM totalsale
WHERE invoice_id LIKE 'INV-%'";


                using (SqlCommand cmd =
                       new SqlCommand(query, con))
                {
                    int number =
                        Convert.ToInt32(
                            cmd.ExecuteScalar()
                        );

                    TextBoxInvoice.Text =
                        "INV-" + number;
                }
            }
        }

        void LoadCustomers()
        {
            DropList1.Items.Clear();

            DropList1.Items.Add(
                new ListItem(
                    "-- Select Customer --",
                    ""
                )
            );


            using (SqlConnection con =
                   new SqlConnection(cs))
            {
                con.Open();

                string query = @"
SELECT
    cust_id,
    cust_name
FROM customer
ORDER BY cust_name";


                using (SqlCommand cmd =
                       new SqlCommand(query, con))
                {
                    using (SqlDataReader dr =
                           cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            DropList1.Items.Add(
                                new ListItem(
                                    dr["cust_name"].ToString(),
                                    dr["cust_id"].ToString()
                                )
                            );
                        }
                    }
                }
            }
        }

        protected void DropList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string customerid =
                 DropList1.SelectedValue;

            ClearCustomer();

            if (string.IsNullOrEmpty(customerid))
                return;

            LoadCustomerDetails(customerid);
        }

        void LoadCustomerDetails(string customerid)
        {
            using (SqlConnection con =
                  new SqlConnection(cs))
            {
                con.Open();

                string query = @"
SELECT
    cust_name,
    cust_contact,
    cust_address
FROM customer
WHERE cust_id = @cust_id";


                using (SqlCommand cmd =
                       new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue(
                        "@cust_id",
                        customerid
                    );


                    using (SqlDataReader dr =
                           cmd.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            lblCustomerName.Text =
                                dr["cust_name"].ToString();

                            lblCustomerMobile.Text =
                                dr["cust_contact"].ToString();

                            lblCustomerAddress.Text =
                                dr["cust_address"].ToString();
                        }
                    }
                }
            }
        }
        void ClearCustomer()
        {
            lblCustomerName.Text = "-";

            lblCustomerMobile.Text = "-";

            lblCustomerAddress.Text = "-";
        }


        void LoadProducts()
        {
            DropListProduct1.Items.Clear();

            DropListProduct1.Items.Add(
                new ListItem(
                    "-- Select Product --",
                    ""
                )
            );


            using (SqlConnection con =
                   new SqlConnection(cs))
            {
                con.Open();

                string query = @"
SELECT DISTINCT
    pro_name
FROM product
ORDER BY pro_name";


                using (SqlCommand cmd =
                       new SqlCommand(query, con))
                {
                    using (SqlDataReader dr =
                           cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            string productname =
                                dr["pro_name"].ToString();

                            DropListProduct1.Items.Add(
                                new ListItem(
                                    productname,
                                    productname
                                )
                            );
                        }
                    }
                }
            }
        }

        void LoadBrandPrice()
        {
            Dictionary<
                 string,
                 List<BrandPrice>
             > data =
                 new Dictionary<
                     string,
                     List<BrandPrice>
                 >();


            using (SqlConnection con =
                   new SqlConnection(cs))
            {
                con.Open();

                string query = @"
SELECT
    pro_id,
    pro_name,
    pro_brand,
    pro_sellingprice
FROM product
ORDER BY pro_name, pro_brand";


                using (SqlCommand cmd =
                       new SqlCommand(query, con))
                {
                    using (SqlDataReader dr =
                           cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            string productname =
                                dr["pro_name"].ToString();


                            if (!data.ContainsKey(productname))
                            {
                                data.Add(
                                    productname,
                                    new List<BrandPrice>()
                                );
                            }


                            data[productname].Add(
                                new BrandPrice
                                {
                                    productid =
                                        dr["pro_id"].ToString(),

                                    brand =
                                        dr["pro_brand"].ToString(),

                                    price =
                                        Convert.ToDecimal(
                                            dr["pro_sellingprice"]
                                        )
                                }
                            );
                        }
                    }
                }
            }


            JavaScriptSerializer serializer =
                new JavaScriptSerializer();


            HiddenProductBrandPrice.Value =
                serializer.Serialize(data);
        }

        
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('Button2_Click is working!');</script>");
            try
            {
                // ---------------------------------------------
                // BASIC DATA
                // ---------------------------------------------

                string invoiceId =
                    TextBoxInvoice.Text.Trim();

                string customerId =
                    DropList1.SelectedValue;


                // ---------------------------------------------
                // CUSTOMER CHECK
                // ---------------------------------------------

                if (string.IsNullOrEmpty(customerId))
                {
                    ShowMessage(
                        "Please select a customer."
                    );

                    return;
                }


                // ---------------------------------------------
                // INVOICE CHECK
                // ---------------------------------------------

                if (string.IsNullOrEmpty(invoiceId))
                {
                    ShowMessage(
                        "Invoice number is missing."
                    );

                    return;
                }


                // ---------------------------------------------
                // SALE ITEMS CHECK
                // ---------------------------------------------

                if (string.IsNullOrWhiteSpace(
                    HiddenSaleItems.Value))
                {
                    ShowMessage(
                        "Sale items data is empty."
                    );

                    return;
                }


                JavaScriptSerializer serializer =
                    new JavaScriptSerializer();


                List<SaleItem> items =
                    serializer.Deserialize<List<SaleItem>>(
                        HiddenSaleItems.Value
                    );


                if (items == null ||
                    items.Count == 0)
                {
                    ShowMessage(
                        "Please add at least one product."
                    );

                    return;
                }


                // ---------------------------------------------
                // CALCULATE TOTAL
                // ---------------------------------------------

                decimal totalGross = 0;

                decimal totalDiscount = 0;

                decimal totalNet = 0;


                foreach (SaleItem item in items)
                {
                    if (string.IsNullOrWhiteSpace(
                        item.productid))
                    {
                        ShowMessage(
                            "Product ID is missing."
                        );

                        return;
                    }


                    if (string.IsNullOrWhiteSpace(
                        item.productname))
                    {
                        ShowMessage(
                            "Product name is missing."
                        );

                        return;
                    }


                    if (string.IsNullOrWhiteSpace(
                        item.brand))
                    {
                        ShowMessage(
                            "Brand is missing for " +
                            item.productname
                        );

                        return;
                    }


                    if (item.quantity <= 0)
                    {
                        ShowMessage(
                            "Quantity must be greater than 0 for " +
                            item.productname
                        );

                        return;
                    }


                    if (item.sellingprice <= 0)
                    {
                        ShowMessage(
                            "Selling price is missing for " +
                            item.productname
                        );

                        return;
                    }


                    if (item.discountpercent < 0 ||
                        item.discountpercent > 100)
                    {
                        ShowMessage(
                            "Discount must be between 0 and 100."
                        );

                        return;
                    }


                    // Recalculate on server

                    item.grossamount =
                        item.quantity *
                        item.sellingprice;


                    item.discountamount =
                        item.grossamount *
                        item.discountpercent /
                        100;


                    item.netamount =
                        item.grossamount -
                        item.discountamount;


                    totalGross +=
                        item.grossamount;


                    totalDiscount +=
                        item.discountamount;


                    totalNet +=
                        item.netamount;
                }


                DateTime saleDate =
                    DateTime.Now;


                // =================================================
                // DATABASE
                // =================================================

                using (SqlConnection con =
                       new SqlConnection(cs))
                {
                    con.Open();


                    using (SqlTransaction tran =
                           con.BeginTransaction())
                    {
                        try
                        {
                            // =====================================
                            // INSERT TOTAL SALE
                            // =====================================

                            string totalQuery = @"
INSERT INTO totalsale
(
    invoice_id,
    customer_id,
    sale_date,
    totalgross,
    totaldiscount,
    totalnet
)
VALUES
(
    @invoice_id,
    @customerid,
    @saledate,
    @totalgross,
    @totaldiscount,
    @totalnet
)";


                            using (SqlCommand cmd =
                                   new SqlCommand(
                                       totalQuery,
                                       con,
                                       tran))
                            {
                                cmd.Parameters.AddWithValue(
                                    "@invoice_id",
                                    invoiceId
                                );

                                cmd.Parameters.AddWithValue(
                                    "@customerid",
                                    customerId
                                );

                                cmd.Parameters.AddWithValue(
                                    "@saledate",
                                    saleDate
                                );

                                cmd.Parameters.AddWithValue(
                                    "@totalgross",
                                    totalGross
                                );

                                cmd.Parameters.AddWithValue(
                                    "@totaldiscount",
                                    totalDiscount
                                );

                                cmd.Parameters.AddWithValue(
                                    "@totalnet",
                                    totalNet
                                );


                                cmd.ExecuteNonQuery();
                            }


                            // =====================================
                            // EACH PRODUCT
                            // =====================================

                            foreach (SaleItem item in items)
                            {
                                int currentStock = 0;

                                int maxStock = 0;

                                string actualProductName = "";


                                // =================================
                                // GET PRODUCT + STOCK
                                // =================================

                                string stockQuery = @"
SELECT
    p.pro_name,
    p.pro_maxstock,
    s.quantity
FROM product p
INNER JOIN stock s
    ON p.pro_name = s.product_name
WHERE p.pro_id = @productid";


                                using (SqlCommand cmd =
                                       new SqlCommand(
                                           stockQuery,
                                           con,
                                           tran))
                                {
                                    cmd.Parameters.AddWithValue(
                                        "@productid",
                                        item.productid
                                    );


                                    using (SqlDataReader dr =
                                           cmd.ExecuteReader())
                                    {
                                        if (!dr.Read())
                                        {
                                            throw new Exception(
                                                "Stock record not found for product: " +
                                                item.productname
                                            );
                                        }


                                        actualProductName =
                                            dr["pro_name"].ToString();


                                        currentStock =
                                            Convert.ToInt32(
                                                dr["quantity"]
                                            );


                                        maxStock =
                                            Convert.ToInt32(
                                                dr["pro_maxstock"]
                                            );
                                    }
                                }


                                // =================================
                                // CHECK STOCK
                                // =================================

                                int saleQuantity =
                                    Convert.ToInt32(
                                        item.quantity
                                    );


                                if (saleQuantity >
                                    currentStock)
                                {
                                    throw new Exception(
                                        "Insufficient stock for " +
                                        actualProductName +
                                        ". Available: " +
                                        currentStock +
                                        ", Required: " +
                                        saleQuantity
                                    );
                                }


                                int newStock =
                                    currentStock -
                                    saleQuantity;


                                // =================================
                                // STATUS
                                // =================================

                                string status;


                                if (newStock == 0)
                                {
                                    status =
                                        "Unavailable";
                                }
                                else if (
                                    newStock <
                                    maxStock * 0.20)
                                {
                                    status =
                                        "Very Low Stock";
                                }
                                else if (
                                    newStock <
                                    maxStock * 0.40)
                                {
                                    status =
                                        "Low Stock";
                                }
                                else if (
                                    newStock <
                                    maxStock * 0.60)
                                {
                                    status =
                                        "Available";
                                }
                                else
                                {
                                    status =
                                        "Full Stock";
                                }


                                // =================================
                                // UPDATE STOCK
                                // =================================

                                string updateStockQuery = @"
UPDATE stock
SET
    quantity = @quantity,
    status = @status,
    last_update = GETDATE()
WHERE product_name = @product_name";


                                using (SqlCommand cmd =
                                       new SqlCommand(
                                           updateStockQuery,
                                           con,
                                           tran))
                                {
                                    cmd.Parameters.AddWithValue(
                                        "@quantity",
                                        newStock
                                    );

                                    cmd.Parameters.AddWithValue(
                                        "@status",
                                        status
                                    );

                                    cmd.Parameters.AddWithValue(
                                        "@product_name",
                                        actualProductName
                                    );


                                    int result =
                                        cmd.ExecuteNonQuery();


                                    if (result == 0)
                                    {
                                        throw new Exception(
                                            "Stock could not be updated for: " +
                                            actualProductName
                                        );
                                    }
                                }


                                // =================================
                                // INSERT SALE DETAIL
                                // =================================

                                string detailQuery = @"
INSERT INTO allsale
(
    invoice_id,
    customer_id,
    product_name,
    brand,
    quantity,
    selling_price,
    grossamount,
    discountpercent,
    discountamount,
    netamount,
    sale_date
)
VALUES
(
    @invoice_id,
    @customerid,
    @product_name,
    @brand,
    @quantity,
    @sellingprice,
    @grossamount,
    @discountpercent,
    @discountamount,
    @netamount,
    @saledate
)";


                                using (SqlCommand cmd =
                                       new SqlCommand(
                                           detailQuery,
                                           con,
                                           tran))
                                {
                                    cmd.Parameters.AddWithValue(
                                        "@invoice_id",
                                        invoiceId
                                    );

                                    cmd.Parameters.AddWithValue(
                                        "@customerid",
                                        customerId
                                    );

                                    

                                    cmd.Parameters.AddWithValue(
                                        "@product_name",
                                        actualProductName
                                    );

                                    cmd.Parameters.AddWithValue(
                                        "@brand",
                                        item.brand
                                    );

                                    cmd.Parameters.AddWithValue(
                                        "@quantity",
                                        item.quantity
                                    );

                                    cmd.Parameters.AddWithValue(
                                        "@sellingprice",
                                        item.sellingprice
                                    );

                                    cmd.Parameters.AddWithValue(
                                        "@grossamount",
                                        item.grossamount
                                    );

                                    cmd.Parameters.AddWithValue(
                                        "@discountpercent",
                                        item.discountpercent
                                    );

                                    cmd.Parameters.AddWithValue(
                                        "@discountamount",
                                        item.discountamount
                                    );

                                    cmd.Parameters.AddWithValue(
                                        "@netamount",
                                        item.netamount
                                    );

                                    cmd.Parameters.AddWithValue(
                                        "@saledate",
                                        saleDate
                                    );


                                    cmd.ExecuteNonQuery();
                                }
                            }


                            // =====================================
                            // COMMIT
                            // =====================================

                            tran.Commit();
                        }
                        catch
                        {
                            try
                            {
                                tran.Rollback();
                            }
                            catch
                            {
                            }

                            throw;
                        }
                    }
                }


                // =================================================
                // REDIRECT AFTER SUCCESS
                // =================================================

                Response.Redirect(
                    "~/Sell-Bill_Module/Sell_Invoice.aspx?invoice_id=" +
                    Server.UrlEncode(invoiceId),
                    false
                );

                Context.ApplicationInstance.CompleteRequest();
            }
            catch (Exception ex)
            {
                ShowMessage(
                    "Sale could not be saved.\n\n" +
                    ex.Message
                );
            }
        }

        void ShowMessage(string message)
        {
            string safeMessage =
                 HttpUtility.JavaScriptStringEncode(
                     message
                 );


            ScriptManager.RegisterStartupScript(
                this,
                this.GetType(),
                "SaleMessage",
                "alert('" +
                safeMessage +
                "');",
                true
            );
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Sell-Bill_Module/AllSells.aspx");
        }
    }
}