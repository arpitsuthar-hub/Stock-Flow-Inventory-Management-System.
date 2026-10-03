<%@ Page Title="New Sale"
    Language="C#"
    MasterPageFile="~/Sell-Bill_Module/Sell-Bill_Module.Master"
    AutoEventWireup="true"
    CodeBehind="Sell_New.aspx.cs"
    Inherits="Inventory_Management_System.Sell_New" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style type="text/css">

        /* =========================================================
           GLOBAL
           ========================================================= */

        * {
            box-sizing: border-box;
        }


        /* =========================================================
           MAIN CONTAINER
           ========================================================= */

        .sell-container {
            width: 96%;
            margin: 25px auto;
            font-family: "Segoe UI", Arial, sans-serif;
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
        }


        .card-title {
            font-size: 20px;
            font-weight: 600;
            margin-bottom: 18px;
            color: #333;
        }


        /* =========================================================
           FORM ROW
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
            font-size: 14px;
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
            background: #fff;
        }


        .form-control:focus,
        .item-input:focus {
            border-color: #333;
        }


        .readonly-box {
            background: #f3f3f3;
        }


        /* =========================================================
           CUSTOMER INFORMATION
           ========================================================= */

        .customer-info {
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
            min-height: 70px;
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
           SALE ITEMS TABLE
           ========================================================= */

        .table-wrapper {
            width: 100%;
            overflow-x: auto;
        }


        .sale-table {
            width: 100%;
            border-collapse: collapse;
            min-width: 1250px;
        }


        .sale-table th {
            background: #222;
            color: #fff;
            padding: 12px 8px;
            text-align: center;
            font-size: 13px;
            white-space: nowrap;
        }


        .sale-table td {
            padding: 8px;
            border-bottom: 1px solid #ddd;
            vertical-align: middle;
        }


        .sale-table td:first-child {
            text-align: center;
            font-weight: 600;
        }


        /* =========================================================
           TABLE INPUTS
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


        .qty-input {
            min-width: 90px;
        }


        .discount-input {
            min-width: 110px;
        }


        /* =========================================================
           CALCULATED VALUES
           ========================================================= */

        .calculate-value {
            display: block;
            min-width: 95px;
            text-align: right;
            padding: 10px 8px;
            background: #f5f5f5;
            border-radius: 5px;
            font-weight: 600;
            box-sizing: border-box;
            white-space: nowrap;
        }


        .net-amount {
            background: #f0fdf4;
            color: #18804b;
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
           ADD PRODUCT
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
            font-size: 14px;
        }


        .add-row-btn:hover {
            background: #157347;
        }


        /* =========================================================
           HELPER TEXT
           ========================================================= */

        .helper-text {
            margin-top: 8px;
            font-size: 11px;
            color: #888;
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

            .customer-info {
                grid-template-columns: repeat(3, 1fr);
            }

        }


        /* =========================================================
           RESPONSIVE - 900px
           ========================================================= */

        @media(max-width: 900px) {

            .form-row,
            .customer-info {
                grid-template-columns: 1fr;
            }


            .action-buttons {
                flex-direction: column;
                align-items: stretch;
                gap: 12px;
            }


            .back-btn,
            .btn-save {
                width: 100%;
                text-align: center;
                box-sizing: border-box;
            }

        }


        /* =========================================================
           RESPONSIVE - 600px
           ========================================================= */

        @media(max-width: 600px) {

            .sell-container {
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

            .sell-container {
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

    <div class="sell-container">

        <!-- =====================================================
             PAGE TITLE
             ===================================================== -->

        <div class="page-title">
            New Sale
        </div>


        <!-- =====================================================
             CUSTOMER / SALE INFORMATION
             ===================================================== -->

        <div class="card">

            <div class="card-title">
                Sale Information
            </div>


            <div class="form-row">

                <!-- CUSTOMER -->

                <div class="form-group">

                    <label>
                        Customer
                    </label>

                    <asp:DropDownList
                        ID="DropList1"
                        runat="server"
                        CssClass="form-control"
                        AutoPostBack="true"
                        OnSelectedIndexChanged="DropList1_SelectedIndexChanged">

                        <asp:ListItem
                            Text="-- Select Customer --"
                            Value="">
                        </asp:ListItem>

                    </asp:DropDownList>

                </div>


                <!-- INVOICE NUMBER -->

                <div class="form-group">

                    <label>
                        Invoice Number
                    </label>

                    <asp:TextBox
                        ID="TextBoxInvoice"
                        runat="server"
                        CssClass="form-control readonly-box"
                        ReadOnly="true">
                    </asp:TextBox>

                </div>


                <!-- DATE -->

                <div class="form-group">

                    <label>
                        Sale Date
                    </label>

                    <asp:TextBox
                        ID="TextBoxDate"
                        runat="server"
                        CssClass="form-control readonly-box"
                        ReadOnly="true">
                    </asp:TextBox>

                </div>

            </div>


            <!-- =================================================
                 CUSTOMER INFORMATION
                 ================================================= -->

            <div class="customer-info">

                <!-- CUSTOMER NAME -->

                <div class="info-box">

                    <div class="info-title">
                        Customer Name
                    </div>

                    <asp:Label
                        ID="lblCustomerName"
                        runat="server"
                        CssClass="info-value"
                        Text="-">
                    </asp:Label>

                </div>


                <!-- CONTACT -->

                <div class="info-box">

                    <div class="info-title">
                        Contact
                    </div>

                    <asp:Label
                        ID="lblCustomerMobile"
                        runat="server"
                        CssClass="info-value"
                        Text="-">
                    </asp:Label>

                </div>


                <!-- ADDRESS -->

                <div class="info-box">

                    <div class="info-title">
                        Address
                    </div>

                    <asp:Label
                        ID="lblCustomerAddress"
                        runat="server"
                        CssClass="info-value"
                        Text="-">
                    </asp:Label>

                </div>

            </div>

        </div>


        <!-- =====================================================
             SALE ITEMS
             ===================================================== -->

        <div class="card">

            <div class="card-title">
                Sale Items
            </div>


            <div class="table-wrapper">

                <table class="sale-table">

                    <thead>

                        <tr>

                            <th>#</th>

                            <th>Product</th>

                            <th>Brand</th>

                            <th>Selling Price</th>

                            <th>Quantity</th>

                            <th>Gross Amount</th>

                            <th>Discount %</th>

                            <th>Discount Amount</th>

                            <th>Net Amount</th>

                            <th>Action</th>

                        </tr>

                    </thead>


                    <tbody id="saleItemsBody">

                        <!-- =================================================
                             FIRST SALE ROW
                             ================================================= -->

                        <tr class="sale-item-row">

                            <!-- NUMBER -->

                            <td class="row-number">
                                1
                            </td>


                            <!-- PRODUCT -->

                            <td>

                                <asp:DropDownList
                                    ID="DropListProduct1"
                                    runat="server"
                                    CssClass="item-input product-select"
                                    onchange="productChanged(this);">

                                    <asp:ListItem
                                        Text="-- Select Product --"
                                        Value="">
                                    </asp:ListItem>

                                </asp:DropDownList>

                            </td>


                            <!-- BRAND -->

                            <td>

                                <select
                                    class="item-input brand-select"
                                    onchange="brandChanged(this);">

                                    <option value="">
                                        -- Select Brand --
                                    </option>

                                </select>

                            </td>


                            <!-- SELLING PRICE -->

                            <td>

                                <asp:TextBox
                                    ID="TextBoxPrice1"
                                    runat="server"
                                    CssClass="item-input price-input"
                                    ReadOnly="true"
                                    Text="0.00">
                                </asp:TextBox>

                            </td>


                            <!-- QUANTITY -->

                            <td>

                                <asp:TextBox
                                    ID="TextBoxQty1"
                                    runat="server"
                                    CssClass="item-input qty-input"
                                    TextMode="Number"
                                    min="1"
                                    placeholder="Qty"
                                    oninput="calculateRow(this);">
                                </asp:TextBox>

                            </td>


                            <!-- GROSS -->

                            <td>

                                <span class="calculate-value gross-amount">
                                    ₹ 0.00
                                </span>

                            </td>


                            <!-- DISCOUNT -->

                            <td>

                                <asp:TextBox
                                    ID="TextBoxDiscount1"
                                    runat="server"
                                    CssClass="item-input discount-input"
                                    TextMode="Number"
                                    min="0"
                                    max="100"
                                    step="0.01"
                                    placeholder="0"
                                    oninput="calculateRow(this);">
                                </asp:TextBox>

                            </td>


                            <!-- DISCOUNT AMOUNT -->

                            <td>

                                <span class="calculate-value discount-amount">
                                    ₹ 0.00
                                </span>

                            </td>


                            <!-- NET -->

                            <td>

                                <span class="calculate-value net-amount">
                                    ₹ 0.00
                                </span>

                            </td>


                            <!-- REMOVE -->

                            <td>

                                <button
                                    type="button"
                                    class="remove-btn"
                                    onclick="removeProductRow(this);">

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
                onclick="addProductRow();">

                <i class="fa-solid fa-plus"></i>
                Add Product

            </button>


            <div class="helper-text">

                Select product → select brand → enter quantity →
                enter discount → calculate summary → save sale.

            </div>


            <!-- =================================================
                 SUMMARY
                 ================================================= -->

            <div class="card-title" style="margin-top:25px;">
                Sale Summary
            </div>


            <div class="summary">

                <div class="summary-box">

                    <!-- TOTAL GROSS -->

                    <div class="summary-row">

                        <span class="summary-label">
                            Total Gross
                        </span>

                        <span class="summary-value">

                            ₹
                            <asp:Label
                                ID="lblTotalGross"
                                runat="server"
                                Text="0.00">
                            </asp:Label>

                        </span>

                    </div>


                    <!-- TOTAL DISCOUNT -->

                    <div class="summary-row">

                        <span class="summary-label">
                            Total Discount
                        </span>

                        <span class="summary-value">

                            ₹
                            <asp:Label
                                ID="lblTotalDiscount"
                                runat="server"
                                Text="0.00">
                            </asp:Label>

                        </span>

                    </div>


                    <!-- TOTAL NET -->

                    <div class="summary-row grand-total">

                        <span class="summary-label">
                            Total Net
                        </span>

                        <span class="summary-value">

                            ₹
                            <asp:Label
                                ID="lblTotalNet"
                                runat="server"
                                Text="0.00">
                            </asp:Label>

                        </span>

                    </div>

                </div>

            </div>


            <!-- =================================================
                 HIDDEN FIELDS
                 ================================================= -->

            <asp:HiddenField
                ID="HiddenSaleItems"
                runat="server" />


            <asp:HiddenField
                ID="HiddenProductBrandPrice"
                runat="server" />


            <asp:HiddenField
                ID="HiddenTotalGross"
                runat="server" />


            <asp:HiddenField
                ID="HiddenTotalDiscount"
                runat="server" />


            <asp:HiddenField
                ID="HiddenTotalNet"
                runat="server" />


            <!-- =================================================
                 ACTION BUTTONS
                 ================================================= -->

            <div class="action-buttons">

                <asp:LinkButton
                    ID="LinkButton1"
                    runat="server"
                    CssClass="back-btn"
                    OnClick="LinkButton1_Click">

                    <i class="fa-solid fa-arrow-left"></i>
                    View All Sales

                </asp:LinkButton>


                <asp:Button
                    ID="Button2"
                    runat="server"
                    Text="Save Sale & Generate Invoice"
                    CssClass="btn-save"
                    CausesValidation="false"
                    UseSubmitBehavior="false"
                    OnClick="Button2_Click"
                    OnClientClick="return prepareSaleData();">

                </asp:Button>

            </div>

        </div>

    </div>


    <!-- =========================================================
         JAVASCRIPT
         ========================================================= -->

    <script type="text/javascript">

        var productBrandPrice = {};


        /* =========================================================
           LOAD PRODUCT / BRAND / PRICE DATA
           ========================================================= */

        function loadBrandPriceData() {

            var hidden =
                document.getElementById(
                    '<%= HiddenProductBrandPrice.ClientID %>'
                );


            if (!hidden || !hidden.value) {

                productBrandPrice = {};

                return;

            }


            try {

                productBrandPrice =
                    JSON.parse(hidden.value);

            }
            catch (e) {

                console.error(
                    "Brand price JSON error:",
                    e
                );

                productBrandPrice = {};

            }

        }


        /* =========================================================
           PRODUCT CHANGED
           ========================================================= */

        function productChanged(productSelect) {

            loadBrandPriceData();


            var row =
                productSelect.closest(
                    ".sale-item-row"
                );


            if (!row)
                return;


            var brandSelect =
                row.querySelector(
                    ".brand-select"
                );


            var priceInput =
                row.querySelector(
                    ".price-input"
                );


            brandSelect.innerHTML =
                '<option value="">-- Select Brand --</option>';


            priceInput.value =
                "0.00";


            var productName =
                productSelect.value;


            if (!productName) {

                calculateRow(productSelect);

                calculateSummary();

                return;

            }


            var brands =
                productBrandPrice[productName];


            if (!brands ||
                brands.length === 0) {

                console.log(
                    "No brand found for " +
                    productName
                );

                calculateSummary();

                return;

            }


            brands.forEach(function (item) {

                var option =
                    document.createElement(
                        "option"
                    );


                option.value =
                    item.brand;


                option.text =
                    item.brand;


                option.setAttribute(
                    "data-product-id",
                    item.productid
                );


                option.setAttribute(
                    "data-price",
                    item.price
                );


                brandSelect.appendChild(
                    option
                );

            });


            calculateRow(productSelect);

            calculateSummary();

        }


        /* =========================================================
           BRAND CHANGED
           ========================================================= */

        function brandChanged(brandSelect) {

            var row =
                brandSelect.closest(
                    ".sale-item-row"
                );


            var priceInput =
                row.querySelector(
                    ".price-input"
                );


            var option =
                brandSelect.options[
                    brandSelect.selectedIndex
                ];


            if (!brandSelect.value) {

                priceInput.value =
                    "0.00";


                calculateRow(
                    brandSelect
                );

                calculateSummary();

                return;

            }


            var price =
                option.getAttribute(
                    "data-price"
                );


            priceInput.value =
                parseFloat(
                    price || 0
                ).toFixed(2);


            calculateRow(
                brandSelect
            );


            calculateSummary();

        }


        /* =========================================================
           CALCULATE SINGLE ROW
           ========================================================= */

        function calculateRow(element) {

            var row =
                element.closest(
                    ".sale-item-row"
                );


            if (!row)
                return;


            var quantity =
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


            if (discount < 0)
                discount = 0;


            if (discount > 100)
                discount = 100;


            var gross =
                quantity * price;


            var discountAmount =
                gross * discount / 100;


            var net =
                gross - discountAmount;


            row.querySelector(
                ".gross-amount"
            ).innerText =
                "₹ " +
                gross.toFixed(2);


            row.querySelector(
                ".discount-amount"
            ).innerText =
                "₹ " +
                discountAmount.toFixed(2);


            row.querySelector(
                ".net-amount"
            ).innerText =
                "₹ " +
                net.toFixed(2);

        }


        /* =========================================================
           ADD PRODUCT ROW
           ========================================================= */

        function addProductRow() {

            var tbody =
                document.getElementById(
                    "saleItemsBody"
                );


            var firstRow =
                tbody.querySelector(
                    ".sale-item-row"
                );


            if (!firstRow)
                return;


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


            var qty =
                newRow.querySelector(
                    ".qty-input"
                );


            var price =
                newRow.querySelector(
                    ".price-input"
                );


            var discount =
                newRow.querySelector(
                    ".discount-input"
                );


            product.selectedIndex =
                0;


            brand.innerHTML =
                '<option value="">-- Select Brand --</option>';


            qty.value =
                "";


            price.value =
                "0.00";


            discount.value =
                "";


            newRow.querySelector(
                ".gross-amount"
            ).innerText =
                "₹ 0.00";


            newRow.querySelector(
                ".discount-amount"
            ).innerText =
                "₹ 0.00";


            newRow.querySelector(
                ".net-amount"
            ).innerText =
                "₹ 0.00";


            product.onchange =
                function () {

                    productChanged(
                        this
                    );

                };


            brand.onchange =
                function () {

                    brandChanged(
                        this
                    );

                };


            qty.oninput =
                function () {

                    calculateRow(
                        this
                    );

                    calculateSummary();

                };


            discount.oninput =
                function () {

                    calculateRow(
                        this
                    );

                    calculateSummary();

                };


            tbody.appendChild(
                newRow
            );


            updateRowNumbers();

        }


        /* =========================================================
           UPDATE ROW NUMBERS
           ========================================================= */

        function updateRowNumbers() {

            var rows =
                document.querySelectorAll(
                    "#saleItemsBody .sale-item-row"
                );


            rows.forEach(
                function (row, index) {

                    var number =
                        row.querySelector(
                            ".row-number"
                        );


                    if (number) {

                        number.innerText =
                            index + 1;

                    }

                }
            );

        }


        /* =========================================================
           REMOVE PRODUCT ROW
           ========================================================= */

        function removeProductRow(button) {

            var tbody =
                document.getElementById(
                    "saleItemsBody"
                );


            var rows =
                tbody.querySelectorAll(
                    ".sale-item-row"
                );


            if (rows.length <= 1) {

                alert(
                    "At least one product row is required."
                );

                return;

            }


            button.closest(
                ".sale-item-row"
            ).remove();


            updateRowNumbers();


            calculateSummary();

        }


        /* =========================================================
           CALCULATE SUMMARY
           ========================================================= */

        function calculateSummary() {

            var rows =
                document.querySelectorAll(
                    "#saleItemsBody .sale-item-row"
                );


            var totalGross = 0;

            var totalDiscount = 0;

            var totalNet = 0;


            rows.forEach(
                function (row) {

                    var quantity =
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


                    if (discount < 0)
                        discount = 0;


                    if (discount > 100)
                        discount = 100;


                    var gross =
                        quantity * price;


                    var discountAmount =
                        gross * discount / 100;


                    var net =
                        gross - discountAmount;


                    totalGross +=
                        gross;


                    totalDiscount +=
                        discountAmount;


                    totalNet +=
                        net;

                }
            );


            document.getElementById(
                '<%= lblTotalGross.ClientID %>'
            ).innerText =
                totalGross.toFixed(2);


            document.getElementById(
                '<%= lblTotalDiscount.ClientID %>'
            ).innerText =
                totalDiscount.toFixed(2);


            document.getElementById(
                '<%= lblTotalNet.ClientID %>'
            ).innerText =
                totalNet.toFixed(2);


            document.getElementById(
                '<%= HiddenTotalGross.ClientID %>'
            ).value =
                totalGross.toFixed(2);


            document.getElementById(
                '<%= HiddenTotalDiscount.ClientID %>'
            ).value =
                totalDiscount.toFixed(2);


            document.getElementById(
                '<%= HiddenTotalNet.ClientID %>'
            ).value =
                totalNet.toFixed(2);

        }


        /* =========================================================
           PREPARE SALE DATA BEFORE POSTBACK
           ========================================================= */

        function prepareSaleData() {

            try {

                var rows =
                    document.querySelectorAll(
                        "#saleItemsBody .sale-item-row"
                    );


                var items = [];


                for (
                    var i = 0;
                    i < rows.length;
                    i++
                ) {

                    var row =
                        rows[i];


                    var productSelect =
                        row.querySelector(
                            ".product-select"
                        );


                    var brandSelect =
                        row.querySelector(
                            ".brand-select"
                        );


                    var quantityInput =
                        row.querySelector(
                            ".qty-input"
                        );


                    var priceInput =
                        row.querySelector(
                            ".price-input"
                        );


                    var discountInput =
                        row.querySelector(
                            ".discount-input"
                        );


                    var productName =
                        (
                            productSelect.value ||
                            ""
                        ).trim();


                    /* IGNORE EMPTY ROW */

                    if (productName === "")
                        continue;


                    var brand =
                        (
                            brandSelect.value ||
                            ""
                        ).trim();


                    if (brand === "") {

                        alert(
                            "Please select a brand for " +
                            productName
                        );

                        return false;

                    }


                    var selectedOption =
                        brandSelect.options[
                            brandSelect.selectedIndex
                        ];


                    var productId =
                        selectedOption.getAttribute(
                            "data-product-id"
                        );


                    if (!productId) {

                        alert(
                            "Product ID not found for " +
                            productName
                        );

                        return false;

                    }


                    var quantity =
                        parseFloat(
                            quantityInput.value
                        ) || 0;


                    if (quantity <= 0) {

                        alert(
                            "Please enter quantity for " +
                            productName
                        );

                        return false;

                    }


                    var price =
                        parseFloat(
                            priceInput.value
                        ) || 0;


                    if (price <= 0) {

                        alert(
                            "Selling price not found for " +
                            productName
                        );

                        return false;

                    }


                    var discount =
                        parseFloat(
                            discountInput.value
                        ) || 0;


                    if (
                        discount < 0 ||
                        discount > 100
                    ) {

                        alert(
                            "Discount must be between 0 and 100."
                        );

                        return false;

                    }


                    var gross =
                        quantity * price;


                    var discountAmount =
                        gross * discount / 100;


                    var net =
                        gross - discountAmount;


                    items.push({

                        productid:
                            productId,

                        productname:
                            productName,

                        brand:
                            brand,

                        quantity:
                            quantity,

                        sellingprice:
                            price,

                        discountpercent:
                            discount,

                        grossamount:
                            gross,

                        discountamount:
                            discountAmount,

                        netamount:
                            net

                    });

                }


                if (items.length === 0) {

                    alert(
                        "Please select at least one product."
                    );

                    return false;

                }


                var hiddenField =
                    document.getElementById(
                        '<%= HiddenSaleItems.ClientID %>'
                    );


                if (!hiddenField) {

                    alert(
                        "HiddenSaleItems not found."
                    );

                    return false;

                }


                hiddenField.value =
                    JSON.stringify(items);


                calculateSummary();


                return true;

            }
            catch (error) {

                alert(
                    "JavaScript Error: " +
                    error.message
                );


                console.error(
                    error
                );


                return false;

            }

        }


        /* =========================================================
           PAGE LOAD
           ========================================================= */

        document.addEventListener(
            "DOMContentLoaded",
            function () {

                loadBrandPriceData();


                var productSelect =
                    document.querySelector(
                        ".product-select"
                    );


                if (productSelect) {

                    productSelect.onchange =
                        function () {

                            productChanged(
                                this
                            );

                        };

                }


                updateRowNumbers();


                calculateSummary();

            }
        );

    </script>

</asp:Content>
