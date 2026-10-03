<%@ Page Title="All Bills"
    Language="C#"
    MasterPageFile="~/Sell-Bill_Module/Sell-Bill_Module.Master"
    AutoEventWireup="true"
    CodeBehind="AllBills.aspx.cs"
    Inherits="Inventory_Management_System.Sell_Bill_Module.AllBills" %>


<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style>

        /* =========================================
           ALL BILLS PAGE
        ========================================= */

        .all-bills-page {
            width: 100%;
        }


        /* =========================================
           PAGE HEADER
        ========================================= */

        .bills-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }

        .bills-header-left h2 {
            color: #14213d;
            font-size: 27px;
            margin-bottom: 6px;
        }

        .bills-header-left p {
            color: #718096;
            font-size: 13px;
        }


        /* =========================================
           HEADER BADGE
        ========================================= */

        .bill-count {
            padding: 8px 14px;
            border-radius: 20px;
            background: #fff0ef;
            color: #e53935;
            font-size: 12px;
            font-weight: bold;
        }


        /* =========================================
           FILTER CARD
        ========================================= */

        .bill-filter-card {
            background: white;
            border: 1px solid #e5e9f2;
            border-radius: 12px;
            padding: 20px 22px;
            margin-bottom: 22px;
            box-shadow: 0 4px 15px rgba(20, 33, 61, 0.05);
        }


        .filter-form {
            display: grid;
            grid-template-columns: 1fr 1fr 1fr auto;
            gap: 15px;
            align-items: end;
        }


        /* =========================================
           FILTER GROUP
        ========================================= */

        .filter-group {
            display: flex;
            flex-direction: column;
        }

        .filter-group label {
            color: #344054;
            font-size: 11px;
            font-weight: bold;
            margin-bottom: 7px;
        }


        /* =========================================
           INPUT
        ========================================= */

        .filter-input {
            width: 100%;
            height: 40px;
            padding: 0 11px;

            border: 1px solid #d9dee8;
            border-radius: 7px;

            background: white;
            color: #14213d;

            font-size: 12px;
            outline: none;
            box-sizing: border-box;
        }

        .filter-input:focus {
            border-color: #e53935;
            box-shadow: 0 0 0 3px rgba(229, 57, 53, 0.08);
        }


        /* =========================================
           SEARCH BUTTON
        ========================================= */

        .filter-button {
            height: 40px;
            padding: 0 18px;

            border: none;
            border-radius: 7px;

            background: #e53935;
            color: white;

            font-size: 12px;
            font-weight: bold;

            cursor: pointer;
            transition: 0.2s ease;
        }

        .filter-button:hover {
            background: #c62828;
            transform: translateY(-1px);
        }


        /* =========================================
           BILL TABLE CARD
        ========================================= */

        .bills-table-card {
            background: white;
            border: 1px solid #e5e9f2;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(20, 33, 61, 0.05);
            overflow: hidden;
        }


        /* =========================================
           TABLE HEADER
        ========================================= */

        .table-card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;

            padding: 20px 22px;

            border-bottom: 1px solid #e8ebf0;
        }

        .table-card-title {
            color: #14213d;
            font-size: 16px;
            font-weight: bold;
        }

        .table-card-subtitle {
            color: #98a2b3;
            font-size: 11px;
            margin-top: 4px;
        }


        /* =========================================
           TABLE WRAPPER
        ========================================= */

        .bills-table-wrapper {
            width: 100%;
            overflow-x: auto;
        }


        /* =========================================
           GRIDVIEW TABLE
        ========================================= */

        .bills-table {
            width: 100%;
            min-width: 800px;
            border-collapse: collapse;
        }

        .bills-table th {
            padding: 13px 15px;

            background: #f7f8fb;

            color: #667085;

            font-size: 10px;
            font-weight: bold;

            text-align: left;

            text-transform: uppercase;
            letter-spacing: 0.5px;

            border-bottom: 1px solid #e5e9f2;
        }

        .bills-table td {
            padding: 14px 15px;

            color: #344054;

            font-size: 12px;

            border-bottom: 1px solid #edf0f5;
        }

        .bills-table tr:hover {
            background: #fafbfc;
        }


        /* =========================================
           INVOICE NUMBER
        ========================================= */

        .invoice-number {
            color: #e53935;
            font-weight: bold;
        }


        /* =========================================
           CUSTOMER
        ========================================= */

        .customer-name {
            color: #14213d;
            font-weight: 600;
        }


        /* =========================================
           AMOUNT
        ========================================= */

        .bill-amount {
            color: #14213d;
            font-weight: bold;
        }


        /* =========================================
           VIEW BUTTON
        ========================================= */

        .view-bill-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;

            padding: 7px 13px;

            background: white;

            border: 1px solid #d9dee8;
            border-radius: 6px;

            color: #344054;

            text-decoration: none;

            font-size: 11px;
            font-weight: bold;

            cursor: pointer;
            transition: 0.2s ease;
        }

        .view-bill-btn:hover {
            background: #fff0ef;
            border-color: #e53935;
            color: #e53935;
        }


        /* =========================================
           PRINT BUTTON
        ========================================= */

        .print-bill-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;

            margin-left: 5px;

            padding: 7px 10px;

            background: #14213d;
            color: white;

            border: none;
            border-radius: 6px;

            text-decoration: none;

            font-size: 11px;
            font-weight: bold;

            cursor: pointer;
            transition: 0.2s ease;
        }

        .print-bill-btn:hover {
            background: #203a43;
        }


        /* =========================================
           EMPTY RESULT
        ========================================= */

        .empty-bills {
            text-align: center;
            padding: 55px 20px;
        }

        .empty-icon {
            font-size: 38px;
            margin-bottom: 12px;
        }

        .empty-bills h3 {
            color: #475467;
            font-size: 16px;
            margin-bottom: 6px;
        }

        .empty-bills p {
            color: #98a2b3;
            font-size: 12px;
        }


        /* =========================================
           MOBILE
        ========================================= */

        @media (max-width: 850px) {

            .filter-form {
                grid-template-columns: 1fr 1fr;
            }

        }


        @media (max-width: 600px) {

            .bills-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 12px;
            }

            .bills-header-left h2 {
                font-size: 23px;
            }

            .filter-form {
                grid-template-columns: 1fr;
            }

            .bill-filter-card {
                padding: 17px;
            }

            .table-card-header {
                padding: 17px;
            }

        }

    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="all-bills-page">


        <!-- =========================================
             PAGE HEADER
        ========================================== -->

        <div class="bills-header">

            <div class="bills-header-left">

                <h2>
                    All Bills
                </h2>

                <p>
                    View and manage all generated sales invoices.
                </p>

            </div>


            <div class="bill-count">

                <asp:Label
                    ID="lblBillCount"
                    runat="server"
                    Text="0 Bills">
                </asp:Label>

            </div>

        </div>


        <!-- =========================================
             FILTER CARD
        ========================================== -->

        <div class="bill-filter-card">

            <div class="filter-form">


                <!-- =====================================
                     INVOICE ID
                ====================================== -->

                <div class="filter-group">

                    <label>
                        Invoice / Bill ID
                    </label>

                    <asp:TextBox
                        ID="txtBillID"
                        runat="server"
                        CssClass="filter-input"
                        placeholder="Enter invoice ID">
                    </asp:TextBox>

                </div>


                <!-- =====================================
                     CUSTOMER
                ====================================== -->

                <div class="filter-group">

                    <label>
                        Customer Name
                    </label>

                    <asp:TextBox
                        ID="txtCustomer"
                        runat="server"
                        CssClass="filter-input"
                        placeholder="Enter customer name">
                    </asp:TextBox>

                </div>


                <!-- =====================================
                     DATE
                ====================================== -->

                <div class="filter-group">

                    <label>
                        Bill Date
                    </label>

                    <asp:TextBox
                        ID="txtDate"
                        runat="server"
                        TextMode="Date"
                        CssClass="filter-input">
                    </asp:TextBox>

                </div>


                <!-- =====================================
                     SEARCH
                ====================================== -->

                <asp:Button
                    ID="btnSearch"
                    runat="server"
                    Text="🔍 Search"
                    CssClass="filter-button"
                    OnClick="btnSearch_Click" />

            </div>

        </div>


        <!-- =========================================
             BILLS TABLE CARD
        ========================================== -->

        <div class="bills-table-card">


            <!-- =====================================
                 TABLE HEADER
            ====================================== -->

            <div class="table-card-header">

                <div>

                    <div class="table-card-title">
                        Invoice History
                    </div>

                    <div class="table-card-subtitle">
                        Recently generated sales bills
                    </div>

                </div>

            </div>


            <!-- =====================================
                 TABLE
            ====================================== -->

            <div class="bills-table-wrapper">

                <asp:GridView
                    ID="GridView1"
                    runat="server"
                    AutoGenerateColumns="False"
                    CssClass="bills-table"
                    GridLines="None"
                    OnRowCommand="GridView1_RowCommand">

                    <Columns>


                        

                        <asp:BoundField
                            DataField="invoice_id"
                            HeaderText="Invoice ID" />


                       
                        <asp:BoundField
                            DataField="cust_name"
                            HeaderText="Customer" />


                        

                        <asp:BoundField
                            DataField="sale_date"
                            HeaderText="Bill Date"
                            DataFormatString="{0:dd MMM yyyy}" />


                        

                        <asp:BoundField
                            DataField="item_count"
                            HeaderText="Items" />


                        

                        <asp:BoundField
                            DataField="totalnet"
                            HeaderText="Total Amount"
                            DataFormatString="₹ {0:N2}" />


                       

                        <asp:TemplateField
                            HeaderText="Action">

                            <ItemTemplate>

                                <asp:LinkButton
                                    ID="btnView"
                                    runat="server"
                                    Text="👁 View"
                                    CssClass="view-bill-btn"
                                    CommandName="ViewInvoice"
                                    CommandArgument='<%# Eval("invoice_id") %>'>
                                </asp:LinkButton>


                                <asp:LinkButton
                                    ID="btnPrint"
                                    runat="server"
                                    Text="🖨"
                                    CssClass="print-bill-btn"
                                    CommandName="PrintInvoice"
                                    CommandArgument='<%# Eval("invoice_id") %>'>
                                </asp:LinkButton>

                            </ItemTemplate>

                        </asp:TemplateField>


                    </Columns>


                    

                    <EmptyDataTemplate>

                        <div class="empty-bills">

                            <div class="empty-icon">
                                🧾
                            </div>

                            <h3>
                                No bills found
                            </h3>

                            <p>
                                No sales invoices match your search criteria.
                            </p>

                        </div>

                    </EmptyDataTemplate>

                </asp:GridView>

            </div>


        </div>


    </div>

</asp:Content>