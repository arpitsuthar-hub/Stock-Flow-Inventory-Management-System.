<%@ Page Title="Sell & Bill Dashboard"
Language="C#"
MasterPageFile="~/Sell-Bill_Module/Sell-Bill_Module.Master"
AutoEventWireup="true"
CodeBehind="Sell-Bill_Dashboard.aspx.cs"
Inherits="Inventory_Management_System.Sell_Bill_Module.Sell_Bill_Dashboard" %>

<asp:Content ID="Content1"
ContentPlaceHolderID="head"
runat="server">

<style>

    /* =========================================
       PAGE
    ========================================= */

    .sell-dashboard {
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


    /* =========================================
       COLORS
    ========================================= */

    .customer-count {
        border-top-color: #7048d8;
    }

    .customer-count .summary-value {
        color: #7048d8;
    }


    .product-count {
        border-top-color: #1769e0;
    }

    .product-count .summary-value {
        color: #1769e0;
    }


    .sales-amount {
        border-top-color: #16a05d;
    }

    .sales-amount .summary-value {
        color: #16a05d;
    }


    .today-sales {
        border-top-color: #f39c12;
    }

    .today-sales .summary-value {
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
        margin: 0;
    }


    .panel-header span {
        font-size: 12px;
        color: #888;
    }


    /* =========================================
       RECENT SALES TABLE
    ========================================= */

    .sell-table {
        width: 100%;
        border-collapse: collapse;
    }


    .sell-table th {
        text-align: left;
        background: #f5f7fb;
        color: #666;
        font-size: 11px;
        text-transform: uppercase;
        padding: 12px;
        border-bottom: 1px solid #e1e5eb;
    }


    .sell-table td {
        padding: 13px 12px;
        font-size: 12px;
        color: #444;
        border-bottom: 1px solid #edf0f3;
    }


    .sell-table tr:hover td {
        background: #f8faff;
    }


    /* =========================================
       INVOICE ID
    ========================================= */

    .invoice-id {
        color: #1769e0;
        font-weight: bold;
    }


    /* =========================================
       CUSTOMER
    ========================================= */

    .customer {
        color: #14213d;
        font-weight: bold;
    }


    /* =========================================
       PRODUCT
    ========================================= */

    .product {
        color: #555;
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
       SALES FLOW
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
        margin: 0;
    }


    .flow-item p {
        font-size: 10px;
        color: #888;
        margin-top: 4px;
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

        .quick-action.full-width {
            grid-column: span 1;
        }

        .flow-container {
            grid-template-columns: 1fr;
        }

        .sell-table {
            min-width: 750px;
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

<div class="sell-dashboard">


    <!-- =========================================
         HEADER
    ========================================== -->

    <div class="dashboard-header">

        <div>

            <h1>
                Sell &amp; Bill Dashboard
            </h1>

            <p>
                Manage and monitor all sales and billing activities
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


        <!-- TOTAL CUSTOMERS -->

        <div class="summary-card customer-count">

            <div class="summary-title">
                👥 Total Customers
            </div>

            <div class="summary-value">

                <asp:Label
                    ID="lblTotalCustomers"
                    runat="server"
                    Text="0">
                </asp:Label>

            </div>

            <div class="summary-subtitle">
                Customers with sales
            </div>

        </div>


        <!-- TOTAL PRODUCTS SOLD -->

        <div class="summary-card product-count">

            <div class="summary-title">
                📦 Total Products Sold
            </div>

            <div class="summary-value">

                <asp:Label
                    ID="lblTotalProducts"
                    runat="server"
                    Text="0">
                </asp:Label>

            </div>

            <div class="summary-subtitle">
                Total quantity sold
            </div>

        </div>


        <!-- TOTAL SALES -->

        <div class="summary-card sales-amount">

            <div class="summary-title">
                💰 Total Sales Amount
            </div>

            <div class="summary-value">

                ₹<asp:Label
                    ID="lblTotalSales"
                    runat="server"
                    Text="0.00">
                </asp:Label>

            </div>

            <div class="summary-subtitle">
                Total sales value
            </div>

        </div>


        <!-- TODAY'S SALES -->

        <div class="summary-card today-sales">

            <div class="summary-title">
                📅 Today's Sales
            </div>

            <div class="summary-value">

                <asp:Label
                    ID="lblTodaySales"
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
         MAIN GRID
    ========================================== -->

    <div class="dashboard-grid">


        <!-- =====================================
             RECENT SALES
        ====================================== -->

        <div class="panel">


            <div class="panel-header">

                <h2>
                    Recent Sales
                </h2>

                <span>
                    Latest transactions
                </span>

            </div>


            <table class="sell-table">


                <thead>

                    <tr>

                        <th>
                            Invoice ID
                        </th>

                        <th>
                            Date
                        </th>

                        <th>
                            Customer
                        </th>

                        <th>
                            Product
                        </th>

                        <th>
                            Qty
                        </th>

                        <th>
                            Amount
                        </th>

                    </tr>

                </thead>


                <tbody>


                    <asp:Repeater
                        ID="rptRecentSales"
                        runat="server">

                        <ItemTemplate>

                            <tr>


                                <td>

                                    <span class="invoice-id">

                                        <%# Eval("invoice_id") %>

                                    </span>

                                </td>


                                <td>

                                    <%# Eval("sale_date", "{0:dd MMM yyyy}") %>

                                </td>


                                <td>

                                    <span class="customer">

                                        <%# Eval("customer_name") %>

                                    </span>

                                </td>


                                <td>

                                    <span class="product">

                                        <%# Eval("product_name") %>

                                    </span>

                                </td>


                                <td>

                                    <%# Eval("quantity") %>

                                </td>


                                <td>

                                    <span class="amount">

                                        ₹<%# Eval("totalnet", "{0:N2}") %>

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

                <h2>
                    Quick Actions
                </h2>

                <span>
                    Manage
                </span>

            </div>


            <div class="quick-actions">


                <!-- NEW SELL -->

                <a href="Sell_New.aspx"
                   class="quick-action">

                    <div class="quick-icon">
                        ➕
                    </div>

                    <h3>
                        New Sell
                    </h3>

                    <p>
                        Record new sale
                    </p>

                </a>


                <!-- SEARCH -->

                <a href="Sell_Search.aspx"
                   class="quick-action">

                    <div class="quick-icon">
                        🔍
                    </div>

                    <h3>
                        Search
                    </h3>

                    <p>
                        Find sales
                    </p>

                </a>


                <!-- ALL SALES -->

                <a href="AllSells.aspx"
                   class="quick-action">

                    <div class="quick-icon">
                        📋
                    </div>

                    <h3>
                        All Sells
                    </h3>

                    <p>
                        View all sales
                    </p>

                </a>


                <!-- ALL BILLS -->

                <a href="AllBills.aspx"
                   class="quick-action">

                    <div class="quick-icon">
                        🧾
                    </div>

                    <h3>
                        All Bills
                    </h3>

                    <p>
                        View generated bills
                    </p>

                </a>


            </div>


        </div>


    </div>


    <!-- =========================================
         SALES FLOW
    ========================================== -->

    <div class="panel">


        <div class="panel-header">

            <h2>
                Sales Process
            </h2>

            <span>
                Sales &amp; inventory flow
            </span>

        </div>


        <div class="flow-container">


            <!-- CUSTOMER -->

            <div class="flow-item">

                <div class="flow-icon">
                    👤
                </div>

                <h3>
                    Customer
                </h3>

                <p>
                    Select customer
                </p>

            </div>


            <!-- PRODUCT -->

            <div class="flow-item">

                <div class="flow-icon">
                    📦
                </div>

                <h3>
                    Product
                </h3>

                <p>
                    Select product
                </p>

            </div>


            <!-- SALE -->

            <div class="flow-item">

                <div class="flow-icon">
                    🛒
                </div>

                <h3>
                    Sale
                </h3>

                <p>
                    Enter quantity &amp; price
                </p>

            </div>


            <!-- BILL -->

            <div class="flow-item">

                <div class="flow-icon">
                    🧾
                </div>

                <h3>
                    Bill
                </h3>

                <p>
                    Generate invoice
                </p>

            </div>


        </div>


    </div>


</div>

</asp:Content>
