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

        * {
            box-sizing: border-box;
        }

        .sell-container {
            width: 100%;
            max-width: 1200px;
            margin: 30px auto;
            padding: 0 20px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .page-header {
            margin-bottom: 24px;
        }

        .page-header h2 {
            font-size: 25px;
            font-weight: 700;
            color: #1a252f;
            margin: 0 0 6px 0;
        }

        .page-header p {
            font-size: 14px;
            color: #7f8c8d;
            margin: 0;
        }

        .form-card {
            background: #ffffff;
            border: 1px solid #e8edf2;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 5px 22px rgba(0,0,0,0.07);
        }

        .form-section-title {
            font-size: 13px;
            font-weight: 700;
            color: #2c5364;
            text-transform: uppercase;
            letter-spacing: 0.7px;
            margin: 25px 0 15px 0;
            padding-bottom: 8px;
            border-bottom: 2px solid #eef2f5;
        }

        .form-section-title:first-child {
            margin-top: 0;
        }

        .top-grid {
            display: grid;
            grid-template-columns: 2fr 1fr 1fr;
            gap: 20px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group label {
            font-size: 13px;
            font-weight: 600;
            color: #34495e;
            margin-bottom: 7px;
        }

        .form-control {
            width: 100%;
            min-height: 42px;
            padding: 10px 13px;
            font-size: 14px;
            color: #2c3e50;
            background: #f8f9fa;
            border: 1.5px solid #dcdfe6;
            border-radius: 6px;
            outline: none;
        }

        .form-control:focus {
            background: #ffffff;
            border-color: #2c5364;
        }

        .readonly-control {
            background: #eef2f5;
            color: #566573;
        }

        .customer-info {
            margin-top: 15px;
            padding: 14px 16px;
            background: #f8fafc;
            border: 1px solid #e6ebf0;
            border-radius: 8px;
            display: grid;
            grid-template-columns: 1fr 1fr 1fr;
            gap: 15px;
        }

        .customer-info-item {
            display: flex;
            flex-direction: column;
            gap: 3px;
        }

        .customer-info-label {
            font-size: 11px;
            text-transform: uppercase;
            color: #94a3b8;
            font-weight: 700;
        }

        .customer-info-value {
            font-size: 13px;
            color: #334155;
            font-weight: 600;
        }

        .items-wrapper {
            width: 100%;
            overflow-x: auto;
            border: 1px solid #e3e8ed;
            border-radius: 8px;
            margin-top: 10px;
        }

        .items-table {
            width: 100%;
            min-width: 1000px;
            border-collapse: collapse;
            background: #ffffff;
        }

        .items-table th {
            background: #f4f7f9;
            color: #475569;
            font-size: 12px;
            font-weight: 700;
            text-transform: uppercase;
            padding: 12px 10px;
            text-align: left;
            border-bottom: 1px solid #e1e6eb;
            white-space: nowrap;
        }

        .items-table td {
            padding: 10px;
            border-bottom: 1px solid #edf0f3;
            vertical-align: middle;
        }

        .items-table .form-control {
            min-height: 39px;
            padding: 8px 10px;
            font-size: 13px;
        }

        .col-product {
            width: 23%;
        }

        .col-qty {
            width: 9%;
        }

        .col-price {
            width: 13%;
        }

        .col-gross {
            width: 14%;
        }

        .col-discount {
            width: 12%;
        }

        .col-discount-amount {
            width: 13%;
        }

        .col-net {
            width: 13%;
        }

        .col-action {
            width: 55px;
            text-align: center;
        }

        .calculated-field {
            display: flex;
            align-items: center;
            min-height: 39px;
            padding: 8px 10px;
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            border-radius: 6px;
            color: #334155;
            font-size: 13px;
            font-weight: 600;
            white-space: nowrap;
        }

        .net-field {
            color: #18804b;
            background: #f0fdf4;
            border-color: #d1fae5;
        }

        .btn-remove {
            width: 34px;
            height: 34px;
            border: none;
            border-radius: 6px;
            background: #fff1f2;
            color: #dc2626;
            font-size: 16px;
            font-weight: 700;
            cursor: pointer;
        }

        .product-action-area {
            margin-top: 15px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 15px;
        }

        .btn-add-product {
            padding: 10px 17px;
            background: #f1f5f9;
            color: #2c5364;
            border: 1px solid #d8e0e7;
            border-radius: 6px;
            font-size: 13px;
            font-weight: 700;
            cursor: pointer;
        }

        .btn-calculate {
            padding: 10px 20px;
            background: #2c5364;
            color: #ffffff;
            border: none;
            border-radius: 6px;
            font-size: 13px;
            font-weight: 700;
            cursor: pointer;
        }

        .helper-text {
            margin-top: 8px;
            font-size: 11px;
            color: #94a3b8;
        }

        .summary-area {
            width: 100%;
            margin-top: 25px;
        }

        .summary-box {
            width: 100%;
        }

        .summary-box::before {
            content: "TOTAL SALE SUMMARY";
            display: block;
            padding: 0 20px 10px 20px;
            font-size: 17px;
            font-weight: 800;
            color: #1a252f;
            letter-spacing: 0.5px;
            border-bottom: 1px solid #303638;
        }

        .summary-row {
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            min-height: 54px;
            padding: 0 20px;
            border-bottom: 1px dashed #303638;
        }

        .summary-label {
            font-size: 15px;
            color: #303638;
            font-weight: 500;
        }

        .summary-value {
            font-size: 15px;
            color: #203f4c;
            font-weight: 700;
            text-align: right;
        }

        .summary-total {
            margin-top: 10px;
            min-height: 80px;
            border-top: 2px solid #303638;
            border-bottom: 1px solid #303638;
        }

        .summary-total .summary-label {
            font-size: 20px;
            color: #18804b;
            font-weight: 700;
        }

        .summary-total .summary-value {
            font-size: 24px;
            color: #18804b;
            font-weight: 800;
        }

        .form-actions {
            margin-top: 28px;
            padding-top: 20px;
            border-top: 1px solid #eef2f5;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 15px;
        }

        .btn-link {
            font-size: 14px;
            font-weight: 600;
            color: #2980b9;
            text-decoration: none;
        }

        .btn-save {
            padding: 12px 25px;
            background: linear-gradient(135deg,#27ae60 0%,#1e8449 100%);
            color: #ffffff;
            border: none;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 700;
            cursor: pointer;
        }

        @media (max-width: 900px) {

            .top-grid {
                grid-template-columns: 1fr 1fr;
            }

            .customer-info {
                grid-template-columns: 1fr 1fr;
            }
        }

        @media (max-width: 600px) {

            .sell-container {
                margin: 20px auto;
                padding: 0 12px;
            }

            .form-card {
                padding: 20px 15px;
            }

            .top-grid {
                grid-template-columns: 1fr;
            }

            .customer-info {
                grid-template-columns: 1fr;
            }

            .product-action-area,
            .form-actions {
                flex-direction: column;
                align-items: stretch;
            }

            .btn-add-product,
            .btn-calculate,
            .btn-save {
                width: 100%;
            }
        }

    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="sell-container">

        <div class="page-header">

            <h2>New Sale</h2>

            <p>
                Create a new sales invoice, add products,
                apply discounts and generate the final bill.
            </p>

        </div>


        <div class="form-card">


            <!-- SALE INFORMATION -->

            <div class="form-section-title">
                Sale Information
            </div>


            <div class="top-grid">

                <div class="form-group">

                    <label>Select Customer</label>

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


                <div class="form-group">

                    <label>Invoice Number</label>

                    <asp:TextBox
                        ID="TextBoxInvoice"
                        runat="server"
                        CssClass="form-control readonly-control"
                        ReadOnly="true">
                    </asp:TextBox>

                </div>


                <div class="form-group">

                    <label>Date of Sale</label>

                    <asp:TextBox
                        ID="TextBoxDate"
                        runat="server"
                        CssClass="form-control readonly-control"
                        ReadOnly="true">
                    </asp:TextBox>

                </div>

            </div>


            <!-- CUSTOMER INFORMATION -->

            <div class="customer-info">

                <div class="customer-info-item">

                    <span class="customer-info-label">
                        Customer Name
                    </span>

                    <asp:Label
                        ID="lblCustomerName"
                        runat="server"
                        CssClass="customer-info-value"
                        Text="-">
                    </asp:Label>

                </div>


                <div class="customer-info-item">

                    <span class="customer-info-label">
                        Mobile Number
                    </span>

                    <asp:Label
                        ID="lblCustomerMobile"
                        runat="server"
                        CssClass="customer-info-value"
                        Text="-">
                    </asp:Label>

                </div>


                <div class="customer-info-item">

                    <span class="customer-info-label">
                        Address
                    </span>

                    <asp:Label
                        ID="lblCustomerAddress"
                        runat="server"
                        CssClass="customer-info-value"
                        Text="-">
                    </asp:Label>

                </div>

            </div>


            <!-- SALE ITEMS -->

            <div class="form-section-title">
                Sale Items
            </div>


            <div class="items-wrapper">

                <table class="items-table">

                    <thead>

                        <tr>

                            <th class="col-product">Product</th>
                            <th>Brand</th>
                            <th class="col-qty">Quantity</th>
                            <th class="col-price">Selling Price</th>
                            <th class="col-gross">Gross Amount</th>
                            <th class="col-discount">Discount %</th>
                            <th class="col-discount-amount">Discount Amount</th>
                            <th class="col-net">Net Amount</th>
                            <th class="col-action"></th>

                        </tr>

                    </thead>


                    <tbody id="saleItemsBody">

                        <tr class="sale-item-row">

                            <td>

                                <asp:DropDownList
                                    ID="DropListProduct1"
                                    runat="server"
                                    CssClass="form-control product-select"
                                    onchange="productChanged(this);">

                                    <asp:ListItem
                                        Text="-- Select Product --"
                                        Value="">
                                    </asp:ListItem>

                                </asp:DropDownList>

                            </td>


                            <td>

                                <select
                                    class="form-control brand-select"
                                    onchange="brandChanged(this);">

                                    <option value="">
                                        -- Select Brand --
                                    </option>

                                </select>

                            </td>


                            <td>

                                <asp:TextBox
                                    ID="TextBoxQty1"
                                    runat="server"
                                    CssClass="form-control qty-input"
                                    TextMode="Number"
                                    min="1"
                                    placeholder="Qty"
                                    oninput="calculateRow(this);">
                                </asp:TextBox>

                            </td>


                            <td>

                                <asp:TextBox
                                    ID="TextBoxPrice1"
                                    runat="server"
                                    CssClass="form-control readonly-control price-input"
                                    ReadOnly="true">
                                </asp:TextBox>

                            </td>


                            <td>

                                <div class="calculated-field">

                                    <asp:Label
                                        ID="lblGross1"
                                        runat="server"
                                        CssClass="gross-amount"
                                        Text="₹ 0.00">
                                    </asp:Label>

                                </div>

                            </td>


                            <td>

                                <asp:TextBox
                                    ID="TextBoxDiscount1"
                                    runat="server"
                                    CssClass="form-control discount-input"
                                    TextMode="Number"
                                    min="0"
                                    max="100"
                                    step="0.01"
                                    placeholder="0"
                                    oninput="calculateRow(this);">
                                </asp:TextBox>

                            </td>


                            <td>

                                <div class="calculated-field">

                                    <asp:Label
                                        ID="lblDiscountAmount1"
                                        runat="server"
                                        CssClass="discount-amount"
                                        Text="₹ 0.00">
                                    </asp:Label>

                                </div>

                            </td>


                            <td>

                                <div class="calculated-field net-field">

                                    <asp:Label
                                        ID="lblNetAmount1"
                                        runat="server"
                                        CssClass="net-amount"
                                        Text="₹ 0.00">
                                    </asp:Label>

                                </div>

                            </td>


                            <td class="col-action">

                                <button
                                    type="button"
                                    class="btn-remove"
                                    onclick="removeProductRow(this);">

                                    ×

                                </button>

                            </td>

                        </tr>

                    </tbody>

                </table>

            </div>


            <!-- PRODUCT BUTTONS -->

            <div class="product-action-area">

                <asp:Button
                    ID="btnAddProduct"
                    runat="server"
                    Text="+ Add Another Product"
                    CssClass="btn-add-product"
                    CausesValidation="false"
                    UseSubmitBehavior="false"
                    OnClientClick="addProductRow(); return false;">
                </asp:Button>


                <asp:Button
                    ID="btnCalculateSummary"
                    runat="server"
                    Text="Calculate Summary"
                    CssClass="btn-calculate"
                    CausesValidation="false"
                    UseSubmitBehavior="false"
                    OnClientClick="calculateSummary(); return false;">
                </asp:Button>

            </div>


            <div class="helper-text">
                Select product → select brand → enter quantity →
                enter discount → calculate summary → save sale.
            </div>


            <!-- SUMMARY -->

            <div class="form-section-title">
                Sale Summary
            </div>


            <div class="summary-area">

                <div class="summary-box">

                    <div class="summary-row">

                        <span class="summary-label">
                            Total Gross Amount
                        </span>

                        <span class="summary-value">

                            <asp:Label
                                ID="lblTotalGross"
                                runat="server"
                                Text="₹ 0.00">
                            </asp:Label>

                        </span>

                    </div>


                    <div class="summary-row">

                        <span class="summary-label">
                            Total Discount Amount
                        </span>

                        <span class="summary-value">

                            <asp:Label
                                ID="lblTotalDiscount"
                                runat="server"
                                Text="₹ 0.00">
                            </asp:Label>

                        </span>

                    </div>


                    <div class="summary-row summary-total">

                        <span class="summary-label">
                            Net Amount Collectible
                        </span>

                        <span class="summary-value">

                            <asp:Label
                                ID="lblTotalNet"
                                runat="server"
                                Text="₹ 0.00">
                            </asp:Label>

                        </span>

                    </div>

                </div>

            </div>


            <!-- ACTIONS -->

            <div class="form-actions">

                <asp:LinkButton
                    ID="LinkButton1"
                    runat="server"
                    CssClass="btn-link"
                    OnClick="LinkButton1_Click">

                    &larr; View All Sales

                </asp:LinkButton>


                <asp:Button
                    ID="Button2"
                    runat="server"
                    Text="Save Sale & Generate Invoice"
                    CssClass="btn-save"
                    CausesValidation="false"
                    UseSubmitBehavior="false"
                    OnClick="Button2_Click"
                    OnClientClick="prepareSaleData();">
                </asp:Button>

            </div>


            <!-- HIDDEN FIELDS -->

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

        </div>

    </div>


<script type="text/javascript">

    var productBrandPrice = {};

    // =====================================================
    // LOAD PRODUCT / BRAND / PRICE DATA
    // =====================================================

    function loadBrandPriceData() {

        var hidden = document.getElementById(
            '<%= HiddenProductBrandPrice.ClientID %>'
        );

        if (!hidden || !hidden.value) {
            productBrandPrice = {};
            return;
        }

        try {
            productBrandPrice = JSON.parse(hidden.value);
        }
        catch (e) {
            console.error("Brand price JSON error:", e);
            productBrandPrice = {};
        }
    }


    // =====================================================
    // PRODUCT CHANGED
    // =====================================================

    function productChanged(productSelect) {

        loadBrandPriceData();

        var row = productSelect.closest(".sale-item-row");

        if (!row)
            return;

        var brandSelect =
            row.querySelector(".brand-select");

        var priceInput =
            row.querySelector(".price-input");

        brandSelect.innerHTML =
            '<option value="">-- Select Brand --</option>';

        priceInput.value = "";

        var productName =
            productSelect.value;

        if (!productName) {
            calculateRow(productSelect);
            return;
        }

        var brands =
            productBrandPrice[productName];

        if (!brands || brands.length === 0) {

            console.log(
                "No brand found for " + productName
            );

            return;
        }

        brands.forEach(function (item) {

            var option =
                document.createElement("option");

            option.value = item.brand;

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

            brandSelect.appendChild(option);

        });

        calculateRow(productSelect);
    }


    // =====================================================
    // BRAND CHANGED
    // =====================================================

    function brandChanged(brandSelect) {

        var row =
            brandSelect.closest(".sale-item-row");

        var priceInput =
            row.querySelector(".price-input");

        var option =
            brandSelect.options[
                brandSelect.selectedIndex
            ];

        if (!brandSelect.value) {

            priceInput.value = "";

            calculateRow(brandSelect);

            return;
        }

        var price =
            option.getAttribute("data-price");

        priceInput.value =
            parseFloat(price || 0).toFixed(2);

        calculateRow(brandSelect);
    }


    // =====================================================
    // CALCULATE ROW
    // =====================================================

    function calculateRow(element) {

        var row =
            element.closest(".sale-item-row");

        if (!row)
            return;

        var quantity =
            parseFloat(
                row.querySelector(".qty-input").value
            ) || 0;

        var price =
            parseFloat(
                row.querySelector(".price-input").value
            ) || 0;

        var discount =
            parseFloat(
                row.querySelector(".discount-input").value
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

        row.querySelector(".gross-amount").innerText =
            "₹ " + gross.toFixed(2);

        row.querySelector(".discount-amount").innerText =
            "₹ " + discountAmount.toFixed(2);

        row.querySelector(".net-amount").innerText =
            "₹ " + net.toFixed(2);
    }


    // =====================================================
    // ADD PRODUCT ROW
    // =====================================================

    function addProductRow() {

        var tbody =
            document.getElementById("saleItemsBody");

        var firstRow =
            tbody.querySelector(".sale-item-row");

        if (!firstRow)
            return;

        var newRow =
            firstRow.cloneNode(true);

        var product =
            newRow.querySelector(".product-select");

        var brand =
            newRow.querySelector(".brand-select");

        var qty =
            newRow.querySelector(".qty-input");

        var price =
            newRow.querySelector(".price-input");

        var discount =
            newRow.querySelector(".discount-input");

        product.selectedIndex = 0;

        brand.innerHTML =
            '<option value="">-- Select Brand --</option>';

        qty.value = "";

        price.value = "";

        discount.value = "";

        newRow.querySelector(".gross-amount").innerText =
            "₹ 0.00";

        newRow.querySelector(".discount-amount").innerText =
            "₹ 0.00";

        newRow.querySelector(".net-amount").innerText =
            "₹ 0.00";

        product.onchange = function () {
            productChanged(this);
        };

        brand.onchange = function () {
            brandChanged(this);
        };

        qty.oninput = function () {
            calculateRow(this);
        };

        discount.oninput = function () {
            calculateRow(this);
        };

        tbody.appendChild(newRow);
    }


    // =====================================================
    // REMOVE ROW
    // =====================================================

    function removeProductRow(button) {

        var tbody =
            document.getElementById("saleItemsBody");

        var rows =
            tbody.querySelectorAll(".sale-item-row");

        if (rows.length <= 1) {

            alert(
                "At least one product row is required."
            );

            return;
        }

        button.closest(".sale-item-row").remove();

        calculateSummary();
    }


    // =====================================================
    // CALCULATE SUMMARY
    // =====================================================

    function calculateSummary() {

        var rows =
            document.querySelectorAll(
                "#saleItemsBody .sale-item-row"
            );

        var totalGross = 0;
        var totalDiscount = 0;
        var totalNet = 0;

        rows.forEach(function (row) {

            var quantity =
                parseFloat(
                    row.querySelector(".qty-input").value
                ) || 0;

            var price =
                parseFloat(
                    row.querySelector(".price-input").value
                ) || 0;

            var discount =
                parseFloat(
                    row.querySelector(".discount-input").value
                ) || 0;

            var gross =
                quantity * price;

            var discountAmount =
                gross * discount / 100;

            var net =
                gross - discountAmount;

            totalGross += gross;
            totalDiscount += discountAmount;
            totalNet += net;

        });


        document.getElementById(
            '<%= lblTotalGross.ClientID %>'
        ).innerText =
            "₹ " + totalGross.toFixed(2);


        document.getElementById(
            '<%= lblTotalDiscount.ClientID %>'
        ).innerText =
            "₹ " + totalDiscount.toFixed(2);


        document.getElementById(
            '<%= lblTotalNet.ClientID %>'
        ).innerText =
            "₹ " + totalNet.toFixed(2);


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


    // =====================================================
    // PREPARE DATA BEFORE SERVER POSTBACK
    // =====================================================

function prepareSaleData() { 

        try {

            var rows =
                document.querySelectorAll(
                    "#saleItemsBody .sale-item-row"
                );

            var items = [];

            for (var i = 0; i < rows.length; i++) {

                var row = rows[i];

                var productSelect =
                    row.querySelector(".product-select");

                var brandSelect =
                    row.querySelector(".brand-select");

                var quantityInput =
                    row.querySelector(".qty-input");

                var priceInput =
                    row.querySelector(".price-input");

                var discountInput =
                    row.querySelector(".discount-input");


                var productName =
                    (productSelect.value || "").trim();

                if (productName === "")
                    continue;


                var brand =
                    (brandSelect.value || "").trim();

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


                if (discount < 0 ||
                    discount > 100) {

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

                    productid: productId,

                    productname: productName,

                    brand: brand,

                    quantity: quantity,

                    sellingprice: price,

                    discountpercent: discount,

                    grossamount: gross,

                    discountamount: discountAmount,

                    netamount: net

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


            console.log(
                "SALE DATA:",
                hiddenField.value
            );


            return true;

        }
        catch (error) {

            alert(
                "JavaScript Error: " +
                error.message
            );

            console.error(error);

        }
    }


    // =====================================================
    // PAGE LOAD
    // =====================================================

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

                        productChanged(this);

                    };
            }

        }
    );

</script>

</asp:Content>