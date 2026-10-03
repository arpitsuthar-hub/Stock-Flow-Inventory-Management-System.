<%@ Page Title="Customer Dashboard"
    Language="C#"
    MasterPageFile="~/Customer_Module/Customer_Module.Master"
    AutoEventWireup="true"
    CodeBehind="Customer_Dashboard.aspx.cs"
    Inherits="Inventory_Management_System.Customer_Dashboard" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style>
        /* =========================================
           DASHBOARD
        ========================================= */

        .dashboard {
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
           SUMMARY CARDS
        ========================================= */

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
   CUSTOMER CARD COLORS
========================================= */

        .total-customer {
            border-color: #7048d8;
        }

            .total-customer .summary-icon {
                background: #eee7ff;
                color: #7048d8;
            }


        .regular-customer {
            border-color: #16a05d;
        }

            .regular-customer .summary-icon {
                background: #e3f7ec;
                color: #16a05d;
            }


        .new-customer {
            border-color: #1769e0;
        }

            .new-customer .summary-icon {
                background: #e4efff;
                color: #1769e0;
            }



        /* =========================================
           CARD COLORS
        ========================================= */

        .total-customers {
            border-top: 4px solid #7048d8;
        }

            .total-customers .summary-icon {
                background: #eee7ff;
                color: #7048d8;
            }

        .active-customers {
            border-top: 4px solid #16a05d;
        }

            .active-customers .summary-icon {
                background: #e3f7ec;
                color: #16a05d;
            }

        .new-customers {
            border-top: 4px solid #1769e0;
        }

            .new-customers .summary-icon {
                background: #e4efff;
                color: #1769e0;
            }

        .inactive-customers {
            border-top: 4px solid #e53935;
        }

            .inactive-customers .summary-icon {
                background: #ffe5e5;
                color: #e53935;
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

        .action-text h3 {
            color: #14213d;
            font-size: 16px;
            margin-bottom: 5px;
        }

        .action-text p {
            color: #777;
            font-size: 12px;
        }


        /* ACTION COLORS */

        .new-customer-icon {
            background: #eee7ff;
            color: #7048d8;
        }

        .search-customer-icon {
            background: #e4efff;
            color: #1769e0;
        }

        .all-customer-icon {
            background: #e3f7ec;
            color: #16a05d;
        }


        /* =========================================
           BOTTOM SECTION
        ========================================= */

        .bottom-container {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

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
           CUSTOMER INFO
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
           CATEGORY
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
            background: #eee7ff;
            color: #7048d8;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: bold;
        }

        /* =========================================
   RECENT CUSTOMERS
========================================= */

.recent-customer-row {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 13px 0;
    border-bottom: 1px solid #edf0f4;
}

.recent-customer-row:last-child {
    border-bottom: none;
}

.recent-customer-info {
    display: flex;
    flex-direction: column;
    gap: 4px;
}

.recent-customer-name {
    font-size: 14px;
    font-weight: bold;
    color: #14213d;
}

.recent-customer-contact {
    font-size: 12px;
    color: #888;
}

.recent-customer-date {
    font-size: 12px;
    color: #1769e0;
    font-weight: bold;
}


/* =========================================
   CUSTOMER STATUS
========================================= */

.customer-status-row {
    display: flex;
    justify-content: space-between;
    padding: 13px 0;
    border-bottom: 1px solid #edf0f4;
    font-size: 14px;
}

.customer-status-row:last-child {
    border-bottom: none;
}

.customer-status-label {
    color: #777;
}

.customer-status-value {
    font-weight: bold;
    color: #14213d;
}

        /* =========================================
           RESPONSIVE
        ========================================= */

        @media (max-width: 1100px) {

            .summary-container {
                grid-template-columns: repeat(2, 1fr);
            }

            .quick-actions {
                grid-template-columns: repeat(2, 1fr);
            }
        }


        @media (max-width: 700px) {

            .dashboard-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }

            .summary-container {
                grid-template-columns: 1fr;
            }

            .quick-actions {
                grid-template-columns: 1fr;
            }

            .bottom-container {
                grid-template-columns: 1fr;
            }

            .dashboard-header h1 {
                font-size: 24px;
            }
        }
    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="dashboard">


        <!-- =========================================
             HEADER
        ========================================== -->

        <div class="dashboard-header">

            <div>

                <h1>Customer Dashboard</h1>

                <p>
                    Manage and monitor your customers
                </p>

            </div>

            <div class="date-box">
                📅 <%= DateTime.Now.ToString("dd MMM yyyy") %>

                <br />

                🕐 <%= DateTime.Now.ToString("hh:mm tt") %>
            </div>

        </div>


        <!-- =========================================
             SUMMARY
        ========================================== -->



        <div class="summary-container">


            <!-- TOTAL CUSTOMERS -->

            <div class="summary-card total-customer">

                <div class="summary-icon">
                    👥
                </div>

                <div class="summary-title">
                    Total Customers
                </div>

                <div class="summary-value">

                    <asp:Label ID="lblTotalCustomers"
                        runat="server"
                        Text="0">
                    </asp:Label>

                </div>

            </div>


            <!-- REGULAR CUSTOMERS -->

            <div class="summary-card regular-customer">

                <div class="summary-icon">
                    ⭐
                </div>

                <div class="summary-title">
                    Regular Customers
                </div>

                <div class="summary-value">

                    <asp:Label ID="lblRegularCustomers"
                        runat="server"
                        Text="0">
                    </asp:Label>

                </div>

            </div>


            <!-- NEW CUSTOMERS -->

            <div class="summary-card new-customer">

                <div class="summary-icon">
                    🆕
                </div>

                <div class="summary-title">
                    New Customers
                </div>

                <div class="summary-value">

                    <asp:Label ID="lblNewCustomers"
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


            <!-- NEW CUSTOMER -->

            <a href="Customer_AddNew.aspx"
                class="action-card">

                <div class="action-icon new-customer-icon">
                    ➕
                </div>

                <div class="action-text">

                    <h3>New Customer</h3>

                    <p>
                        Register a new customer
                    </p>

                </div>

            </a>


            <!-- SEARCH -->

            <a href="Customer_Search.aspx"
                class="action-card">

                <div class="action-icon search-customer-icon">
                    🔍
                </div>

                <div class="action-text">

                    <h3>Search Customer</h3>

                    <p>
                        Find customer records
                    </p>

                </div>

            </a>


            <!-- ALL CUSTOMERS -->

            <a href="AllCustomer.aspx"
                class="action-card">

                <div class="action-icon all-customer-icon">
                    📋
                </div>

                <div class="action-text">

                    <h3>All Customers</h3>

                    <p>
                        View all registered customers
                    </p>

                </div>

            </a>


        </div>


        <!-- =========================================
             BOTTOM INFORMATION
        ========================================== -->

        <div class="section-title">

            <h2>Customer Overview</h2>

            <span></span>

        </div>


        <div class="bottom-container">


            <!-- =========================================
     RECENTLY ADDED CUSTOMERS
========================================== -->

<div class="dashboard-box">

    <h3>Recently Added Customers</h3>

    <asp:Repeater ID="rptRecentCustomers" runat="server">

        <ItemTemplate>

            <div class="recent-customer-row">

                <div class="recent-customer-info">

                    <div class="recent-customer-name">
                        <%# Eval("cust_name") %>
                    </div>

                    <div class="recent-customer-contact">
                        <%# Eval("cust_contact") %>
                    </div>

                </div>

                <div class="recent-customer-date">
                    <%# Eval("cust_registerdate", "{0:dd-MM-yyyy}") %>
                </div>

            </div>

        </ItemTemplate>

    </asp:Repeater>

</div>


            <!-- =========================================
     CUSTOMER STATUS
========================================== -->

<div class="dashboard-box">

    <h3>Customer Status</h3>


    <div class="customer-status-row">

        <span class="customer-status-label">
            Total Customers
        </span>

        <asp:Label ID="lblStatusTotalCustomers"
            runat="server"
            CssClass="customer-status-value"
            Text="0">
        </asp:Label>

    </div>


    <div class="customer-status-row">

        <span class="customer-status-label">
            Added This Month
        </span>

        <asp:Label ID="lblCustomersThisMonth"
            runat="server"
            CssClass="customer-status-value"
            Text="0">
        </asp:Label>

    </div>


    <div class="customer-status-row">

        <span class="customer-status-label">
            Added Today
        </span>

        <asp:Label ID="lblCustomersToday"
            runat="server"
            CssClass="customer-status-value"
            Text="0">
        </asp:Label>

    </div>


    <div class="customer-status-row">

        <span class="customer-status-label">
            Latest Customer
        </span>

        <asp:Label ID="lblLatestCustomer"
            runat="server"
            CssClass="customer-status-value"
            Text="-">
        </asp:Label>

    </div>

</div>

        </div>


    </div>

</asp:Content>
