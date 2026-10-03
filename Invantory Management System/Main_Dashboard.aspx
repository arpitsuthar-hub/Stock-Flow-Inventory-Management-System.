<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Main_Dashboard.aspx.cs"
    Inherits="Inventory_Management_System.Main_Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Inventory Management System</title>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        rel="stylesheet" />

    <link href="Main_Dashboard.css?v=2"
        rel="stylesheet"
        type="text/css" />

</head>


<body>

    <form id="form1" runat="server">

        <div class="dashboard-container">


            <!-- =========================================
         HEADER
    ========================================== -->

            <header class="header">

                <div class="brand">

                    <div class="brand-icon">

                        <i class="fa-solid fa-boxes-stacked"></i>

                    </div>


                    <div class="brand-text">

                        <h1>Inventory Management System
                        </h1>

                        <p>
                            Track. Manage. Grow.
                        </p>

                    </div>

                </div>

                <div class="stock-flow-title">
                    STOCK FLOW
                </div>

                <div class="date-card">

                    <i class="fa-regular fa-calendar"></i>

                    <div class="date-text">
                        📅
                <%= DateTime.Now.ToString("dd MMM yyyy") %>

                        <br />

                        🕐
                <%= DateTime.Now.ToString("hh:mm tt") %>
                    </div>

                </div>

            </header>



            <!-- =========================================
         LOGIN PANELS
    ========================================== -->

            <section class="login-panels">


                <!-- ADMIN -->

                <div class="panel-card admin-card">

                    <div class="panel-content">

                        <div class="panel-icon admin-icon">

                            <i class="fa-solid fa-user-shield"></i>

                        </div>


                        <div class="panel-info">

                            <h2>Admin
                            </h2>

                            <p>
                                Manage inventory, users, products,
                        and system settings.
                            </p>


                            <asp:Button
                                ID="btnAdminLogin"
                                runat="server"
                                Text="Login as Admin"
                                CssClass="btn btn-admin"
                                OnClick="btnAdminLogin_Click" />

                        </div>

                    </div>

                </div>



                <!-- SUPPLIER -->

                <div class="panel-card supplier-card">

                    <div class="panel-content">

                        <div class="panel-icon supplier-icon">

                            <i class="fa-solid fa-truck-ramp-box"></i>

                        </div>


                        <div class="panel-info">

                            <h2>Supplier
                            </h2>

                            <p>
                                Manage your products, stock,
                        and view sales.
                            </p>


                            <asp:Button
                                ID="btnSupplierLogin"
                                runat="server"
                                Text="Login as Supplier"
                                CssClass="btn btn-supplier"
                                OnClick="btnSupplierLogin_Click" />

                        </div>

                    </div>

                </div>

            </section>



            <!-- =========================================
         INVENTORY OVERVIEW
    ========================================== -->

            <section class="overview-section">


                <!-- SECTION HEADER -->

                <div class="section-header">

                    <i class="fa-solid fa-chart-line"></i>

                    <div>

                        <h3>Inventory Overview
                        </h3>

                        <p>
                            Key metrics at a glance
                        </p>

                    </div>

                </div>



                <!-- =====================================
             METRICS
        ====================================== -->

                <div class="metrics-grid">


                    <!-- =================================
                 TOTAL PRODUCTS
            ================================== -->

                    <div class="metric-card">

                        <div class="metric-top">

                            <div class="metric-icon icon-blue">

                                <i class="fa-solid fa-boxes-stacked"></i>

                            </div>


                            <div class="metric-details">

                                <span class="metric-label">Total Products
                                </span>


                                <h4 class="metric-value">

                                    <asp:Label
                                        ID="lblTotalProducts"
                                        runat="server">
                                    </asp:Label>

                                </h4>

                            </div>

                        </div>


                        <div class="metric-footer">

                            <span>Total products in inventory.
                            </span>

                            <span class="badge badge-blue">

                                <i class="fa-solid fa-box"></i>

                                Products

                            </span>

                        </div>

                    </div>



                    <!-- =================================
                 TOTAL SUPPLIERS
            ================================== -->

                    <div class="metric-card">

                        <div class="metric-top">

                            <div class="metric-icon icon-purple">

                                <i class="fa-solid fa-truck-field"></i>

                            </div>


                            <div class="metric-details">

                                <span class="metric-label">Total Suppliers
                                </span>


                                <h4 class="metric-value">

                                    <asp:Label
                                        ID="lblTotalSuppliers"
                                        runat="server">
                                    </asp:Label>

                                </h4>

                            </div>

                        </div>


                        <div class="metric-footer">

                            <span>Registered suppliers.
                            </span>

                            <span class="badge badge-purple">

                                <i class="fa-solid fa-truck"></i>

                                Suppliers

                            </span>

                        </div>

                    </div>



                    <!-- =================================
                 TOTAL CUSTOMERS
            ================================== -->

                    <div class="metric-card">

                        <div class="metric-top">

                            <div class="metric-icon icon-orange">

                                <i class="fa-solid fa-users"></i>

                            </div>


                            <div class="metric-details">

                                <span class="metric-label">Total Customers
                                </span>


                                <h4 class="metric-value">

                                    <asp:Label
                                        ID="lblTotalCustomers"
                                        runat="server">
                                    </asp:Label>

                                </h4>

                            </div>

                        </div>


                        <div class="metric-footer">

                            <span>All registered customers.
                            </span>

                            <span class="badge badge-orange">

                                <i class="fa-solid fa-user-group"></i>

                                Customers

                            </span>

                        </div>

                    </div>



                    <!-- =================================
     TODAY'S TOTAL SALE
================================== -->

                    <div class="metric-card">

                        <div class="metric-top">

                            <div class="metric-icon icon-green">

                                <i class="fa-solid fa-cart-shopping"></i>

                            </div>


                            <div class="metric-details">

                                <span class="metric-label">Today's Total Sale
            </span>

                                <h4 class="metric-value">₹
               
                                    <asp:Label
                                        ID="lblTotalSales"
                                        runat="server">
                </asp:Label>

                                </h4>

                            </div>

                        </div>


                        <div class="metric-footer">

                            <span>Total sales amount generated today.
        </span>

                            <span class="badge badge-green">

                                <i class="fa-solid fa-calendar-day"></i>

                                Today

        </span>

                        </div>

                    </div>


                </div>

            </section>



            <!-- =========================================
         FOOTER
    ========================================== -->

            <footer class="footer">

                <p>
                    &copy;
            <%= DateTime.Now.Year %>
            Inventory Management System.
            All rights reserved.
                </p>

            </footer>


        </div>

    </form>

</body>

</html>
