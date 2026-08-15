<%@ Page Title="" Language="C#" MasterPageFile="~/I-M-S.Master" AutoEventWireup="true" CodeBehind="AllBill.aspx.cs" Inherits="Invantory_Management_System.AllBill" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   


    <style>
.bill-container {
    max-width: 1200px;
    margin: 30px auto;
    padding: 0 20px;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

/* Page Title & Subtitle */
.page-header {
    margin-bottom: 25px;
}

.page-title {
    font-size: 24px;
    font-weight: 700;
    color: #1a252f;
    margin-bottom: 6px;
}

.page-subtitle {
    font-size: 14px;
    color: #7f8c8d;
}

/* Two-Column Layout for Sell & Purchase Cards */
.tables-flex-wrapper {
    display: flex;
    gap: 24px;
    margin-bottom: 30px;
}

.grid-card {
    flex: 1;
    background: #ffffff;
    border-radius: 10px;
    box-shadow: 0 4px 18px rgba(0, 0, 0, 0.06);
    border: 1px solid #eef2f5;
    overflow: hidden;
    display: flex;
    flex-direction: column;
}

/* Card Header Styling */
.card-header {
    padding: 16px 20px;
    border-bottom: 1px solid #eef2f5;
}

.sell-header {
    background-color: #f4fbf7;
    border-left: 4px solid #27ae60;
}

.purchase-header {
    background-color: #fcf8f8;
    border-left: 4px solid #e74c3c;
}

.section-title {
    font-size: 16px;
    font-weight: 700;
    color: #2c3e50;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

/* Table Wrapper for Horizontal Scroll Support */
.table-wrapper {
    overflow-x: auto;
    padding: 10px;
}

/* Base Custom Grid View Styling */
.custom-grid {
    width: 100%;
    border-collapse: collapse;
    font-size: 14px;
    color: #333333;
    border: none;
}

.custom-grid th {
    background-color: #f8f9fa;
    color: #555555;
    font-weight: 600;
    font-size: 12px;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    padding: 12px 14px;
    border-bottom: 2px solid #eef2f5;
}

.custom-grid td {
    padding: 12px 14px;
    border-bottom: 1px solid #eef2f5;
    vertical-align: middle;
}

.custom-grid tr:last-child td {
    border-bottom: none;
}

.custom-grid tr:hover td {
    background-color: #fcfcfc;
}

/* Summary Card Section */
.summary-card {
    background: #ffffff;
    border-radius: 10px;
    padding: 24px;
    box-shadow: 0 4px 18px rgba(0, 0, 0, 0.06);
    border: 1px solid #eef2f5;
    border-top: 4px solid #2c5364;
}

.summary-card-header {
    margin-bottom: 15px;
}

.summary-text {
    font-size: 13px;
    color: #7f8c8d;
    margin-top: 4px;
}

.summary-grid th {
    background: linear-gradient(135deg, #2c5364 0%, #203a43 100%);
    color: #ffffff;
}

/* Alignments & Text Helpers */
.text-center {
    text-align: center;
}

.text-right {
    text-align: right;
}

.text-success {
    color: #27ae60;
    font-weight: 600;
}

.text-danger {
    color: #c0392b;
    font-weight: 600;
}

/* Responsive View (Stacked Grid for Mobile Screen sizes) */
@media (max-width: 850px) {
    .tables-flex-wrapper {
        flex-direction: column;
    }
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="bill-container">

        <!-- Header Section -->
        <div class="page-header">
            <h2 class="page-title">Transaction & Ledger Details</h2>
            <p class="page-subtitle">Overview of current sales records, purchase orders, and daily financial summaries.</p>
        </div>

        <!-- Side-by-Side Sales & Purchase Grids Container -->
        <div class="tables-flex-wrapper">

            <!-- Sell Details Card -->
            <div class="grid-card sell-card">
                <div class="card-header sell-header">
                    <h3 class="section-title">Sell Details</h3>
                </div>
                <div class="table-wrapper">
                    <asp:GridView ID="GridView1" runat="server"
                        AutoGenerateColumns="false"
                        CssClass="custom-grid"
                        GridLines="None">
                        <Columns>
                            <asp:BoundField DataField="datesell" HeaderText="Date" DataFormatString="{0:dd-MMM-yyyy}" />
                            <asp:BoundField DataField="cname" HeaderText="Item Name" />
                            <asp:BoundField DataField="cqty" HeaderText="Quantity" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" />
                            <asp:BoundField DataField="netamount" HeaderText="Net Amount (₹)" ItemStyle-CssClass="text-right" HeaderStyle-CssClass="text-right" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

            <!-- Purchase Details Card -->
            <div class="grid-card purchase-card">
                <div class="card-header purchase-header">
                    <h3 class="section-title">Purchase Details</h3>
                </div>
                <div class="table-wrapper">
                    <asp:GridView ID="GridView2" runat="server"
                        AutoGenerateColumns="false"
                        CssClass="custom-grid"
                        GridLines="None">
                        <Columns>
                            <asp:BoundField DataField="datepur" HeaderText="Date" DataFormatString="{0:dd-MMM-yyyy}" />
                            <asp:BoundField DataField="iname" HeaderText="Item Name" />
                            <asp:BoundField DataField="iqty" HeaderText="Quantity" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" />
                            <asp:BoundField DataField="netamount" HeaderText="Net Amount (₹)" ItemStyle-CssClass="text-right" HeaderStyle-CssClass="text-right" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

        </div>

        <!-- Summary Report Card -->
        <div class="summary-card">
            <div class="summary-card-header">
                <div>
                    <h3 class="section-title">Summary Report</h3>
                    <p class="summary-text">Daily consolidated summary of total sales and total purchases.</p>
                </div>
            </div>
            
            <div class="table-wrapper">
                <asp:GridView ID="GridView3" runat="server"
                    AutoGenerateColumns="False"
                    CssClass="custom-grid summary-grid"
                    GridLines="None">
                    <Columns>
                        <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:dd-MMM-yyyy}" />
                        <asp:BoundField DataField="Total Sell" HeaderText="Total Sell (₹)" ItemStyle-CssClass="text-right text-success" HeaderStyle-CssClass="text-right" />
                        <asp:BoundField DataField="Total Purchase" HeaderText="Total Purchase (₹)" ItemStyle-CssClass="text-right text-danger" HeaderStyle-CssClass="text-right" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>

    </div>
</asp:Content>
