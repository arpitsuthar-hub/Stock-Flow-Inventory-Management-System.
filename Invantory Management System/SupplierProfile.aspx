<%@ Page Title="" Language="C#" MasterPageFile="~/Supplier.Master" AutoEventWireup="true" CodeBehind="SupplierProfile.aspx.cs" Inherits="Invantory_Management_System.SupplierProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        /* ==========================================================================
           Internal Styles for Supplier Profile Page
           ========================================================================== */

        /* Main Container */
        .profile-container {
            max-width: 650px;
            margin: 30px auto;
            padding: 0 20px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        /* Page Header */
        .page-header {
            margin-bottom: 24px;
            text-align: center;
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

        /* Profile Card */
        .profile-card {
            background: #ffffff;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 4px 18px rgba(0, 0, 0, 0.08);
            border: 1px solid #eef2f5;
        }

        /* Avatar Header Section */
        .profile-avatar-section {
            text-align: center;
            padding-bottom: 24px;
            margin-bottom: 20px;
            border-bottom: 1px solid #eef2f5;
        }

        .profile-image-wrapper {
            width: 120px;
            height: 120px;
            margin: 0 auto 15px auto;
            border-radius: 50%;
            overflow: hidden;
            border: 3px solid #2c5364;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            background-color: #f8f9fa;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .profile-image-wrapper img {
            width: 100% !important;
            height: 100% !important;
            object-fit: cover;
        }

        /* Section Titles */
        .form-section-title {
            font-size: 12px;
            font-weight: 700;
            color: #2c5364;
            text-transform: uppercase;
            letter-spacing: 0.75px;
            margin: 20px 0 12px 0;
            padding-bottom: 4px;
            border-bottom: 2px solid #eef2f5;
        }

        .form-section-title:first-child {
            margin-top: 0;
        }

        /* Data Details Grid */
        .details-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 16px 24px;
        }

        .detail-item {
            display: flex;
            flex-direction: column;
        }

        .detail-item.full-width {
            grid-column: span 2;
        }

        .detail-item .detail-label {
            font-size: 12px;
            font-weight: 600;
            color: #7f8c8d;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-bottom: 4px;
        }

        .detail-item .detail-value {
            font-size: 15px;
            font-weight: 600;
            color: #2c3e50;
            background-color: #f8f9fa;
            padding: 10px 14px;
            border-radius: 6px;
            border: 1px solid #eef2f5;
            min-height: 20px;
            word-break: break-word;
        }

        /* Mobile Responsive View */
        @media (max-width: 600px) {
            .details-grid {
                grid-template-columns: 1fr;
            }

            .detail-item.full-width {
                grid-column: span 1;
            }

            .profile-card {
                padding: 20px 15px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="profile-container">

        <!-- Page Header -->
        <div class="page-header">
            <h2>Supplier Profile</h2>
            <p>Overview of supplier account details and credentials.</p>
        </div>

        <!-- Profile Card -->
        <div class="profile-card">
            
            <!-- Avatar / Item Image Section -->
            <div class="profile-avatar-section">
                <div class="profile-image-wrapper">
                    <asp:Image ID="Image1" runat="server" />
                </div>
            </div>

            <!-- General Information Section -->
            <div class="form-section-title">Personal Information</div>
            <div class="details-grid">
                
                <div class="detail-item">
                    <span class="detail-label">Supplier ID</span>
                    <span class="detail-value"><asp:Label ID="Label1" runat="server"></asp:Label></span>
                </div>

                <div class="detail-item">
                    <span class="detail-label">Supplier Name</span>
                    <span class="detail-value"><asp:Label ID="Label2" runat="server"></asp:Label></span>
                </div>

                <div class="detail-item">
                    <span class="detail-label">Age</span>
                    <span class="detail-value"><asp:Label ID="Label3" runat="server"></asp:Label></span>
                </div>

                <div class="detail-item">
                    <span class="detail-label">Gender</span>
                    <span class="detail-value"><asp:Label ID="Label4" runat="server"></asp:Label></span>
                </div>

            </div>

            <!-- Contact Details Section -->
            <div class="form-section-title">Contact Information</div>
            <div class="details-grid">
                
                <div class="detail-item">
                    <span class="detail-label">Contact Number</span>
                    <span class="detail-value"><asp:Label ID="Label5" runat="server"></asp:Label></span>
                </div>

                <div class="detail-item">
                    <span class="detail-label">Email Address</span>
                    <span class="detail-value"><asp:Label ID="Label6" runat="server"></asp:Label></span>
                </div>

                <div class="detail-item full-width">
                    <span class="detail-label">Address</span>
                    <span class="detail-value"><asp:Label ID="Label7" runat="server"></asp:Label></span>
                </div>

            </div>

            <!-- Account Credentials Section -->
            <div class="form-section-title">Account Credentials</div>
            <div class="details-grid">
                
                <div class="detail-item">
                    <span class="detail-label">Account ID</span>
                    <span class="detail-value"><asp:Label ID="Label8" runat="server"></asp:Label></span>
                </div>

                <div class="detail-item">
                    <span class="detail-label">Password</span>
                    <span class="detail-value"><asp:Label ID="Label9" runat="server"></asp:Label></span>
                </div>

            </div>

        </div>

    </div>
</asp:Content>
