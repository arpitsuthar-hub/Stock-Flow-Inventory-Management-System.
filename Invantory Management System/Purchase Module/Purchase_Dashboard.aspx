<%@ Page Title="Purchase Dashboard"
    Language="C#"
    MasterPageFile="~/Purchase Module/Purchase_Module.Master"
    AutoEventWireup="true"
    CodeBehind="Purchase_Dashboard.aspx.cs"
    Inherits="Inventory_Management_System.Purchase_Module.Purchase_Dashboard" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style>
        /* =========================================
           PAGE
        ========================================= */

        .purchase-dashboard {
            width: 100%;
            padding-bottom: 30px;
        }


        /* =========================================
           HEADER
        ========================================= */

        .dashboard-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 28px;
        }

            .dashboard-header h1 {
                font-size: 28px;
                color: #14213d;
                margin-bottom: 6px;
            }

            .dashboard-header p {
                font-size: 14px;
                color: #777;
            }

        .date-box {
            background: white;
            padding: 12px 18px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.06);
            color: #555;
            font-size: 13px;
            line-height: 1.7;
        }


        /* =========================================
           SUMMARY CARDS
        ========================================= */

        .summary-container {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 18px;
            margin-bottom: 30px;
        }

        .summary-card {
            background: white;
            padding: 22px;
            border-radius: 13px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.06);
            border-top: 4px solid #1769e0;
            transition: 0.25s;
        }

            .summary-card:hover {
                transform: translateY(-4px);
                box-shadow: 0 8px 22px rgba(0,0,0,0.10);
            }

        .summary-title {
            font-size: 13px;
            color: #777;
            margin-bottom: 10px;
            font-weight: bold;
        }

        .summary-value {
            font-size: 28px;
            font-weight: bold;
            color: #1769e0;
        }

        .summary-subtitle {
            font-size: 11px;
            color: #999;
            margin-top: 7px;
        }


        /* COLORS */

        .purchase-count {
            border-top-color: #1769e0;
        }

            .purchase-count .summary-value {
                color: #1769e0;
            }


        .items-count {
            border-top-color: #7048d8;
        }

            .items-count .summary-value {
                color: #7048d8;
            }


        .purchase-amount {
            border-top-color: #16a05d;
        }

            .purchase-amount .summary-value {
                color: #16a05d;
            }


        .today-purchase {
            border-top-color: #f39c12;
        }

            .today-purchase .summary-value {
                color: #f39c12;
            }


        /* =========================================
           MAIN GRID
        ========================================= */

        .dashboard-grid {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 22px;
            margin-bottom: 25px;
        }


        /* =========================================
           PANEL
        ========================================= */

        .panel {
            background: white;
            border-radius: 14px;
            padding: 25px;
            box-shadow: 0 4px 18px rgba(0,0,0,0.07);
        }


        /* =========================================
           PANEL HEADER
        ========================================= */

        .panel-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-bottom: 15px;
            margin-bottom: 18px;
            border-bottom: 1px solid #e5e8ed;
        }

            .panel-header h2 {
                font-size: 18px;
                color: #14213d;
            }

            .panel-header span {
                font-size: 12px;
                color: #888;
            }


        /* =========================================
           RECENT PURCHASE TABLE
        ========================================= */

        .purchase-table {
            width: 100%;
            border-collapse: collapse;
        }

            .purchase-table th {
                text-align: left;
                background: #f5f7fb;
                color: #666;
                font-size: 11px;
                text-transform: uppercase;
                padding: 12px;
                border-bottom: 1px solid #e1e5eb;
            }

            .purchase-table td {
                padding: 13px 12px;
                font-size: 12px;
                color: #444;
                border-bottom: 1px solid #edf0f3;
            }

            .purchase-table tr:hover td {
                background: #f8faff;
            }


        /* =========================================
           PURCHASE ID
        ========================================= */

        .purchase-id {
            color: #1769e0;
            font-weight: bold;
        }


        /* =========================================
           SUPPLIER
        ========================================= */

        .supplier {
            color: #14213d;
            font-weight: bold;
        }


        /* =========================================
           AMOUNT
        ========================================= */

        .amount {
            color: #16a05d;
            font-weight: bold;
        }


        /* =========================================
           QUICK ACTIONS
        ========================================= */

        .quick-actions {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 12px;
        }

        .quick-action {
            text-decoration: none;
            padding: 18px 12px;
            border-radius: 9px;
            background: #f7f9fc;
            border: 1px solid #e7ebf0;
            text-align: center;
            transition: 0.2s;
        }

            .quick-action:hover {
                transform: translateY(-3px);
                background: #eef5ff;
                border-color: #cbdcf7;
            }

        .quick-icon {
            font-size: 24px;
            margin-bottom: 8px;
        }

        .quick-action h3 {
            font-size: 13px;
            color: #14213d;
            margin-bottom: 4px;
        }

        .quick-action p {
            font-size: 10px;
            color: #888;
        }

        .quick-action.full-width {
            grid-column: span 2;
        }
        /* =========================================
           PURCHASE FLOW
        ========================================= */

        .flow-container {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 15px;
            align-items: center;
        }

        .flow-item {
            text-align: center;
            padding: 15px;
            background: #f8f9fb;
            border-radius: 9px;
        }

        .flow-icon {
            font-size: 25px;
            margin-bottom: 8px;
        }

        .flow-item h3 {
            font-size: 12px;
            color: #14213d;
        }

        .flow-item p {
            font-size: 10px;
            color: #888;
            margin-top: 4px;
        }

        .flow-arrow {
            display: none;
        }


        /* =========================================
           RESPONSIVE
        ========================================= */

        @media (max-width: 1100px) {

            .summary-container {
                grid-template-columns: repeat(2, 1fr);
            }

            .dashboard-grid {
                grid-template-columns: 1fr;
            }
        }


        @media (max-width: 700px) {

            .dashboard-header {
                display: block;
            }

            .date-box {
                display: inline-block;
                margin-top: 15px;
            }

            .summary-container {
                grid-template-columns: 1fr;
            }

            .quick-actions {
                grid-template-columns: 1fr;
            }

            .flow-container {
                grid-template-columns: 1fr;
            }

            .purchase-table {
                min-width: 650px;
            }

            .panel {
                overflow-x: auto;
            }
        }
    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="purchase-dashboard">


        <!-- =========================================
             HEADER
        ========================================== -->

        <div class="dashboard-header">

            <div>

                <h1>Purchase Dashboard</h1>

                <p>
                    Manage and monitor all purchase activities
                </p>

            </div>

            <div class="date-box">
                📅 <%= DateTime.Now.ToString("dd MMM yyyy") %>
                <br />

                🕐 <%= DateTime.Now.ToString("hh:mm tt") %>
            </div>

        </div>


        <!-- =========================================
             SUMMARY CARDS
        ========================================== -->



        <div class="summary-container">


            <!-- TOTAL CATEGORY PURCHASE -->

            <div class="summary-card purchase-count">

                <div class="summary-title">
                    🗂️ Total Category Purchase
                </div>

                <div class="summary-value">
                    <asp:Label ID="lblTotalCategory"
                        runat="server"
                        Text="0">
                    </asp:Label>
                </div>

                <div class="summary-subtitle">
                    Categories with purchases
                </div>

            </div>


            <!-- TOTAL PRODUCT PURCHASE -->

            <div class="summary-card items-count">

                <div class="summary-title">
                    📦 Total Product Purchase
                </div>

                <div class="summary-value">
                    <asp:Label ID="lblTotalProduct"
                        runat="server"
                        Text="0">
                    </asp:Label>
                </div>

                <div class="summary-subtitle">
                    Total quantity purchased
                </div>

            </div>


            <!-- TOTAL PURCHASE AMOUNT -->

            <div class="summary-card purchase-amount">

                <div class="summary-title">
                    💰 Total Amount Purchases
                </div>

                <div class="summary-value">
                    <asp:Label ID="lblTotalAmount"
                        runat="server"
                        Text="₹0.00">
                    </asp:Label>
                </div>

                <div class="summary-subtitle">
                    Total purchase value
                </div>

            </div>


            <!-- TODAY'S PURCHASE -->

            <div class="summary-card today-purchase">

                <div class="summary-title">
                    📅 Today's Purchase
                </div>

                <div class="summary-value">
                    <asp:Label ID="lblTodayPurchase"
                        runat="server"
                        Text="0">
                    </asp:Label>
                </div>

                <div class="summary-subtitle">
                    Transactions today
                </div>

            </div>


        </div>


        <!-- =========================================
             MAIN DASHBOARD
        ========================================== -->

        <div class="dashboard-grid">


            <!-- =====================================
                 RECENT PURCHASES
            ====================================== -->

            <div class="panel">


                <div class="panel-header">

                    <h2>Recent Purchases
                    </h2>

                    <span>Latest transactions
                    </span>

                </div>


                <table class="purchase-table">

                    <thead>

                        <tr>

                            <th>Purchase ID</th>

                            <th>Date</th>

                            <th>Supplier</th>

                            <th>Product</th>

                            <th>Qty</th>

                            <th>Amount</th>

                        </tr>

                    </thead>


<tbody>

    <asp:Repeater ID="rptRecentPurchases"
        runat="server">

        <ItemTemplate>

            <tr>

                <td>
                    <span class="purchase-id">
                        <%# Eval("purchaseid") %>
                    </span>
                </td>

                <td>
                    <%# Eval("purchasedate", "{0:dd MMM yyyy}") %>
                </td>

                <td>
                    <span class="supplier">
                        <%# Eval("sup_name") %>
                    </span>
                </td>

                <td>
                    <%# Eval("product_name") %>
                </td>

                <td>
                    <%# Eval("quantity") %>
                </td>

                <td>
                    <span class="amount">
                        ₹<%# Eval("netamount", "{0:N2}") %>
                    </span>
                </td>

            </tr>

        </ItemTemplate>

    </asp:Repeater>

</tbody>

                </table>


            </div>


            <!-- =====================================
                 QUICK ACTIONS
            ====================================== -->

            <div class="panel">


                <div class="panel-header">

                    <h2>Quick Actions
                    </h2>

                    <span>Manage
                    </span>

                </div>


                <div class="quick-actions">


                    <a href="Purchase_AddNew.aspx"
                        class="quick-action">

                        <div class="quick-icon">
                            ➕
                        </div>

                        <h3>New Purchase
                        </h3>

                        <p>
                            Record new purchase
                        </p>

                    </a>


                    <a href="Purchase_Search.aspx"
                        class="quick-action">

                        <div class="quick-icon">
                            🔍
                        </div>

                        <h3>Search
                        </h3>

                        <p>
                            Find purchase
                        </p>

                    </a>


                    <a href="AllPurchase.aspx"
                        class="quick-action full-width">

                        <div class="quick-icon">
                            📋
                        </div>

                        <h3>All Purchases
                        </h3>

                        <p>
                            View all records
                        </p>

                    </a>


                </div>


            </div>


        </div>


        <!-- =========================================
             PURCHASE FLOW
        ========================================== -->

        <div class="panel">


            <div class="panel-header">

                <h2>Purchase Process
                </h2>

                <span>Inventory flow
                </span>

            </div>


            <div class="flow-container">


                <div class="flow-item">

                    <div class="flow-icon">
                        🚚
                    </div>

                    <h3>Supplier
                    </h3>

                    <p>
                        Select supplier
                    </p>

                </div>


                <div class="flow-item">

                    <div class="flow-icon">
                        📦
                    </div>

                    <h3>Product
                    </h3>

                    <p>
                        Select product
                    </p>

                </div>


                <div class="flow-item">

                    <div class="flow-icon">
                        🛒
                    </div>

                    <h3>Purchase
                    </h3>

                    <p>
                        Enter quantity & price
                    </p>

                </div>


                <div class="flow-item">

                    <div class="flow-icon">
                        📊
                    </div>

                    <h3>Stock
                    </h3>

                    <p>
                        Stock increases
                    </p>

                </div>


            </div>


        </div>


    </div>

</asp:Content>
