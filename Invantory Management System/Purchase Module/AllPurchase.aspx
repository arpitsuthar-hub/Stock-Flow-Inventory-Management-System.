<%@ Page Title="All Purchases"
    Language="C#"
    MasterPageFile="~/Purchase Module/Purchase_Module.Master"
    AutoEventWireup="true"
    CodeBehind="AllPurchase.aspx.cs"
    Inherits="Inventory_Management_System.AllPurchase" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style>
        /* =========================================
           PAGE
        ========================================= */

        .purchase-page {
            width: 100%;
            padding-bottom: 30px;
        }


        /* =========================================
           HEADER
        ========================================= */

        .page-header {
            margin-bottom: 25px;
        }

            .page-header h1 {
                font-size: 28px;
                color: #14213d;
                margin-bottom: 6px;
            }

            .page-header p {
                color: #777;
                font-size: 14px;
            }


        /* =========================================
           SUMMARY
        ========================================= */

        .summary-container {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 18px;
            margin-bottom: 25px;
        }

        .summary-card {
            background: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.06);
            border-left: 4px solid #1769e0;
        }

            .summary-card:nth-child(2) {
                border-left-color: #16a05d;
            }

            .summary-card:nth-child(3) {
                border-left-color: #f39c12;
            }

        .summary-title {
            color: #777;
            font-size: 13px;
            margin-bottom: 8px;
        }

        .summary-value {
            font-size: 26px;
            font-weight: bold;
            color: #1769e0;
        }

        .summary-card:nth-child(2) .summary-value {
            color: #16a05d;
        }

        .summary-card:nth-child(3) .summary-value {
            color: #f39c12;
        }


        /* =========================================
           TABLE CONTAINER
        ========================================= */

        .table-container {
            background: white;
            padding: 25px;
            border-radius: 14px;
            box-shadow: 0 4px 18px rgba(0,0,0,0.07);
            overflow-x: auto;
        }


        /* =========================================
           TABLE HEADER
        ========================================= */

        .table-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 1px solid #e5e8ed;
        }

            .table-header h2 {
                font-size: 19px;
                color: #14213d;
            }

        .purchase-badge {
            background: #e4efff;
            color: #1769e0;
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: bold;
        }


        /* =========================================
           GRIDVIEW
        ========================================= */

        .purchase-grid {
            width: 100%;
            min-width: 950px;
            border-collapse: collapse;
            border: none;
        }


            /* HEADER */

            .purchase-grid th {
                background: #1769e0;
                color: white;
                font-size: 12px;
                text-transform: uppercase;
                letter-spacing: 0.4px;
                padding: 14px 12px;
                border: none;
                white-space: nowrap;
            }


            /* ROW */

            .purchase-grid td {
                padding: 14px 12px;
                font-size: 13px;
                color: #333;
                border-bottom: 1px solid #edf0f3;
                background: white;
                white-space: nowrap;
            }


            /* ALTERNATING ROW */

            .purchase-grid tr:nth-child(even) td {
                background: #f8faff;
            }


            /* HOVER */

            .purchase-grid tr:hover td {
                background: #eef5ff;
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

        .supplier-name {
            font-weight: bold;
            color: #14213d;
        }


        /* =========================================
           PRODUCT
        ========================================= */

        .product-name {
            font-weight: 600;
            color: #333;
        }


        /* =========================================
           QUANTITY
        ========================================= */

        .quantity {
            font-weight: bold;
            color: #7048d8;
        }


        /* =========================================
           PRICE
        ========================================= */

        .price {
            font-weight: bold;
            color: #555;
        }


        /* =========================================
           TOTAL
        ========================================= */

        .total-amount {
            font-weight: bold;
            color: #16a05d;
        }


        /* =========================================
           FOOTER
        ========================================= */

        .table-footer {
            display: flex;
            justify-content: space-between;
            margin-top: 18px;
            padding-top: 15px;
            border-top: 1px solid #edf0f3;
            color: #777;
            font-size: 12px;
        }


        /* =========================================
           RESPONSIVE
        ========================================= */

        @media (max-width: 800px) {

            .summary-container {
                grid-template-columns: 1fr;
            }

            .table-container {
                padding: 18px;
            }
        }

        /* =========================================
   ALL PRODUCTS BUTTON
========================================= */

        .all-products-btn {
            display: inline-block;
            background: #1769e0;
            color: white !important;
            padding: 7px 12px;
            border-radius: 6px;
            text-decoration: none;
            font-size: 12px;
            font-weight: bold;
            transition: 0.2s;
        }

            .all-products-btn:hover {
                background: #1255b5;
                text-decoration: none;
            }
    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="purchase-page">


        <!-- =========================================
             PAGE HEADER
        ========================================== -->

        <div class="page-header">

            <h1>All Purchases</h1>

            <p>
                View all purchase transactions recorded in the inventory
            </p>

        </div>


        <!-- =========================================
             SUMMARY
        ========================================== -->

        <div class="summary-container">


            <div class="summary-card">

                <div class="summary-title">
                    Total Purchases
                </div>

                <div class="summary-value">
                    128
                </div>

            </div>


            <div class="summary-card">

                <div class="summary-title">
                    Total Items Purchased
                </div>

                <div class="summary-value">
                    2,450
                </div>

            </div>


            <div class="summary-card">

                <div class="summary-title">
                    Total Purchase Amount
                </div>

                <div class="summary-value">
                    ₹18,45,000
                </div>

            </div>


        </div>


        <!-- =========================================
             PURCHASE TABLE
        ========================================== -->

        <div class="table-container">


            <div class="table-header">

                <h2>Purchase Records
                </h2>

                <span class="purchase-badge">Purchase History
                </span>

            </div>


            <asp:GridView
                ID="GridView1"
                runat="server"
                CssClass="purchase-grid"
                AutoGenerateColumns="false"
                GridLines="None"
                OnRowCommand="GridView1_RowCommand">

                <Columns>

                    <asp:BoundField
                        DataField="purchaseid"
                        HeaderText="Purchase ID" />

                    <asp:TemplateField HeaderText="Supplier">
                        <ItemTemplate>
                            <span class="supplier-name">
                                <%# Eval("supplierid") %>
                                -
                                <%# Eval("sup_name") %>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField
                        DataField="category"
                        HeaderText="Category" />

                    <asp:BoundField
                        DataField="purchasedate"
                        HeaderText="Purchase Date"
                        DataFormatString="{0:dd-MM-yyyy}" />

                    <asp:BoundField
                        DataField="totalgross"
                        HeaderText="Gross Amount"
                        DataFormatString="₹{0:N2}" />

                    <asp:BoundField
                        DataField="totaldiscount"
                        HeaderText="Discount"
                        DataFormatString="₹{0:N2}" />

                    <asp:BoundField
                        DataField="totalnet"
                        HeaderText="Net Amount"
                        DataFormatString="₹{0:N2}" />

                    <asp:TemplateField HeaderText="Products">

                        <ItemTemplate>
                            <asp:LinkButton
                                ID="btnAllProducts"
                                runat="server"
                                Text="All Products"
                                CommandName="AllProducts"
                                CommandArgument='<%# Eval("purchaseid") %>'
                                CssClass="all-products-btn">
                            </asp:LinkButton>

                        </ItemTemplate>

                    </asp:TemplateField>

                </Columns>

            </asp:GridView>


            <!-- =====================================
                 FOOTER
            ====================================== -->

            <div class="table-footer">

                <span>Purchase transactions
                </span>

                <span>Inventory Purchase Records
                </span>

            </div>


        </div>


    </div>

</asp:Content>
