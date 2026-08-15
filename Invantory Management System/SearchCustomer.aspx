<%@ Page Title="" Language="C#" MasterPageFile="~/I-M-S.Master" AutoEventWireup="true" CodeBehind="SearchCustomer.aspx.cs" Inherits="Invantory_Management_System.SearchCustomer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        /* ==========================================================================
           Internal Styles for Search Customer Page
           ========================================================================== */

        /* Main Container */
        .search-page-container {
            max-width: 800px;
            margin: 30px auto;
            padding: 0 20px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        /* Search Header & Input Card */
        .search-card {
            background: #ffffff;
            border-radius: 10px;
            padding: 25px 30px;
            box-shadow: 0 4px 18px rgba(0, 0, 0, 0.08);
            border: 1px solid #eef2f5;
            margin-bottom: 25px;
        }

        .search-card h2 {
            font-size: 22px;
            font-weight: 700;
            color: #1a252f;
            margin-bottom: 6px;
        }

        .search-card p {
            font-size: 14px;
            color: #7f8c8d;
            margin-bottom: 20px;
        }

        .search-bar-group {
            display: flex;
            gap: 12px;
        }

        .search-input {
            flex: 1;
            padding: 12px 16px;
            font-size: 14px;
            color: #2c3e50;
            background-color: #f8f9fa;
            border: 1.5px solid #dcdfe6;
            border-radius: 6px;
            outline: none;
            transition: all 0.2s ease-in-out;
        }

        .search-input:focus {
            background-color: #ffffff;
            border-color: #2c5364;
            box-shadow: 0 0 0 3px rgba(44, 83, 100, 0.12);
        }

        .btn-search {
            padding: 12px 24px;
            background: linear-gradient(135deg, #2c5364 0%, #203a43 100%);
            color: #ffffff;
            border: none;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            box-shadow: 0 4px 10px rgba(44, 83, 100, 0.25);
            transition: all 0.25s ease;
            white-space: nowrap;
        }

        .btn-search:hover {
            background: linear-gradient(135deg, #203a43 0%, #0f2027 100%);
            box-shadow: 0 6px 14px rgba(44, 83, 100, 0.35);
            transform: translateY(-1px);
        }

        /* Profile Results Card */
        .profile-card {
            background: #ffffff;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 4px 18px rgba(0, 0, 0, 0.08);
            border: 1px solid #eef2f5;
        }

        /* Header / Avatar Area */
        .profile-header {
            display: flex;
            align-items: center;
            gap: 20px;
            padding-bottom: 20px;
            border-bottom: 2px solid #eef2f5;
            margin-bottom: 20px;
        }

        .avatar-wrapper {
            width: 90px;
            height: 90px;
            border-radius: 50%;
            overflow: hidden;
            border: 3px solid #eef2f5;
            background-color: #f8f9fa;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        .profile-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .profile-title h3 {
            font-size: 20px;
            font-weight: 700;
            color: #2c3e50;
            margin-bottom: 4px;
        }

        .badge {
            display: inline-block;
            padding: 4px 10px;
            background-color: #eef2f5;
            color: #2c5364;
            font-size: 12px;
            font-weight: 600;
            border-radius: 20px;
        }

        /* Section Titles */
        .info-section-title {
            font-size: 13px;
            font-weight: 600;
            color: #2c5364;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin: 20px 0 12px 0;
        }

        /* Grid for Info Items */
        .info-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 16px 24px;
        }

        .info-item {
            background-color: #f8f9fa;
            padding: 12px 16px;
            border-radius: 6px;
            border: 1px solid #f0f0f0;
            display: flex;
            flex-direction: column;
        }

        .info-item.full-width {
            grid-column: span 2;
        }

        .info-label {
            font-size: 12px;
            font-weight: 600;
            color: #7f8c8d;
            text-transform: uppercase;
            margin-bottom: 4px;
        }

        .info-value {
            font-size: 15px;
            font-weight: 600;
            color: #2c3e50;
            word-break: break-word;
        }

        /* Mobile View Adjustment */
        @media (max-width: 600px) {
            .search-bar-group {
                flex-direction: column;
            }

            .info-grid {
                grid-template-columns: 1fr;
            }

            .info-item.full-width {
                grid-column: span 1;
            }

            .profile-header {
                flex-direction: column;
                text-align: center;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="search-page-container">
        
        <!-- Search Input Card -->
        <div class="search-card">
            <h2>Search Customer Details</h2>
            <p>Enter a Customer ID below to retrieve profile details and account records.</p>
            
            <div class="search-bar-group">
                <asp:TextBox ID="TextBox1" runat="server" CssClass="search-input" placeholder="Enter Customer ID (e.g. CUST-1001)"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="Get Details" OnClick="Button1_Click" CssClass="btn-search" />
            </div>
        </div>

        <!-- Customer Profile Card -->
        <div class="profile-card">
            
            <!-- Header Section with Avatar & Name -->
            <div class="profile-header">
                <div class="avatar-wrapper">
                    <asp:Image ID="Image1" runat="server" CssClass="profile-image" AlternateText="Customer Photo" />
                </div>
                <div class="profile-title">
                    <h3><asp:Label ID="Label2" runat="server" Text="Customer Name"></asp:Label></h3>
                    <span class="badge">Customer ID: <asp:Label ID="Label1" runat="server" Text="N/A"></asp:Label></span>
                </div>
            </div>

            <!-- Basic Info Section -->
            <div class="info-section-title">Personal Information</div>
            <div class="info-grid">
                <div class="info-item">
                    <span class="info-label">Age</span>
                    <span class="info-value"><asp:Label ID="Label3" runat="server" Text="-"></asp:Label></span>
                </div>
                <div class="info-item">
                    <span class="info-label">Gender</span>
                    <span class="info-value"><asp:Label ID="Label4" runat="server" Text="-"></asp:Label></span>
                </div>
            </div>

            <!-- Contact Details Section -->
            <div class="info-section-title">Contact Information</div>
            <div class="info-grid">
                <div class="info-item">
                    <span class="info-label">Contact Number</span>
                    <span class="info-value"><asp:Label ID="Label5" runat="server" Text="-"></asp:Label></span>
                </div>
                <div class="info-item">
                    <span class="info-label">Email Address</span>
                    <span class="info-value"><asp:Label ID="Label6" runat="server" Text="-"></asp:Label></span>
                </div>
                <div class="info-item full-width">
                    <span class="info-label">Address</span>
                    <span class="info-value"><asp:Label ID="Label7" runat="server" Text="-"></asp:Label></span>
                </div>
            </div>

            <!-- Account Credentials Section -->
            <div class="info-section-title">Account Credentials</div>
            <div class="info-grid">
                <div class="info-item">
                    <span class="info-label">User ID</span>
                    <span class="info-value"><asp:Label ID="Label8" runat="server" Text="-"></asp:Label></span>
                </div>
                <div class="info-item">
                    <span class="info-label">Password</span>
                    <span class="info-value"><asp:Label ID="Label9" runat="server" Text="-"></asp:Label></span>
                </div>
            </div>

        </div>

    </div>
</asp:Content>
