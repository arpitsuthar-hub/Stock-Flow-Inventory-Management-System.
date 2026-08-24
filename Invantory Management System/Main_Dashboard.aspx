<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main_Dashboard.aspx.cs" Inherits="Invantory_Management_System.Main_Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Inventory Management System</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
    <link href="Main_Dashboard.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="dashboard-container">

            <!-- Header Section -->
            <header class="header">
                <div class="brand">
                    <div class="brand-icon">
                        <i class="fa-solid fa-boxes-stacked"></i>
                    </div>
                    <div class="brand-text">
                        <h1>Inventory Management System</h1>
                        <p>Track. Manage. Grow.</p>
                    </div>
                </div>
                <div class="date-card">
                    <i class="fa-regular fa-calendar"></i>
                    <div class="date-text">
                        <span class="date-main">May 21, 2025</span>
                        <span class="date-sub">Wednesday</span>
                    </div>
                </div>
            </header>

            <!-- Login Panels Section -->
            <section class="login-panels">
                <!-- Admin Card -->
                <div class="panel-card admin-card">
                    <div class="panel-content">
                        <div class="panel-icon admin-icon">
                            <i class="fa-solid fa-user-shield"></i>
                        </div>
                        <div class="panel-info">
                            <h2>Admin</h2>
                            <p>Manage inventory, users, products, and system settings.</p>
                            <asp:Button ID="btnAdminLogin" runat="server" Text="Login as Admin" CssClass="btn btn-admin" OnClick="btnAdminLogin_Click" />
                        </div>
                    </div>
                </div>

                <!-- Supplier Card -->
                <div class="panel-card supplier-card">
                    <div class="panel-content">
                        <div class="panel-icon supplier-icon">
                            <i class="fa-solid fa-truck-ramp-box"></i>
                        </div>
                        <div class="panel-info">
                            <h2>Supplier</h2>
                            <p>Manage your products, stock, and view sales.</p>
                            <asp:Button ID="btnSupplierLogin" runat="server" Text="Login as Supplier" CssClass="btn btn-supplier" OnClick="btnSupplierLogin_Click" />
                        </div>
                    </div>
                </div>
            </section>

            <!-- Metrics Overview Section -->
            <section class="overview-section">
                <div class="section-header">
                    <i class="fa-solid fa-chart-line"></i>
                    <div>
                        <h3>Inventory Overview</h3>
                        <p>Key metrics at a glance</p>
                    </div>
                </div>

                <div class="metrics-grid">
                    <!-- Name of Inventory -->
                    <div class="metric-card">
                        <div class="metric-top">
                            <div class="metric-icon icon-blue">
                                <i class="fa-solid fa-cube"></i>
                            </div>
                            <div class="metric-details">
                                <span class="metric-label">Name of Inventory</span>
                                <h4 class="metric-value">Main Inventory</h4>
                            </div>
                        </div>
                        <div class="metric-footer">
                            <p>Central warehouse managing all products.</p>
                        </div>
                    </div>

                    <!-- Total Products -->
                    <div class="metric-card">
                        <div class="metric-top">
                            <div class="metric-icon icon-blue-light">
                                <i class="fa-solid fa-border-all"></i>
                            </div>
                            <div class="metric-details">
                                <span class="metric-label">Total Products</span>
                                <h4 class="metric-value">
                                    <asp:Label ID="lblTotalProducts" runat="server" Text="1,248"></asp:Label></h4>
                            </div>
                        </div>
                        <div class="metric-footer">
                            <span>All products across categories.</span>
                            <span class="badge badge-blue"><i class="fa-solid fa-arrow-up"></i>8.5%</span>
                        </div>
                    </div>

                    <!-- Total Sales Today -->
                    <div class="metric-card">
                        <div class="metric-top">
                            <div class="metric-icon icon-green">
                                <i class="fa-solid fa-bag-shopping"></i>
                            </div>
                            <div class="metric-details">
                                <span class="metric-label">Total Sales (Today)</span>
                                <h4 class="metric-value">₹
                                    <asp:Label ID="lblTotalSalesToday" runat="server" Text="89,650"></asp:Label></h4>
                            </div>
                        </div>
                        <div class="metric-footer">
                            <span>Total sales amount for today.</span>
                            <span class="badge badge-green"><i class="fa-solid fa-arrow-up"></i>12.4%</span>
                        </div>
                    </div>

                    <!-- Daily Sell -->
                    <div class="metric-card">
                        <div class="metric-top">
                            <div class="metric-icon icon-orange">
                                <i class="fa-solid fa-chart-simple"></i>
                            </div>
                            <div class="metric-details">
                                <span class="metric-label">Daily Sell</span>
                                <h4 class="metric-value">
                                    <asp:Label ID="lblDailySell" runat="server" Text="326"></asp:Label></h4>
                            </div>
                        </div>
                        <div class="metric-footer">
                            <span>Total units sold today.</span>
                            <span class="badge badge-orange"><i class="fa-solid fa-arrow-up"></i>6.7%</span>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Footer -->
            <footer class="footer">
                <p>&copy; <%= DateTime.Now.Year %> Inventory Management System. All rights reserved.</p>
            </footer>

        </div>
    </form>
</body>
</html>
