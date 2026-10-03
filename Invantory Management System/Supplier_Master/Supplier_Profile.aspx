<%@ Page Title="My Profile"
    Language="C#"
    MasterPageFile="~/Supplier_Master/Supplier.Master"
    AutoEventWireup="true"
    CodeBehind="Supplier_Profile.aspx.cs"
    Inherits="Inventory_Management_System.SupplierProfile" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <!-- Font Awesome -->
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />

    <style>

        /* =========================================================
           PAGE
        ========================================================= */

        .supplier-profile-page {
            width: 100%;
            min-height: calc(100vh - 70px);
            background: #f5f7f9;
            padding: 30px 20px 50px;
            box-sizing: border-box;
        }


        /* =========================================================
           MAIN LAYOUT
        ========================================================= */

        .supplier-profile-layout {
            width: 100%;
            max-width: 1380px;
            margin: 0 auto;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            gap: 24px;
        }


        /* =========================================================
           SIDE BOXES
        ========================================================= */

        .profile-side-boxes {
            width: 205px;
            flex-shrink: 0;
            margin-top: 88px;
        }

        .profile-side-box {
            background: #ffffff;
            border: 1px solid #e2e7eb;
            border-radius: 10px;
            margin-bottom: 18px;
            overflow: hidden;
            box-shadow: 0 3px 12px rgba(0,0,0,0.05);
        }

        .side-box-title {
            padding: 13px 15px;
            background: #2c5364;
            color: #ffffff;
            font-size: 13px;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 9px;
        }

        .side-box-title i {
            font-size: 13px;
        }

        .side-box-content {
            padding: 15px;
        }

        .side-item {
            display: flex;
            align-items: center;
            gap: 10px;
            color: #59636d;
            font-size: 12px;
            line-height: 1.5;
            margin-bottom: 11px;
        }

        .side-item:last-child {
            margin-bottom: 0;
        }

        .side-item i {
            width: 18px;
            color: #2c5364;
            text-align: center;
            font-size: 12px;
        }


        /* =========================================================
           PROFILE WRAPPER
        ========================================================= */

        .profile-wrapper {
            width: 100%;
            max-width: 900px;
            min-width: 0;
        }


        /* =========================================================
           PAGE HEADER
        ========================================================= */

        .profile-page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            gap: 20px;
        }

        .profile-title-area {
            display: flex;
            align-items: center;
            gap: 13px;
        }

        .profile-title-icon {
            width: 45px;
            height: 45px;
            border-radius: 9px;
            background: #2c5364;
            color: #ffffff;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 19px;
            box-shadow: 0 4px 10px rgba(44,83,100,0.20);
        }

        .profile-title-text h1 {
            margin: 0;
            font-size: 23px;
            color: #26343d;
            font-weight: 650;
        }

        .profile-title-text p {
            margin: 4px 0 0;
            color: #7b858d;
            font-size: 12px;
        }

        .profile-status {
            display: inline-flex;
            align-items: center;
            gap: 7px;
            padding: 8px 13px;
            background: #ffffff;
            border: 1px solid #dfe5e9;
            border-radius: 7px;
            color: #53616a;
            font-size: 11px;
            font-weight: 600;
            white-space: nowrap;
        }

        .profile-status i {
            color: #2c5364;
            font-size: 10px;
        }


        /* =========================================================
           PROFILE CARD
        ========================================================= */

        .profile-card {
            background: #ffffff;
            border: 1px solid #e1e6e9;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 5px 20px rgba(0,0,0,0.06);
            position: relative;
        }

        .profile-card::before {
            content: "";
            position: absolute;
            left: 0;
            top: 0;
            bottom: 0;
            width: 4px;
            background: #2c5364;
            z-index: 10;
        }


        /* =========================================================
           PROFILE BANNER
        ========================================================= */

        .profile-banner {
            height: 230px;
            background: #2c5364;
            position: relative;
            overflow: hidden;

            display: flex;
            align-items: center;
            justify-content: center;
        }


        /* Decorative Background */

        .profile-banner-pattern {
            position: absolute;
            right: 45px;
            top: 20px;
            font-size: 105px;
            color: rgba(255,255,255,0.045);
            pointer-events: none;
        }

        .profile-banner-pattern::after {
            content: "\f1ad";
            font-family: "Font Awesome 6 Free";
            font-weight: 900;
            position: absolute;
            right: 105px;
            top: 25px;
            font-size: 65px;
            color: rgba(255,255,255,0.025);
        }


        /* =========================================================
           MAIN PROFILE AREA
           IMPORTANT:
           This remains INSIDE profile-banner
        ========================================================= */

        .profile-banner .profile-main {
            position: relative;
            z-index: 5;

            display: flex;
            align-items: center;
            justify-content: center;

            gap: 25px;

            width: fit-content;
            max-width: 90%;

            padding: 20px 35px;
            box-sizing: border-box;
        }


        /* Avatar */

        .profile-banner .profile-avatar {
            width: 100px;
            height: 100px;

            border-radius: 50%;

            background: #ffffff;
            color: #2c5364;

            display: flex;
            align-items: center;
            justify-content: center;

            font-size: 38px;

            border: 5px solid rgba(255,255,255,0.95);

            box-shadow: 0 5px 18px rgba(0,0,0,0.22);

            flex-shrink: 0;
        }


        /* Main Information */

        .profile-banner .profile-main-info {
            padding: 0;
            text-align: left;
            min-width: 220px;
        }

        .profile-banner .profile-main-info h2 {
            margin: 0 0 7px 0;
            color: #ffffff;
            font-size: 26px;
            font-weight: 650;
            line-height: 1.3;
            word-break: break-word;
        }

        .profile-banner .profile-role {
            color: rgba(255,255,255,0.85);
            font-size: 13px;
            margin-bottom: 11px;
        }

        .profile-banner .profile-role i {
            margin-right: 6px;
            color: #ffffff;
        }


        /* Supplier ID */

        .profile-banner .supplier-id {
            display: inline-flex;
            align-items: center;
            gap: 7px;

            padding: 6px 11px;

            background: rgba(255,255,255,0.12);
            color: #ffffff;

            border: 1px solid rgba(255,255,255,0.25);

            border-radius: 6px;

            font-size: 12px;
            font-weight: 600;
        }


        /* =========================================================
           PROFILE BODY
        ========================================================= */

        .profile-body {
            padding: 30px 32px 28px;
        }


        /* =========================================================
           INFORMATION SECTION
        ========================================================= */

        .information-section {
            margin-bottom: 28px;
        }

        .information-section:last-child {
            margin-bottom: 0;
        }

        .section-heading {
            display: flex;
            align-items: center;
            gap: 9px;

            color: #2d3b44;
            font-size: 15px;
            font-weight: 650;

            padding-bottom: 12px;
            margin-bottom: 18px;

            border-bottom: 1px solid #e7ebee;
        }

        .section-heading i {
            color: #2c5364;
            font-size: 14px;
        }


        /* =========================================================
           DETAILS GRID
        ========================================================= */

        .details-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 16px;
        }

        .detail-box {
            min-width: 0;
            background: #fafbfc;
            border: 1px solid #e6eaed;
            border-radius: 8px;
            padding: 15px 16px;
            box-sizing: border-box;
        }

        .detail-label {
            display: flex;
            align-items: center;
            gap: 7px;

            color: #89929a;
            font-size: 10px;
            font-weight: 600;

            text-transform: uppercase;
            letter-spacing: 0.4px;

            margin-bottom: 7px;
        }

        .detail-label i {
            color: #2c5364;
            font-size: 10px;
        }

        .detail-value {
            color: #303b43;
            font-size: 13px;
            font-weight: 600;
            line-height: 1.5;
            word-break: break-word;
        }


        /* =========================================================
           CATEGORY BADGE
        ========================================================= */

        .category-badge {
            display: inline-flex;
            align-items: center;
            gap: 6px;

            padding: 5px 10px;

            background: #eaf0f3;
            color: #2c5364;

            border-radius: 5px;

            font-size: 11px;
            font-weight: 600;
        }

        .category-badge i {
            font-size: 10px;
        }


        /* =========================================================
           CONTACT VALUE
        ========================================================= */

        .contact-value {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .contact-value i {
            color: #2c5364;
            font-size: 12px;
        }


        /* =========================================================
           ADDRESS
        ========================================================= */

        .address-box {
            grid-column: span 2;
        }


        /* =========================================================
           PROFILE FOOTER
        ========================================================= */

        .profile-footer {
            border-top: 1px solid #e8ecef;
            padding: 14px 25px;

            background: #fafbfc;

            color: #89929a;
            font-size: 11px;

            display: flex;
            align-items: center;
            justify-content: center;
            gap: 7px;

            text-align: center;
        }

        .profile-footer i {
            color: #2c5364;
        }


        /* =========================================================
           RIGHT SIDE BOXES
        ========================================================= */

        .profile-side-boxes.right {
            order: 3;
        }

        .profile-side-boxes.left {
            order: 1;
        }

        .profile-wrapper {
            order: 2;
        }


        /* =========================================================
           RESPONSIVE - 1100px
        ========================================================= */

        @media (max-width: 1100px) {

            .supplier-profile-layout {
                display: block;
            }

            .profile-wrapper {
                max-width: 900px;
                margin: 0 auto;
            }

            .profile-side-boxes {
                display: none;
            }
        }


        /* =========================================================
           RESPONSIVE - 850px
        ========================================================= */

        @media (max-width: 850px) {

            .supplier-profile-page {
                padding: 25px 15px 40px;
            }

            .profile-body {
                padding: 25px 22px;
            }

            .details-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }


        /* =========================================================
           RESPONSIVE - 650px
        ========================================================= */

        @media (max-width: 650px) {

            .supplier-profile-page {
                padding: 18px 10px 35px;
            }


            /* Page Header */

            .profile-page-header {
                flex-direction: column;
                align-items: flex-start;
                margin-bottom: 15px;
                gap: 12px;
            }

            .profile-title-area {
                gap: 10px;
            }

            .profile-title-icon {
                width: 40px;
                height: 40px;
                font-size: 16px;
            }

            .profile-title-text h1 {
                font-size: 20px;
            }

            .profile-title-text p {
                font-size: 11px;
            }

            .profile-status {
                align-self: flex-start;
            }


            /* Banner */

            .profile-banner {
                height: 270px;

                display: flex;
                align-items: center;
                justify-content: center;
            }


            /* Main Profile */

            .profile-banner .profile-main {
                width: 100%;
                max-width: 100%;

                padding: 20px;

                flex-direction: column;

                align-items: center;
                justify-content: center;

                text-align: center;

                gap: 10px;
            }


            /* Avatar */

            .profile-banner .profile-avatar {
                width: 82px;
                height: 82px;
                font-size: 31px;
            }


            /* Main Info */

            .profile-banner .profile-main-info {
                min-width: 0;
                width: 100%;
                text-align: center;
            }

            .profile-banner .profile-main-info h2 {
                font-size: 22px;
            }

            .profile-banner .profile-role {
                margin-bottom: 8px;
            }

            .profile-banner .supplier-id {
                font-size: 11px;
            }


            /* Body */

            .profile-body {
                padding: 22px 15px;
            }

            .details-grid {
                grid-template-columns: 1fr;
                gap: 12px;
            }

            .address-box {
                grid-column: span 1;
            }

            .detail-box {
                padding: 13px 14px;
            }


            /* Footer */

            .profile-footer {
                padding: 13px 15px;
                font-size: 10px;
            }
        }


        /* =========================================================
           RESPONSIVE - 400px
        ========================================================= */

        @media (max-width: 400px) {

            .profile-banner {
                height: 280px;
            }

            .profile-banner .profile-avatar {
                width: 76px;
                height: 76px;
                font-size: 28px;
            }

            .profile-banner .profile-main-info h2 {
                font-size: 20px;
            }

            .profile-body {
                padding: 20px 12px;
            }
        }

    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="supplier-profile-page">

        <div class="supplier-profile-layout">


            <!-- =====================================================
                 LEFT SIDE INFORMATION
            ====================================================== -->

            <div class="profile-side-boxes left">

                <div class="profile-side-box">

                    <div class="side-box-title">
                        <i class="fa-solid fa-user-check"></i>
                        Account Information
                    </div>

                    <div class="side-box-content">

                        <div class="side-item">
                            <i class="fa-solid fa-circle-check"></i>
                            Active Supplier
                        </div>

                        <div class="side-item">
                            <i class="fa-solid fa-shield-halved"></i>
                            Secure Account
                        </div>

                        <div class="side-item">
                            <i class="fa-solid fa-id-card"></i>
                            Supplier Profile
                        </div>

                    </div>

                </div>


                <div class="profile-side-box">

                    <div class="side-box-title">
                        <i class="fa-solid fa-id-card"></i>
                        Supplier Details
                    </div>

                    <div class="side-box-content">

                        <div class="side-item">
                            <i class="fa-solid fa-building"></i>
                            Supplier Account
                        </div>

                        <div class="side-item">
                            <i class="fa-solid fa-box"></i>
                            Product Supplier
                        </div>

                        <div class="side-item">
                            <i class="fa-solid fa-calendar"></i>
                            Registered Supplier
                        </div>

                    </div>

                </div>

            </div>


            <!-- =====================================================
                 MAIN PROFILE
            ====================================================== -->

            <div class="profile-wrapper">


                <!-- PAGE HEADER -->

                <div class="profile-page-header">

                    <div class="profile-title-area">

                        <div class="profile-title-icon">
                            <i class="fa-solid fa-user"></i>
                        </div>

                        <div class="profile-title-text">

                            <h1>My Profile</h1>

                            <p>
                                View your supplier account and contact information.
                            </p>

                        </div>

                    </div>


                    <div class="profile-status">

                        <i class="fa-solid fa-circle-check"></i>

                        Supplier Account

                    </div>

                </div>


                <!-- PROFILE CARD -->

                <div class="profile-card">


                    <!-- =================================================
                         PROFILE BANNER
                         profile-main IS INSIDE profile-banner
                    ================================================== -->

                    <div class="profile-banner">

                        <div class="profile-banner-pattern">

                            <i class="fa-solid fa-boxes-stacked"></i>

                        </div>


                        <div class="profile-main">

                            <!-- AVATAR -->

                            <div class="profile-avatar">

                                <i class="fa-solid fa-user"></i>

                            </div>


                            <!-- MAIN INFORMATION -->

                            <div class="profile-main-info">

                                <h2>

                                    <asp:Label
                                        ID="Label2"
                                        runat="server">
                                    </asp:Label>

                                </h2>


                                <div class="profile-role">

                                    <i class="fa-solid fa-building"></i>

                                    Supplier Account

                                </div>


                                <div class="supplier-id">

                                    <i class="fa-solid fa-id-card"></i>

                                    Supplier ID:

                                    <asp:Label
                                        ID="Label1"
                                        runat="server">
                                    </asp:Label>

                                </div>

                            </div>

                        </div>

                    </div>


                    <!-- =================================================
                         PROFILE BODY
                    ================================================== -->

                    <div class="profile-body">


                        <!-- =================================================
                             PERSONAL INFORMATION
                        ================================================== -->

                        <div class="information-section">

                            <div class="section-heading">

                                <i class="fa-solid fa-user"></i>

                                Personal Information

                            </div>


                            <div class="details-grid">


                                <!-- Supplier Name -->

                                <div class="detail-box">

                                    <div class="detail-label">

                                        <i class="fa-solid fa-user"></i>

                                        Supplier Name

                                    </div>

                                    <div class="detail-value">

                                        <asp:Label
                                            ID="Label3"
                                            runat="server">
                                        </asp:Label>

                                    </div>

                                </div>


                                <!-- Age -->

                                <div class="detail-box">

                                    <div class="detail-label">

                                        <i class="fa-solid fa-cake-candles"></i>

                                        Age

                                    </div>

                                    <div class="detail-value">

                                        <asp:Label
                                            ID="Label4"
                                            runat="server">
                                        </asp:Label>

                                        Years

                                    </div>

                                </div>


                                <!-- Gender -->

                                <div class="detail-box">

                                    <div class="detail-label">

                                        <i class="fa-solid fa-venus-mars"></i>

                                        Gender

                                    </div>

                                    <div class="detail-value">

                                        <asp:Label
                                            ID="Label5"
                                            runat="server">
                                        </asp:Label>

                                    </div>

                                </div>


                                <!-- Category -->

                                <div class="detail-box">

                                    <div class="detail-label">

                                        <i class="fa-solid fa-layer-group"></i>

                                        Product Category

                                    </div>

                                    <div class="detail-value">

                                        <span class="category-badge">

                                            <i class="fa-solid fa-boxes-stacked"></i>

                                            <asp:Label
                                                ID="Label6"
                                                runat="server">
                                            </asp:Label>

                                        </span>

                                    </div>

                                </div>

                            </div>

                        </div>



                        <!-- =================================================
                             CONTACT INFORMATION
                        ================================================== -->

                        <div class="information-section">

                            <div class="section-heading">

                                <i class="fa-solid fa-address-card"></i>

                                Contact Information

                            </div>


                            <div class="details-grid">


                                <!-- Contact -->

                                <div class="detail-box">

                                    <div class="detail-label">

                                        <i class="fa-solid fa-phone"></i>

                                        Contact Number

                                    </div>

                                    <div class="detail-value contact-value">

                                        <i class="fa-solid fa-phone"></i>

                                        <asp:Label
                                            ID="Label7"
                                            runat="server">
                                        </asp:Label>

                                    </div>

                                </div>


                                <!-- Email -->

                                <div class="detail-box">

                                    <div class="detail-label">

                                        <i class="fa-solid fa-envelope"></i>

                                        Email Address

                                    </div>

                                    <div class="detail-value contact-value">

                                        <i class="fa-solid fa-envelope"></i>

                                        <asp:Label
                                            ID="Label8"
                                            runat="server">
                                        </asp:Label>

                                    </div>

                                </div>


                                <!-- Address -->

                                <div class="detail-box address-box">

                                    <div class="detail-label">

                                        <i class="fa-solid fa-location-dot"></i>

                                        Address

                                    </div>

                                    <div class="detail-value contact-value">

                                        <i class="fa-solid fa-location-dot"></i>

                                        <asp:Label
                                            ID="Label9"
                                            runat="server">
                                        </asp:Label>

                                    </div>

                                </div>


                            </div>

                        </div>


                    </div>


                    <!-- =================================================
                         FOOTER
                    ================================================== -->

                    <div class="profile-footer">

                        <i class="fa-solid fa-circle-info"></i>

                        This information is managed by the Inventory Management System.

                    </div>


                </div>

            </div>


            <!-- =====================================================
                 RIGHT SIDE INFORMATION
            ====================================================== -->

            <div class="profile-side-boxes right">

                <div class="profile-side-box">

                    <div class="side-box-title">

                        <i class="fa-solid fa-boxes-stacked"></i>

                        Product Management

                    </div>

                    <div class="side-box-content">

                        <div class="side-item">

                            <i class="fa-solid fa-plus"></i>

                            Add Products

                        </div>

                        <div class="side-item">

                            <i class="fa-solid fa-box"></i>

                            My Products

                        </div>

                        <div class="side-item">

                            <i class="fa-solid fa-receipt"></i>

                            Product Sales

                        </div>

                    </div>

                </div>


                <div class="profile-side-box">

                    <div class="side-box-title">

                        <i class="fa-solid fa-chart-line"></i>

                        Inventory Activity

                    </div>

                    <div class="side-box-content">

                        <div class="side-item">

                            <i class="fa-solid fa-chart-simple"></i>

                            Stock Overview

                        </div>

                        <div class="side-item">

                            <i class="fa-solid fa-triangle-exclamation"></i>

                            Stock Alerts

                        </div>

                        <div class="side-item">

                            <i class="fa-solid fa-clock-rotate-left"></i>

                            Recent Activity

                        </div>

                    </div>

                </div>

            </div>


        </div>

    </div>

</asp:Content>