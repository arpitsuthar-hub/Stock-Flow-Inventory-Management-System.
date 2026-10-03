<%@ Page Title="Purchase Invoice"
    Language="C#"
    MasterPageFile="~/Purchase Module/Purchase_Module.Master"
    AutoEventWireup="true"
    CodeBehind="Purchase_Invoice.aspx.cs"
    Inherits="Inventory_Management_System.Purchase_Module.Purchase_Invoice" %>


<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style type="text/css">

        /* =========================================================
           INVOICE CONTAINER
        ========================================================= */

        .invoice-container {
            max-width: 1150px;
            margin: 30px auto;
            padding: 0 20px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }


        /* =========================================================
           PAGE HEADER
        ========================================================= */

        .invoice-page-header {
            margin-bottom: 20px;
        }

        .invoice-page-header h2 {
            margin: 0;
            font-size: 25px;
            font-weight: 700;
            color: #1a252f;
        }

        .invoice-page-header p {
            margin: 6px 0 0;
            font-size: 14px;
            color: #7f8c8d;
        }


        /* =========================================================
           INVOICE CARD
        ========================================================= */

        .invoice-card {
            background: #ffffff;
            border-radius: 10px;
            padding: 35px;
            border: 1px solid #e6ebef;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.08);
        }


        /* =========================================================
           INVOICE HEADER
        ========================================================= */

        .invoice-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            padding-bottom: 25px;
            border-bottom: 2px solid #2c5364;
        }


        .company-details h1 {
            margin: 0;
            font-size: 24px;
            font-weight: 800;
            color: #203a43;
        }

        .company-details p {
            margin: 5px 0;
            font-size: 13px;
            color: #6b7280;
        }


        .invoice-title {
            text-align: right;
        }

        .invoice-title h2 {
            margin: 0;
            font-size: 30px;
            font-weight: 800;
            color: #2c5364;
            letter-spacing: 1px;
        }

        .invoice-title span {
            display: block;
            margin-top: 5px;
            font-size: 13px;
            color: #7f8c8d;
        }


        /* =========================================================
           SUPPLIER / INVOICE INFORMATION
        ========================================================= */

        .invoice-meta {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 40px;
            padding: 25px 0;
        }


        .meta-section h4 {
            margin: 0 0 10px;
            font-size: 12px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            color: #7f8c8d;
        }

        .meta-section p {
            margin: 7px 0;
            font-size: 14px;
            color: #2c3e50;
        }

        .meta-section strong {
            color: #1a252f;
        }


        /* =========================================================
           PURCHASE INFO BOX
        ========================================================= */

        .purchase-info {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
            background: #f8f9fa;
            border: 1px solid #eef2f5;
            border-radius: 8px;
            padding: 16px 20px;
            margin-bottom: 28px;
        }


        .purchase-info-item {
            display: flex;
            justify-content: space-between;
            gap: 15px;
            font-size: 13px;
        }


        .purchase-info-item .label {
            color: #7f8c8d;
            font-weight: 600;
        }


        .purchase-info-item .value {
            color: #2c3e50;
            font-weight: 700;
            text-align: right;
        }


        /* =========================================================
           PURCHASE ITEMS TITLE
        ========================================================= */

        .section-title {
            font-size: 15px;
            font-weight: 800;
            color: #203a43;
            margin: 25px 0 12px;
            padding-bottom: 10px;
            border-bottom: 1px solid #e6ebef;
        }


        /* =========================================================
           TABLE WRAPPER
        ========================================================= */

        .table-wrapper {
            width: 100%;
            overflow-x: auto;
            border: 1px solid #e5eaee;
            border-radius: 8px;
        }


        /* =========================================================
           PURCHASE GRID
        ========================================================= */

        .purchase-grid {
            width: 100%;
            min-width: 1050px;
            border-collapse: collapse;
            background: #ffffff;
        }


        .purchase-grid th {
            padding: 14px 12px;
            background: #203a43;
            color: #ffffff;
            font-size: 11px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.3px;
            text-align: left;
            white-space: nowrap;
        }


        .purchase-grid td {
            padding: 14px 12px;
            border-bottom: 1px solid #eef2f5;
            font-size: 13px;
            color: #34495e;
            vertical-align: middle;
        }


        .purchase-grid tr:last-child td {
            border-bottom: none;
        }


        .purchase-grid tr:hover td {
            background: #fafcfd;
        }


        /* =========================================================
           PRODUCT COLUMN
        ========================================================= */

        .product-name {
            font-weight: 700;
            color: #1a252f;
            display: block;
        }


        .product-id {
            display: block;
            margin-top: 4px;
            font-size: 11px;
            color: #94a3b8;
        }


        /* =========================================================
           TEXT ALIGNMENT
        ========================================================= */

        .text-center {
            text-align: center;
        }


        .text-right {
            text-align: right;
        }


        /* =========================================================
           DISCOUNT
        ========================================================= */

        .discount-value {
            color: #dc2626;
            font-weight: 700;
        }


        /* =========================================================
           NET AMOUNT
        ========================================================= */

        .net-value {
            color: #18804b;
            font-weight: 800;
        }


        /* =========================================================
           PURCHASE SUMMARY TITLE
        ========================================================= */

        .summary-section-title {
            margin-top: 30px;
            padding-bottom: 10px;
            border-bottom: 1px solid #e6ebef;
            font-size: 16px;
            font-weight: 800;
            color: #203a43;
        }


        /* =========================================================
           PURCHASE SUMMARY - FULL WIDTH
        ========================================================= */

        .invoice-bottom {
            width: 100%;
            display: block;
            margin-top: 0;
        }


        .invoice-summary {
            width: 100%;
            max-width: 100%;
        }


        /* =========================================================
           SUMMARY ROW
        ========================================================= */

        .summary-row {
            width: 100%;

            display: flex;
            justify-content: space-between;
            align-items: center;

            min-height: 55px;
            padding: 0 5px;

            border-bottom: 1px dashed #d8dee4;

            font-size: 14px;
        }


        .summary-label {
            color: #64748b;
            font-weight: 600;
        }


        .summary-value {
            color: #1e293b;
            font-weight: 700;
            text-align: right;

            min-width: 160px;
        }


        /* =========================================================
           TOTAL NET AMOUNT
        ========================================================= */

        .summary-total {
            width: 100%;

            margin-top: 8px;
            min-height: 75px;

            padding: 0 5px;

            border-top: 2px solid #203a43;
            border-bottom: none;
        }


        .summary-total .summary-label {
            font-size: 17px;
            color: #0f172a;
            font-weight: 800;
        }


        .summary-total .summary-value {
            font-size: 21px;
            color: #18804b;
            font-weight: 800;
        }


        /* =========================================================
           FOOTER
        ========================================================= */

        .invoice-note {
            margin-top: 35px;
            padding-top: 20px;
            border-top: 1px solid #eef2f5;
            text-align: center;
        }


        .invoice-note p {
            margin: 5px 0;
            font-size: 12px;
            color: #7f8c8d;
        }


        /* =========================================================
           ACTION BUTTONS
        ========================================================= */

        .invoice-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 22px;
        }


        .btn-back {
            padding: 11px 20px;
            background: #eef2f5;
            color: #2c5364;
            border: 1px solid #dcdfe6;
            border-radius: 6px;
            font-size: 13px;
            font-weight: 700;
            text-decoration: none;
        }


        .btn-back:hover {
            background: #e2e8ee;
        }


        .btn-print {
            padding: 11px 22px;
            background: linear-gradient(
                135deg,
                #2c5364,
                #203a43
            );
            color: #ffffff;
            border: none;
            border-radius: 6px;
            font-size: 13px;
            font-weight: 700;
            cursor: pointer;
        }


        .btn-print:hover {
            opacity: 0.92;
        }


        /* =========================================================
           MOBILE
        ========================================================= */

        @media (max-width: 700px) {

            .invoice-container {
                padding: 0 12px;
            }


            .invoice-card {
                padding: 20px;
            }


            .invoice-header {
                flex-direction: column;
                gap: 20px;
            }


            .invoice-title {
                text-align: left;
            }


            .invoice-meta {
                grid-template-columns: 1fr;
                gap: 20px;
            }


            .purchase-info {
                grid-template-columns: 1fr;
            }


            .invoice-summary {
                width: 100%;
            }


            .summary-value {
                min-width: 120px;
            }


            .invoice-actions {
                flex-direction: column-reverse;
                gap: 12px;
            }


            .btn-back,
            .btn-print {
                width: 100%;
                text-align: center;
                box-sizing: border-box;
            }

        }


        /* =========================================================
           PRINT
        ========================================================= */

        @media print {

            .invoice-page-header,
            .invoice-actions {
                display: none !important;
            }


            .invoice-container {
                max-width: 100%;
                margin: 0;
                padding: 0;
            }


            .invoice-card {
                box-shadow: none;
                border: none;
                padding: 0;
            }


            .purchase-grid th {
                background: #203a43 !important;
                color: #ffffff !important;
                -webkit-print-color-adjust: exact;
                print-color-adjust: exact;
            }

        }

    </style>

</asp:Content>



<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">


    <div class="invoice-container">


        <!-- =====================================================
             PAGE HEADER
        ====================================================== -->

        <div class="invoice-page-header">

            <h2>
                Purchase Invoice
            </h2>

            <p>
                View complete purchase details and print the invoice.
            </p>

        </div>



        <!-- =====================================================
             INVOICE CARD
        ====================================================== -->

        <div class="invoice-card">


            <!-- =================================================
                 COMPANY HEADER
            ================================================== -->

            <div class="invoice-header">


                <div class="company-details">

                    <h1>
                        INVENTORY MANAGEMENT SYSTEM
                    </h1>

                    <p>
                        Inventory &amp; Purchase Management
                    </p>

                    <p>
                        Rajasthan, India
                    </p>

                </div>



                <div class="invoice-title">

                    <h2>
                        PURCHASE
                    </h2>

                    <span>
                        INVOICE
                    </span>

                </div>


            </div>



            <!-- =================================================
                 SUPPLIER / INVOICE INFORMATION
            ================================================== -->

            <div class="invoice-meta">


                <!-- SUPPLIER DETAILS -->

                <div class="meta-section">

                    <h4>
                        Supplier Details
                    </h4>


                    <p>

                        <strong>

                            <asp:Label
                                ID="lblSupplierName"
                                runat="server"
                                Text="-">
                            </asp:Label>

                        </strong>

                    </p>


                    <p>

                        Phone:

                        <asp:Label
                            ID="lblSupplierPhone"
                            runat="server"
                            Text="-">
                        </asp:Label>

                    </p>


                    <p>

                        Address:

                        <asp:Label
                            ID="lblSupplierAddress"
                            runat="server"
                            Text="-">
                        </asp:Label>

                    </p>

                </div>



                <!-- INVOICE DETAILS -->

                <div class="meta-section">

                    <h4>
                        Invoice Details
                    </h4>


                    <p>

                        Invoice No:

                        <strong>

                            <asp:Label
                                ID="lblInvoiceNo"
                                runat="server"
                                Text="-">
                            </asp:Label>

                        </strong>

                    </p>


                    <p>

                        Purchase Date:

                        <asp:Label
                            ID="lblPurchaseDate"
                            runat="server"
                            Text="-">
                        </asp:Label>

                    </p>


                    <p>

                        Purchase ID:

                        <strong>

                            <asp:Label
                                ID="lblPurchaseId"
                                runat="server"
                                Text="-">
                            </asp:Label>

                        </strong>

                    </p>

                </div>


            </div>



            <!-- =================================================
                 PURCHASE INFORMATION
            ================================================== -->

            <div class="purchase-info">


                <!-- SUPPLIER -->

                <div class="purchase-info-item">

                    <span class="label">
                        Supplier
                    </span>


                    <span class="value">

                        <asp:Label
                            ID="lblSupplierName2"
                            runat="server"
                            Text="-">
                        </asp:Label>

                    </span>

                </div>



                <!-- TOTAL PRODUCTS -->

                <div class="purchase-info-item">

                    <span class="label">
                        Total Products
                    </span>


                    <span class="value">

                        <asp:Label
                            ID="lblTotalProducts"
                            runat="server"
                            Text="0">
                        </asp:Label>

                    </span>

                </div>


            </div>



            <!-- =================================================
                 PURCHASED PRODUCTS
            ================================================== -->

            <div class="section-title">

                Purchased Products

            </div>



            <div class="table-wrapper">


                <asp:GridView
                    ID="gvPurchaseProducts"
                    runat="server"
                    AutoGenerateColumns="False"
                    CssClass="purchase-grid"
                    GridLines="None"
                    ShowHeader="true"
                    ShowHeaderWhenEmpty="true"
                    EmptyDataText="No purchased products found.">


                    <Columns>



                        <asp:TemplateField
                            HeaderText="#">

                            <ItemStyle
                                CssClass="text-center"
                                Width="5%" />

                            <HeaderStyle
                                HorizontalAlign="Center" />

                            <ItemTemplate>

                                <%# Container.DataItemIndex + 1 %>

                            </ItemTemplate>

                        </asp:TemplateField>




                        <asp:TemplateField
                            HeaderText="Category">

                            <ItemStyle Width="13%" />

                            <ItemTemplate>

                                <asp:Label
                                    ID="lblCategory"
                                    runat="server"
                                    Text='<%# Eval("Category") %>'>
                                </asp:Label>

                            </ItemTemplate>

                        </asp:TemplateField>



                       

                        <asp:TemplateField
                            HeaderText="Product Name + ID">

                            <ItemStyle Width="22%" />

                            <ItemTemplate>


                                <span class="product-name">

                                    <asp:Label
                                        ID="lblProductName"
                                        runat="server"
                                        Text='<%# Eval("ProductName") %>'>
                                    </asp:Label>

                                </span>


                                <span class="product-id">

                                    ID:

                                    <asp:Label
                                        ID="lblProductId"
                                        runat="server"
                                        Text='<%# Eval("ProductID") %>'>
                                    </asp:Label>

                                </span>


                            </ItemTemplate>

                        </asp:TemplateField>



                    
                        <asp:TemplateField
                            HeaderText="Brand">

                            <ItemStyle Width="12%" />

                            <ItemTemplate>

                                <asp:Label
                                    ID="lblBrand"
                                    runat="server"
                                    Text='<%# Eval("Brand") %>'>
                                </asp:Label>

                            </ItemTemplate>

                        </asp:TemplateField>




                        <asp:TemplateField
                            HeaderText="Quantity">

                            <HeaderStyle
                                HorizontalAlign="Center" />

                            <ItemStyle
                                CssClass="text-center"
                                Width="12%" />

                            <ItemTemplate>

                                <asp:Label
                                    ID="lblQuantity"
                                    runat="server"
                                    Text='<%# Eval("Quantity") %>'>
                                </asp:Label>

                                &nbsp;

                                <asp:Label
                                    ID="lblUnit"
                                    runat="server"
                                    Text='<%# Eval("Unit") %>'>
                                </asp:Label>

                            </ItemTemplate>

                        </asp:TemplateField>



                      

                        <asp:TemplateField
                            HeaderText="Total Gross">

                            <HeaderStyle
                                HorizontalAlign="Right" />

                            <ItemStyle
                                CssClass="text-right"
                                Width="13%" />

                            <ItemTemplate>

                                ₹

                                <asp:Label
                                    ID="lblGross"
                                    runat="server"
                                    Text='<%# Eval("GrossAmount", "{0:N2}") %>'>
                                </asp:Label>

                            </ItemTemplate>

                        </asp:TemplateField>



                        

                        <asp:TemplateField
                            HeaderText="Discount Applied">

                            <HeaderStyle
                                HorizontalAlign="Right" />

                            <ItemStyle
                                CssClass="text-right discount-value"
                                Width="13%" />

                            <ItemTemplate>

                                ₹

                                <asp:Label
                                    ID="lblDiscount"
                                    runat="server"
                                    Text='<%# Eval("DiscountAmount", "{0:N2}") %>'>
                                </asp:Label>

                            </ItemTemplate>

                        </asp:TemplateField>



                    
                        <asp:TemplateField
                            HeaderText="Net Amount">

                            <HeaderStyle
                                HorizontalAlign="Right" />

                            <ItemStyle
                                CssClass="text-right net-value"
                                Width="13%" />

                            <ItemTemplate>

                                ₹

                                <asp:Label
                                    ID="lblNetAmount"
                                    runat="server"
                                    Text='<%# Eval("NetAmount", "{0:N2}") %>'>
                                </asp:Label>

                            </ItemTemplate>

                        </asp:TemplateField>


                    </Columns>


                    <EmptyDataTemplate>

                        <div style="
                            padding:25px;
                            text-align:center;
                            color:#94a3b8;">

                            No purchased products found.

                        </div>

                    </EmptyDataTemplate>


                </asp:GridView>


            </div>



            <!-- =================================================
                 PURCHASE SUMMARY
            ================================================== -->

            <div class="summary-section-title">

                Purchase Summary

            </div>



            <div class="invoice-bottom">


                <div class="invoice-summary">


                    <!-- =================================================
                         TOTAL GROSS AMOUNT
                    ================================================== -->

                    <div class="summary-row">


                        <span class="summary-label">

                            Total Gross Amount

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



                    <!-- =================================================
                         TOTAL DISCOUNT AMOUNT
                    ================================================== -->

                    <div class="summary-row">


                        <span class="summary-label">

                            Total Discount Amount

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



                    <!-- =================================================
                         TOTAL NET AMOUNT
                    ================================================== -->

                    <div class="summary-row summary-total">


                        <span class="summary-label">

                            Total Net Amount

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
                 FOOTER
            ================================================== -->

            <div class="invoice-note">


                <p>

                    <strong>
                        Thank you for your business.
                    </strong>

                </p>


                <p>
                    This is a computer-generated purchase invoice.
                </p>


            </div>


        </div>



        <!-- =====================================================
             ACTION BUTTONS
        ====================================================== -->

        <div class="invoice-actions">


            <asp:HyperLink
                ID="btnBack"
                runat="server"
                NavigateUrl="Purchase_All.aspx"
                CssClass="btn-back">

                &larr; Back to Purchases

            </asp:HyperLink>



            <button
                type="button"
                class="btn-print"
                onclick="window.print();">

                🖨 Print Invoice

            </button>


        </div>


    </div>


</asp:Content>