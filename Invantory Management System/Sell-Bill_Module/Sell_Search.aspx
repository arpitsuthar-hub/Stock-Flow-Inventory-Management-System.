<%@ Page Title="Search Sell"
    Language="C#"
    MasterPageFile="~/Sell-Bill_Module/Sell-Bill_Module.Master"
    AutoEventWireup="true"
    CodeBehind="Sell_Search.aspx.cs"
    Inherits="Inventory_Management_System.Sell_Bill_Module.Sell_Search" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style>

        .sell-search-page {
            width: 100%;
        }

        .search-header {
            margin-bottom: 25px;
        }

        .search-header h2 {
            font-size: 27px;
            color: #14213d;
            margin-bottom: 6px;
        }

        .search-header p {
            color: #718096;
            font-size: 14px;
        }

        .search-card {
            background: white;
            border: 1px solid #e5e9f2;
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 4px 15px rgba(20, 33, 61, 0.06);
            margin-bottom: 25px;
        }

        .search-card-title {
            display: flex;
            align-items: center;
            gap: 10px;
            color: #14213d;
            font-size: 17px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .search-card-icon {
            width: 38px;
            height: 38px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #fff0ef;
            border-radius: 8px;
            font-size: 19px;
        }

        .search-form {
            display: grid;
            grid-template-columns: 1fr 1fr 1fr;
            gap: 18px;
            align-items: end;
        }

        .search-group {
            display: flex;
            flex-direction: column;
        }

        .search-group label {
            color: #344054;
            font-size: 12px;
            font-weight: bold;
            margin-bottom: 7px;
        }

        .search-input {
            width: 100%;
            height: 43px;
            padding: 0 12px;
            border: 1px solid #d9dee8;
            border-radius: 7px;
            background: #ffffff;
            color: #14213d;
            font-size: 13px;
            outline: none;
        }

        .search-input:focus {
            border-color: #e53935;
        }

        .search-buttons {
            grid-column: 1 / -1;
            display: flex;
            justify-content: flex-end;
            gap: 10px;
            padding-top: 5px;
        }

        .btn-search {
            height: 42px;
            padding: 0 22px;
            border: none;
            border-radius: 7px;
            background: #e53935;
            color: white;
            font-size: 13px;
            font-weight: bold;
            cursor: pointer;
        }

        .btn-search:hover {
            background: #c62828;
        }

        .btn-clear {
            height: 42px;
            padding: 0 22px;
            border: 1px solid #d9dee8;
            border-radius: 7px;
            background: #ffffff;
            color: #596579;
            font-size: 13px;
            font-weight: bold;
            cursor: pointer;
        }

        .result-card {
            background: white;
            border: 1px solid #e5e9f2;
            border-radius: 12px;
            padding: 22px;
            box-shadow: 0 4px 15px rgba(20, 33, 61, 0.05);
        }

        .result-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 18px;
        }

        .result-title {
            color: #14213d;
            font-size: 17px;
            font-weight: bold;
        }

        .result-count {
            padding: 5px 10px;
            border-radius: 20px;
            background: #f1f3f7;
            color: #667085;
            font-size: 11px;
            font-weight: bold;
        }

        .sell-table-wrapper {
            width: 100%;
            overflow-x: auto;
        }

        .sell-table {
            width: 100%;
            border-collapse: collapse;
            min-width: 850px;
        }

        .sell-table th {
            background: #f7f8fb;
            color: #667085;
            text-align: left;
            padding: 13px 14px;
            font-size: 11px;
            font-weight: bold;
            border-bottom: 1px solid #e5e9f2;
        }

        .sell-table td {
            padding: 14px;
            color: #344054;
            font-size: 12px;
            border-bottom: 1px solid #edf0f5;
        }

        .sell-table tr:hover {
            background: #fafbfc;
        }

        .sell-id {
            color: #e53935;
            font-weight: bold;
        }

        .customer-name {
            color: #14213d;
            font-weight: 600;
        }

        .sell-amount {
            color: #14213d;
            font-weight: bold;
        }

        .view-btn {
            display: inline-block;
            padding: 7px 12px;
            border: 1px solid #dce1e9;
            border-radius: 6px;
            color: #344054;
            background: white;
            text-decoration: none;
            font-size: 11px;
            font-weight: bold;
        }

        .view-btn:hover {
            background: #f5f7fb;
            border-color: #e53935;
            color: #e53935;
        }

        .no-result {
            text-align: center;
            padding: 40px;
            color: #98a2b3;
        }

        @media (max-width: 950px) {

            .search-form {
                grid-template-columns: 1fr 1fr;
            }

        }

        @media (max-width: 650px) {

            .search-form {
                grid-template-columns: 1fr;
            }

            .search-buttons {
                grid-column: auto;
            }

            .btn-search,
            .btn-clear {
                flex: 1;
            }

        }

    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="sell-search-page">

        <div class="search-header">

            <h2>Search Sell</h2>

            <p>
                Search and view previous sales and customer transactions.
            </p>

        </div>


        <div class="search-card">

            <div class="search-card-title">

                <div class="search-card-icon">
                    🔍
                </div>

                Search Sales

            </div>


            <div class="search-form">

                <div class="search-group">

                    <label>Sell / Invoice ID</label>

                    <asp:TextBox
                        ID="txtSellID"
                        runat="server"
                        CssClass="search-input"
                        placeholder="Enter invoice ID">
                    </asp:TextBox>

                </div>


                <div class="search-group">

                    <label>Customer Name</label>

                    <asp:TextBox
                        ID="txtCustomer"
                        runat="server"
                        CssClass="search-input"
                        placeholder="Enter customer name">
                    </asp:TextBox>

                </div>


                <div class="search-group">

                    <label>Sell Date</label>

                    <asp:TextBox
                        ID="txtSellDate"
                        runat="server"
                        CssClass="search-input"
                        TextMode="Date">
                    </asp:TextBox>

                </div>


                <div class="search-buttons">

                    <asp:Button
                        ID="btnClear"
                        runat="server"
                        Text="Clear"
                        CssClass="btn-clear" OnClick="btnClear_Click1"
                         />

                    <asp:Button
                        ID="btnSearch"
                        runat="server"
                        Text="🔍 Search"
                        CssClass="btn-search" OnClick="btnSearch_Click1"
                         />

                </div>

            </div>

        </div>


        <div class="result-card">

            <div class="result-header">

                <div class="result-title">
                    Search Results
                </div>

                <div class="result-count">

                    <asp:Label
                        ID="lblResultCount"
                        runat="server"
                        Text="0 Results">
                    </asp:Label>

                </div>

            </div>


            <div class="sell-table-wrapper">

                <asp:GridView
                    ID="GridView1"
                    runat="server"
                    AutoGenerateColumns="False"
                    CssClass="sell-table"
                    GridLines="None"
                    OnRowCommand="GridView1_RowCommand">

                    <Columns>

                        <asp:BoundField
                            DataField="invoice_id"
                            HeaderText="Sell ID" />

                        <asp:BoundField
                            DataField="cust_name"
                            HeaderText="Customer" />

                        <asp:BoundField
                            DataField="sale_date"
                            HeaderText="Date"
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
                                    Text="View"
                                    CssClass="view-btn"
                                    CommandName="ViewInvoice"
                                    CommandArgument='<%# Eval("invoice_id") %>'>
                                </asp:LinkButton>

                            </ItemTemplate>

                        </asp:TemplateField>

                    </Columns>

                    <EmptyDataTemplate>

                        <div class="no-result">

                            <h3>No sales found</h3>

                            <p>
                                No sale matches the selected search criteria.
                            </p>

                        </div>

                    </EmptyDataTemplate>

                </asp:GridView>

            </div>

        </div>

    </div>

</asp:Content>