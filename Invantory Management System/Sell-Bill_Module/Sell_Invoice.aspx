<%@ Page Title="Sales Invoice"
    Language="C#"
    MasterPageFile="~/Sell-Bill_Module/Sell-Bill_Module.Master"
    AutoEventWireup="true"
    CodeBehind="Sell_Invoice.aspx.cs"
    Inherits="Inventory_Management_System.Sell_Bill_Module.Sell_Invoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">

        /* =========================================================
           SALES INVOICE
        ========================================================= */

        * {
            box-sizing: border-box;
        }

        body {
            background: #f4f6f8;
        }

        /* =========================================================
           MAIN CONTAINER
        ========================================================= */

        .invoice-container {
            width: 100%;
            max-width: 1050px;
            margin: 30px auto;
            padding: 0 20px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        /* =========================================================
           INVOICE CARD
        ========================================================= */

        .invoice-card {
            background: #ffffff;
            border: 1px solid #e3e8ed;
            border-radius: 10px;
            box-shadow: 0 5px 22px rgba(0, 0, 0, 0.07);
            overflow: hidden;
        }

        /* =========================================================
           HEADER
        ========================================================= */

        .invoice-header {
            padding: 30px 35px;
            border-bottom: 1px solid #e5e9ed;
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            gap: 30px;
        }

        .company-info {
            flex: 1;
        }

        .company-name {
            font-size: 25px;
            font-weight: 800;
            color: #1a252f;
            margin: 0 0 6px 0;
            letter-spacing: 0.3px;
        }

        .company-subtitle {
            font-size: 13px;
            color: #64748b;
            margin: 0 0 8px 0;
        }

        .company-contact {
            font-size: 12px;
            line-height: 1.7;
            color: #64748b;
        }

        .invoice-title-box {
            text-align: right;
            min-width: 230px;
        }

        .invoice-title {
            font-size: 28px;
            font-weight: 800;
            color: #2c5364;
            margin: 0 0 8px 0;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .invoice-number {
            font-size: 13px;
            color: #475569;
            margin-bottom: 4px;
        }

        .invoice-date {
            font-size: 13px;
            color: #64748b;
        }

        /* =========================================================
           CUSTOMER SECTION
        ========================================================= */

        .customer-section {
            padding: 24px 35px;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 30px;
            border-bottom: 1px solid #e5e9ed;
        }

        .info-block-title {
            font-size: 11px;
            font-weight: 800;
            color: #94a3b8;
            text-transform: uppercase;
            letter-spacing: 0.8px;
            margin-bottom: 8px;
        }

        .customer-name {
            font-size: 16px;
            font-weight: 700;
            color: #1e293b;
            margin-bottom: 5px;
        }

        .customer-detail {
            font-size: 13px;
            color: #64748b;
            line-height: 1.7;
        }

        .sale-detail {
            text-align: right;
        }

        .sale-detail-row {
            display: flex;
            justify-content: flex-end;
            gap: 20px;
            margin-bottom: 6px;
        }

        .sale-detail-label {
            font-size: 12px;
            color: #94a3b8;
            font-weight: 600;
        }

        .sale-detail-value {
            min-width: 120px;
            font-size: 13px;
            color: #334155;
            font-weight: 700;
        }

        /* =========================================================
           ITEMS TABLE
        ========================================================= */

        .items-section {
            padding: 0 35px;
            overflow-x: auto;
        }

        .items-table {
            width: 100%;
            min-width: 900px;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .items-table thead th {
            background: #f4f7f9;
            color: #475569;
            font-size: 11px;
            font-weight: 800;
            text-transform: uppercase;
            letter-spacing: 0.4px;
            padding: 12px 10px;
            border-top: 1px solid #e3e8ed;
            border-bottom: 1px solid #e3e8ed;
            text-align: left;
        }

        .items-table tbody td {
            padding: 13px 10px;
            font-size: 13px;
            color: #334155;
            border-bottom: 1px solid #edf0f3;
            vertical-align: middle;
        }

        .items-table tbody tr:last-child td {
            border-bottom: 1px solid #e3e8ed;
        }

        .product-name {
            font-weight: 700;
            color: #1e293b;
        }

        .brand-name {
            color: #64748b;
            font-weight: 600;
        }

        .text-center {
            text-align: center !important;
        }

        .text-right {
            text-align: right !important;
        }

        .price-cell {
            white-space: nowrap;
        }

        .discount-cell {
            color: #64748b !important;
        }

        .net-cell {
            color: #18804b !important;
            font-weight: 700;
        }

        /* =========================================================
           TOTALS
        ========================================================= */

        .summary-title {
            font-size: 14px;
            font-weight: 800;
            color: #2c5364;
            text-transform: uppercase;
            letter-spacing: 0.6px;
            margin-bottom: 12px;
            padding-bottom: 10px;
            border-bottom: 1px solid #e3e8ed;
        }

        .totals-section {
            width: 100%;
            padding: 25px 35px 10px 35px;
        }

        .totals-box {
            width: 100%;
        }

        .total-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
            padding: 10px 0;
            border-bottom: 1px dashed #dfe5ea;
        }

        .total-label {
            text-align: left;
            font-size: 13px;
            color: #64748b;
            font-weight: 600;
        }

        .total-value {
            text-align: right;
            min-width: 120px;
            font-size: 14px;
            color: #334155;
            font-weight: 700;
        }

        .grand-total {
            margin-top: 8px;
            padding: 14px 0;
            border-top: 2px solid #dfe5ea;
            border-bottom: none;
        }

        .grand-total .total-label {
            text-align: left;
            font-size: 16px;
            color: #0f172a;
            font-weight: 800;
        }

        .grand-total .total-value {
            text-align: right;
            font-size: 21px;
            color: #18804b;
            font-weight: 800;
        }

        /* =========================================================
           FOOTER
        ========================================================= */

        .invoice-footer {
            margin: 20px 35px 0 35px;
            padding: 20px 0;
            border-top: 1px solid #e5e9ed;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 30px;
        }

        .footer-title {
            font-size: 12px;
            font-weight: 800;
            color: #334155;
            margin-bottom: 6px;
        }

        .footer-text {
            font-size: 12px;
            color: #64748b;
            line-height: 1.7;
        }

        .signature-box {
            text-align: right;
        }

        .signature-line {
            display: inline-block;
            width: 180px;
            margin-top: 35px;
            border-top: 1px solid #94a3b8;
            padding-top: 7px;
            font-size: 11px;
            color: #64748b;
            text-align: center;
        }

        /* =========================================================
           ACTION BUTTONS
        ========================================================= */

        .invoice-actions {
            margin-top: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 15px;
        }

        .btn-back {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 11px 20px;
            background: #eef2f5;
            border: 1px solid #d8e0e7;
            border-radius: 6px;
            color: #2c5364;
            font-size: 13px;
            font-weight: 700;
            text-decoration: none;
            cursor: pointer;
        }

        .btn-back:hover {
            background: #e3e9ee;
        }

        .btn-print {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 11px 23px;
            background: linear-gradient(135deg, #2c5364 0%, #203a43 100%);
            border: none;
            border-radius: 6px;
            color: #ffffff;
            font-size: 13px;
            font-weight: 700;
            cursor: pointer;
        }

        .btn-print:hover {
            transform: translateY(-1px);
        }

        /* =========================================================
           PRINT
        ========================================================= */

        @media print {

            body {
                background: #ffffff !important;
            }

            .invoice-container {
                max-width: none;
                margin: 0;
                padding: 0;
            }

            .invoice-card {
                border: none;
                box-shadow: none;
                border-radius: 0;
            }

            .invoice-actions {
                display: none !important;
            }

            .invoice-header {
                padding: 20px 0;
            }

            .customer-section {
                padding-left: 0;
                padding-right: 0;
            }

            .items-section {
                padding-left: 0;
                padding-right: 0;
                overflow: visible;
            }

            .items-table {
                min-width: 0;
            }

            .totals-section {
                padding-right: 0;
                padding-left: 0;
            }

            .invoice-footer {
                margin-left: 0;
                margin-right: 0;
            }

            .items-table thead th {
                background: #f4f7f9 !important;
                -webkit-print-color-adjust: exact;
                print-color-adjust: exact;
            }

            .net-cell,
            .grand-total .total-value {
                color: #18804b !important;
                -webkit-print-color-adjust: exact;
                print-color-adjust: exact;
            }
        }

        /* =========================================================
           MOBILE
        ========================================================= */

        @media (max-width: 700px) {

            .invoice-container {
                margin: 15px auto;
                padding: 0 10px;
            }

            .invoice-header {
                padding: 22px 20px;
                flex-direction: column;
            }

            .invoice-title-box {
                text-align: left;
            }

            .invoice-title {
                font-size: 23px;
            }

            .customer-section {
                padding: 20px;
                grid-template-columns: 1fr;
                gap: 20px;
            }

            .sale-detail {
                text-align: left;
            }

            .sale-detail-row {
                justify-content: flex-start;
            }

            .items-section {
                padding: 0 15px;
            }

            .items-table {
                min-width: 900px;
            }

            .totals-section {
                padding: 20px 15px 10px 15px;
            }

            .invoice-footer {
                margin: 15px;
                grid-template-columns: 1fr;
            }

            .signature-box {
                text-align: left;
            }

            .invoice-actions {
                flex-direction: column-reverse;
                align-items: stretch;
            }

            .btn-back,
            .btn-print {
                width: 100%;
            }
        }

    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="invoice-container">

        <div class="invoice-card">

            <!-- =====================================================
                 HEADER
            ====================================================== -->

            <div class="invoice-header">

                <div class="company-info">

                    <h1 class="company-name">
                        INVENTORY MANAGEMENT SYSTEM
                    </h1>

                    <p class="company-subtitle">
                        Sales & Billing Department
                    </p>

                    <div class="company-contact">
                        Address: Your Business Address, Rajasthan<br />
                        Phone: +91 XXXXX XXXXX<br />
                        Email: yourbusiness@email.com
                    </div>

                </div>


                <div class="invoice-title-box">

                    <div class="invoice-title">
                        Invoice
                    </div>

                    <div class="invoice-number">

                        Invoice No:

                        <asp:Label
                            ID="lblInvoiceNo"
                            runat="server"
                            Text="INV-00001">
                        </asp:Label>

                    </div>

                    <div class="invoice-date">

                        Date:

                        <asp:Label
                            ID="lblInvoiceDate"
                            runat="server"
                            Text="-">
                        </asp:Label>

                    </div>

                </div>

            </div>


            <!-- =====================================================
                 CUSTOMER INFORMATION
            ====================================================== -->

            <div class="customer-section">

                <div>

                    <div class="info-block-title">
                        Bill To
                    </div>

                    <div class="customer-name">

                        <asp:Label
                            ID="lblCustomerName"
                            runat="server"
                            Text="-">
                        </asp:Label>

                    </div>

                    <div class="customer-detail">

                        Mobile:

                        <asp:Label
                            ID="lblCustomerMobile"
                            runat="server"
                            Text="-">
                        </asp:Label>

                        <br />

                        Address:

                        <asp:Label
                            ID="lblCustomerAddress"
                            runat="server"
                            Text="-">
                        </asp:Label>

                    </div>

                </div>


                <!-- SALE INFORMATION -->

                <div class="sale-detail">

                    <div class="info-block-title">
                        Sale Information
                    </div>

                    <div class="sale-detail-row">

                        <span class="sale-detail-label">
                            Payment Status
                        </span>

                        <span class="sale-detail-value">

                            <asp:Label
                                ID="lblPaymentStatus"
                                runat="server"
                                Text="Paid">
                            </asp:Label>

                        </span>

                    </div>


                    <div class="sale-detail-row">

                        <span class="sale-detail-label">
                            Payment Method
                        </span>

                        <span class="sale-detail-value">

                            <asp:Label
                                ID="lblPaymentMethod"
                                runat="server"
                                Text="Cash">
                            </asp:Label>

                        </span>

                    </div>


                    <div class="sale-detail-row">

                        <span class="sale-detail-label">
                            Salesperson
                        </span>

                        <span class="sale-detail-value">

                            <asp:Label
                                ID="lblSalesPerson"
                                runat="server"
                                Text="Admin">
                            </asp:Label>

                        </span>

                    </div>

                </div>

            </div>


            <!-- =====================================================
                 PRODUCTS
            ====================================================== -->

            <div class="items-section">

                <table class="items-table">

                    <thead>

                        <tr>

                            <th style="width: 20%;">
                                Product Name
                            </th>

                            <th style="width: 13%;">
                                Brand
                            </th>

                            <th class="text-center" style="width: 8%;">
                                Quantity
                            </th>

                            <th class="text-right" style="width: 12%;">
                                Unit Price
                            </th>

                            <th class="text-right" style="width: 14%;">
                                Gross Amount
                            </th>

                            <th class="text-center" style="width: 9%;">
                                Discount
                            </th>

                            <th class="text-right" style="width: 13%;">
                                Discount Amount
                            </th>

                            <th class="text-right" style="width: 13%;">
                                Net Amount
                            </th>

                        </tr>

                    </thead>


                    <tbody>

                        <asp:Repeater
                            ID="rptSaleItems"
                            runat="server">

                            <ItemTemplate>

                                <tr>

                                    <!-- PRODUCT NAME -->

                                    <td>

                                        <div class="product-name">
                                            <%# Eval("product_name") %>
                                        </div>

                                    </td>


                                    <!-- BRAND -->

                                    <td>

                                        <div class="brand-name">
                                            <%# Eval("brand") %>
                                        </div>

                                    </td>


                                    <!-- QUANTITY -->

                                    <td class="text-center">

                                        <%# FormatQuantity(Eval("quantity")) %>

                                    </td>


                                    <!-- UNIT PRICE -->

                                    <td class="text-right price-cell">

                                        ₹ <%# FormatAmount(Eval("selling_price")) %>

                                    </td>


                                    <!-- GROSS AMOUNT -->

                                    <td class="text-right price-cell">

                                        ₹ <%# FormatAmount(Eval("grossamount")) %>

                                    </td>


                                    <!-- DISCOUNT -->

                                    <td class="text-center discount-cell">

                                        <%# FormatDiscount(Eval("discountpercent")) %>

                                    </td>


                                    <!-- DISCOUNT AMOUNT -->

                                    <td class="text-right price-cell discount-cell">

                                        ₹ <%# FormatAmount(Eval("discountamount")) %>

                                    </td>


                                    <!-- NET AMOUNT -->

                                    <td class="text-right price-cell net-cell">

                                        ₹ <%# FormatAmount(Eval("netamount")) %>

                                    </td>

                                </tr>

                            </ItemTemplate>

                        </asp:Repeater>

                    </tbody>

                </table>

            </div>


            <!-- =====================================================
                 TOTALS
            ====================================================== -->

            <div class="totals-section">

                <div class="totals-box">

                    <div class="summary-title">
                        Total Sale Summary
                    </div>


                    <div class="total-row">

                        <span class="total-label">
                            Total Gross Amount
                        </span>

                        <span class="total-value">

                            ₹

                            <asp:Label
                                ID="lblTotalGross"
                                runat="server"
                                Text="0.00">
                            </asp:Label>

                        </span>

                    </div>


                    <div class="total-row">

                        <span class="total-label">
                            Total Discount Amount
                        </span>

                        <span class="total-value">

                            ₹

                            <asp:Label
                                ID="lblTotalDiscount"
                                runat="server"
                                Text="0.00">
                            </asp:Label>

                        </span>

                    </div>


                    <div class="total-row grand-total">

                        <span class="total-label">
                            Net Amount Collectible
                        </span>

                        <span class="total-value">

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


            <!-- =====================================================
                 FOOTER
            ====================================================== -->

            <div class="invoice-footer">

                <div>

                    <div class="footer-title">
                        Terms & Notes
                    </div>

                    <div class="footer-text">

                        Goods once sold are subject to the company's
                        return and exchange policy.

                        <br />

                        Please retain this invoice for future reference.

                        <br />

                        Thank you for your business.

                    </div>

                </div>


                <div class="signature-box">

                    <div class="footer-title">
                        Authorized Signature
                    </div>

                    <div class="signature-line">
                        Authorized Signatory
                    </div>

                </div>

            </div>

        </div>


        <!-- =====================================================
             ACTION BUTTONS
        ====================================================== -->

        <div class="invoice-actions">

            <asp:LinkButton
                ID="btnBack"
                runat="server"
                CssClass="btn-back"
                OnClick="btnBack_Click">

                &larr;&nbsp; Back to Sales

            </asp:LinkButton>


            <asp:Button
                ID="btnPrint"
                runat="server"
                Text="Print Invoice"
                CssClass="btn-print"
                OnClick="btnPrint_Click">
            </asp:Button>

        </div>

    </div>

</asp:Content>