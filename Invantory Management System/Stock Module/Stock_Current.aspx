<%@ Page Title="Current Stock"
    Language="C#"
    MasterPageFile="~/Stock Module/Stock_Module.Master"
    AutoEventWireup="true"
    CodeBehind="Stock_Current.aspx.cs"
    Inherits="Inventory_Management_System.Stock_Module.Stock_Current" %>


<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style>

        /* =========================================================
           CURRENT STOCK PAGE
        ========================================================= */

        .current-stock {
            width: 100%;
            padding: 0;
            font-family: "Segoe UI", Arial, Helvetica, sans-serif;
            color: #172033;
        }


        /* =========================================================
           PAGE HEADER
        ========================================================= */

        .current-stock-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }


        .stock-title h1 {
            margin: 0 0 6px;
            font-size: 28px;
            font-weight: 700;
            color: #172033;
        }


        .stock-title p {
            margin: 0;
            color: #718096;
            font-size: 14px;
        }


        /* =========================================================
           STOCK SUMMARY
        ========================================================= */

        .stock-summary {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 18px;
            margin-bottom: 25px;
        }


        .summary-card {
            background: #ffffff;
            border: 1px solid #e5e7eb;
            border-radius: 10px;
            padding: 20px;

            transition:
                transform 0.2s ease,
                box-shadow 0.2s ease;
        }


        .summary-card:hover {
            transform: translateY(-2px);

            box-shadow:
                0 5px 15px rgba(0, 0, 0, 0.06);
        }


        .summary-card span {
            display: block;
            color: #718096;
            font-size: 13px;
            margin-bottom: 8px;
        }


        .summary-card strong {
            display: block;
            font-size: 25px;
            color: #172033;
        }


        /* =========================================================
           STOCK CONTAINER
        ========================================================= */

        .stock-container {
            background: #ffffff;
            border: 1px solid #e5e7eb;
            border-radius: 10px;
            overflow: hidden;
        }


        /* =========================================================
           TABLE TOP
        ========================================================= */

        .table-top {
            padding: 20px 22px;

            display: flex;
            justify-content: space-between;
            align-items: center;

            border-bottom: 1px solid #e5e7eb;
        }


        .table-top h2 {
            margin: 0;
            font-size: 18px;
            color: #172033;
        }


        .table-top p {
            margin: 5px 0 0;
            color: #718096;
            font-size: 13px;
        }


        /* =========================================================
           CATEGORY SEARCH
        ========================================================= */

        .search-box {
            width: 250px;
            height: 40px;

            border: 1px solid #d1d5db;
            border-radius: 7px;

            padding: 0 13px;

            outline: none;

            font-size: 13px;
            color: #333;

            background: #ffffff;

            cursor: pointer;
        }


        .search-box:focus {
            border-color: #172033;

            box-shadow:
                0 0 0 2px rgba(23, 32, 51, 0.07);
        }


        /* =========================================================
           TABLE WRAPPER
        ========================================================= */

        .stock-table-wrapper {
            width: 100%;
            overflow-x: auto;
        }


        /* =========================================================
           GRIDVIEW TABLE
        ========================================================= */

        .stock-table {
            width: 100%;
            border-collapse: collapse;
            min-width: 900px;
        }


        /* =========================================================
           TABLE HEADER
        ========================================================= */

        .stock-table th {
            background: #172033;

            color: #ffffff;

            font-size: 12px;
            font-weight: 600;

            text-align: left;

            padding: 14px 20px;

            border-bottom: 1px solid #263149;

            text-transform: uppercase;

            letter-spacing: 0.3px;

            white-space: nowrap;
        }


        /* =========================================================
           TABLE DATA
        ========================================================= */

        .stock-table td {
            padding: 16px 20px;

            font-size: 13px;

            border-bottom: 1px solid #eef0f3;

            color: #334155;

            white-space: nowrap;
        }


        /* =========================================================
           TABLE HOVER
        ========================================================= */

        .stock-table tr:hover {
            background: #f7f8fa;
        }


        .stock-table tr:last-child td {
            border-bottom: none;
        }


        /* =========================================================
           PRODUCT NAME
        ========================================================= */

        .product-name {
            font-weight: 600;
            color: #172033;
        }


        .product-id {
            color: #94a3b8;
            font-size: 11px;
            margin-top: 3px;
        }


        /* =========================================================
           QUANTITY
        ========================================================= */

        .quantity {
            font-weight: 600;
            color: #172033;
        }


        /* =========================================================
           STATUS
        ========================================================= */

        .status {
            font-weight: 600;
        }


        /* =========================================================
           EMPTY STATE
        ========================================================= */

        .empty-stock {
            text-align: center;
            padding: 55px 20px;
        }


        .empty-stock-icon {
            font-size: 38px;
            margin-bottom: 12px;
        }


        .empty-stock h3 {
            margin: 0 0 6px;
            font-size: 18px;
            color: #172033;
        }


        .empty-stock p {
            margin: 0;
            color: #718096;
            font-size: 13px;
        }


        /* =========================================================
           RESPONSIVE - TABLET
        ========================================================= */

        @media (max-width: 900px) {

            .stock-summary {
                grid-template-columns: 1fr;
            }


            .table-top {
                align-items: flex-start;
                gap: 15px;
                flex-direction: column;
            }


            .search-box {
                width: 100%;
            }

        }


        /* =========================================================
           RESPONSIVE - MOBILE
        ========================================================= */

        @media (max-width: 600px) {

            .current-stock {
                padding: 0;
            }


            .current-stock-header {
                align-items: flex-start;
                flex-direction: column;
                gap: 5px;
            }


            .stock-title h1 {
                font-size: 24px;
            }


            .stock-title p {
                font-size: 13px;
            }


            .summary-card {
                padding: 17px;
            }


            .table-top {
                padding: 17px;
            }

        }

    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">


    <div class="current-stock">


        <!-- =====================================================
             PAGE HEADER
        ====================================================== -->

        <div class="current-stock-header">

            <div class="stock-title">

                <h1>
                    Current Stock
                </h1>

                <p>
                    View and monitor the current inventory available in your store.
                </p>

            </div>

        </div>


        <!-- =====================================================
             STOCK SUMMARY
        ====================================================== -->

        <div class="stock-summary">


            <!-- TOTAL PRODUCTS -->

            <div class="summary-card">

                <span>
                    Total Products
                </span>

                <strong>

                    <asp:Label
                        ID="lblTotalProducts"
                        runat="server"
                        Text="0">
                    </asp:Label>

                </strong>

            </div>


            <!-- TOTAL QUANTITY -->

            <div class="summary-card">

                <span>
                    Total Quantity
                </span>

                <strong>

                    <asp:Label
                        ID="lblTotalQuantity"
                        runat="server"
                        Text="0">
                    </asp:Label>

                </strong>

            </div>


            <!-- LOW STOCK -->

            <div class="summary-card">

                <span>
                    Low Stock Items
                </span>

                <strong>

                    <asp:Label
                        ID="lblLowStockItems"
                        runat="server"
                        Text="0">
                    </asp:Label>

                </strong>

            </div>

        </div>


        <!-- =====================================================
             INVENTORY TABLE
        ====================================================== -->

        <div class="stock-container">


            <!-- =================================================
                 TABLE TOP
            ================================================== -->

            <div class="table-top">

                <div>

                    <h2>
                        Inventory List
                    </h2>

                    <p>
                        Current quantity and automatically calculated stock status
                    </p>

                </div>


                <!-- CATEGORY FILTER -->

                <asp:DropDownList
                    ID="ddlCategory"
                    runat="server"
                    CssClass="search-box"
                    AutoPostBack="true"
                    OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">

                    <asp:ListItem
                        Text="-- Select Category --"
                        Value="">
                    </asp:ListItem>

                    <asp:ListItem
                        Text="Electronics"
                        Value="Electronics">
                    </asp:ListItem>

                    <asp:ListItem
                        Text="Grocery"
                        Value="Grocery">
                    </asp:ListItem>

                    <asp:ListItem
                        Text="Clothing &amp; Fashion"
                        Value="Clothing">
                    </asp:ListItem>

                    <asp:ListItem
                        Text="Furniture"
                        Value="Furniture">
                    </asp:ListItem>

                    <asp:ListItem
                        Text="Stationery"
                        Value="Stationery">
                    </asp:ListItem>

                    <asp:ListItem
                        Text="Hardware"
                        Value="Hardware">
                    </asp:ListItem>

                    <asp:ListItem
                        Text="Cosmetics &amp; Personal Care"
                        Value="Cosmetics">
                    </asp:ListItem>

                    <asp:ListItem
                        Text="Medicines &amp; Healthcare"
                        Value="Healthcare">
                    </asp:ListItem>

                    <asp:ListItem
                        Text="Automobile Parts"
                        Value="Automobile">
                    </asp:ListItem>

                    <asp:ListItem
                        Text="Sports &amp; Fitness"
                        Value="Sports">
                    </asp:ListItem>

                    <asp:ListItem
                        Text="Other"
                        Value="Other">
                    </asp:ListItem>

                </asp:DropDownList>

            </div>


            <!-- =================================================
                 TABLE
            ================================================== -->

            <div class="stock-table-wrapper">


                <asp:GridView
                    ID="gvCurrentStock"
                    runat="server"
                    AutoGenerateColumns="False"
                    CssClass="stock-table"
                    GridLines="None"
                    EmptyDataText="No stock available." 
                    >


                    <Columns>



                        <asp:TemplateField
                            HeaderText="Product">

                            <ItemTemplate>

                                <div class="product-name">

                                    <%# Eval("pro_name") %>

                                </div>

                                <div class="product-id">

                                    <%# Eval("pro_id") %>

                                </div>

                            </ItemTemplate>

                        </asp:TemplateField>



                        <asp:BoundField
                            DataField="pro_category"
                            HeaderText="Category" />



                        <asp:TemplateField
                            HeaderText="Quantity">

                            <ItemTemplate>

                                <span class="quantity">

                                    <%# Eval("quantity") %>

                                </span>

                            </ItemTemplate>

                        </asp:TemplateField>



                        <asp:TemplateField
                            HeaderText="Maximum Stock">

                            <ItemTemplate>

                                <%# Eval("pro_maxstock") %>

                            </ItemTemplate>

                        </asp:TemplateField>



                        <asp:TemplateField
                            HeaderText="Unit Price">

                            <ItemTemplate>

                                ₹<%# Eval("pro_sellingprice", "{0:N2}") %>

                            </ItemTemplate>

                        </asp:TemplateField>



                        <asp:TemplateField
                            HeaderText="Status">

                            <ItemTemplate>

                                <span class="status">

                                    <%# Eval("status") %>

                                </span>

                            </ItemTemplate>

                        </asp:TemplateField>



                        <asp:BoundField
                            DataField="last_update"
                            HeaderText="Last Update"
                            DataFormatString="{0:dd MMM yyyy}" />

                    </Columns>

                </asp:GridView>


            </div>


        </div>


    </div>

</asp:Content>