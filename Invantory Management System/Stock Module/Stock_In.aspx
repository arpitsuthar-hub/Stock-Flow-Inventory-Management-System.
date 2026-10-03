<%@ Page Title="Stock In"
    Language="C#"
    MasterPageFile="~/Stock Module/Stock_Module.Master"
    AutoEventWireup="true"
    CodeBehind="Stock_In.aspx.cs"
    Inherits="Inventory_Management_System.Stock_Module.Stock_In" %>


<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style>

        /* =========================================
           STOCK IN

        ========================================= */

        .stock-in-page {
            width: 100%;
            padding: 0;
            font-family: "Segoe UI", Arial, Helvetica, sans-serif;
            color: #172033;
        }


        /* =========================================
           HEADER
        ========================================= */

        .stock-in-header {
            margin-bottom: 25px;
        }


        .stock-in-header h1 {
            margin: 0 0 6px;
            font-size: 28px;
            font-weight: 700;
            color: #172033;
        }


        .stock-in-header p {
            margin: 0;
            color: #718096;
            font-size: 14px;
        }


        /* =========================================
           SUMMARY
        ========================================= */

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


        /* =========================================
           STOCK CONTAINER
        ========================================= */

        .stock-in-container {
            background: #ffffff;
            border: 1px solid #e5e7eb;
            border-radius: 10px;
            overflow: hidden;
        }


        /* =========================================
           TABLE TOP
        ========================================= */

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


        /* =========================================
           CATEGORY SEARCH
        ========================================= */

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


        /* =========================================
           TABLE WRAPPER
        ========================================= */

        .table-wrapper {
            width: 100%;
            overflow-x: auto;
        }


        /* =========================================
           GRIDVIEW
        ========================================= */

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


        /* =========================================
           PRODUCT
        ========================================= */

        .product-name {
            font-weight: 600;
            color: #172033;
        }


        .product-id {
            color: #94a3b8;
            font-size: 11px;
            margin-top: 3px;
        }


        /* =========================================
           QUANTITY
        ========================================= */

        .quantity {
            font-weight: 600;
            color: #172033;
        }


        /* =========================================
           STATUS
        ========================================= */

        .status {
            font-weight: 600;
        }


        /* =========================================
           PRICE
        ========================================= */

        .price {
            font-weight: 600;
        }


        /* =========================================
           INFO BOX
        ========================================= */

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


        /* =========================================
           RESPONSIVE
        ========================================= */

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

            .stock-in-page {
                padding: 0;
            }


            .stock-in-header h1 {
                font-size: 24px;
            }

        }

    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">


    <div class="stock-in-page">


        <!-- =====================================
             HEADER
        ====================================== -->

        <div class="stock-in-header">

            <h1>
                Stock In
            </h1>

            <p>
                View products that are currently available in stock.
            </p>

        </div>


        <!-- =====================================
             SUMMARY
        ====================================== -->

        <div class="stock-summary">


            <!-- TOTAL PRODUCTS -->

            <div class="summary-card">

                <span>
                    Products In Stock
                </span>

                <strong>

                    <asp:Label
                        ID="lblTotalStockIn"
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


            <!-- FULL STOCK -->

            <div class="summary-card">

                <span>
                    Full Stock Items
                </span>

                <strong>

                    <asp:Label
                        ID="lblFullStockItem"
                        runat="server"
                        Text="0">
                    </asp:Label>

                </strong>

            </div>

        </div>


        <!-- =====================================
             STOCK IN TABLE
        ====================================== -->

        <div class="stock-in-container">


            <!-- =================================
                 TABLE TOP
            ================================== -->

            <div class="table-top">


                <div class="table-heading">

                    <h2>
                        Available Stock
                    </h2>

                    <p>
                        Products with Available or Full Stock status
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


            <!-- =================================
                 TABLE
            ================================== -->

            <div class="table-wrapper">


                <asp:GridView
                    ID="gvStockIn"
                    runat="server"
                    AutoGenerateColumns="False"
                    CssClass="stock-table"
                    GridLines="None"
                    EmptyDataText="No products currently available in stock.">


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


                       

                        <asp:BoundField
                            DataField="pro_maxstock"
                            HeaderText="Maximum Stock" />


                        

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


        <!-- =====================================
             INFORMATION
        ====================================== -->

        <div class="info-box">

            <strong>
                Stock In Information
            </strong>

            <p>
                Stock In is automatically updated when a purchase is completed.
                Purchased quantities increase the current stock quantity.
                Products remain in Stock In while their status is Available or
                Full Stock.
            </p>

        </div>


    </div>

</asp:Content>