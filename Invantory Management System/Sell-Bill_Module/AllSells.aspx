
<%@ Page Title="All Sales"
    Language="C#"
    MasterPageFile="~/Sell-Bill_Module/Sell-Bill_Module.Master"
    AutoEventWireup="true"
    CodeBehind="AllSells.aspx.cs"
    Inherits="Inventory_Management_System.AllSells" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style type="text/css">

        * {
            box-sizing: border-box;
        }

        .sales-container {
            width: 100%;
            max-width: 1250px;
            margin: 30px auto;
            padding: 0 20px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        /* ================= PAGE HEADER ================= */

        .page-header {
            margin-bottom: 22px;
        }

        .page-header h1 {
            margin: 0 0 6px 0;
            font-size: 26px;
            font-weight: 700;
            color: #1a252f;
        }

        .page-header p {
            margin: 0;
            font-size: 14px;
            color: #7f8c8d;
        }

        /* ================= SEARCH CARD ================= */

        .search-card {
            background: #ffffff;
            border: 1px solid #e5e9ed;
            border-radius: 10px;
            padding: 22px;
            margin-bottom: 20px;
            box-shadow: 0 5px 22px rgba(0, 0, 0, 0.06);
        }

        .search-title {
            font-size: 13px;
            font-weight: 800;
            color: #2c5364;
            text-transform: uppercase;
            letter-spacing: 0.7px;
            margin-bottom: 16px;
        }

        .search-grid {
            display: grid;
            grid-template-columns: 1.5fr 1.2fr 1fr auto auto;
            gap: 12px;
            align-items: end;
        }

        .search-group {
            display: flex;
            flex-direction: column;
        }

        .search-group label {
            font-size: 12px;
            font-weight: 700;
            color: #475569;
            margin-bottom: 6px;
        }

        .search-control {
            width: 100%;
            height: 40px;
            padding: 8px 11px;
            border: 1px solid #d8e0e7;
            border-radius: 6px;
            background: #f8fafc;
            color: #334155;
            font-size: 13px;
            outline: none;
        }

        .search-control:focus {
            background: #ffffff;
            border-color: #2c5364;
        }

        .btn-search {
            height: 40px;
            padding: 0 20px;
            background: #2c5364;
            color: #ffffff;
            border: none;
            border-radius: 6px;
            font-size: 13px;
            font-weight: 700;
            cursor: pointer;
        }

        .btn-search:hover {
            background: #203a43;
        }

        .btn-clear {
            height: 40px;
            padding: 0 20px;
            background: #eef2f5;
            color: #2c5364;
            border: 1px solid #d8e0e7;
            border-radius: 6px;
            font-size: 13px;
            font-weight: 700;
            cursor: pointer;
        }

        .btn-clear:hover {
            background: #e3e9ee;
        }

        /* ================= SALES CARD ================= */

        .sales-card {
            background: #ffffff;
            border: 1px solid #e5e9ed;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 5px 22px rgba(0, 0, 0, 0.07);
            overflow-x: auto;
        }

        /* ================= GRIDVIEW ================= */

        .sales-grid {
            width: 100%;
            border-collapse: collapse;
        }

        .sales-grid th {
            background: #2c5364;
            color: #ffffff;
            padding: 13px 10px;
            font-size: 12px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.4px;
            white-space: nowrap;
            border: none;
        }

        .sales-grid td {
            padding: 12px 10px;
            border-bottom: 1px solid #edf0f3;
            color: #334155;
            font-size: 13px;
            white-space: nowrap;
        }

        .sales-grid tr:hover td {
            background: #f8fafc;
        }

        /* ================= VIEW BUTTON ================= */

        .view-btn {
            display: inline-block;
            padding: 7px 13px;
            background: #2c5364;
            color: #ffffff !important;
            text-decoration: none;
            border-radius: 5px;
            font-size: 12px;
            font-weight: 700;
        }

        .view-btn:hover {
            background: #203a43;
        }

        /* ================= MOBILE ================= */

        @media(max-width: 900px) {

            .search-grid {
                grid-template-columns: 1fr 1fr;
            }

        }

        @media(max-width: 600px) {

            .sales-container {
                margin: 20px auto;
                padding: 0 10px;
            }

            .search-grid {
                grid-template-columns: 1fr;
            }

            .btn-search,
            .btn-clear {
                width: 100%;
            }

            .sales-card {
                padding: 10px;
            }

        }

    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="sales-container">

        <!-- ================= PAGE HEADER ================= -->

        <div class="page-header">

            <h1>All Sales</h1>

            <p>
                View, search and manage all sales invoices.
            </p>

        </div>


        <!-- ================= SEARCH ================= -->

        <div class="search-card">

            <div class="search-title">
                Search Sales
            </div>


            <div class="search-grid">

                <!-- PRODUCT NAME -->

                <div class="search-group">

                    <label>
                        Product Name
                    </label>

                    <asp:TextBox
                        ID="txtProductName"
                        runat="server"
                        CssClass="search-control"
                        placeholder="Search product name">
                    </asp:TextBox>

                </div>


                <!-- BRAND -->

                <div class="search-group">

                    <label>
                        Brand
                    </label>

                    <asp:TextBox
                        ID="txtBrand"
                        runat="server"
                        CssClass="search-control"
                        placeholder="Search brand">
                    </asp:TextBox>

                </div>


                <!-- DATE -->

                <div class="search-group">

                    <label>
                        Sale Date
                    </label>

                    <asp:TextBox
                        ID="txtDate"
                        runat="server"
                        CssClass="search-control"
                        TextMode="Date">
                    </asp:TextBox>

                </div>


                <!-- SEARCH BUTTON -->

                <asp:Button
                    ID="btnSearch"
                    runat="server"
                    Text="Search"
                    CssClass="btn-search"
                    CausesValidation="false"
                    OnClick="btnSearch_Click" />


                <!-- CLEAR BUTTON -->

                <asp:Button
                    ID="btnClear"
                    runat="server"
                    Text="Clear"
                    CssClass="btn-clear"
                    CausesValidation="false"
                    OnClick="btnClear_Click" />

            </div>

        </div>


        <!-- ================= SALES TABLE ================= -->

        <div class="sales-card">

            <asp:GridView
                ID="GridView1"
                runat="server"
                CssClass="sales-grid"
                AutoGenerateColumns="False"
                GridLines="None"
                EmptyDataText="No sales records found."
                OnRowCommand="GridView1_RowCommand">

                <Columns>


                    <asp:BoundField
                        DataField="invoice_id"
                        HeaderText="Invoice No" />



                    <asp:BoundField
                        DataField="customer_id"
                        HeaderText="Customer ID" />



                    <asp:BoundField
                        DataField="cust_name"
                        HeaderText="Customer Name" />



                    <asp:BoundField
                        DataField="sale_date"
                        HeaderText="Sale Date"
                        DataFormatString="{0:dd MMM yyyy}" />



                    <asp:BoundField
                        DataField="totalgross"
                        HeaderText="Gross Amount"
                        DataFormatString="₹ {0:N2}" />



                    <asp:BoundField
                        DataField="totaldiscount"
                        HeaderText="Discount"
                        DataFormatString="₹ {0:N2}" />



                    <asp:BoundField
                        DataField="totalnet"
                        HeaderText="Net Amount"
                        DataFormatString="₹ {0:N2}" />



                    <asp:TemplateField
                        HeaderText="Action">

                        <ItemTemplate>

                            <asp:LinkButton
                                ID="btnView"
                                runat="server"
                                Text="View Invoice"
                                CssClass="view-btn"
                                CommandName="ViewInvoice"
                                CommandArgument='<%# Eval("invoice_id") %>'>
                            </asp:LinkButton>

                        </ItemTemplate>

                    </asp:TemplateField>

                </Columns>

            </asp:GridView>

        </div>

    </div>

</asp:Content>
