<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Admin_Dashboard.aspx.cs"
    Inherits="Inventory_Management_System.Admin_Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Admin Dashboard</title>

    <link href="Admin_Dashboard.css" rel="stylesheet" />

</head>

<body>

    <form id="form1" runat="server">

        <div class="main-container">

            <!-- =====================================================
                 HEADER
            ====================================================== -->

            <header class="header">

    <!-- LEFT : ADMIN DASHBOARD -->

    <div class="admin-title">

        <span class="admin-label">
            ADMIN
        </span>

        <h1>
            Dashboard
        </h1>

    </div>


    <!-- CENTER : STOCK-FLOW -->

    <div class="stockflow-brand">

        <div class="stockflow-name">
            STOCK-FLOW
        </div>

        <div class="stockflow-subtitle">
            Inventory Management System
        </div>

    </div>


    <!-- RIGHT : DATE / TIME -->

    <div class="date-box">

        <div class="date-row">

            <span class="date-icon">
                ◷
            </span>

            <span>
                <%= DateTime.Now.ToString("dd MMM yyyy") %>
            </span>

        </div>

        <div class="time-row">

            <span>
                <%= DateTime.Now.ToString("hh:mm tt") %>
            </span>

        </div>

    </div>


    <!-- MAIN DASHBOARD -->

    <a href="Main_Dashboard.aspx"
       class="main-dashboard-link">
        ← Main Dashboard
    </a>

</header>

            <!-- =====================================================
                 MAIN CONTENT
            ====================================================== -->

            <main class="page-content">


                <!-- =================================================
                     SUMMARY
                ================================================== -->

                <section class="summary-section">

                    <div class="section-heading">

                        <div>
                            <span class="section-label">OVERVIEW
                            </span>

                            <h2>System Summary
                            </h2>
                        </div>

                    </div>


                    <div class="summary-container">


                        <!-- PRODUCTS -->

                        <div class="summary-card">

                            <div class="summary-top">

                                <div class="summary-icon">
                                    ▦
                                </div>

                                <span class="summary-status">Inventory
                                </span>

                            </div>

                            <div class="summary-title">
                                Total Products
                            </div>

                            <asp:Label ID="lblTotalProducts"
                                runat="server"
                                CssClass="summary-value">
                             </asp:Label>

                            <a href="Product_Module/AllProduct.aspx"
                                class="summary-link">View Products
                                <span>→</span>
                            </a>

                        </div>


                        <!-- SUPPLIERS -->

                        <div class="summary-card">

                            <div class="summary-top">

                                <div class="summary-icon">
                                    ◈
                                </div>

                                <span class="summary-status">Partners
                                </span>

                            </div>

                            <div class="summary-title">
                                Total Suppliers
                            </div>

                            <asp:Label ID="lblTotalSuppliers"
                                runat="server"
                                CssClass="summary-value">
                            </asp:Label>

                            <a href="Supplier_Module/AllSupplier.aspx"
                                class="summary-link">View Suppliers
                                <span>→</span>
                            </a>

                        </div>


                        <!-- CUSTOMERS -->

                        <div class="summary-card">

                            <div class="summary-top">

                                <div class="summary-icon">
                                    ◉
                                </div>

                                <span class="summary-status">Customers
                                </span>

                            </div>

                            <div class="summary-title">
                                Total Customers
                            </div>

                            <asp:Label ID="lblTotalCustomers"
                                runat="server"
                                CssClass="summary-value">
                            </asp:Label>

                            <a href="Customer_Module/AllCustomer.aspx"
                                class="summary-link">View Customers
                                <span>→</span>
                            </a>

                        </div>


                        <!-- PURCHASES -->

                        <div class="summary-card">

                            <div class="summary-top">

                                <div class="summary-icon">
                                    +
                                </div>

                                <span class="summary-status">Purchases
                                </span>

                            </div>

                            <div class="summary-title">
                                Total Purchases
                            </div>

                            <asp:Label ID="lblTotalPurchases"
                                runat="server"
                                CssClass="summary-value">
                            </asp:Label>

                            <a href="Purchase Module/AllPurchase.aspx"
                                class="summary-link">View Purchases
                                <span>→</span>
                            </a>

                        </div>


                        <!-- BILLS -->

                        <div class="summary-card">

                            <div class="summary-top">

                                <div class="summary-icon">
                                    #
                                </div>

                                <span class="summary-status">Sales
                                </span>

                            </div>

                            <div class="summary-title">
                                Total Sells
                            </div>

                            <asp:Label ID="lblTotalSell"
                                runat="server"
                                CssClass="summary-value">
                            </asp:Label>

                            <a href="Sell-Bill_Module/AllSells.aspx"
                                class="summary-link">View Sell
                                <span>→</span>
                            </a>

                        </div>


                    </div>

                </section>


                <!-- =================================================
                     MANAGEMENT
                ================================================== -->

                <section class="management-section">


                    <div class="section-heading management-heading">

                        <div>

                            <span class="section-label">MANAGEMENT
                            </span>

                            <h2>System Modules
                            </h2>

                        </div>

                        <p>
                            Select a module to manage your inventory system.
                        </p>

                    </div>


                    <div class="management-container">

                                                <!-- =================================================
     PRODUCT
================================================== -->

<div class="management-card">

    <div class="module-header">

        <div class="module-icon">
            ▦
        </div>

        <span class="module-number">01
        </span>

    </div>

    <h3>Product Management
    </h3>

    <p class="description">
        Manage products, categories and product information.
    </p>

    <ul class="management-list">

        <li>Product Dashboard</li>
        <li>Add New Product</li>
        <li>Search Product</li>
        <li>View All Products</li>
        <li>Edit Product</li>

    </ul>

    <a href="Product_Module/Product_Dashboard.aspx"
        class="manage-button">Open Module
        <span>→</span>
    </a>

</div>

                        <!-- =================================================
      SUPPLIER
 ================================================== -->

                        <div class="management-card">

                            <div class="module-header">

                                <div class="module-icon">
                                    ◈
                                </div>

                                <span class="module-number">02
                                </span>

                            </div>

                            <h3>Supplier Management
                            </h3>

                            <p class="description">
                                Register, search and manage your product suppliers.
                            </p>

                            <ul class="management-list">

                                <li>Supplier Dashboard</li>
                                <li>Add New Supplier</li>
                                <li>Search Supplier</li>
                                <li>View All Suppliers</li>
                                <li>Edit Supplier</li>

                            </ul>

                            <a href="Supplier_Module/Supplier_Dashboard.aspx"
                                class="manage-button">Open Module
         <span>→</span>
                            </a>

                        </div>
                        


                        <!-- =================================================
     PURCHASE
================================================== -->

                        <div class="management-card">

                            <div class="module-header">

                                <div class="module-icon">
                                    +
                                </div>

                                <span class="module-number">03
                                </span>

                            </div>

                            <h3>Purchase Management
                            </h3>

                            <p class="description">
                                Manage purchases and products received from suppliers.
                            </p>

                            <ul class="management-list">

                                <li>Purchase Dashboard</li>
                                <li>New Purchase</li>
                                <li>Search Purchase</li>
                                <li>View All Purchases</li>
                                <li>Purchase History</li>

                            </ul>

                            <a href="Purchase Module/Purchase_Dashboard.aspx"
                                class="manage-button">Open Module
        <span>→</span>
                            </a>

                        </div>


                        <!-- =================================================
                             CUSTOMER
                        ================================================== -->

                        <div class="management-card">

                            <div class="module-header">

                                <div class="module-icon">
                                    ◉
                                </div>

                                <span class="module-number">04
                                </span>

                            </div>

                            <h3>Customer Management
                            </h3>

                            <p class="description">
                                Register and manage customer information and records.
                            </p>

                            <ul class="management-list">

                                <li>Customer Dashboard</li>
                                <li>Register Customer</li>
                                <li>Search Customer</li>
                                <li>View All Customers</li>
                                <li>Edit Customer</li>

                            </ul>

                            <a href="Customer_Module/Customer_Dashboard.aspx"
                                class="manage-button">Open Module
                                <span>→</span>
                            </a>

                        </div>


                        <!-- =================================================
      SALES
 ================================================== -->

                        <div class="management-card">

                            <div class="module-header">

                                <div class="module-icon">
                                    #
                                </div>

                                <span class="module-number">05
                                </span>

                            </div>

                            <h3>Bill & Sales Management
                            </h3>

                            <p class="description">
                                Create sales, generate invoices and manage customer bills.
                            </p>

                            <ul class="management-list">

                                <li>Sales Dashboard</li>
                                <li>New Sale</li>
                                <li>Search Bill</li>
                                <li>View All Bills</li>
                                <li>Sales Report</li>

                            </ul>

                            <a href="Sell-Bill_Module/Sell-Bill_Dashboard.aspx"
                                class="manage-button">Open Module
         <span>→</span>
                            </a>

                        </div>



                        <!-- =================================================
                             STOCK
                        ================================================== -->

                        <div class="management-card">

                            <div class="module-header">

                                <div class="module-icon">
                                    ▤
                                </div>

                                <span class="module-number">06
                                </span>

                            </div>

                            <h3>Stock Management
                            </h3>

                            <p class="description">
                                Monitor current stock levels and inventory movements.
                            </p>

                            <ul class="management-list">

                                <li>Stock Dashboard</li>
                                <li>Current Stock</li>
                                <li>Stock In</li>
                                <li>Stock Out</li>
                                <li>Low Stock Report</li>

                            </ul>

                            <a href="Stock Module/Stock_Dashboard.aspx"
                                class="manage-button">Open Module
                                <span>→</span>
                            </a>

                        </div>


                    </div>

                </section>

            </main>


            <!-- =====================================================
                 FOOTER
            ====================================================== -->

            <footer class="footer">

                <div class="footer-content">

                    <div class="footer-brand">

                        <span class="footer-icon">▦
                        </span>

                        <span>StockFlow
                        </span>

                    </div>


                    <div class="footer-center">
                        © <%= DateTime.Now.Year %>
                        StockFlow Inventory System

                    </div>


                    <div class="footer-status">

                        <span class="status-dot"></span>

                        System Online

                    </div>

                </div>

            </footer>

        </div>

    </form>

</body>

</html>
