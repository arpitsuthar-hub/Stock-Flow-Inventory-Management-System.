<%@ Page Title="Low Stock"
    Language="C#"
    MasterPageFile="~/Stock Module/Stock_Module.Master"
    AutoEventWireup="true"
    CodeBehind="Stock_Low.aspx.cs"
    Inherits="Inventory_Management_System.Stock_Module.Stock_Low" %>


<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style>

        /* =========================================================
           LOW STOCK PAGE
        ========================================================= */

        .stock-low-page {
            width: 100%;
            padding: 0;
            font-family: "Segoe UI", Arial, Helvetica, sans-serif;
            color: #172033;
        }


        /* =========================================================
           PAGE HEADER
        ========================================================= */

        .stock-low-header {
            margin-bottom: 25px;
        }


        .stock-low-header h1 {
            margin: 0 0 6px;
            font-size: 28px;
            font-weight: 700;
            color: #172033;
        }


        .stock-low-header p {
            margin: 0;
            color: #718096;
            font-size: 14px;
        }


        /* =========================================================
           SUMMARY
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
           LOW STOCK CONTAINER
        ========================================================= */

        .stock-low-container {
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


        .table-heading h2 {
            margin: 0 0 5px;
            font-size: 18px;
            color: #172033;
        }


        .table-heading p {
            margin: 0;
            color: #718096;
            font-size: 13px;
        }


        /* =========================================================
           CATEGORY FILTER
        ========================================================= */

        .search-box {
            width: 250px;
            height: 40px;

            border: 1px solid #d1d5db;
            border-radius: 7px;

            padding: 0 12px;

            outline: none;

            font-size: 13px;
            color: #334155;

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

        .table-wrapper {
            width: 100%;
            overflow-x: auto;
        }


        /* =========================================================
           GRIDVIEW
        ========================================================= */

        .stock-table {
            width: 100%;
            border-collapse: collapse;
            min-width: 950px;
        }


        .stock-table th {
            background: #172033;

            color: #ffffff;

            font-size: 12px;
            font-weight: 600;

            text-align: left;

            padding: 14px 18px;

            white-space: nowrap;

            text-transform: uppercase;

            letter-spacing: 0.3px;
        }


        .stock-table td {
            padding: 15px 18px;

            font-size: 13px;

            color: #334155;

            border-bottom: 1px solid #eef0f3;

            white-space: nowrap;
        }


        .stock-table tr:hover {
            background: #f7f8fa;
        }


        .stock-table tr:last-child td {
            border-bottom: none;
        }


        /* =========================================================
           PRODUCT
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
           MINIMUM STOCK
        ========================================================= */

        .minimum-stock {
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
           PRICE
        ========================================================= */

        .price {
            font-weight: 600;
        }


        /* =========================================================
           INFORMATION BOX
        ========================================================= */

        .info-box {
            margin-top: 22px;

            background: #f8fafc;

            border: 1px solid #e5e7eb;

            border-radius: 10px;

            padding: 16px 18px;
        }


        .info-box strong {
            display: block;

            font-size: 13px;

            margin-bottom: 5px;
        }


        .info-box p {
            margin: 0;

            color: #718096;

            font-size: 12px;

            line-height: 1.6;
        }


        /* =========================================================
           RESPONSIVE
        ========================================================= */

        @media (max-width: 900px) {

            .stock-summary {
                grid-template-columns: 1fr;
            }


            .table-top {
                align-items: flex-start;
                flex-direction: column;
                gap: 15px;
            }


            .search-box {
                width: 100%;
            }

        }


        @media (max-width: 600px) {

            .stock-low-page {
                padding: 0;
            }


            .stock-low-header h1 {
                font-size: 24px;
            }

        }

    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">


    <div class="stock-low-page">


        <!-- =====================================================
             PAGE HEADER
        ====================================================== -->

        <div class="stock-low-header">

            <h1>
                Low Stock
            </h1>

            <p>
                Monitor products that have reached or fallen below their minimum stock level.
            </p>

        </div>


        <!-- =====================================================
             SUMMARY
        ====================================================== -->

        <div class="stock-summary">


            <!-- LOW STOCK PRODUCTS -->

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


            <!-- LOW STOCK QUANTITY -->

            <div class="summary-card">

                <span>
                    Low Stock Quantity
                </span>

                <strong>

                    <asp:Label
                        ID="lblLowStockQuantity"
                        runat="server"
                        Text="0">
                    </asp:Label>

                </strong>

            </div>


            <!-- UNAVAILABLE -->

            <div class="summary-card">

                <span>
                    Unavailable Items
                </span>

                <strong>

                    <asp:Label
                        ID="lblUnavailableItems"
                        runat="server"
                        Text="0">
                    </asp:Label>

                </strong>

            </div>

        </div>


        <!-- =====================================================
             LOW STOCK TABLE
        ====================================================== -->

        <div class="stock-low-container">


            <!-- =================================================
                 TABLE TOP
            ================================================== -->

            <div class="table-top">


                <div class="table-heading">

                    <h2>
                        Low Stock Inventory
                    </h2>

                    <p>
                        Products with Low Stock or Unavailable status
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

            <div class="table-wrapper">


                <asp:GridView
                    ID="gvStockLow"
                    runat="server"
                    AutoGenerateColumns="False"
                    CssClass="stock-table"
                    GridLines="None"
                    EmptyDataText="No low stock products found.">


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
                            HeaderText="Current Quantity">

                            <ItemTemplate>

                                <span class="quantity">

                                    <%# Eval("quantity") %>

                                </span>

                            </ItemTemplate>

                        </asp:TemplateField>



                        <asp:TemplateField
                            HeaderText="Minimum Stock">

                            <ItemTemplate>

                                <span class="minimum-stock">

                                    <%# Eval("pro_maxstock") %>

                                </span>

                            </ItemTemplate>

                        </asp:TemplateField>



                        <asp:TemplateField
                            HeaderText="Unit Price">

                            <ItemTemplate>

                                <span class="price">

                                    ₹<%# Eval("pro_sellingprice", "{0:N2}") %>

                                </span>

                            </ItemTemplate>

                        </asp:TemplateField>



                        <asp:BoundField
                            DataField="status"
                            HeaderText="Status" />



                        <asp:BoundField
                            DataField="last_update"
                            HeaderText="Last Update"
                            DataFormatString="{0:dd MMM yyyy}" />


                    </Columns>

                </asp:GridView>


            </div>

        </div>


        <!-- =====================================================
             INFORMATION
        ====================================================== -->

        <div class="info-box">

            <strong>
                Low Stock Information
            </strong>

            <p>
                Stock status is automatically calculated from the current
                quantity and the product minimum stock level. Products below
                the minimum quantity are shown as Low Stock. Products with
                zero quantity are shown as Unavailable.
            </p>

        </div>


    </div>

</asp:Content>