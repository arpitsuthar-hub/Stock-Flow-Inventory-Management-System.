<%@ Page Title="Stock Management" Language="C#"
    MasterPageFile="~/Stock Module/Stock_Module.Master"
    AutoEventWireup="true"
    CodeBehind="Stock_Dashboard.aspx.cs"
    Inherits="Inventory_Management_System.Stock_Module.Stock_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!-- Font Awesome -->
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />

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
            gap: 20px;
        }

        .dashboard-header h1 {
            margin: 0 0 6px;
            font-size: 30px;
            font-weight: 700;
            color: #14213d;
        }

        .dashboard-header p {
            margin: 0;
            color: #718096;
            font-size: 15px;
        }

        /* =========================================
           DATE BOX
        ========================================= */

        .date-box {
            background: white;
            border: 1px solid #e5e7eb;
            border-radius: 10px;
            padding: 12px 20px;
            text-align: right;
            min-width: 125px;
        }

        .date-box span {
            display: block;
            font-size: 12px;
            color: #718096;
            margin-bottom: 5px;
        }

        .date-box strong {
            font-size: 14px;
            color: #14213d;
        }

        /* =========================================
           STATISTICS CONTAINER
        ========================================= */

        .stats-container {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 22px;
            margin-bottom: 25px;
            width: 100%;
        }

        /* =========================================
           STATISTICS CARDS
        ========================================= */

        .stat-card {
            min-height: 145px;
            background: white;
            border: 1px solid #e5e7eb;
            border-radius: 12px;
            padding: 28px 30px;

            display: flex;
            align-items: center;
            gap: 20px;

            transition: 0.3s ease;
        }

        .stat-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.05);
        }

        /* =========================================
           STATISTICS ICONS
        ========================================= */

        .stat-icon {
            width: 60px;
            height: 60px;
            min-width: 60px;

            border-radius: 12px;

            display: flex;
            align-items: center;
            justify-content: center;

            font-size: 25px;
        }

        .products-icon {
            background: #eff6ff;
            color: #2563eb;
        }

        .stock-icon {
            background: #ecfdf5;
            color: #059669;
        }

        .low-stock-icon {
            background: #fff7ed;
            color: #ea580c;
        }

        /* =========================================
           STATISTICS TEXT
        ========================================= */

        .stat-info {
            flex: 1;
        }

        .stat-info span {
            display: block;
            color: #718096;
            font-size: 14px;
            margin-bottom: 8px;
        }

        .stat-info h2 {
            margin: 0;
            font-size: 30px;
            font-weight: 700;
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
           DASHBOARD CARDS
        ========================================= */

        .dashboard-card {
            background: white;
            border: 1px solid #e5e7eb;
            border-radius: 12px;
            padding: 25px;
        }

        /* =========================================
           CARD HEADER
        ========================================= */

        .card-header {
            margin-bottom: 22px;
        }

        .card-header h3 {
            margin: 0 0 7px;
            font-size: 19px;
            font-weight: 700;
            color: #14213d;
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

        /* =========================================
           OVERVIEW ITEMS
        ========================================= */

        .overview-item {
            background: #f8fafc;
            padding: 22px 12px;
            border-radius: 10px;
            text-align: center;
            transition: 0.3s;
        }

        .overview-item:hover {
            background: #f1f5f9;
        }

        .overview-icon {
            font-size: 23px;
            margin-bottom: 12px;
        }

        .overview-item span {
            display: block;
            font-size: 13px;
            color: #718096;
            margin-bottom: 10px;
        }

        .overview-item strong {
            display: block;
            font-size: 26px;
            font-weight: 700;
            color: #14213d;
        }

        /* =========================================
           OVERVIEW ICON COLORS
        ========================================= */

        .in-stock-color {
            color: #16a34a;
        }

        .low-stock-color {
            color: #f59e0b;
        }

        .out-stock-color {
            color: #dc2626;
        }

        /* =========================================
           QUICK ACTIONS
        ========================================= */

        .quick-actions {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        /* =========================================
           ACTION BUTTONS
        ========================================= */

        .action-btn {
            text-decoration: none;
            color: #14213d;

            display: flex;
            align-items: center;
            gap: 15px;

            padding: 15px;
            border-radius: 10px;

            background: #f8fafc;
            border: 1px solid transparent;

            transition: 0.3s ease;
        }

        .action-btn:hover {
            background: #eff6ff;
            border-color: #dbeafe;
            transform: translateX(3px);
        }

        /* =========================================
           ACTION ICONS
        ========================================= */

        .action-icon {
            width: 45px;
            height: 45px;
            min-width: 45px;

            display: flex;
            align-items: center;
            justify-content: center;

            border-radius: 10px;
            font-size: 20px;
        }

        .action-blue {
            background: #dbeafe;
            color: #2563eb;
        }

        .action-orange {
            background: #ffedd5;
            color: #ea580c;
        }

        .action-green {
            background: #dcfce7;
            color: #16a34a;
        }

        /* =========================================
           ACTION TEXT
        ========================================= */

        .action-info {
            flex: 1;
        }

        .action-info strong {
            display: block;
            font-size: 14px;
            font-weight: 700;
            margin-bottom: 5px;
        }

        .action-info small {
            display: block;
            color: #718096;
            font-size: 12px;
        }

        /* =========================================
           ACTION ARROW
        ========================================= */

        .action-arrow {
            color: #94a3b8;
            font-size: 14px;
            transition: 0.3s;
        }

        .action-btn:hover .action-arrow {
            color: #2563eb;
            transform: translateX(3px);
        }

        /* =========================================
           WELCOME CARD
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

            gap: 20px;
        }

        .welcome-card h2 {
            margin: 0 0 8px;
            font-size: 20px;
            font-weight: 700;
            color: #14213d;
        }

        .welcome-card p {
            margin: 0;
            color: #718096;
            font-size: 14px;
            line-height: 1.7;
        }

        /* =========================================
           WELCOME BUTTON
        ========================================= */

        .welcome-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 10px;

            background: #14213d;
            color: white;

            text-decoration: none;
            font-size: 13px;
            font-weight: 600;

            padding: 13px 20px;
            border-radius: 8px;

            white-space: nowrap;
            transition: 0.3s;
        }

        .welcome-btn:hover {
            background: #2563eb;
            color: white;
        }

        /* =========================================
           RESPONSIVE - TABLET
        ========================================= */

        @media (max-width: 1100px) {

            .stats-container {
                gap: 15px;
            }

            .stat-card {
                padding: 20px;
            }

            .dashboard-grid {
                grid-template-columns: 1fr;
            }
        }

        /* =========================================
           RESPONSIVE - MOBILE
        ========================================= */

        @media (max-width: 700px) {

            .dashboard {
                padding: 20px;
            }

            .dashboard-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }

            .dashboard-header h1 {
                font-size: 25px;
            }

            .date-box {
                text-align: left;
            }

            .stats-container {
                grid-template-columns: 1fr;
                gap: 15px;
            }

            .stat-card {
                min-height: 110px;
                padding: 20px;
            }

            .stat-info h2 {
                font-size: 27px;
            }

            .stock-overview {
                grid-template-columns: 1fr;
            }

            .dashboard-card {
                padding: 20px;
            }

            .welcome-card {
                flex-direction: column;
                align-items: flex-start;
            }

            .welcome-btn {
                width: 100%;
            }
        }

    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="dashboard">

        <!-- =====================================
             DASHBOARD HEADER
        ====================================== -->

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


        <!-- =====================================
             STATISTICS
        ====================================== -->

        <div class="stats-container">

            <!-- TOTAL PRODUCTS -->

            <div class="stat-card">

                <div class="stat-icon products-icon">
                    <i class="fa-solid fa-box"></i>
                </div>

                <div class="stat-info">

                    <span>Total Products</span>

                    <h2>
                        <asp:Label
                            ID="lblTotalProducts"
                            runat="server"
                            Text="0">
                        </asp:Label>
                    </h2>

                </div>

            </div>


            <!-- TOTAL STOCK -->

            <div class="stat-card">

                <div class="stat-icon stock-icon">
                    <i class="fa-solid fa-boxes-stacked"></i>
                </div>

                <div class="stat-info">

                    <span>Total Stock</span>

                    <h2>
                        <asp:Label
                            ID="lblTotalStock"
                            runat="server"
                            Text="0">
                        </asp:Label>
                    </h2>

                </div>

            </div>


            <!-- TOTAL LOW STOCK -->

            <div class="stat-card">

                <div class="stat-icon low-stock-icon">
                    <i class="fa-solid fa-triangle-exclamation"></i>
                </div>

                <div class="stat-info">

                    <span>Total Low Stock</span>

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


        <!-- =====================================
             MAIN DASHBOARD GRID
        ====================================== -->

        <div class="dashboard-grid">

            <!-- STOCK OVERVIEW -->

            <div class="dashboard-card">

                <div class="card-header">

                    <h3>Stock Overview</h3>

                    <span>Current inventory status</span>

                </div>

                <div class="stock-overview">

                    <!-- IN STOCK -->

                    <div class="overview-item">

                        <div class="overview-icon in-stock-color">
                            <i class="fa-solid fa-circle-check"></i>
                        </div>

                        <span>In Stock</span>

                        <strong>
                            <asp:Label
                                ID="lblInStock"
                                runat="server"
                                Text="0">
                            </asp:Label>
                        </strong>

                    </div>


                    <!-- LOW STOCK -->

                    <div class="overview-item">

                        <div class="overview-icon low-stock-color">
                            <i class="fa-solid fa-arrow-trend-down"></i>
                        </div>

                        <span>Low Stock</span>

                        <strong>
                            <asp:Label
                                ID="lblOverviewLowStock"
                                runat="server"
                                Text="0">
                            </asp:Label>
                        </strong>

                    </div>


                    <!-- OUT OF STOCK -->

                    <div class="overview-item">

                        <div class="overview-icon out-stock-color">
                            <i class="fa-solid fa-circle-xmark"></i>
                        </div>

                        <span>Out of Stock</span>

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


            <!-- =================================
                 QUICK ACTIONS
            ================================== -->

            <div class="dashboard-card">

                <div class="card-header">

                    <h3>Quick Actions</h3>

                    <span>Monitor and manage stock</span>

                </div>

                <div class="quick-actions">

                    <!-- VIEW ALL STOCK -->

                    <a href="AllStock.aspx" class="action-btn">

                        <div class="action-icon action-blue">
                            <i class="fa-solid fa-warehouse"></i>
                        </div>

                        <div class="action-info">

                            <strong>View All Stock</strong>

                            <small>
                                Check current available inventory
                            </small>

                        </div>

                        <i class="fa-solid fa-chevron-right action-arrow"></i>

                    </a>


                    <!-- LOW STOCK PRODUCTS -->

                    <a href="Stock_Low.aspx" class="action-btn">

                        <div class="action-icon action-orange">
                            <i class="fa-solid fa-triangle-exclamation"></i>
                        </div>

                        <div class="action-info">

                            <strong>Low Stock Products</strong>

                            <small>
                                Monitor products that need restocking
                            </small>

                        </div>

                        <i class="fa-solid fa-chevron-right action-arrow"></i>

                    </a>


                    <!-- STOCK REPORT -->

                    <a href="Stock_Report.aspx" class="action-btn">

                        <div class="action-icon action-green">
                            <i class="fa-solid fa-chart-column"></i>
                        </div>

                        <div class="action-info">

                            <strong>Stock Report</strong>

                            <small>
                                View detailed inventory reports
                            </small>

                        </div>

                        <i class="fa-solid fa-chevron-right action-arrow"></i>

                    </a>

                </div>

            </div>

        </div>


        <!-- =====================================
             STOCK CONTROL CENTER
        ====================================== -->

        <div class="welcome-card">

            <div>

                <h2>
                    <i class="fa-solid fa-clipboard-list"
                        style="color: #2563eb; margin-right: 8px;">
                    </i>

                    Stock Control Center
                </h2>

                <p>
                    Keep track of your products, monitor stock levels,
                    identify low stock items, and manage inventory efficiently.
                </p>

            </div>

            <a href="AllStock.aspx" class="welcome-btn">

                View Stock

                <i class="fa-solid fa-arrow-right"></i>

            </a>

        </div>

    </div>

</asp:Content>
