<%@ Page Title="" Language="C#" MasterPageFile="~/I-M-S.Master" AutoEventWireup="true" CodeBehind="AllCustomer.aspx.cs" Inherits="Invantory_Management_System.AllCustomer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        /* ==========================================================================
           Internal Styles for All Customers Table Page
           ========================================================================== */

        /* Main Container */
        .table-page-container {
            max-width: 950px;
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

        /* Action Buttons Styling */
        .action-cell {
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        .btn-action {
            display: inline-block;
            padding: 6px 14px;
            font-size: 12px;
            font-weight: 600;
            border-radius: 5px;
            text-decoration: none;
            transition: all 0.2s ease-in-out;
            cursor: pointer;
            border: none;
        }

        /* "More" Button Styling */
        .btn-more {
            background-color: #e8f4fd;
            color: #2980b9;
        }

        .btn-more:hover {
            background-color: #2980b9;
            color: #ffffff;
            box-shadow: 0 2px 6px rgba(41, 128, 185, 0.3);
        }

        /* "Delete" Button Styling */
        .btn-delete {
            background-color: #fdeded;
            color: #e74c3c;
        }

        .btn-delete:hover {
            background-color: #e74c3c;
            color: #ffffff;
            box-shadow: 0 2px 6px rgba(231, 76, 60, 0.3);
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

            .action-cell {
                flex-direction: column;
                gap: 6px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="table-page-container">
        
        <!-- Page Header -->
        <div class="page-header">
            <h2>Details of All Customers</h2>
            <p>View, manage, and inspect registered customer profiles.</p>
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
                    <asp:TemplateField HeaderText="Customer ID">
                        <ItemTemplate>
                            <strong><%# Eval("cid") %></strong>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Customer Name">
                        <ItemTemplate>
                            <%# Eval("cname") %>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Customer Age">
                        <ItemTemplate>
                            <%# Eval("age") %>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <div class="action-cell">
                                <asp:LinkButton ID="LinkButton1" runat="server" 
                                    Text="More" 
                                    OnCommand="more" 
                                    CommandName='<%# Eval("cid") %>' 
                                    CssClass="btn-action btn-more">
                                </asp:LinkButton>
                                
                                <asp:LinkButton ID="LinkButton2" runat="server" 
                                    Text="Delete" 
                                    OnCommand="Link" 
                                    CommandName='<%# Eval("cid") %>' 
                                    OnClientClick="return confirm('Are you sure you want to delete this customer?');" 
                                    CssClass="btn-action btn-delete">
                                </asp:LinkButton>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

                <PagerStyle CssClass="grid-pager" HorizontalAlign="Center" />
            </asp:GridView>
        </div>

    </div>
</asp:Content>
