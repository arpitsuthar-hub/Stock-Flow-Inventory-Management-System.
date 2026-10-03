<%@ Page Title="Stock Out"
    Language="C#"
    MasterPageFile="~/Stock Module/Stock_Module.Master"
    AutoEventWireup="true"
    CodeBehind="Stock_Out.aspx.cs"
    Inherits="Inventory_Management_System.Stock_Module.Stock_Out" %>


<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style>

        /* =========================================
           STOCK OUT PAGE
        ========================================= */

        .stock-out-page {
            width: 100%;
            padding: 30px;
            font-family: Arial, Helvetica, sans-serif;
            color: #14213d;
        }


        /* =========================================
           HEADER
        ========================================= */

        .stock-out-header {
            margin-bottom: 25px;
        }

        .stock-out-header h1 {
            margin: 0 0 6px;
            font-size: 28px;
        }

        .stock-out-header p {
            margin: 0;
            color: #718096;
            font-size: 14px;
        }


        /* =========================================
           SUMMARY CARDS
        ========================================= */

        .summary-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 18px;
            margin-bottom: 25px;
        }

        .summary-card {
            background: #ffffff;
            border: 1px solid #e5e7eb;
            border-radius: 12px;
            padding: 20px;
        }

        .summary-card span {
            display: block;
            margin-bottom: 8px;
            color: #718096;
            font-size: 12px;
        }

        .summary-card strong {
            font-size: 25px;
            color: #14213d;
        }


        /* =========================================
           FILTER CARD
        ========================================= */

        .filter-card {
            background: #ffffff;
            border: 1px solid #e5e7eb;
            border-radius: 12px;
            padding: 20px;
            margin-bottom: 20px;
        }

        .filter-grid {
            display: grid;
            grid-template-columns: 1fr 1fr 1fr auto;
            gap: 15px;
            align-items: end;
        }

        .filter-group {
            display: flex;
            flex-direction: column;
        }

        .filter-group label {
            margin-bottom: 7px;
            font-size: 13px;
            font-weight: 600;
            color: #334155;
        }

        .form-control {
            width: 100%;
            height: 42px;
            padding: 0 12px;
            border: 1px solid #d1d5db;
            border-radius: 8px;
            outline: none;
            font-size: 13px;
            color: #334155;
            background: #ffffff;
            box-sizing: border-box;
        }

        .form-control:focus {
            border-color: #14213d;
        }


        /* =========================================
           SEARCH BUTTON
        ========================================= */

        .btn-search {
            height: 42px;
            padding: 0 20px;
            border: none;
            border-radius: 8px;
            background: #14213d;
            color: #ffffff;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
        }

        .btn-search:hover {
            opacity: 0.9;
        }


        /* =========================================
           TABLE CARD
        ========================================= */

        .table-card {
            background: #ffffff;
            border: 1px solid #e5e7eb;
            border-radius: 12px;
            padding: 20px;
            overflow-x: auto;
        }

        .table-heading {
            margin-bottom: 18px;
        }

        .table-heading h2 {
            margin: 0 0 5px;
            font-size: 19px;
        }

        .table-heading p {
            margin: 0;
            color: #718096;
            font-size: 13px;
        }


        /* =========================================
           GRIDVIEW
        ========================================= */

        .stock-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 13px;
        }

        .stock-table th {
            background: #f8fafc;
            color: #475569;
            font-weight: 600;
            padding: 13px 12px;
            text-align: left;
            border-bottom: 1px solid #e5e7eb;
            white-space: nowrap;
        }

        .stock-table td {
            padding: 13px 12px;
            border-bottom: 1px solid #f1f5f9;
            color: #334155;
            white-space: nowrap;
        }

        .stock-table tr:hover td {
            background: #fafafa;
        }


        /* =========================================
           EMPTY MESSAGE
        ========================================= */

        .empty-message {
            text-align: center;
            padding: 30px;
            color: #718096;
            font-size: 13px;
        }


        /* =========================================
           RESPONSIVE
        ========================================= */

        @media (max-width: 1000px) {

            .filter-grid {
                grid-template-columns: 1fr 1fr;
            }

        }


        @media (max-width: 700px) {

            .stock-out-page {
                padding: 20px;
            }

            .summary-grid {
                grid-template-columns: 1fr;
            }

            .filter-grid {
                grid-template-columns: 1fr;
            }

            .table-card {
                padding: 15px;
            }

        }

    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">


    <div class="stock-out-page">


        <!-- =====================================
             HEADER
        ====================================== -->

        <div class="stock-out-header">

            <h1>Stock Out</h1>

            <p>
                View products and quantities removed from inventory through sales.
            </p>

        </div>


        <!-- =====================================
             SUMMARY
        ====================================== -->

        <div class="summary-grid">


            <!-- Total Transactions -->

            <div class="summary-card">

                <span>Stock Out Transactions</span>

                <strong>

                    <asp:Label ID="lblTotalStockOut"
                        runat="server"
                        Text="0">
                    </asp:Label>

                </strong>

            </div>


            <!-- Total Quantity -->

            <div class="summary-card">

                <span>Total Quantity Out</span>

                <strong>

                    <asp:Label ID="lblTotalQuantity"
                        runat="server"
                        Text="0">
                    </asp:Label>

                </strong>

            </div>


            <!-- Total Customers -->

            <div class="summary-card">

                <span>Customers</span>

                <strong>

                    <asp:Label ID="lblTotalCustomers"
                        runat="server"
                        Text="0">
                    </asp:Label>

                </strong>

            </div>

        </div>


        <!-- =====================================
             FILTER
        ====================================== -->

        <div class="filter-card">

            <div class="filter-grid">


                <!-- Product Search -->

                <div class="filter-group">

                    <label>Product</label>

                    <asp:TextBox ID="txtProduct"
                        runat="server"
                        CssClass="form-control"
                        placeholder="Product ID or Name">
                    </asp:TextBox>

                </div>


                <!-- Customer Search -->

                <div class="filter-group">

                    <label>Customer</label>

                    <asp:TextBox ID="txtCustomer"
                        runat="server"
                        CssClass="form-control"
                        placeholder="Customer ID or Name">
                    </asp:TextBox>

                </div>


                <!-- Date -->

                <div class="filter-group">

                    <label>Stock Out Date</label>

                    <asp:TextBox ID="txtStockOutDate"
                        runat="server"
                        TextMode="Date"
                        CssClass="form-control">
                    </asp:TextBox>

                </div>


                <!-- Search -->

                <asp:Button ID="btnSearch"
                    runat="server"
                    Text="Search"
                    CssClass="btn-search"
                     />

            </div>

        </div>


        <!-- =====================================
             STOCK OUT TABLE
        ====================================== -->

        <div class="table-card">


            <div class="table-heading">

                <h2>Stock Out History</h2>

                <p>
                    Products that have been removed from inventory through sales.
                </p>

            </div>


            <asp:GridView ID="gvStockOut"
                runat="server"
                AutoGenerateColumns="False"
                CssClass="stock-table"
                GridLines="None"
                EmptyDataText="No stock out records found."
                EmptyDataRowStyle-CssClass="empty-message">


                <Columns>


                    

                    <asp:BoundField
                        DataField="stockoutdate"
                        HeaderText="Date"
                        DataFormatString="{0:dd-MM-yyyy}" />


                   

                    <asp:BoundField
                        DataField="billno"
                        HeaderText="Bill No." />



                    <asp:BoundField
                        DataField="pro_id"
                        HeaderText="Product ID" />


                    

                    <asp:BoundField
                        DataField="pro_name"
                        HeaderText="Product Name" />



                    <asp:BoundField
                        DataField="pro_category"
                        HeaderText="Category" />



                    <asp:BoundField
                        DataField="customerid"
                        HeaderText="Customer ID" />



                    <asp:BoundField
                        DataField="customername"
                        HeaderText="Customer" />



                    <asp:BoundField
                        DataField="quantity"
                        HeaderText="Quantity" />


                    

                    <asp:BoundField
                        DataField="sellingprice"
                        HeaderText="Selling Price"
                        DataFormatString="₹ {0:N2}" />


                </Columns>

            </asp:GridView>


        </div>


        <!-- =====================================
             INFORMATION
        ====================================== -->

        <div class="filter-card"
             style="margin-top:22px;">

            <strong style="display:block;
                           margin-bottom:5px;
                           font-size:13px;">

                Stock Out Information

            </strong>

            <p style="margin:0;
                      color:#718096;
                      font-size:12px;
                      line-height:1.6;">

                Stock Out is generated automatically when products are sold.
                The sold quantity is deducted from the current inventory and
                the product status is updated according to the remaining stock.

            </p>

        </div>


    </div>

</asp:Content>