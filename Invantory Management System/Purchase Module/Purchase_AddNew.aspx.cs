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
    public partial class Purchase_AddNew : System.Web.UI.Page
    {
        string cs = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Inventory;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GeneratePurchaseID();
                TextBoxDate.Text = DateTime.Now.ToString("yyyy-MM-dd");

                LoadSupplier();
            }
        }


        void GeneratePurchaseID()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                string query = @"
SELECT ISNULL(
MAX(
CAST(SUBSTRING(purchaseid,5,10)AS INT)
),100)+1 FROM purchase
                               WHERE purchaseid LIKE 'PUR-%'";

                SqlCommand cmd = new SqlCommand(query, con);
                int number = Convert.ToInt32(cmd.ExecuteScalar());
                TextBoxPurchase.Text = "PUR-" + number;
            }
        }

        void LoadSupplier()
        {
            DropList1.Items.Clear();

            DropList1.Items.Add("-- Select Supplier --");

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                string query = @"SELECT sup_id, sup_name FROM supplier ORDER BY sup_name";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    DropList1.Items.Add(new System.Web.UI.WebControls.ListItem(
                        dr["sup_name"].ToString(), dr["sup_id"].ToString()
                        ));
                }
            }
        }

        protected void DropListCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            string category = DropListCategory.SelectedValue;

            LoadSupplierByCategory(category);

            LoadProductsByCategory(category);

            ClearSupplier();
        }

        void LoadSupplierByCategory(string category)
        {
            DropList1.Items.Clear();
            DropList1.Items.Add("-- Select Supplier --");

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                string query = @"SELECT sup_id, sup_name FROM supplier 
                                 WHERE sup_category = @sup_category ORDER BY sup_name";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@sup_category", category);
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    DropList1.Items.Add(
                        new System.Web.UI.WebControls.ListItem(
                            dr["sup_name"].ToString(),
                            dr["sup_id"].ToString()
                            ));
                }
            }
        }


        void LoadProduct()
        {
            DropListProduct1.Items.Clear();
            DropListProduct1.Items.Add("-- Select Product --");

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                string query = @"SELECT pro_id, pro_name FROM product ORDER BY pro_name";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    DropListProduct1.Items.Add(
                       new System.Web.UI.WebControls.ListItem(
                           dr["pro_name"].ToString(),
                           dr["pro_id"].ToString()
                           ));
                }
            }
        }


        void LoadProductsByCategory(string category)
        {
            DropListProduct1.Items.Clear();
            DropListProduct1.Items.Add("-- Select Product --");

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                string query = @"SELECT pro_id, pro_name FROM product 
                                 WHERE pro_category=@pro_category ORDER BY pro_name";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@pro_category", category);
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    DropListProduct1.Items.Add(
                        new System.Web.UI.WebControls.ListItem(
                            dr["pro_name"].ToString(),
                            dr["pro_id"].ToString()
                            ));
                }
            }
        }


        protected void DropList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string supplierid = DropList1.SelectedValue;

            ClearSupplier();

            if(string.IsNullOrEmpty(supplierid))
            {
                return;
            }

            LoadSupplierDetails(supplierid);

            LoadProductBrandPrice(supplierid);
        }

        void LoadSupplierDetails(string supplierid)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                string query = @"SELECT sup_name, sup_contact, sup_address FROM supplier WHERE sup_id=@sup_id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@sup_id", supplierid);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    lblSupplierName.Text = dr["sup_name"].ToString();
                    lblSupplierContact.Text = dr["sup_contact"].ToString();
                    lblSupplierAddress.Text = dr["sup_address"].ToString();
                }
            }
        }

        void ClearSupplier()
        {
            lblSupplierName.Text = "--";
            lblSupplierContact.Text = "--";
            lblSupplierAddress.Text = "--";
        }


        void LoadProductBrandPrice(string supplierid)
        {
            Dictionary<string, List<BrandPrice>> data = new Dictionary<string, List<BrandPrice>>();

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                string query = @"SELECT p.pro_id,sp.brand,sp.selling_price FROM product p 
                                 INNER JOIN supplier_products  sp ON p.pro_name=sp.product_name 
                                 WHERE p.pro_supplier=@sup_id ORDER BY p.pro_id,sp.brand";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@sup_id", supplierid);

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            string productId = dr["pro_id"].ToString();


                            if (!data.ContainsKey(productId))
                            {
                                data.Add(productId, new List<BrandPrice>());
                            }
                            data[productId].Add(new BrandPrice
                            {
                                brand = dr["brand"].ToString(),
                                price = Convert.ToDecimal(dr["selling_price"])
                            });
                        }
                    }
                }

            }

            JavaScriptSerializer serializer = new JavaScriptSerializer();
            HiddenProductBrandPrice.Value = serializer.Serialize(data);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                string purchaseid = TextBoxPurchase.Text;
                string data = TextBoxDate.Text;
                string supplierid = DropList1.SelectedValue;
                string category = DropListCategory.SelectedValue;

                decimal totalgross = Convert.ToDecimal(HiddenTotalGross.Value);
                decimal totaldis = Convert.ToDecimal(HiddenTotalDiscount.Value);
                decimal totalnet = Convert.ToDecimal(HiddenTotalNet.Value);

                JavaScriptSerializer serializer = new JavaScriptSerializer();

                List<PurchaseItem> items =
                    serializer.Deserialize<List<PurchaseItem>>(
                        HiddenPurchaseItems.Value
                    );

                int detailnumber;

                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // =====================================================
                    // TRANSACTION
                    // =====================================================

                    SqlTransaction transaction = con.BeginTransaction();

                    try
                    {
                        // =================================================
                        // INSERT PURCHASE
                        // =================================================

                        string query = @"
                    INSERT INTO purchase
                    (
                        purchaseid,
                        purchasedate,
                        supplierid,
                        category,
                        totalgross,
                        totaldiscount,
                        totalnet
                    )
                    VALUES
                    (
                        @purchaseid,
                        @purchasedate,
                        @supplierid,
                        @category,
                        @totalgross,
                        @totaldiscount,
                        @totalnet
                    )";

                        using (SqlCommand cmd = new SqlCommand(query, con, transaction))
                        {
                            cmd.Parameters.AddWithValue("@purchaseid", purchaseid);
                            cmd.Parameters.AddWithValue("@purchasedate", data);
                            cmd.Parameters.AddWithValue("@supplierid", supplierid);
                            cmd.Parameters.AddWithValue("@category", category);
                            cmd.Parameters.AddWithValue("@totalgross", totalgross);
                            cmd.Parameters.AddWithValue("@totaldiscount", totaldis);
                            cmd.Parameters.AddWithValue("@totalnet", totalnet);

                            cmd.ExecuteNonQuery();
                        }


                        // =================================================
                        // GENERATE PURCHASE DETAIL ID
                        // PUCD-101, PUCD-102...
                        // =================================================

                        string idquery = @"
                    SELECT ISNULL(
                        MAX(
                            CAST(
                                SUBSTRING(purchasedetailid, 6, 10)
                                AS INT
                            )
                        ),
                        100
                    ) + 1
                    FROM purchasedetails
                    WHERE purchasedetailid LIKE 'PUCD-%'";

                        using (SqlCommand idcmd =
                            new SqlCommand(idquery, con, transaction))
                        {
                            detailnumber =
                                Convert.ToInt32(idcmd.ExecuteScalar());
                        }


                        // =================================================
                        // INSERT PURCHASE DETAILS
                        // AND UPDATE STOCK
                        // =================================================

                        foreach (PurchaseItem item in items)
                        {
                            string purchasedetailid =
                                "PUCD-" + detailnumber;


                            // =============================================
                            // INSERT PURCHASE DETAILS
                            // =============================================
                            string productname = "";
                            int maximumstock = 0;

                            string productquery = @"SELECT pro_name,pro_maxstock FROM product WHERE pro_id=@pro_id";

                            using (SqlCommand procmd = new SqlCommand(productquery, con, transaction))
                            {
                                procmd.Parameters.AddWithValue("@pro_id", item.productid);

                                using (SqlDataReader dr = procmd.ExecuteReader())
                                {
                                    if (dr.Read())
                                    {
                                        productname = dr["pro_name"].ToString();
                                        maximumstock = Convert.ToInt32(dr["pro_maxstock"]);
                                    }
                                }
                            }


                            string detailquery = @"
                        INSERT INTO purchasedetails
                        (
                            purchasedetailid,
                            purchaseid,
                            product_name,
                            quantity,
                            purchaseprice,
                            discountpercent,
                            grossamount,
                            discountamount,
                            netamount
                        )
                        VALUES
                        (
                            @purchasedetailid,
                            @purchaseid,
                            @product_name,
                            @quantity,
                            @purchaseprice,
                            @discountpercent,
                            @grossamount,
                            @discountamount,
                            @netamount
                        )";

                            using (SqlCommand detailcmd =
                                new SqlCommand(detailquery, con, transaction))
                            {
                                detailcmd.Parameters.AddWithValue(
                                    "@purchasedetailid",
                                    purchasedetailid
                                );

                                detailcmd.Parameters.AddWithValue(
                                    "@purchaseid",
                                    purchaseid
                                );

                                detailcmd.Parameters.AddWithValue(
                                    "@product_name",
                                    productname
                                );

                                detailcmd.Parameters.AddWithValue(
                                    "@quantity",
                                    item.quantity
                                );

                                detailcmd.Parameters.AddWithValue(
                                    "@purchaseprice",
                                    item.purchaseprice
                                );

                                detailcmd.Parameters.AddWithValue(
                                    "@discountpercent",
                                    item.discountpercent
                                );

                                detailcmd.Parameters.AddWithValue(
                                    "@grossamount",
                                    item.grossamount
                                );

                                detailcmd.Parameters.AddWithValue(
                                    "@discountamount",
                                    item.discountamount
                                );

                                detailcmd.Parameters.AddWithValue(
                                    "@netamount",
                                    item.netamount
                                );

                                detailcmd.ExecuteNonQuery();
                            }


                            // =============================================
                            // PURCHASE QUANTITY
                            // =============================================

                            int purchaseQuantity =
                                Convert.ToInt32(item.quantity);

                            // =============================================
                            // INSERT SUPPLIER SELL
                            // =============================================
                            decimal suppliersellingprice = Convert.ToDecimal(item.purchaseprice);
                            decimal suppliergrossamount = Convert.ToDecimal(item.grossamount);
                            decimal supplierdiscountpercent = Convert.ToDecimal(item.discountpercent);
                            decimal supplierDiscountAmount = Convert.ToDecimal(item.discountamount);
                            decimal supplierNetAmount = Convert.ToDecimal(item.netamount);

                            string suppliersell = "INSERT INTO supplier_sell(" +
                                "sup_id,purchaseid,product_name,brand,quantity, selling_price,total_amount," +
                                "grossamount,discountpercent,discountamount,netamount,sell_date)" +
                                "VALUES(" +
                                "@sup_id,@purchaseid,@product_name,@brand,@quantity,@selling_price,@total_amount," +
                                "@grossamount,@discountpercent,@discountamount,@netamount,GETDATE())";

                            using(SqlCommand cmd = new SqlCommand(suppliersell,con,transaction))
                            {
                                cmd.Parameters.AddWithValue("@sup_id", supplierid);
                                cmd.Parameters.AddWithValue("@purchaseid", purchaseid);
                                cmd.Parameters.AddWithValue("@product_name", productname);
                                cmd.Parameters.AddWithValue("@brand", item.brand);
                                cmd.Parameters.AddWithValue("@quantity", purchaseQuantity);
                                cmd.Parameters.AddWithValue("@selling_price", suppliersellingprice);
                                cmd.Parameters.AddWithValue("@total_amount", supplierNetAmount);
                                cmd.Parameters.AddWithValue("@grossamount", suppliergrossamount);
                                cmd.Parameters.AddWithValue("@discountpercent", supplierdiscountpercent);
                                cmd.Parameters.AddWithValue("@discountamount", supplierDiscountAmount);
                                cmd.Parameters.AddWithValue("@netamount", supplierNetAmount);

                                cmd.ExecuteNonQuery();
                            }

                            // =============================================
                            // CHECK WHETHER PRODUCT ALREADY EXISTS
                            // IN STOCKSTOCKSTOCKSTOCK
                            // =============================================

                            string checkStockQuery = @"
                        SELECT COUNT(*)
                        FROM stock
                        WHERE product_name = @product_name";

                            int stockExists;

                            using (SqlCommand stockCheckCmd =
                                new SqlCommand(
                                    checkStockQuery,
                                    con,
                                    transaction))
                            {
                                stockCheckCmd.Parameters.AddWithValue(
                                    "@product_name",
                                    productname
                                );

                                stockExists =
                                    Convert.ToInt32(
                                        stockCheckCmd.ExecuteScalar()
                                    );
                            }


                            // =============================================
                            // EXISTING STOCK
                            // =============================================

                            if (stockExists > 0)
                            {
                                string updateStockQuery = @"
                            UPDATE stock
            SET
                quantity = quantity + @quantity,

                status =
                    CASE
                        WHEN quantity + @quantity = 0
                            THEN 'Unavailable'

                        WHEN quantity + @quantity BETWEEN 1 AND 99
                            THEN 'Very Low Stock'

                        WHEN quantity + @quantity BETWEEN 100 AND 199
                            THEN 'Low Stock'

                        WHEN quantity + @quantity BETWEEN 200 AND 299
                            THEN 'Available'

                        ELSE 'Full Stock'
                    END,

                last_update = GETDATE()

            WHERE product_name = @product_name";

                                using (SqlCommand updateStockCmd =
                                    new SqlCommand(
                                        updateStockQuery,
                                        con,
                                        transaction))
                                {
                                    updateStockCmd.Parameters.AddWithValue(
                                        "@quantity",
                                        purchaseQuantity
                                    );

                                    updateStockCmd.Parameters.AddWithValue(
                                        "@maxstock",
                                        maximumstock
                                    );

                                    updateStockCmd.Parameters.AddWithValue(
                                        "@product_name",
                                        productname
                                    );

                                    updateStockCmd.ExecuteNonQuery();
                                }
                            }


                            // =============================================
                            // NEW STOCK
                            // =============================================

                            else
                            {
                                // Generate STOCK ID

                                string stockIDQuery = @"
                            SELECT ISNULL(
                                MAX(
                                    CAST(
                                        SUBSTRING(stock_id, 7, 10)
                                        AS INT
                                    )
                                ),
                                100
                            ) + 1
                            FROM stock
                            WHERE stock_id LIKE 'STOCK-%'";

                                int stockNumber;

                                using (SqlCommand stockIDCmd =
                                    new SqlCommand(
                                        stockIDQuery,
                                        con,
                                        transaction))
                                {
                                    stockNumber =
                                        Convert.ToInt32(
                                            stockIDCmd.ExecuteScalar()
                                        );
                                }

                                string stockID =
                                    "STOCK-" + stockNumber;


                                // Determine status

                                string status;

                                if (purchaseQuantity == 0)
                                {
                                    status = "Unavailable";
                                }
                                else if (purchaseQuantity >= 1 && purchaseQuantity <= 99)
                                {
                                    status = "Very Low";
                                }
                                else if (purchaseQuantity >= 100 && purchaseQuantity <= 199)
                                {
                                    status = "Low Stock";
                                }
                                else if (purchaseQuantity >= 200 && purchaseQuantity <= 299)
                                {
                                    status = "Available";
                                }
                                else
                                {
                                    status = "Full Stock";
                                }


                                // Insert stock

                                string insertStockQuery = @"
                            INSERT INTO stock
                            (
                                stock_id,
                                product_name,
                                quantity,
                                status,
                                last_update
                            )
                            VALUES
                            (
                                @stock_id,
                                @product_name,
                                @quantity,
                                @status,
                                GETDATE()
                            )";

                                using (SqlCommand insertStockCmd =
                                    new SqlCommand(
                                        insertStockQuery,
                                        con,
                                        transaction))
                                {
                                    insertStockCmd.Parameters.AddWithValue(
                                        "@stock_id",
                                        stockID
                                    );

                                    insertStockCmd.Parameters.AddWithValue(
                                        "@product_name",
                                        productname
                                    );

                                    insertStockCmd.Parameters.AddWithValue(
                                        "@quantity",
                                        purchaseQuantity
                                    );

                                    insertStockCmd.Parameters.AddWithValue(
                                        "@status",
                                        status
                                    );

                                    insertStockCmd.ExecuteNonQuery();
                                }
                            }


                            detailnumber++;
                        }


                        // =================================================
                        // EVERYTHING SUCCESSFUL
                        // =================================================

                        transaction.Commit();
                    }
                    catch
                    {
                        transaction.Rollback();
                        throw;
                    }
                }




                Response.Redirect(
                    "~/Purchase Module/Purchase_Invoice.aspx?purchaseid=" +
                    Server.UrlEncode(purchaseid)
                );
            }
            catch (Exception ex)
            {
                string message = ex.Message
                    .Replace("'", "")
                    .Replace("\r", " ")
                    .Replace("\n", " ");

                Response.Write(
                    "<script>" +
                    "alert('Error: " + message + "');" +
                    "</script>"
                );
            }
        }

        public class BrandPrice
        {
            public string brand { get; set; }
            public decimal price { get; set; }
        }
        public class PurchaseItem
        {
            public string brand { get; set; }
            public string productid { get; set; }
            public string quantity { get; set; }
            public string purchaseprice { get; set; }
            public string discountpercent { get; set; }
            public string grossamount { get; set; }
            public string discountamount { get; set; }
            public string netamount { get; set; }
        }
    }
}