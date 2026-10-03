<%@ Page Title="Supplier Dashboard"
    Language="C#"
    MasterPageFile="~/Supplier_Master/Supplier.Master"
    AutoEventWireup="true"
    CodeBehind="SupplierMaster_Dashboard.aspx.cs"
    Inherits="Inventory_Management_System.Supplier_Master.SupplierMaster_Dashboard" %>


<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style>

        /* =====================================================
           DASHBOARD HEADER
        ===================================================== */

        .dashboard-header {
            margin-bottom: 25px;
        }

        .dashboard-title {
            font-size: 28px;
            font-weight: 600;
            color: #17202a;
            margin-bottom: 6px;
        }

        .dashboard-title i {
            margin-right: 10px;
        }

        .dashboard-subtitle {
            color: #777;
            font-size: 14px;
        }


        /* =====================================================
           SUPPLIER WELCOME
        ===================================================== */

        .supplier-welcome {
            background: #17202a;
            color: white;
            border-radius: 12px;
            padding: 25px;

            margin-bottom: 25px;

            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .welcome-title {
            font-size: 22px;
            margin-bottom: 8px;
        }

        .welcome-text {
            color: #d5d8dc;
            font-size: 14px;
        }

        .supplier-id {
            background: #34495e;
            padding: 10px 16px;
            border-radius: 6px;
            font-size: 14px;
        }


        /* =====================================================
           SUMMARY CARDS
        ===================================================== */

        .summary-grid {
            display: grid;

            grid-template-columns:
                repeat(3, 1fr);

            gap: 20px;

            margin-bottom: 30px;
        }


        .summary-card {
            background: white;

            border-radius: 10px;

            padding: 25px;

            min-height: 105px;

            box-shadow:
                0 3px 12px rgba(0,0,0,0.08);

            display: flex;

            align-items: center;

            gap: 18px;

            transition: 0.2s;
        }


        .summary-card:hover {
            transform: translateY(-3px);
        }


        .card-icon {
            width: 60px;
            height: 60px;

            min-width: 60px;

            border-radius: 10px;

            background: #eef1f4;

            display: flex;

            align-items: center;
            justify-content: center;

            font-size: 24px;

            color: #17202a;
        }


        .card-info h3 {
            font-size: 28px;

            color: #17202a;

            margin: 0 0 5px 0;
        }


        .card-info p {
            color: #777;

            font-size: 13px;

            margin: 0;
        }


        /* =====================================================
           LOW STOCK CARD
        ===================================================== */

        .low-stock-card .card-icon {
            color: #c0392b;
            background: #fcebea;
        }


        .low-stock-card .card-info h3 {
            color: #c0392b;
        }


        /* =====================================================
           RECENT PRODUCTS SECTION
        ===================================================== */

        .recent-products-card {

            background: white;

            border-radius: 10px;

            padding: 25px;

            box-shadow:
                0 3px 12px rgba(0,0,0,0.08);

        }


        .dashboard-card-title {

            font-size: 20px;

            font-weight: 600;

            color: #17202a;

            margin-bottom: 22px;

            padding-bottom: 14px;

            border-bottom: 1px solid #eee;

        }


        .dashboard-card-title i {

            margin-right: 8px;

        }


        /* =====================================================
           PRODUCT GRID
        ===================================================== */

        .product-grid {

            display: grid;

            grid-template-columns:
                repeat(4, 1fr);

            gap: 18px;

        }


        /* =====================================================
           PRODUCT CARD
        ===================================================== */

        .product-card {

            border: 1px solid #e5e7e9;

            border-radius: 10px;

            padding: 20px;

            min-height: 175px;

            background: #ffffff;

            transition: 0.2s;

            display: flex;

            flex-direction: column;

            justify-content: space-between;

        }


        .product-card:hover {

            transform: translateY(-4px);

            box-shadow:
                0 5px 16px rgba(0,0,0,0.10);

            border-color: #bdc3c7;

        }


        .product-icon {

            width: 48px;

            height: 48px;

            border-radius: 9px;

            background: #eef1f4;

            color: #17202a;

            display: flex;

            align-items: center;

            justify-content: center;

            font-size: 21px;

            margin-bottom: 15px;

        }


        .product-name {

            font-size: 16px;

            font-weight: 600;

            color: #17202a;

            line-height: 1.4;

            margin-bottom: 7px;

        }


        .product-price {

            color: #777;

            font-size: 13px;

            margin-bottom: 14px;

        }


        /* =====================================================
           STOCK INFORMATION
        ===================================================== */

        .stock-info {

            display: flex;

            justify-content: space-between;

            align-items: center;

            border-top: 1px solid #eee;

            padding-top: 12px;

        }


        .stock-label {

            font-size: 12px;

            color: #888;

        }


        .stock-value {

            font-size: 14px;

            font-weight: 700;

            color: #17202a;

        }


        /* LOW STOCK */

        .stock-value.low-stock {

            color: #c0392b;

        }


        .stock-status {

            display: inline-block;

            margin-top: 7px;

            font-size: 11px;

            font-weight: 600;

            color: #1e8449;

        }


        .stock-status.low {

            color: #c0392b;

        }


        /* =====================================================
           NO PRODUCT
        ===================================================== */

        .no-products {

            text-align: center;

            padding: 45px 20px;

            color: #888;

            font-size: 14px;

        }


        .no-products i {

            font-size: 35px;

            margin-bottom: 12px;

            color: #bdc3c7;

        }


        /* =====================================================
           QUICK ACTIONS
        ===================================================== */

        .quick-actions {

            display: flex;

            justify-content: flex-end;

            gap: 10px;

            margin-top: 22px;

        }


        .quick-action {

            display: inline-block;

            text-decoration: none;

            color: #34495e;

            padding: 10px 16px;

            border: 1px solid #e5e7e9;

            border-radius: 6px;

            font-size: 13px;

            transition: 0.2s;

        }


        .quick-action i {

            margin-right: 6px;

        }


        .quick-action:hover {

            background: #17202a;

            color: white;

        }


        /* =====================================================
           RESPONSIVE
        ===================================================== */

        @media (max-width: 1100px) {

            .product-grid {

                grid-template-columns:
                    repeat(2, 1fr);

            }

        }


        @media (max-width: 900px) {

            .summary-grid {

                grid-template-columns:
                    repeat(2, 1fr);

            }

        }


        @media (max-width: 650px) {

            .summary-grid {

                grid-template-columns: 1fr;

            }


            .product-grid {

                grid-template-columns: 1fr;

            }


            .supplier-welcome {

                flex-direction: column;

                align-items: flex-start;

                gap: 15px;

            }


            .quick-actions {

                justify-content: flex-start;

                flex-wrap: wrap;

            }

        }

    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">


    <!-- =====================================================
         DASHBOARD HEADER
    ===================================================== -->

    <div class="dashboard-header">

        <div class="dashboard-title">

            <i class="fa-solid fa-gauge-high"></i>

            Supplier Dashboard

        </div>


        <div class="dashboard-subtitle">

            Manage and monitor your products, stock and supplier activities.

        </div>

    </div>



    <!-- =====================================================
         SUPPLIER WELCOME
    ===================================================== -->

    <div class="supplier-welcome">

        <div>

            <div class="welcome-title">

                Welcome,
                <asp:Label
                    ID="lblSupplierName"
                    runat="server"
                    Text="Supplier">
                </asp:Label>

            </div>


            <div class="welcome-text">

                View your products and monitor your current inventory stock.

            </div>

        </div>


        <div class="supplier-id">

            Supplier ID:

            <strong>

                <asp:Label
                    ID="lblSupplierID"
                    runat="server"
                    Text="SUP-101">
                </asp:Label>

            </strong>

        </div>

    </div>



    <!-- =====================================================
         SUMMARY
    ===================================================== -->

    <div class="summary-grid">


        <!-- MY PRODUCTS -->

        <div class="summary-card">

            <div class="card-icon">

                <i class="fa-solid fa-box"></i>

            </div>


            <div class="card-info">

                <h3>

                    <asp:Label
                        ID="lblMyProducts"
                        runat="server"
                        Text="0">
                    </asp:Label>

                </h3>

                <p>
                    My Products
                </p>

            </div>

        </div>



        <!-- TOTAL STOCK -->

        <div class="summary-card">

            <div class="card-icon">

                <i class="fa-solid fa-warehouse"></i>

            </div>


            <div class="card-info">

                <h3>

                    <asp:Label
                        ID="lblTotalStock"
                        runat="server"
                        Text="0">
                    </asp:Label>

                </h3>

                <p>
                    Total Stock
                </p>

            </div>

        </div>



        <!-- LOW STOCK -->

        <div class="summary-card low-stock-card">

            <div class="card-icon">

                <i class="fa-solid fa-triangle-exclamation"></i>

            </div>


            <div class="card-info">

                <h3>

                    <asp:Label
                        ID="lblLowStock"
                        runat="server"
                        Text="0">
                    </asp:Label>

                </h3>

                <p>
                    Low Stock
                </p>

            </div>

        </div>


    </div>



    <!-- =====================================================
         RECENT PRODUCTS
    ===================================================== -->

    <div class="recent-products-card">


        <div class="dashboard-card-title">

            <i class="fa-solid fa-box-open"></i>

            Recent Products

        </div>



        <div class="product-grid">


            <!-- PRODUCT 1 -->

            <asp:Repeater
                ID="rptRecentProducts"
                runat="server">

                <ItemTemplate>

                    <div class="product-card">


                        <div>

                            <div class="product-icon">

                                <i class="fa-solid fa-box"></i>

                            </div>


                            <div class="product-name">

                                <%# Eval("product_name") %>

                            </div>


                            <div class="product-price">

                                ₹ <%# Eval("selling_price", "{0:N2}") %>

                            </div>

                        </div>


                        <div>

                            <div class="stock-info">

                                <span class="stock-label">

                                    Total Stock

                                </span>


                                <span class='<%# Convert.ToInt32(Eval("quantity")) <= 50 ? "stock-value low-stock" : "stock-value" %>'>

                                    <%# Eval("quantity") %>

                                    <%# Eval("unit") %>

                                </span>

                            </div>


                            <span class='<%# Convert.ToInt32(Eval("quantity")) <= 50 ? "stock-status low" : "stock-status" %>'>

                                <%# Convert.ToInt32(Eval("quantity")) <= 50 ? "Low Stock" : "Available Stock" %>

                            </span>

                        </div>


                    </div>

                </ItemTemplate>


                <FooterTemplate>

                    <%# rptRecentProducts.Items.Count == 0
                        ? "<div class='no-products'><i class='fa-solid fa-box-open'></i><br/>No products available.</div>"
                        : "" %>

                </FooterTemplate>

            </asp:Repeater>


        </div>


        <!-- QUICK ACTIONS -->

        <div class="quick-actions">


            <a href="Supplier_AllProducts.aspx"
               class="quick-action">

                <i class="fa-solid fa-box"></i>

                My Products

            </a>


            <a href="Supplier_MySell.aspx"
               class="quick-action">

                <i class="fa-solid fa-user"></i>

                My Profile

            </a>


            <a href="../Main_Dashboard.aspx"
               class="quick-action">

                <i class="fa-solid fa-right-from-bracket"></i>

                Logout

            </a>


        </div>


    </div>


</asp:Content>