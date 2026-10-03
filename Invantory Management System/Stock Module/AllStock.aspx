<%@ Page Title="" Language="C#" MasterPageFile="~/Stock Module/Stock_Module.Master" AutoEventWireup="true" CodeBehind="AllStock.aspx.cs" Inherits="Inventory_Management_System.AllStock" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style type="text/css">
        /* ==========================================================================
           Internal Styles for All Available Stock Page
           ========================================================================== */

        /* Main Container */
        .stock-container {
            max-width: 700px;
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
            font-size: 14px;
            color: #2c3e50;
            border: none;
        }

        /* Grid Header */
        .custom-grid th {
            background: linear-gradient(135deg, #2c5364 0%, #203a43 100%);
            color: #ffffff;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 12px;
            letter-spacing: 0.5px;
            padding: 14px 16px;
            text-align: center;
            border: none;
        }

        .custom-grid th:first-child {
            border-top-left-radius: 6px;
        }

        .custom-grid th:last-child {
            border-top-right-radius: 6px;
        }

        /* Grid Rows */
        .custom-grid td {
            padding: 14px 16px;
            border-bottom: 1px solid #eef2f5;
            text-align: center;
            vertical-align: middle;
        }

        .custom-grid tr:last-child td {
            border-bottom: none;
        }

        /* Row Hover Effect */
        .custom-grid tr:hover td {
            background-color: #f8f9fa;
        }

        /* Alternate Row Background */
        .custom-grid .grid-alt-row td {
            background-color: #fafbfc;
        }

        .custom-grid .grid-alt-row:hover td {
            background-color: #f8f9fa;
        }

        /* Stock Quantity Styling */
        .qty-badge {
            display: inline-block;
            padding: 4px 12px;
            background-color: #e8f4fd;
            color: #2980b9;
            font-weight: 700;
            border-radius: 12px;
            font-size: 13px;
        }

        /* Grid View Pager Footer */
        .grid-pager td {
            padding: 12px !important;
            background-color: #ffffff !important;
        }

        /* Mobile Responsive View */
        @media (max-width: 600px) {
            .table-card {
                padding: 15px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="stock-container">
        
        <!-- Page Header -->
        <div class="page-header">
            <h2>All Available Stock</h2>
            <p>Real-time overview of current inventory items and available quantities.</p>
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
                    <asp:TemplateField HeaderText="Item Name">
                        <ItemTemplate>
                            <strong><%# Eval("item") %></strong>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate>
                            <span class="qty-badge"><%# Eval("quantity") %></span>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

                <PagerStyle CssClass="grid-pager" HorizontalAlign="Center" />
            </asp:GridView>
        </div>

    </div>
</asp:Content>
