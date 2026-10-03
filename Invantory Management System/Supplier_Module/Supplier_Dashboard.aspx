<%@ Page Title="Supplier Dashboard"
    Language="C#"
    MasterPageFile="~/Supplier_Module/Supplier_Module.Master"
    AutoEventWireup="true"
    CodeBehind="Supplier_Dashboard.aspx.cs"
    Inherits="Inventory_Management_System.Supplier_Module.Supplier_Dashboard" %>


<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style>
        /* =========================================
           PAGE
        ========================================= */

        .supplier-dashboard {
            width: 100%;
            padding-bottom: 30px;
        }


        /* =========================================
           PAGE HEADER
        ========================================= */

        .dashboard-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 25px;
        }

            .dashboard-header h1 {
                font-size: 28px;
                color: #14213d;
                margin-bottom: 6px;
            }

            .dashboard-header p {
                color: #777;
                font-size: 14px;
            }


        /* =========================================
           DATE BOX
        ========================================= */

        .date-box {
            background: white;
            padding: 12px 18px;
            border-radius: 10px;
            box-shadow: 0 4px 18px rgba(0,0,0,0.07);
            font-size: 13px;
            color: #555;
            line-height: 1.8;
        }


        /* =========================================
           SUMMARY CARDS
        ========================================= */

        .summary-container {
            display: flex;
            justify-content: center;
            align-items: stretch;
            gap: 25px;
            margin-bottom: 30px;
            width: 100%;
        }


        .summary-card {
            width: 280px;
            background: white;
            padding: 20px;
            border-radius: 14px;
            box-shadow: 0 4px 18px rgba(0,0,0,0.07);
            transition: 0.25s;
            border-top: 4px solid;
        }

            .summary-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 25px rgba(0,0,0,0.10);
            }


        .summary-icon {
            width: 52px;
            height: 52px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            margin-bottom: 15px;
        }


        .summary-title {
            color: #777;
            font-size: 13px;
            font-weight: bold;
            text-transform: uppercase;
            margin-bottom: 7px;
        }


        .summary-value {
            font-size: 27px;
            font-weight: bold;
            color: #14213d;
        }


        /* =========================================
           CARD COLORS
        ========================================= */

        .total-supplier {
            border-color: #16a05d;
        }

            .total-supplier .summary-icon {
                background: #e3f7ec;
            }


        .active-supplier {
            border-color: #1769e0;
        }

            .active-supplier .summary-icon {
                background: #e4efff;
            }


        .inactive-supplier {
            border-color: #e53935;
        }

            .inactive-supplier .summary-icon {
                background: #ffe5e5;
            }


        .new-supplier {
            border-color: #7048d8;
        }

            .new-supplier .summary-icon {
                background: #eee7ff;
            }


        /* =========================================
           SECTION HEADING
        ========================================= */

        .section-heading {
            display: flex;
            align-items: center;
            gap: 15px;
            margin: 25px 0 15px;
        }

            .section-heading h2 {
                color: #14213d;
                font-size: 20px;
                white-space: nowrap;
            }

            .section-heading span {
                height: 1px;
                background: #dfe4eb;
                width: 100%;
            }


        /* =========================================
           QUICK ACTIONS
        ========================================= */

        .quick-actions {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 18px;
        }


        .quick-action-card {
            background: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 18px rgba(0,0,0,0.07);
            display: flex;
            align-items: center;
            gap: 15px;
            text-decoration: none;
            transition: 0.25s;
        }

            .quick-action-card:hover {
                transform: translateY(-4px);
                box-shadow: 0 9px 22px rgba(0,0,0,0.10);
            }


        .quick-action-icon {
            width: 52px;
            height: 52px;
            min-width: 52px;
            border-radius: 12px;
            background: #e3f7ec;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 23px;
        }


        .quick-action-content h3 {
            color: #14213d;
            font-size: 16px;
            margin-bottom: 5px;
        }

        .quick-action-content p {
            color: #777;
            font-size: 12px;
        }


        /* =========================================
           SUPPLIER OVERVIEW
        ========================================= */

        .supplier-overview {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }


        .overview-card {
            background: white;
            padding: 25px;
            border-radius: 14px;
            box-shadow: 0 4px 18px rgba(0,0,0,0.07);
        }


            .overview-card h3 {
                font-size: 18px;
                color: #14213d;
                margin-bottom: 20px;
            }


        /* =========================================
           SUPPLIER STATUS
        ========================================= */

        .status-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 14px 0;
            border-bottom: 1px solid #edf0f4;
            font-size: 14px;
            color: #666;
        }

            .status-row:last-child {
                border-bottom: none;
            }

        .status-value {
            font-weight: bold;
            color: #14213d;
        }


        /* =========================================
           RECENT SUPPLIERS
        ========================================= */

        .supplier-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 13px 0;
            border-bottom: 1px solid #edf0f4;
        }

            .supplier-row:last-child {
                border-bottom: none;
            }


        .supplier-name {
            font-size: 14px;
            font-weight: bold;
            color: #14213d;
        }

       /* =========================================
   SUPPLIER DATE
========================================= */

.supplier-date {
    color: #14213d;
    font-size: 11px;
    font-weight: bold;
    white-space: nowrap;
}


/* =========================================
   SUPPLIER INFORMATION
========================================= */

.supplier-company {
    font-size: 12px;
    color: #888;
    margin-top: 5px;
    line-height: 1.5;
}


        /* =========================================
           RESPONSIVE
        ========================================= */

        @media (max-width: 900px) {

    .summary-container {
        flex-wrap: wrap;
        justify-content: center;
    }

    .summary-card {
        width: 280px;
    }
}

        @media (max-width: 1100px) {

            .summary-container {
                grid-template-columns: repeat(2, 1fr);
            }
        }


        @media (max-width: 850px) {

            .quick-actions {
                grid-template-columns: 1fr;
            }

            .supplier-overview {
                grid-template-columns: 1fr;
            }
        }


        @media (max-width: 600px) {

            .dashboard-header {
                flex-direction: column;
                gap: 15px;
            }

            .summary-container {
                grid-template-columns: 1fr;
            }

            .date-box {
                width: 100%;
            }
        }
    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">


    <div class="supplier-dashboard">


        <!-- =========================================
             HEADER
        ========================================= -->

        <div class="dashboard-header">

            <div>

                <h1>Supplier Dashboard</h1>

                <p>
                    Manage and monitor your supplier information
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
        ========================================= -->

        <div class="summary-container">

            <!-- TOTAL SUPPLIERS -->
            <div class="summary-card total-supplier">

                <div class="summary-icon">
                    🚚
                </div>

                <div class="summary-title">
                    Total Suppliers
                </div>

                <div class="summary-value">
                    <asp:Label ID="lblTotalSuppliers"
                        runat="server"
                        Text="0">
                    </asp:Label>
                </div>

            </div>


            <!-- TOTAL CATEGORIES -->
            <div class="summary-card active-supplier">

                <div class="summary-icon">
                    ◈
                </div>

                <div class="summary-title">
                    Total Categories
                </div>

                <div class="summary-value">
                    <asp:Label ID="lblTotalCategories"
                        runat="server"
                        Text="0">
                    </asp:Label>
                </div>

            </div>


            <!-- NEW SUPPLIERS -->
            <div class="summary-card new-supplier">

                <div class="summary-icon">
                    🆕
                </div>

                <div class="summary-title">
                    New Suppliers
                </div>

                <div class="summary-value">
                    <asp:Label ID="lblNewSuppliers"
                        runat="server"
                        Text="0">
                    </asp:Label>
                </div>

            </div>

        </div>


        <!-- =========================================
             QUICK ACTIONS
        ========================================= -->

        <div class="section-heading">

            <h2>Quick Actions</h2>

            <span></span>

        </div>


        <div class="quick-actions">


            <a href="Supplier_AddNew.aspx"
                class="quick-action-card">

                <div class="quick-action-icon">
                    ➕
                </div>

                <div class="quick-action-content">

                    <h3>New Supplier</h3>

                    <p>
                        Add a new supplier
                    </p>

                </div>

            </a>


            <a href="Supplier_Search.aspx"
                class="quick-action-card">

                <div class="quick-action-icon">
                    🔍
                </div>

                <div class="quick-action-content">

                    <h3>Search Supplier</h3>

                    <p>
                        Find supplier information
                    </p>

                </div>

            </a>


            <a href="AllSupplier.aspx"
                class="quick-action-card">

                <div class="quick-action-icon">
                    📋
                </div>

                <div class="quick-action-content">

                    <h3>All Suppliers</h3>

                    <p>
                        View all supplier records
                    </p>

                </div>

            </a>


        </div>


        <!-- =========================================
             SUPPLIER OVERVIEW
        ========================================= -->

        <div class="section-heading">

    <h2>Supplier Overview</h2>

    <span></span>

</div>


<div class="supplier-overview">


    <!-- SUPPLIER CATEGORIES -->

    
  

<div class="overview-card">

    <h3>Supplier Categories</h3>

    <asp:Repeater ID="rptSupplierCategories"
        runat="server">

        <ItemTemplate>

            <div class="status-row">

                <span>
                    <%# Eval("sup_category") %>
                </span>

                <span class="status-value">
                    <%# Eval("SupplierCount") %> Suppliers
                </span>

            </div>

        </ItemTemplate>

    </asp:Repeater>

</div>


            <!-- RECENT SUPPLIERS -->

            <div class="overview-card">

    <h3>Recently Added Suppliers</h3>

    <asp:Repeater ID="rptRecentSuppliers"
        runat="server">

        <ItemTemplate>

            <div class="supplier-row">

                <div>

                    <div class="supplier-name">
                        <%# Eval("sup_name") %>
                    </div>

                    <div class="supplier-company">
                        <%# Eval("sup_category") %> Supplier
                        → <%# Eval("products") %>
                    </div>

                </div>

                <span class="supplier-date">
                    <%# Eval("sup_registerdate", "{0:dd-MM-yyyy}") %>
                </span>

            </div>

        </ItemTemplate>

    </asp:Repeater>

</div>


        </div>


    </div>

</asp:Content>
