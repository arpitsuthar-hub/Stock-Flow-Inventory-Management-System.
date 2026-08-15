<%@ Page Title="" Language="C#" MasterPageFile="~/Supplier.Master" AutoEventWireup="true" CodeBehind="Supplier_MySell.aspx.cs" Inherits="Invantory_Management_System.Supplier_MySell" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        /* ==========================================================================
           Internal Styles for Supplier My Sales Page
           ========================================================================== */

        /* Main Container */
        .sales-container {
            max-width: 1100px;
            margin: 30px auto;
            padding: 0 20px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        /* Page Header */
        .page-header {
            margin-bottom: 24px;
        }

        .page-header h2 {
            font-size: 24px;
            font-weight: 700;
            color: #1a252f;
            margin-bottom: 6px;
        }

        .page-header p {
            font-size: 14px;
            color: #7f8c8d;
        }

        /* Table Card Container */
        .table-card {
            background: #ffffff;
            border-radius: 10px;
            padding: 24px;
            box-shadow: 0 4px 18px rgba(0, 0, 0, 0.08);
            border: 1px solid #eef2f5;
            overflow-x: auto;
        }

        /* Custom GridView Styling */
        .custom-grid {
            width: 100%;
            border-collapse: collapse;
            font-size: 13.5px;
            color: #2c3e50;
            border: none;
        }

        /* Grid Header */
        .custom-grid th {
            background: linear-gradient(135deg, #1c5e55 0%, #15524a 100%);
            color: #ffffff;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 12px;
            letter-spacing: 0.5px;
            padding: 14px 12px;
            text-align: center;
            border: none;
            white-space: nowrap;
        }

        .custom-grid th:first-child {
            border-top-left-radius: 6px;
        }

        .custom-grid th:last-child {
            border-top-right-radius: 6px;
        }

        /* Grid Rows */
        .custom-grid td {
            padding: 12px 14px;
            border-bottom: 1px solid #eef2f5;
            text-align: center;
            vertical-align: middle;
            white-space: nowrap;
        }

        .custom-grid tr:last-child td {
            border-bottom: none;
        }

        /* Row Hover Effect */
        .custom-grid tr:hover td {
            background-color: #f1f7f6;
        }

        /* Alternate Row Background */
        .custom-grid .grid-alt-row td {
            background-color: #fafbfc;
        }

        .custom-grid .grid-alt-row:hover td {
            background-color: #f1f7f6;
        }

        /* Highlight Net Amount */
        .net-amount {
            font-weight: 700;
            color: #27ae60;
        }

        /* Grid View Pager Footer */
        .grid-pager td {
            padding: 12px !important;
            background-color: #ffffff !important;
        }

        /* Mobile Responsive View */
        @media (max-width: 768px) {
            .table-card {
                padding: 15px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="sales-container">
        
        <!-- Page Header -->
        <div class="page-header">
            <h2>My Sales History</h2>
            <p>Detailed breakdown of past sales transactions, calculated totals, and order records.</p>
        </div>

        <!-- Table Card Container -->
        <div class="table-card">
            <asp:GridView ID="GridView1" runat="server" 
                AutoGenerateColumns="False" 
                CssClass="custom-grid" 
                GridLines="None"
                BorderStyle="None">
                
                <AlternatingRowStyle CssClass="grid-alt-row" />
                
                <Columns>
                    <asp:TemplateField HeaderText="Supplier ID">
                        <ItemTemplate><%# Eval("sid") %></ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Item Name">
                        <ItemTemplate><strong><%# Eval("iname") %></strong></ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate><%# Eval("iqty") %></ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Price">
                        <ItemTemplate><%# Eval("iprice") %></ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Discount">
                        <ItemTemplate><%# Eval("discount") %></ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Gross Amount">
                        <ItemTemplate><%# Eval("grsamount") %></ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Discount Amount">
                        <ItemTemplate><%# Eval("disamount") %></ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Net Amount">
                        <ItemTemplate><span class="net-amount"><%# Eval("netamount") %></span></ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Purchase Date">
                        <ItemTemplate><%# Eval("datepur") %></ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Item Image">
                        <ItemTemplate><%# Eval("pick") %></ItemTemplate>
                    </asp:TemplateField>
                </Columns>

                <PagerStyle CssClass="grid-pager" HorizontalAlign="Center" />
            </asp:GridView>
        </div>

    </div>
</asp:Content>
