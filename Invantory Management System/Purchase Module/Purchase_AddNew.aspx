<%@ Page Title="New Purchase"
    Language="C#"
    MasterPageFile="~/Purchase Module/Purchase_Module.Master"
    AutoEventWireup="true"
    CodeBehind="Purchase_AddNew.aspx.cs"
    Inherits="Inventory_Management_System.Purchase_AddNew" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style>

        /* =========================================================
           PURCHASE CONTAINER
           ========================================================= */

        .purchase-container {
            width: 96%;
            margin: 25px auto;
        }


        /* =========================================================
           PAGE TITLE
           ========================================================= */

        .page-title {
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 22px;
            color: #222;
        }


        /* =========================================================
           CARD
           ========================================================= */

        .card {
            background: #fff;
            border-radius: 10px;
            padding: 22px;
            margin-bottom: 20px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
            box-sizing: border-box;
        }


        .card-title {
            font-size: 20px;
            font-weight: 600;
            margin-bottom: 18px;
            color: #333;
        }


        /* =========================================================
           PURCHASE INFORMATION FORM
           ========================================================= */

        .form-row {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 18px;
        }


        .form-group {
            display: flex;
            flex-direction: column;
        }


        .form-group label {
            font-weight: 600;
            margin-bottom: 7px;
            color: #444;
        }


        .form-control,
        .item-input {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
            box-sizing: border-box;
            outline: none;
        }


        .form-control:focus,
        .item-input:focus {
            border-color: #333;
        }


        .readonly-box {
            background: #f3f3f3;
        }


        /* =========================================================
           SUPPLIER INFORMATION
           ========================================================= */

        .supplier-info {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 15px;
            margin-top: 20px;
        }


        .info-box {
            background: #f7f7f7;
            border-radius: 7px;
            padding: 14px;
            border: 1px solid #e2e2e2;
            box-sizing: border-box;
        }


        .info-title {
            font-size: 12px;
            color: #777;
            margin-bottom: 5px;
        }


        .info-value {
            font-size: 15px;
            font-weight: 600;
            color: #222;
            word-break: break-word;
        }


        /* =========================================================
           PURCHASE TABLE
           ========================================================= */

        .table-wrapper {
            width: 100%;
            overflow-x: auto;
        }


        .purchase-table {
            width: 100%;
            border-collapse: collapse;
            min-width: 1250px;
        }


        .purchase-table th {
            background: #222;
            color: #fff;
            padding: 12px 8px;
            text-align: center;
            font-size: 13px;
            white-space: nowrap;
        }


        .purchase-table td {
            padding: 8px;
            border-bottom: 1px solid #ddd;
            vertical-align: middle;
        }


        .purchase-table td:first-child {
            text-align: center;
            font-weight: 600;
        }


        /* =========================================================
           PRODUCT / BRAND / PRICE
           ========================================================= */

        .product-select {
            min-width: 230px;
        }


        .brand-select {
            min-width: 160px;
        }


        .price-input {
            background: #f3f3f3;
            font-weight: 600;
        }


        .calculate-value {
            display: block;
            min-width: 95px;
            text-align: right;
            padding: 10px 8px;
            background: #f5f5f5;
            border-radius: 5px;
            font-weight: 600;
            box-sizing: border-box;
        }


        /* =========================================================
           REMOVE BUTTON
           ========================================================= */

        .remove-btn {
            border: none;
            background: #dc3545;
            color: white;
            padding: 9px 12px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 13px;
        }


        .remove-btn:hover {
            background: #b02a37;
        }


        /* =========================================================
           ADD PRODUCT BUTTON
           ========================================================= */

        .add-row-btn {
            margin-top: 15px;
            padding: 10px 18px;
            background: #198754;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: 600;
        }


        .add-row-btn:hover {
            background: #157347;
        }


        /* =========================================================
           SUMMARY
           FULL WIDTH
           ========================================================= */

        .summary {
            width: 100%;
            margin-top: 20px;
            display: flex;
            justify-content: stretch;
            box-sizing: border-box;
        }


        .summary-box {
            width: 100%;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 16px;
            background: #fafafa;
            box-sizing: border-box;
        }


        .summary-row {
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px 5px;
            border-bottom: 1px solid #e5e5e5;
            box-sizing: border-box;
        }


        .summary-row:last-child {
            border-bottom: none;
        }


        .summary-label {
            font-weight: 600;
            color: #555;
        }


        .summary-value {
            font-weight: 700;
            color: #222;
        }


        .grand-total {
            font-size: 19px;
        }


        /* =========================================================
           ACTION BUTTONS
           ========================================================= */

        .action-buttons {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 20px;
        }


        .btn-save {
            padding: 12px 25px;
            border: none;
            border-radius: 6px;
            background: #0d6efd;
            color: white;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
        }


        .btn-save:hover {
            background: #0b5ed7;
        }


        .back-btn {
            padding: 11px 20px;
            border-radius: 6px;
            background: #6c757d;
            color: white;
            text-decoration: none;
            font-weight: 600;
        }


        .back-btn:hover {
            background: #5c636a;
            color: white;
        }


        /* =========================================================
           MESSAGE
           ========================================================= */

        .message {
            display: block;
            margin-bottom: 15px;
            font-weight: 600;
        }


        /* =========================================================
           RESPONSIVE - 1200px
           ========================================================= */

        @media(max-width: 1200px) {

            .form-row {
                grid-template-columns: repeat(2, 1fr);
            }

            .supplier-info {
                grid-template-columns: repeat(3, 1fr);
            }

        }


        /* =========================================================
           RESPONSIVE - 900px
           ========================================================= */

        @media(max-width: 900px) {

            .form-row,
            .supplier-info {
                grid-template-columns: 1fr;
            }


            .summary {
                width: 100%;
            }


            .summary-box {
                width: 100%;
            }


            .action-buttons {
                flex-direction: column;
                align-items: stretch;
                gap: 12px;
            }


            .back-btn,
            .btn-save {
                text-align: center;
                width: 100%;
                box-sizing: border-box;
            }

        }


        /* =========================================================
           RESPONSIVE - 600px
           ========================================================= */

        @media(max-width: 600px) {

            .purchase-container {
                width: 94%;
                margin: 15px auto;
            }


            .card {
                padding: 15px;
            }


            .page-title {
                font-size: 24px;
            }


            .card-title {
                font-size: 18px;
            }


            .summary-row {
                padding: 11px 2px;
            }


            .summary-label {
                font-size: 14px;
            }


            .summary-value {
                font-size: 14px;
            }


            .grand-total {
                font-size: 17px;
            }

        }


        /* =========================================================
           RESPONSIVE - 400px
           ========================================================= */

        @media(max-width: 400px) {

            .purchase-container {
                width: 96%;
            }


            .card {
                padding: 12px;
            }


            .page-title {
                font-size: 22px;
            }


            .summary-row {
                flex-direction: column;
                align-items: flex-start;
                gap: 5px;
            }


            .summary-value {
                align-self: flex-end;
            }

        }

    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="purchase-container">

        <!-- =====================================================
             PAGE TITLE
             ===================================================== -->

        <div class="page-title">
            New Purchase
        </div>


        <!-- =====================================================
             MESSAGE
             ===================================================== -->

        <asp:Label ID="lblMessage"
            runat="server"
            CssClass="message">
        </asp:Label>


        <!-- =====================================================
             PURCHASE INFORMATION
             ===================================================== -->

        <div class="card">

            <div class="card-title">
                Purchase Information
            </div>


            <div class="form-row">

                <!-- CATEGORY -->

                <div class="form-group">

                    <label>Category</label>

                    <asp:DropDownList
                        ID="DropListCategory"
                        runat="server"
                        CssClass="form-control"
                        AutoPostBack="true"
                        OnSelectedIndexChanged="DropListCategory_SelectedIndexChanged">

                        <asp:ListItem
                            Text="-- Select Category --"
                            Value="" />

                        <asp:ListItem
                            Text="Electronics"
                            Value="Electronics" />

                        <asp:ListItem
                            Text="Grocery"
                            Value="Grocery" />

                        <asp:ListItem
                            Text="Clothing & Fashion"
                            Value="Clothing" />

                        <asp:ListItem
                            Text="Furniture"
                            Value="Furniture" />

                        <asp:ListItem
                            Text="Stationery"
                            Value="Stationery" />

                        <asp:ListItem
                            Text="Hardware"
                            Value="Hardware" />

                        <asp:ListItem
                            Text="Cosmetics & Personal Care"
                            Value="Cosmetics" />

                        <asp:ListItem
                            Text="Medicines & Healthcare"
                            Value="Healthcare" />

                        <asp:ListItem
                            Text="Automobile Parts"
                            Value="Automobile" />

                        <asp:ListItem
                            Text="Sports & Fitness"
                            Value="Sports" />

                        <asp:ListItem
                            Text="Other"
                            Value="Other" />

                    </asp:DropDownList>

                </div>


                <!-- SUPPLIER -->

                <div class="form-group">

                    <label>Supplier</label>

                    <asp:DropDownList
                        ID="DropList1"
                        runat="server"
                        CssClass="form-control"
                        AutoPostBack="true"
                        OnSelectedIndexChanged="DropList1_SelectedIndexChanged">

                        <asp:ListItem
                            Text="-- Select Supplier --"
                            Value="" />

                    </asp:DropDownList>

                </div>


                <!-- PURCHASE ID -->

                <div class="form-group">

                    <label>Purchase ID</label>

                    <asp:TextBox
                        ID="TextBoxPurchase"
                        runat="server"
                        CssClass="form-control readonly-box"
                        ReadOnly="true">
                    </asp:TextBox>

                </div>


                <!-- DATE -->

                <div class="form-group">

                    <label>Purchase Date</label>

                    <asp:TextBox
                        ID="TextBoxDate"
                        runat="server"
                        CssClass="form-control readonly-box"
                        ReadOnly="true">
                    </asp:TextBox>

                </div>

            </div>


            <!-- =================================================
                 SUPPLIER INFORMATION
                 ================================================= -->

            <div class="supplier-info">

                <!-- SUPPLIER NAME -->

                <div class="info-box">

                    <div class="info-title">
                        Supplier Name
                    </div>

                    <asp:Label
                        ID="lblSupplierName"
                        runat="server"
                        CssClass="info-value">
                        --
                    </asp:Label>

                </div>


                <!-- CONTACT -->

                <div class="info-box">

                    <div class="info-title">
                        Contact
                    </div>

                    <asp:Label
                        ID="lblSupplierContact"
                        runat="server"
                        CssClass="info-value">
                        --
                    </asp:Label>

                </div>


                <!-- ADDRESS -->

                <div class="info-box">

                    <div class="info-title">
                        Address
                    </div>

                    <asp:Label
                        ID="lblSupplierAddress"
                        runat="server"
                        CssClass="info-value">
                        --
                    </asp:Label>

                </div>

            </div>

        </div>


        <!-- =====================================================
             PURCHASE ITEMS
             ===================================================== -->

        <div class="card">

            <div class="card-title">
                Purchase Items
            </div>


            <div class="table-wrapper">

                <table class="purchase-table">

                    <thead>

                        <tr>

                            <th>#</th>

                            <th>Product</th>

                            <th>Brand</th>

                            <th>Purchase Price</th>

                            <th>Quantity</th>

                            <th>Gross Amount</th>

                            <th>Discount %</th>

                            <th>Discount Amount</th>

                            <th>Net Amount</th>

                            <th>Action</th>

                        </tr>

                    </thead>


                    <tbody id="purchaseItemsBody">

                        <!-- =================================================
                             FIRST PRODUCT ROW
                             ================================================= -->

                        <tr class="product-row">

                            <!-- NUMBER -->

                            <td class="row-number">
                                1
                            </td>


                            <!-- PRODUCT -->

                            <td>

                                <asp:DropDownList
                                    ID="DropListProduct1"
                                    runat="server"
                                    CssClass="item-input product-select">

                                    <asp:ListItem
                                        Text="-- Select Product --"
                                        Value="" />

                                </asp:DropDownList>

                            </td>


                            <!-- BRAND -->

                            <td>

                                <select class="item-input brand-select">

                                    <option value="">
                                        -- Select Brand --
                                    </option>

                                </select>

                            </td>


                            <!-- PURCHASE PRICE -->

                            <td>

                                <input
                                    type="text"
                                    class="item-input price-input"
                                    readonly
                                    value="0.00" />

                            </td>


                            <!-- QUANTITY -->

                            <td>

                                <input
                                    type="number"
                                    class="item-input qty-input"
                                    value="1"
                                    min="1"
                                    step="1" />

                            </td>


                            <!-- GROSS -->

                            <td>

                                <span class="calculate-value gross-amount">
                                    0.00
                                </span>

                            </td>


                            <!-- DISCOUNT -->

                            <td>

                                <input
                                    type="number"
                                    class="item-input discount-input"
                                    value="0"
                                    min="0"
                                    max="100"
                                    step="0.01" />

                            </td>


                            <!-- DISCOUNT AMOUNT -->

                            <td>

                                <span class="calculate-value discount-amount">
                                    0.00
                                </span>

                            </td>


                            <!-- NET AMOUNT -->

                            <td>

                                <span class="calculate-value net-amount">
                                    0.00
                                </span>

                            </td>


                            <!-- REMOVE -->

                            <td>

                                <button
                                    type="button"
                                    class="remove-btn"
                                    onclick="removeProductRow(this)">

                                    <i class="fa-solid fa-trash"></i>

                                </button>

                            </td>

                        </tr>

                    </tbody>

                </table>

            </div>


            <!-- =================================================
                 ADD PRODUCT
                 ================================================= -->

            <button
                type="button"
                class="add-row-btn"
                onclick="addProductRow()">

                <i class="fa-solid fa-plus"></i>
                Add Product

            </button>


            <!-- =================================================
                 SUMMARY - FULL WIDTH
                 ================================================= -->

            <div class="summary">

                <div class="summary-box">

                    <div class="summary-row">

                        <span class="summary-label">
                            Total Gross
                        </span>

                        <span class="summary-value">
                            ₹
                            <span id="totalGross">
                                0.00
                            </span>
                        </span>

                    </div>


                    <div class="summary-row">

                        <span class="summary-label">
                            Total Discount
                        </span>

                        <span class="summary-value">
                            ₹
                            <span id="totalDiscount">
                                0.00
                            </span>
                        </span>

                    </div>


                    <div class="summary-row grand-total">

                        <span class="summary-label">
                            Total Net
                        </span>

                        <span class="summary-value">
                            ₹
                            <span id="totalNet">
                                0.00
                            </span>
                        </span>

                    </div>

                </div>

            </div>


            <!-- =================================================
                 HIDDEN FIELDS
                 ================================================= -->

            <asp:HiddenField
                ID="HiddenTotalGross"
                runat="server" />


            <asp:HiddenField
                ID="HiddenTotalDiscount"
                runat="server" />


            <asp:HiddenField
                ID="HiddenTotalNet"
                runat="server" />


            <asp:HiddenField
                ID="HiddenPurchaseItems"
                runat="server" />


            <asp:HiddenField
                ID="HiddenProductBrandPrice"
                runat="server" />


            <!-- =================================================
                 ACTION BUTTONS
                 ================================================= -->

            <div class="action-buttons">

                <asp:LinkButton
                    ID="LinkButtonBack"
                    runat="server"
                    CssClass="back-btn"
                    PostBackUrl="~/Purchase Module/AllPurchase.aspx">

                    <i class="fa-solid fa-arrow-left"></i>
                    Back

                </asp:LinkButton>


                <asp:Button
                    ID="Button2"
                    runat="server"
                    Text="Complete Purchase"
                    CssClass="btn-save"
                    OnClientClick="return validatePurchase();"
                    OnClick="Button2_Click" />

            </div>

        </div>

    </div>


    <!-- =========================================================
         JAVASCRIPT
         ========================================================= -->

    <script>

        /* =========================================================
           GET PRODUCT + BRAND + PRICE DATA
           ========================================================= */

        function getProductBrandPriceData() {

            var hidden =
                document.getElementById(
                    '<%= HiddenProductBrandPrice.ClientID %>'
                );

            if (!hidden || hidden.value === "")
                return {};

            try {

                return JSON.parse(hidden.value);

            }
            catch (e) {

                console.log(
                    "Invalid Product Brand Price JSON"
                );

                return {};

            }

        }


        /* =========================================================
           LOAD BRANDS ACCORDING TO PRODUCT
           ========================================================= */

        function loadBrands(row) {

            var product =
                row.querySelector(".product-select");

            var brand =
                row.querySelector(".brand-select");

            var price =
                row.querySelector(".price-input");


            brand.innerHTML =
                '<option value="">-- Select Brand --</option>';


            price.value = "0.00";


            if (!product || product.value === "")
                return;


            var data =
                getProductBrandPriceData();


            var productID =
                product.value;


            if (!data[productID])
                return;


            var brands =
                data[productID];


            brands.forEach(function (item) {

                var option =
                    document.createElement("option");


                option.value =
                    item.brand;


                option.text =
                    item.brand;


                brand.appendChild(option);

            });

        }


        /* =========================================================
           LOAD PRICE ACCORDING TO BRAND
           ========================================================= */

        function loadPrice(row) {

            var product =
                row.querySelector(".product-select");

            var brand =
                row.querySelector(".brand-select");

            var price =
                row.querySelector(".price-input");


            price.value = "0.00";


            if (!product ||
                !brand ||
                product.value === "" ||
                brand.value === "") {

                calculateRow(row);

                return;

            }


            var data =
                getProductBrandPriceData();


            var productID =
                product.value;


            if (!data[productID]) {

                calculateRow(row);

                return;

            }


            var brands =
                data[productID];


            for (var i = 0; i < brands.length; i++) {

                if (brands[i].brand === brand.value) {

                    price.value =
                        parseFloat(
                            brands[i].price
                        ).toFixed(2);

                    break;

                }

            }


            calculateAll();

        }


        /* =========================================================
           CALCULATE SINGLE ROW
           ========================================================= */

        function calculateRow(row) {

            var qtyElement =
                row.querySelector(".qty-input");

            var priceElement =
                row.querySelector(".price-input");

            var discountElement =
                row.querySelector(".discount-input");


            var qty =
                parseFloat(
                    qtyElement.value
                ) || 0;


            var price =
                parseFloat(
                    priceElement.value
                ) || 0;


            var discount =
                parseFloat(
                    discountElement.value
                ) || 0;


            if (discount < 0)
                discount = 0;


            if (discount > 100)
                discount = 100;


            var gross =
                qty * price;


            var discountAmount =
                gross * discount / 100;


            var net =
                gross - discountAmount;


            row.querySelector(".gross-amount")
                .innerText =
                gross.toFixed(2);


            row.querySelector(".discount-amount")
                .innerText =
                discountAmount.toFixed(2);


            row.querySelector(".net-amount")
                .innerText =
                net.toFixed(2);

        }


        /* =========================================================
           CALCULATE ALL ROWS
           ========================================================= */

        function calculateAll() {

            var rows =
                document.querySelectorAll(
                    ".product-row"
                );


            var totalGross = 0;
            var totalDiscount = 0;
            var totalNet = 0;


            rows.forEach(function (row, index) {

                row.querySelector(".row-number")
                    .innerText =
                    index + 1;


                calculateRow(row);


                totalGross +=
                    parseFloat(
                        row.querySelector(
                            ".gross-amount"
                        ).innerText
                    ) || 0;


                totalDiscount +=
                    parseFloat(
                        row.querySelector(
                            ".discount-amount"
                        ).innerText
                    ) || 0;


                totalNet +=
                    parseFloat(
                        row.querySelector(
                            ".net-amount"
                        ).innerText
                    ) || 0;

            });


            document.getElementById(
                "totalGross"
            ).innerText =
                totalGross.toFixed(2);


            document.getElementById(
                "totalDiscount"
            ).innerText =
                totalDiscount.toFixed(2);


            document.getElementById(
                "totalNet"
            ).innerText =
                totalNet.toFixed(2);


            saveTotals();


            savePurchaseItems();

        }


        /* =========================================================
           SAVE TOTALS
           ========================================================= */

        function saveTotals() {

            document.getElementById(
                '<%= HiddenTotalGross.ClientID %>'
            ).value =
                document.getElementById(
                    "totalGross"
                ).innerText;


            document.getElementById(
                '<%= HiddenTotalDiscount.ClientID %>'
            ).value =
                document.getElementById(
                    "totalDiscount"
                ).innerText;


            document.getElementById(
                '<%= HiddenTotalNet.ClientID %>'
            ).value =
                document.getElementById(
                    "totalNet"
                ).innerText;

        }


        /* =========================================================
           SAVE PURCHASE ITEMS
           ========================================================= */

        function savePurchaseItems() {

            var rows =
                document.querySelectorAll(
                    ".product-row"
                );


            var items = [];


            rows.forEach(function (row) {

                var product =
                    row.querySelector(
                        ".product-select"
                    );


                var brand =
                    row.querySelector(
                        ".brand-select"
                    );


                var qty =
                    row.querySelector(
                        ".qty-input"
                    );


                var price =
                    row.querySelector(
                        ".price-input"
                    );


                var discount =
                    row.querySelector(
                        ".discount-input"
                    );


                var gross =
                    row.querySelector(
                        ".gross-amount"
                    );


                var discountAmount =
                    row.querySelector(
                        ".discount-amount"
                    );


                var net =
                    row.querySelector(
                        ".net-amount"
                    );


                if (!product ||
                    product.value === "") {

                    return;

                }


                items.push({

                    productid:
                        product.value,

                    brand:
                        brand.value,

                    quantity:
                        parseInt(
                            qty.value
                        ) || 0,

                    purchaseprice:
                        parseFloat(
                            price.value
                        ) || 0,

                    discountpercent:
                        parseFloat(
                            discount.value
                        ) || 0,

                    grossamount:
                        parseFloat(
                            gross.innerText
                        ) || 0,

                    discountamount:
                        parseFloat(
                            discountAmount.innerText
                        ) || 0,

                    netamount:
                        parseFloat(
                            net.innerText
                        ) || 0

                });

            });


            document.getElementById(
                '<%= HiddenPurchaseItems.ClientID %>'
            ).value =
                JSON.stringify(items);

        }


        /* =========================================================
           ATTACH EVENTS TO ROW
           ========================================================= */

        function attachRowEvents(row) {

            var product =
                row.querySelector(
                    ".product-select"
                );


            var brand =
                row.querySelector(
                    ".brand-select"
                );


            var qty =
                row.querySelector(
                    ".qty-input"
                );


            var discount =
                row.querySelector(
                    ".discount-input"
                );


            /* PRODUCT CHANGE */

            if (product) {

                product.addEventListener(
                    "change",
                    function () {

                        loadBrands(row);


                        row.querySelector(
                            ".price-input"
                        ).value =
                            "0.00";


                        calculateAll();

                    }
                );

            }


            /* BRAND CHANGE */

            if (brand) {

                brand.addEventListener(
                    "change",
                    function () {

                        loadPrice(row);

                    }
                );

            }


            /* QUANTITY CHANGE */

            if (qty) {

                qty.addEventListener(
                    "input",
                    function () {

                        calculateAll();

                    }
                );

            }


            /* DISCOUNT CHANGE */

            if (discount) {

                discount.addEventListener(
                    "input",
                    function () {

                        calculateAll();

                    }
                );

            }

        }


        /* =========================================================
           ADD NEW PRODUCT ROW
           ========================================================= */

        function addProductRow() {

            var tbody =
                document.getElementById(
                    "purchaseItemsBody"
                );


            var firstRow =
                tbody.querySelector(
                    ".product-row"
                );


            var newRow =
                firstRow.cloneNode(true);


            var product =
                newRow.querySelector(
                    ".product-select"
                );


            var brand =
                newRow.querySelector(
                    ".brand-select"
                );


            var price =
                newRow.querySelector(
                    ".price-input"
                );


            var qty =
                newRow.querySelector(
                    ".qty-input"
                );


            var discount =
                newRow.querySelector(
                    ".discount-input"
                );


            product.value = "";


            brand.innerHTML =
                '<option value="">-- Select Brand --</option>';


            price.value =
                "0.00";


            qty.value =
                "1";


            discount.value =
                "0";


            newRow.querySelector(
                ".gross-amount"
            ).innerText =
                "0.00";


            newRow.querySelector(
                ".discount-amount"
            ).innerText =
                "0.00";


            newRow.querySelector(
                ".net-amount"
            ).innerText =
                "0.00";


            tbody.appendChild(
                newRow
            );


            attachRowEvents(
                newRow
            );


            calculateAll();

        }


        /* =========================================================
           REMOVE PRODUCT ROW
           ========================================================= */

        function removeProductRow(button) {

            var rows =
                document.querySelectorAll(
                    ".product-row"
                );


            if (rows.length <= 1) {

                alert(
                    "At least one product row is required."
                );

                return;

            }


            button.closest(
                ".product-row"
            ).remove();


            calculateAll();

        }


        /* =========================================================
           VALIDATE PURCHASE
           ========================================================= */

        function validatePurchase() {

            var category =
                document.getElementById(
                    '<%= DropListCategory.ClientID %>'
                ).value;


            var supplier =
                document.getElementById(
                    '<%= DropList1.ClientID %>'
                ).value;


            /* CATEGORY */

            if (category === "") {

                alert(
                    "Please select category."
                );

                return false;

            }


            /* SUPPLIER */

            if (supplier === "") {

                alert(
                    "Please select supplier."
                );

                return false;

            }


            /* ROWS */

            var rows =
                document.querySelectorAll(
                    ".product-row"
                );


            if (rows.length === 0) {

                alert(
                    "Please add at least one product."
                );

                return false;

            }


            var valid = true;


            rows.forEach(function (row) {

                if (!valid)
                    return;


                var product =
                    row.querySelector(
                        ".product-select"
                    ).value;


                var brand =
                    row.querySelector(
                        ".brand-select"
                    ).value;


                var qty =
                    parseFloat(
                        row.querySelector(
                            ".qty-input"
                        ).value
                    ) || 0;


                var price =
                    parseFloat(
                        row.querySelector(
                            ".price-input"
                        ).value
                    ) || 0;


                var discount =
                    parseFloat(
                        row.querySelector(
                            ".discount-input"
                        ).value
                    ) || 0;


                /* PRODUCT */

                if (product === "") {

                    alert(
                        "Please select product for every row."
                    );

                    valid = false;

                    return;

                }


                /* BRAND */

                if (brand === "") {

                    alert(
                        "Please select brand for every row."
                    );

                    valid = false;

                    return;

                }


                /* PRICE */

                if (price <= 0) {

                    alert(
                        "Purchase price is not available for selected brand."
                    );

                    valid = false;

                    return;

                }


                /* QUANTITY */

                if (qty <= 0) {

                    alert(
                        "Quantity must be greater than 0."
                    );

                    valid = false;

                    return;

                }


                /* DISCOUNT */

                if (
                    discount < 0 ||
                    discount > 100
                ) {

                    alert(
                        "Discount must be between 0 and 100."
                    );

                    valid = false;

                    return;

                }

            });


            if (!valid)
                return false;


            /* SAVE EVERYTHING BEFORE POSTBACK */

            calculateAll();

            saveTotals();

            savePurchaseItems();


            return true;

        }


        /* =========================================================
           PAGE LOAD
           ========================================================= */

        window.addEventListener(
            "load",
            function () {

                var rows =
                    document.querySelectorAll(
                        ".product-row"
                    );


                rows.forEach(function (row) {

                    attachRowEvents(
                        row
                    );

                });


                calculateAll();

            }
        );

    </script>

</asp:Content>
