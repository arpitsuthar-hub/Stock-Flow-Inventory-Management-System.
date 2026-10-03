<%@ Page Title="" Language="C#" MasterPageFile="~/Stock Module/Stock_Module.Master"
    AutoEventWireup="true"
    CodeBehind="Stock_Dashboard.aspx.cs"
    Inherits="Inventory_Management_System.Stock_Module.Stock_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style>

    /* =========================================
       RESET
    ========================================= */

    * {
        box-sizing: border-box;
    }


    /* =========================================
       DASHBOARD
    ========================================= */

    .dashboard {
        width: 100%;
        padding: 30px;
        font-family: Arial, Helvetica, sans-serif;
        color: #14213d;
    }


    /* =========================================
       HEADER
    ========================================= */

    .dashboard-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 30px;
    }

    .dashboard-header h1 {
        margin: 0 0 6px;
        font-size: 30px;
    }

    .dashboard-header p {
        margin: 0;
        color: #718096;
        font-size: 15px;
    }

    .date-box {
        background: white;
        border: 1px solid #e5e7eb;
        border-radius: 10px;
        padding: 12px 18px;
        text-align: right;
    }

    .date-box span {
        display: block;
        font-size: 12px;
        color: #718096;
        margin-bottom: 4px;
    }

    .date-box strong {
        font-size: 14px;
    }


    /* =========================================
       STATISTICS
    ========================================= */

    .stats-container {
        display: flex;
        justify-content: center;
        align-items: stretch;

        gap: 22px;

        margin-bottom: 25px;
        width: 100%;
    }

    .stat-card {
        width: 100%;
        min-height: 135px;

        background: white;

        border: 1px solid #e5e7eb;

        border-radius: 12px;

        padding: 28px 30px;

        display: flex;

        align-items: center;

        justify-content: flex-start;

        gap: 20px;

        text-align: left;

        flex: 1;
    }

    .stat-icon {
        width: 58px;
        height: 58px;

        min-width: 58px;

        border-radius: 10px;

        background: #f1f5f9;

        display: flex;

        align-items: center;
        justify-content: center;

        font-size: 25px;
    }

    .stat-card span {
        display: block;

        color: #718096;

        font-size: 14px;

        margin-bottom: 6px;
    }

    .stat-card h2 {
        margin: 0;

        font-size: 30px;

        color: #14213d;
    }


    /* =========================================
       MAIN GRID
    ========================================= */

    .dashboard-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 22px;
    }


    /* =========================================
       CARD
    ========================================= */

    .dashboard-card {
        background: white;
        border: 1px solid #e5e7eb;
        border-radius: 12px;
        padding: 24px;
    }

    .card-header {
        margin-bottom: 22px;
    }

    .card-header h3 {
        margin: 0 0 5px;
        font-size: 19px;
    }

    .card-header span {
        color: #718096;
        font-size: 13px;
    }


    /* =========================================
       STOCK OVERVIEW
    ========================================= */

    .stock-overview {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 12px;
    }

    .overview-item {
        background: #f8fafc;
        padding: 20px;
        border-radius: 9px;
        text-align: center;
    }

    .overview-item span {
        display: block;
        font-size: 13px;
        color: #718096;
        margin-bottom: 8px;
    }

    .overview-item strong {
        font-size: 25px;
    }


    /* =========================================
       QUICK ACTIONS
    ========================================= */

    .quick-actions {
        display: flex;
        flex-direction: column;
        gap: 10px;
    }

    .action-btn {
        text-decoration: none;
        color: #14213d;
        display: flex;
        align-items: center;
        gap: 14px;
        padding: 14px;
        border-radius: 9px;
        background: #f8fafc;
        transition: 0.2s;
    }

    .action-btn:hover {
        background: #eef2f7;
    }

    .action-btn > span {
        font-size: 21px;
    }

    .action-btn strong {
        display: block;
        font-size: 14px;
        margin-bottom: 3px;
    }

    .action-btn small {
        color: #718096;
        font-size: 12px;
    }


    /* =========================================
       WELCOME
    ========================================= */

    .welcome-card {
        margin-top: 22px;
        background: white;
        border: 1px solid #e5e7eb;
        border-radius: 12px;
        padding: 25px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .welcome-card h2 {
        margin: 0 0 7px;
        font-size: 20px;
    }

    .welcome-card p {
        margin: 0;
        color: #718096;
        font-size: 14px;
    }

    .welcome-card a {
        text-decoration: none;
        color: #14213d;
        font-weight: bold;
        font-size: 14px;
    }


    /* =========================================
       RESPONSIVE
    ========================================= */

    @media (max-width: 900px) {

        .stats-container {
            flex-wrap: wrap;
            justify-content: center;
        }

        .stat-card {
            flex: 1 1 45%;
        }

        .dashboard-grid {
            grid-template-columns: 1fr;
        }
    }


    @media (max-width: 600px) {

        .dashboard {
            padding: 20px;
        }

        .dashboard-header {
            flex-direction: column;
            align-items: flex-start;
            gap: 15px;
        }

        .stats-container {
            flex-direction: column;
            align-items: center;
        }

        .stat-card {
            width: 100%;
            max-width: none;
            min-height: 120px;
        }

        .stock-overview {
            grid-template-columns: 1fr;
        }

        .welcome-card {
            flex-direction: column;
            align-items: flex-start;
            gap: 15px;
        }
    }

</style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="dashboard">


    <!-- Header -->

    <div class="dashboard-header">

        <div>

            <h1>Stock Management</h1>

            <p>
                Monitor and manage your inventory stock.
            </p>

        </div>


        <div class="date-box">

            <span>Today</span>

            <strong>
                <%= DateTime.Now.ToString("dd MMM yyyy") %>
            </strong>

        </div>

    </div>



    <!-- Statistics -->

    <div class="stats-container">


        <!-- Total Products -->

        <div class="stat-card">

            <div class="stat-icon">
                📦
            </div>

            <div>

                <span>
                    Total Products
                </span>

                <h2>

                    <asp:Label
                        ID="lblTotalProducts"
                        runat="server"
                        Text="0">
                    </asp:Label>

                </h2>

            </div>

        </div>



        <!-- Total Stock -->

        <div class="stat-card">

            <div class="stat-icon">
                📊
            </div>

            <div>

                <span>
                    Total Stock
                </span>

                <h2>

                    <asp:Label
                        ID="lblTotalStock"
                        runat="server"
                        Text="0">
                    </asp:Label>

                </h2>

            </div>

        </div>



        <!-- Total Low Stock -->

        <div class="stat-card">

            <div class="stat-icon">
                ⚠️
            </div>

            <div>

                <span>
                    Total Low Stock
                </span>

                <h2>

                    <asp:Label
                        ID="lblTotalLowStock"
                        runat="server"
                        Text="0">
                    </asp:Label>

                </h2>

            </div>

        </div>

    </div>



    <!-- Main Content -->

    <div class="dashboard-grid">


        <!-- Stock Overview -->

        <div class="dashboard-card">

            <div class="card-header">

                <h3>
                    Stock Overview
                </h3>

                <span>
                    Current inventory status
                </span>

            </div>


            <div class="stock-overview">


                <div class="overview-item">

                    <span>
                        In Stock
                    </span>

                    <strong>

                        <asp:Label
                            ID="lblInStock"
                            runat="server"
                            Text="0">
                        </asp:Label>

                    </strong>

                </div>



                <div class="overview-item">

                    <span>
                        Low Stock
                    </span>

                    <strong>

                        <asp:Label
                            ID="lblOverviewLowStock"
                            runat="server"
                            Text="0">
                        </asp:Label>

                    </strong>

                </div>



                <div class="overview-item">

                    <span>
                        Out of Stock
                    </span>

                    <strong>

                        <asp:Label
                            ID="lblOutOfStock"
                            runat="server"
                            Text="0">
                        </asp:Label>

                    </strong>

                </div>


            </div>

        </div>



        <!-- Quick Actions -->

        <div class="dashboard-card">

            <div class="card-header">

                <h3>
                    Quick Actions
                </h3>

                <span>
                    Monitor and manage stock
                </span>

            </div>


            <div class="quick-actions">


                <a href="AllStock.aspx" class="action-btn">

                    <span>
                        📦
                    </span>

                    <div>

                        <strong>
                            View All Stock
                        </strong>

                        <small>
                            Check current available inventory
                        </small>

                    </div>

                </a>



                <a href="Stock_Low.aspx" class="action-btn">

                    <span>
                        ⚠️
                    </span>

                    <div>

                        <strong>
                            Low Stock Products
                        </strong>

                        <small>
                            Monitor products that need restocking
                        </small>

                    </div>

                </a>



                <a href="Stock_Report.aspx" class="action-btn">

                    <span>
                        📊
                    </span>

                    <div>

                        <strong>
                            Stock Report
                        </strong>

                        <small>
                            View detailed inventory reports
                        </small>

                    </div>

                </a>


            </div>

        </div>

    </div>



    <!-- Bottom Welcome -->

    <div class="welcome-card">

        <div>

            <h2>
                Stock Control Center
            </h2>

            <p>
                Keep track of your products, monitor stock levels,
                identify low stock items, and manage inventory efficiently.
            </p>

        </div>


        <a href="AllStock.aspx">
            View Stock →
        </a>

    </div>


</div>

</asp:Content>
