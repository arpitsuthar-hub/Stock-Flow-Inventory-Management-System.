<%@ Page Title="Product Dashboard"
    Language="C#"
    MasterPageFile="~/Product_Module/Product_Module.Master"
    AutoEventWireup="true"
    CodeBehind="Product_Dashboard.aspx.cs"
    Inherits="Inventory_Management_System.Product_Module.Product_Dashboard" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style>
        /* =========================================
           DASHBOARD
        ========================================= */

        .product-dashboard {
            width: 100%;
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
                font-size: 30px;
                color: #14213d;
                margin-bottom: 6px;
            }

            .dashboard-header p {
                color: #777;
                font-size: 15px;
            }


        /* =========================================
           DATE BOX
        ========================================= */

        .date-box {
            background: white;
            padding: 12px 18px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.07);
            color: #555;
            font-size: 14px;
            line-height: 1.7;
        }


        /* =========================================
           SUMMARY
        ========================================= */

        .summary-container {
            display: flex;
    justify-content: center;
    align-items: stretch;
    gap: 25px;
    margin-bottom: 35px;
    width: 100%;
        }


        /* =========================================
           SUMMARY CARD
        ========================================= */

        .summary-card {
            width: 280px;

    background: white;

    border-radius: 12px;

    padding: 22px;

    min-height: 145px;

    box-shadow: 0 4px 15px rgba(0,0,0,0.07);

    transition: 0.3s;
        }

            .summary-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 8px 22px rgba(0,0,0,0.12);
            }


        /* =========================================
           ICON
        ========================================= */

        .summary-icon {
            width: 45px;
            height: 45px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 22px;
            margin-bottom: 12px;
        }


        /* =========================================
           TITLE
        ========================================= */

        .summary-title {
            color: #777;
            font-size: 13px;
            font-weight: bold;
            margin-bottom: 5px;
        }


        /* =========================================
           VALUE
        ========================================= */

        .summary-value {
            font-size: 28px;
            font-weight: bold;
            color: #14213d;
        }


        /* =========================================
           SUMMARY COLORS
        ========================================= */

        .total-products {
            border-top: 4px solid #1769e0;
        }

            .total-products .summary-icon {
                background: #e4efff;
                color: #1769e0;
            }


        .available-products {
            border-top: 4px solid #16a05d;
        }

            .available-products .summary-icon {
                background: #e3f7ec;
                color: #16a05d;
            }


        .categories {
            border-top: 4px solid #7048d8;
        }

            .categories .summary-icon {
                background: #eee7ff;
                color: #7048d8;
            }


        .low-stock {
            border-top: 4px solid #f39c12;
        }

            .low-stock .summary-icon {
                background: #fff0d8;
                color: #f39c12;
            }


        /* =========================================
           SECTION TITLE
        ========================================= */

        .section-title {
            display: flex;
            align-items: center;
            gap: 15px;
            margin-bottom: 20px;
        }

            .section-title h2 {
                font-size: 21px;
                color: #14213d;
            }

            .section-title span {
                flex: 1;
                height: 1px;
                background: #d9dee7;
            }


        /* =========================================
           QUICK ACTIONS
        ========================================= */

        .quick-actions {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 18px;
            margin-bottom: 35px;
        }


        /* =========================================
           ACTION CARD
        ========================================= */

        .action-card {
            background: white;
            padding: 22px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.07);
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 15px;
            transition: 0.3s;
        }

            .action-card:hover {
                transform: translateY(-4px);
                box-shadow: 0 8px 20px rgba(0,0,0,0.12);
            }


        /* =========================================
           ACTION ICON
        ========================================= */

        .action-icon {
            width: 52px;
            height: 52px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            flex-shrink: 0;
        }


        /* =========================================
           ACTION TEXT
        ========================================= */

        .action-text h3 {
            color: #14213d;
            font-size: 16px;
            margin-bottom: 5px;
        }

        .action-text p {
            color: #777;
            font-size: 12px;
        }


        /* =========================================
           ACTION COLORS
        ========================================= */

        .new-product-icon {
            background: #e4efff;
            color: #1769e0;
        }

        .search-product-icon {
            background: #eee7ff;
            color: #7048d8;
        }

        .all-product-icon {
            background: #e3f7ec;
            color: #16a05d;
        }


        /* =========================================
           BOTTOM CONTAINER
        ========================================= */

        .bottom-container {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }


        /* =========================================
           DASHBOARD BOX
        ========================================= */

        .dashboard-box {
            background: white;
            border-radius: 12px;
            padding: 22px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.07);
        }

            .dashboard-box h3 {
                font-size: 18px;
                color: #14213d;
                margin-bottom: 18px;
            }


        /* =========================================
           INFORMATION ROW
        ========================================= */

        .info-row {
            display: flex;
            justify-content: space-between;
            padding: 12px 0;
            border-bottom: 1px solid #edf0f4;
            font-size: 14px;
        }

            .info-row:last-child {
                border-bottom: none;
            }

        .info-label {
            color: #777;
        }

        .info-number {
            font-weight: bold;
            color: #14213d;
        }


        /* =========================================
           CATEGORY ROW
        ========================================= */

        .category-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px 0;
            border-bottom: 1px solid #edf0f4;
        }

            .category-row:last-child {
                border-bottom: none;
            }

        .category-name {
            font-size: 14px;
            color: #555;
        }

        .category-count {
            background: #e4efff;
            color: #1769e0;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: bold;
        }


        /* =========================================
           RESPONSIVE
        ========================================= */

       @media (max-width: 900px) {

    .summary-container {
        flex-wrap: wrap;
        justify-content: center;
    }

}


        @media (max-width: 600px) {

    .summary-container {
        flex-direction: column;
        align-items: center;
        gap: 15px;
    }

    .summary-card {
        width: 100%;
        max-width: 350px;
    }

}
    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="product-dashboard">


        <!-- =========================================
             HEADER
        ========================================== -->

        <div class="dashboard-header">

            <div>

                <h1>Product Dashboard</h1>

                <p>
                    Manage your products and product categories
                </p>

            </div>


            <div class="date-box">
                📅 <%=DateTime.Now.ToString("dd-MM-yyyy") %>

                <br />

                🕒<%=DateTime.Now.ToString("hh:mm tt") %>
            </div>

        </div>


        <!-- =========================================
             SUMMARY CARDS
        ========================================== -->

        <div class="summary-container">

    <!-- TOTAL PRODUCTS -->

    <div class="summary-card total-products">

        <div class="summary-icon">
            📦
        </div>

        <div class="summary-title">
            TOTAL PRODUCTS
        </div>

        <div class="summary-value">

            <asp:Label ID="lblTotalProducts"
                runat="server"
                Text="0">
            </asp:Label>

        </div>

    </div>


    <!-- AVAILABLE PRODUCTS -->

    <div class="summary-card available-products">

        <div class="summary-icon">
            ✓
        </div>

        <div class="summary-title">
            AVAILABLE PRODUCTS
        </div>

        <div class="summary-value">

            <asp:Label ID="lblAvailableProducts"
                runat="server"
                Text="0">
            </asp:Label>

        </div>

    </div>


    <!-- TOTAL CATEGORIES -->

    <div class="summary-card categories">

        <div class="summary-icon">
            🗂️
        </div>

        <div class="summary-title">
            TOTAL CATEGORIES
        </div>

        <div class="summary-value">

            <asp:Label ID="lblTotalCategories"
                runat="server"
                Text="0">
            </asp:Label>

        </div>

    </div>

</div>


        <!-- =========================================
             QUICK ACTIONS
        ========================================== -->

        <div class="section-title">

            <h2>Quick Actions</h2>

            <span></span>

        </div>


        <div class="quick-actions">


            <!-- NEW PRODUCT -->

            <a href="Product_AddNew.aspx"
                class="action-card">

                <div class="action-icon new-product-icon">
                    ➕
                </div>

                <div class="action-text">

                    <h3>New Product</h3>

                    <p>
                        Add a new product
                    </p>

                </div>

            </a>


            <!-- SEARCH PRODUCT -->

            <a href="Product_Search.aspx"
                class="action-card">

                <div class="action-icon search-product-icon">
                    🔍
                </div>

                <div class="action-text">

                    <h3>Search Product</h3>

                    <p>
                        Find product information
                    </p>

                </div>

            </a>


            <!-- ALL PRODUCTS -->

            <a href="AllProduct.aspx"
                class="action-card">

                <div class="action-icon all-product-icon">
                    📋
                </div>

                <div class="action-text">

                    <h3>All Products</h3>

                    <p>
                        View all products
                    </p>

                </div>

            </a>


        </div>


        <!-- =========================================
     PRODUCT OVERVIEW
========================================== -->

<div class="section-title">

    <h2>Product Overview</h2>

    <span></span>

</div>


<div class="bottom-container">


    <!-- PRODUCT STATUS -->

    <div class="dashboard-box">

        <h3>Product Status</h3>


        <div class="info-row">

            <span class="info-label">
                Total Products
            </span>

            <span class="info-number">

                <asp:Label ID="lblStatusTotalProducts"
                    runat="server"
                    Text="0">
                </asp:Label>

            </span>

        </div>


        <div class="info-row">

            <span class="info-label">
                Available Products
            </span>

            <span class="info-number">

                <asp:Label ID="lblStatusAvailableProducts"
                    runat="server"
                    Text="0">
                </asp:Label>

            </span>

        </div>


        <div class="info-row">

            <span class="info-label">
                Low Stock Products
            </span>

            <span class="info-number">

                <asp:Label ID="lblStatusLowStockProducts"
                    runat="server"
                    Text="0">
                </asp:Label>

            </span>

        </div>


        <div class="info-row">

            <span class="info-label">
                Categories
            </span>

            <span class="info-number">

                <asp:Label ID="lblStatusCategories"
                    runat="server"
                    Text="0">
                </asp:Label>

            </span>

        </div>

    </div>


    <!-- PRODUCT CATEGORIES / TOTAL STOCK -->

    <div class="dashboard-box">

        <h3>Product Categories</h3>


        <asp:Repeater ID="rptProductCategories"
            runat="server">

            <ItemTemplate>

                <div class="category-row">

                    <span class="category-name">

                        <%# Eval("pro_category") %>

                    </span>

                    <span class="category-count">

                        <%# Eval("TotalQuantity") %>

                    </span>

                </div>

            </ItemTemplate>


            <FooterTemplate>

                <asp:Label ID="lblNoCategory"
                    runat="server"
                    Text="No product categories found."
                    Visible='<%# ((Repeater)Container.Parent).Items.Count == 0 %>'>
                </asp:Label>

            </FooterTemplate>

        </asp:Repeater>

    </div>


</div>


    </div>

</asp:Content>
