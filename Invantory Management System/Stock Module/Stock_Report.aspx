<%@ Page Title="Stock Report"
Language="C#"
MasterPageFile="~/Stock Module/Stock_Module.Master"
AutoEventWireup="true"
CodeBehind="Stock_Report.aspx.cs"
Inherits="Inventory_Management_System.Stock_Module.Stock_Report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>

    .stock-report-page {
        width: 100%;
        padding: 30px;
        font-family: Arial, Helvetica, sans-serif;
        color: #14213d;
    }

    .report-header {
        margin-bottom: 25px;
    }

    .report-header h1 {
        margin: 0 0 6px;
        font-size: 28px;
    }

    .report-header p {
        margin: 0;
        color: #718096;
        font-size: 14px;
    }

    .filter-card {
        background: #ffffff;
        border: 1px solid #e5e7eb;
        border-radius: 12px;
        padding: 22px;
        margin-bottom: 22px;
    }

    .filter-header {
        margin-bottom: 18px;
    }

    .filter-header h2 {
        margin: 0 0 5px;
        font-size: 18px;
    }

    .filter-header p {
        margin: 0;
        color: #718096;
        font-size: 12px;
    }

    .filter-grid {
        display: grid;
        grid-template-columns: repeat(3, 1fr) auto;
        gap: 15px;
        align-items: end;
    }

    .filter-group {
        display: flex;
        flex-direction: column;
    }

    .filter-group label {
        margin-bottom: 7px;
        font-size: 12px;
        font-weight: 600;
        color: #475569;
    }

    .filter-control {
        height: 40px;
        width: 100%;
        padding: 0 11px;
        border: 1px solid #d1d5db;
        border-radius: 8px;
        outline: none;
        background: #ffffff;
        color: #334155;
        font-size: 13px;
        box-sizing: border-box;
    }

    .filter-control:focus {
        border-color: #14213d;
    }

    .filter-btn {
        height: 40px;
        padding: 0 20px;
        border: none;
        border-radius: 8px;
        background: #14213d;
        color: #ffffff;
        font-size: 13px;
        font-weight: 600;
        cursor: pointer;
    }

    .filter-btn:hover {
        opacity: 0.9;
    }

    .report-summary {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 18px;
        margin-bottom: 22px;
    }

    .summary-card {
        background: #ffffff;
        border: 1px solid #e5e7eb;
        border-radius: 12px;
        padding: 20px;
    }

    .summary-card span {
        display: block;
        color: #718096;
        font-size: 12px;
        margin-bottom: 8px;
    }

    .summary-card strong {
        font-size: 25px;
        color: #14213d;
    }

    .report-card {
        background: #ffffff;
        border: 1px solid #e5e7eb;
        border-radius: 12px;
        overflow: hidden;
    }

    .report-card-header {
        padding: 20px 22px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        border-bottom: 1px solid #e5e7eb;
    }

    .report-card-header h2 {
        margin: 0 0 5px;
        font-size: 18px;
    }

    .report-card-header p {
        margin: 0;
        color: #718096;
        font-size: 12px;
    }

    .export-btn {
        height: 38px;
        padding: 0 16px;
        border: 1px solid #d1d5db;
        border-radius: 8px;
        background: #ffffff;
        color: #334155;
        font-size: 12px;
        font-weight: 600;
        cursor: pointer;
    }

    .export-btn:hover {
        background: #f8fafc;
    }

    .table-wrapper {
        width: 100%;
        overflow-x: auto;
    }

    .report-table {
        width: 100%;
        min-width: 950px;
        border-collapse: collapse;
    }

    .report-table th {
        padding: 14px 18px;
        background: #f8fafc;
        border-bottom: 1px solid #e5e7eb;
        text-align: left;
        font-size: 11px;
        font-weight: 600;
        color: #64748b;
        text-transform: uppercase;
        white-space: nowrap;
    }

    .report-table td {
        padding: 15px 18px;
        border-bottom: 1px solid #eef0f3;
        font-size: 13px;
        color: #334155;
        white-space: nowrap;
    }

    .report-table tbody tr:hover {
        background: #fafafa;
    }

    .report-table tbody tr:last-child td {
        border-bottom: none;
    }

    .product-name {
        font-weight: 600;
        color: #14213d;
    }

    .product-id {
        display: block;
        margin-top: 3px;
        font-size: 10px;
        color: #94a3b8;
    }

    .transaction {
        display: inline-block;
        padding: 5px 10px;
        border-radius: 20px;
        font-size: 11px;
        font-weight: 600;
    }

    .stock-in {
        background: #ecfdf5;
        color: #047857;
    }

    .stock-out {
        background: #fef2f2;
        color: #b91c1c;
    }

    .status {
        display: inline-block;
        padding: 5px 10px;
        border-radius: 20px;
        background: #f1f5f9;
        color: #475569;
        font-size: 11px;
        font-weight: 600;
    }

    .empty-state {
        text-align: center;
        padding: 55px 20px;
    }

    .empty-icon {
        font-size: 38px;
        margin-bottom: 12px;
    }

    .empty-state h3 {
        margin: 0 0 6px;
        font-size: 17px;
    }

    .empty-state p {
        margin: 0;
        color: #718096;
        font-size: 12px;
    }

    .report-footer {
        display: flex;
        justify-content: flex-end;
        gap: 35px;
        padding: 18px 22px;
        background: #f8fafc;
        border-top: 1px solid #e5e7eb;
    }

    .footer-total {
        text-align: right;
    }

    .footer-total span {
        display: block;
        color: #718096;
        font-size: 11px;
        margin-bottom: 5px;
    }

    .footer-total strong {
        font-size: 17px;
        color: #14213d;
    }

    @media (max-width: 1000px) {

        .report-summary {
            grid-template-columns: repeat(2, 1fr);
        }

        .filter-grid {
            grid-template-columns: repeat(2, 1fr);
        }
    }

    @media (max-width: 650px) {

        .stock-report-page {
            padding: 20px;
        }

        .report-summary {
            grid-template-columns: 1fr;
        }

        .filter-grid {
            grid-template-columns: 1fr;
        }

        .report-card-header {
            align-items: flex-start;
            gap: 15px;
            flex-direction: column;
        }

        .export-btn {
            width: 100%;
        }

        .report-footer {
            flex-direction: column;
            gap: 15px;
        }
    }

</style>
</asp:Content>

<asp:Content ID="Content2"
ContentPlaceHolderID="ContentPlaceHolder1"
runat="server">
<div class="stock-report-page">

    <div class="report-header">

        <h1>Stock Report</h1>

        <p>
            View stock movement and inventory transactions.
        </p>

    </div>


    <!-- FILTER -->

    <div class="filter-card">

        <div class="filter-header">

            <h2>Report Filters</h2>

            <p>
                Select a date range and transaction type to generate a report.
            </p>

        </div>


        <div class="filter-grid">

            <div class="filter-group">

                <label>From Date</label>

                <asp:TextBox ID="txtFromDate"
                    runat="server"
                    TextMode="Date"
                    CssClass="filter-control">
                </asp:TextBox>

            </div>


            <div class="filter-group">

                <label>To Date</label>

                <asp:TextBox ID="txtToDate"
                    runat="server"
                    TextMode="Date"
                    CssClass="filter-control">
                </asp:TextBox>

            </div>


            <div class="filter-group">

                <label>Transaction Type</label>

                <asp:DropDownList ID="ddlTransactionType"
                    runat="server"
                    CssClass="filter-control">

                    <asp:ListItem Text="All Transactions"
                        Value="">
                    </asp:ListItem>

                    <asp:ListItem Text="Stock In"
                        Value="IN">
                    </asp:ListItem>

                    <asp:ListItem Text="Stock Out"
                        Value="OUT">
                    </asp:ListItem>

                </asp:DropDownList>

            </div>


            <asp:Button ID="btnGenerateReport"
                runat="server"
                Text="Generate Report"
                CssClass="filter-btn" OnClick="btnGenerateReport_Click"
                />

        </div>

    </div>


    <!-- SUMMARY -->

    <div class="report-summary">

        <div class="summary-card">

            <span>Total Transactions</span>

            <strong>
                <asp:Label ID="lblTotalTransactions"
                    runat="server"
                    Text="0">
                </asp:Label>
            </strong>

        </div>


        <div class="summary-card">

            <span>Stock In</span>

            <strong>
                <asp:Label ID="lblStockIn"
                    runat="server"
                    Text="0">
                </asp:Label>
            </strong>

        </div>


        <div class="summary-card">

            <span>Stock Out</span>

            <strong>
                <asp:Label ID="lblStockOut"
                    runat="server"
                    Text="0">
                </asp:Label>
            </strong>

        </div>


        <div class="summary-card">

            <span>Current Stock</span>

            <strong>
                <asp:Label ID="lblCurrentStock"
                    runat="server"
                    Text="0">
                </asp:Label>
            </strong>

        </div>

    </div>


    <!-- REPORT -->

    <div class="report-card">

        <div class="report-card-header">

            <div>

                <h2>Transaction Report</h2>

                <p>
                    Detailed record of stock movements.
                </p>

            </div>

        </div>


        <div class="table-wrapper">

            <asp:GridView ID="gvStockReport"
                runat="server"
                AutoGenerateColumns="False"
                CssClass="report-table"
                GridLines="None"
                ShowHeader="True">

                <Columns>

                    <asp:TemplateField HeaderText="Transaction">

                        <ItemTemplate>

                            <span class="transaction stock-in">
                                <%# Eval("TransactionType") %>
                            </span>

                            <span class="transaction-id">
                                <%# Eval("TransactionID") %>
                            </span>

                        </ItemTemplate>

                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Product">

                        <ItemTemplate>

                            <div class="product-name">
                                <%# Eval("ProductName") %>
                            </div>

                            <span class="product-id">
                                <%# Eval("ProductID") %>
                            </span>

                        </ItemTemplate>

                    </asp:TemplateField>


                    <asp:BoundField
                        DataField="Quantity"
                        HeaderText="Quantity" />


                    <asp:BoundField
                        DataField="Price"
                        HeaderText="Price"
                        DataFormatString="₹{0:N2}" />


                    <asp:BoundField
                        DataField="TotalAmount"
                        HeaderText="Total"
                        DataFormatString="₹{0:N2}" />


                    <asp:BoundField
                        DataField="TransactionDate"
                        HeaderText="Date"
                        DataFormatString="{0:dd MMM yyyy}" />


                    <asp:TemplateField HeaderText="Status">

                        <ItemTemplate>

                            <span class="status">
                                Completed
                            </span>

                        </ItemTemplate>

                    </asp:TemplateField>

                </Columns>

            </asp:GridView>

        </div>


        <!-- TOTAL -->

        <div class="report-footer">

            <div class="footer-total">

                <span>Total Quantity</span>

                <strong>
                    <asp:Label ID="lblTotalQuantity"
                        runat="server"
                        Text="0">
                    </asp:Label>
                </strong>

            </div>


            <div class="footer-total">

                <span>Total Amount</span>

                <strong>
                    ₹<asp:Label ID="lblTotalAmount"
                        runat="server"
                        Text="0.00">
                    </asp:Label>
                </strong>

            </div>

        </div>

    </div>

</div>
</asp:Content>
