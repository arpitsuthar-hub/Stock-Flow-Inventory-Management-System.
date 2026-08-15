<%@ Page Title="" Language="C#" MasterPageFile="~/I-M-S.Master" AutoEventWireup="true" CodeBehind="InHome.aspx.cs" Inherits="Invantory_Management_System.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        /* ==========================================================================
           Internal Styles for Dashboard Home Page
           ========================================================================== */

        /* Main Container */
        .dashboard-container {
            max-width: 1100px;
            margin: 30px auto;
            padding: 0 20px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        /* Hero Welcome Header */
        .dashboard-banner {
            background: linear-gradient(135deg, #2c5364 0%, #203a43 50%, #0f2027 100%);
            color: #ffffff;
            border-radius: 12px;
            padding: 30px 35px;
            margin-bottom: 30px;
            box-shadow: 0 8px 20px rgba(44, 83, 100, 0.15);
        }

        .dashboard-banner h1 {
            font-size: 26px;
            font-weight: 700;
            margin: 0 0 8px 0;
            letter-spacing: 0.5px;
        }

        .dashboard-banner p {
            font-size: 14px;
            color: #cbd5e1;
            margin: 0;
        }

        /* Section Headings */
        .section-title {
            font-size: 14px;
            font-weight: 700;
            color: #1a252f;
            text-transform: uppercase;
            letter-spacing: 0.75px;
            margin-bottom: 16px;
        }

        /* Key Metrics Grid (4 Cards) */
        .metrics-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin-bottom: 35px;
        }

        .metric-card {
            background: #ffffff;
            border-radius: 10px;
            padding: 20px;
            border: 1px solid #eef2f5;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
            display: flex;
            align-items: center;
            gap: 16px;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .metric-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.08);
        }

        .metric-icon {
            width: 50px;
            height: 50px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
        }

        .metric-icon svg {
            width: 24px;
            height: 24px;
        }

        .icon-blue { background-color: #e8f4fd; fill: #2980b9; }
        .icon-green { background-color: #e8f8f0; fill: #27ae60; }
        .icon-orange { background-color: #fef5e7; fill: #e67e22; }
        .icon-purple { background-color: #f4ecf7; fill: #8e44ad; }

        .metric-info .label {
            font-size: 12px;
            color: #7f8c8d;
            font-weight: 600;
            margin-bottom: 4px;
            text-transform: uppercase;
        }

        .metric-info .value {
            font-size: 20px;
            font-weight: 700;
            color: #2c3e50;
        }

        /* Quick Action Shortcuts Grid (3 Cards) */
        .actions-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
        }

        .action-card {
            background: #ffffff;
            border-radius: 10px;
            padding: 24px;
            border: 1px solid #eef2f5;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
            text-decoration: none;
            color: inherit;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            transition: all 0.25s ease;
        }

        .action-card:hover {
            border-color: #2c5364;
            transform: translateY(-2px);
            box-shadow: 0 8px 22px rgba(44, 83, 100, 0.12);
        }

        .action-card h3 {
            font-size: 16px;
            font-weight: 700;
            color: #1a252f;
            margin: 0 0 8px 0;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .action-card p {
            font-size: 13px;
            color: #7f8c8d;
            margin: 0 0 16px 0;
            line-height: 1.5;
        }

        .action-link {
            font-size: 13px;
            font-weight: 700;
            color: #2c5364;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .action-card:hover .action-link {
            color: #2980b9;
        }

        /* Responsive Breakpoints */
        @media (max-width: 992px) {
            .metrics-grid {
                grid-template-columns: repeat(2, 1fr);
            }

            .actions-grid {
                grid-template-columns: repeat(1, 1fr);
            }
        }

        @media (max-width: 576px) {
            .metrics-grid {
                grid-template-columns: 1fr;
            }

            .dashboard-banner {
                padding: 20px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="dashboard-container">

        <!-- Welcome Banner -->
        <div class="dashboard-banner">
            <h1>Inventory Overview Dashboard</h1>
            <p>Welcome back! Here is a summary of your system metrics and quick navigation shortcuts.</p>
        </div>

        <!-- Key Metrics Section -->
        <div class="section-title">System Metrics</div>
        <div class="metrics-grid">
            
            <!-- Metric Card 1 -->
            <div class="metric-card">
                <div class="metric-icon icon-blue">
                    <svg viewBox="0 0 24 24"><path d="M19 13h-6v6h-2v-6H5v-2h6V5h2v6h6v2z"/></svg>
                </div>
                <div class="metric-info">
                    <div class="label">Purchases Today</div>
                    <div class="value">Active</div>
                </div>
            </div>

            <!-- Metric Card 2 -->
            <div class="metric-card">
                <div class="metric-icon icon-green">
                    <svg viewBox="0 0 24 24"><path d="M7 18c-1.1 0-1.99.9-1.99 2S5.9 22 7 22s2-.9 2-2-.9-2-2-2zM1 2v2h2l3.6 7.59-1.35 2.45c-.16.28-.25.61-.25.96 0 1.1.9 2 2 2h12v-2H7.42c-.14 0-.25-.11-.25-.25l.03-.12.9-1.63h7.45c.75 0 1.41-.41 1.75-1.03l3.58-6.49c.08-.14.12-.31.12-.48 0-.55-.45-1-1-1H5.21l-.94-2H1zm16 16c-1.1 0-1.99.9-1.99 2s.89 2 1.99 2 2-.9 2-2-.9-2-2-2z"/></svg>
                </div>
                <div class="metric-info">
                    <div class="label">Sales Activity</div>
                    <div class="value">Active</div>
                </div>
            </div>

            <!-- Metric Card 3 -->
            <div class="metric-card">
                <div class="metric-icon icon-orange">
                    <svg viewBox="0 0 24 24"><path d="M20 13H4c-.55 0-1 .45-1 1v6c0 .55.45 1 1 1h16c.55 0 1-.45 1-1v-6c0-.55-.45-1-1-1zM7 19c-1.1 0-2-.9-2-2s.9-2 2-2 2 .9 2 2-.9 2-2 2zM20 3H4c-.55 0-1 .45-1 1v6c0 .55.45 1 1 1h16c.55 0 1-.45 1-1V4c0-.55-.45-1-1-1zM7 9c-1.1 0-2-.9-2-2s.9-2 2-2 2 .9 2 2-.9 2-2 2z"/></svg>
                </div>
                <div class="metric-info">
                    <div class="label">Stock Status</div>
                    <div class="value">In Stock</div>
                </div>
            </div>

            <!-- Metric Card 4 -->
            <div class="metric-card">
                <div class="metric-icon icon-purple">
                    <svg viewBox="0 0 24 24"><path d="M19 3H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-5 14H7v-2h7v2zm3-4H7v-2h10v2zm0-4H7V7h10v2z"/></svg>
                </div>
                <div class="metric-info">
                    <div class="label">Daily Statements</div>
                    <div class="value">Ready</div>
                </div>
            </div>

        </div>

        <!-- Quick Actions Navigation Section -->
        <div class="section-title">Quick Actions</div>
        <div class="actions-grid">
            
            <a href="Purchase.aspx" class="action-card">
                <div>
                    <h3>Purchase Entry <span>&rarr;</span></h3>
                    <p>Record new inventory items received from suppliers with quantity and discount details.</p>
                </div>
                <span class="action-link">Open Purchase Form</span>
            </a>

            <a href="Sell.aspx" class="action-card">
                <div>
                    <h3>Sales Entry <span>&rarr;</span></h3>
                    <p>Process outgoing sales orders for customers with instant calculation support.</p>
                </div>
                <span class="action-link">Open Sales Form</span>
            </a>

            <a href="AllStock.aspx" class="action-card">
                <div>
                    <h3>Stock Inventory <span>&rarr;</span></h3>
                    <p>View complete up-to-date inventory levels and item availability status.</p>
                </div>
                <span class="action-link">View Stock Report</span>
            </a>

        </div>

    </div>
</asp:Content>