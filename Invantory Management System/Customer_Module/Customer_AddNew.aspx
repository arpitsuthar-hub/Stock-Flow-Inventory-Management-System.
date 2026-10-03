<%@ Page Title="Add New Customer"
    Language="C#"
    MasterPageFile="~/Customer_Module/Customer_Module.Master"
    AutoEventWireup="true"
    CodeBehind="Customer_AddNew.aspx.cs"
    Inherits="Inventory_Management_System.NewCustomer" %>


<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">


    <!-- =========================================================
         FONT AWESOME
    ========================================================== -->

    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />


    <style type="text/css">

        /* =========================================================
           PAGE WRAPPER
        ========================================================= */

        .customer-page-wrapper {

            position: relative;

            width: 100%;

            min-height: 100vh;

            padding-top: 1px;

            font-family: "Segoe UI", Arial, sans-serif;

            box-sizing: border-box;
        }


        /* =========================================================
           MAIN CUSTOMER FORM CARD
        ========================================================= */

        .customer-form-card {

            position: relative;

            z-index: 5;

            width: 100%;

            max-width: 920px;

            margin: 32px auto;

            padding: 30px 35px;

            box-sizing: border-box;

            background: #ffffff;

            border: 1px solid #e1e7ec;

            border-radius: 14px;

            box-shadow:
                0 5px 20px rgba(0,0,0,0.06);
        }


        /* =========================================================
           FORM HEADER
        ========================================================= */

        .customer-form-header {

            text-align: center;

            margin-bottom: 30px;
        }


        .customer-form-header h1 {

            margin: 0;

            font-size: 27px;

            font-weight: 700;

            color: #243746;
        }


        .customer-form-header h1 i {

            margin-right: 9px;

            color: #2c5364;
        }


        .customer-form-header p {

            margin: 8px 0 0;

            font-size: 13px;

            color: #7b8790;
        }


        /* =========================================================
           TOP INFORMATION ROW
        ========================================================= */

        .customer-top-info {

            display: grid;

            grid-template-columns:
                repeat(2, 1fr);

            gap: 22px;

            margin-bottom: 26px;
        }


        /* =========================================================
           CUSTOMER ID / DATE CARD
        ========================================================= */

        .customer-info-card {

            min-height: 68px;

            display: flex;

            align-items: center;

            justify-content: space-between;

            padding: 0 15px;

            background: #f6f8fa;

            border: 1px solid #dce4e9;

            border-radius: 8px;

            box-sizing: border-box;
        }


        .customer-info-label {

            display: flex;

            align-items: center;

            color: #354854;

            font-size: 12px;

            font-weight: 600;

            letter-spacing: 0.2px;
        }


        .customer-info-label i {

            width: 19px;

            margin-right: 6px;

            color: #2c5364;
        }


        .customer-auto-generated {

            padding: 9px 12px;

            background: #e9eef1;

            color: #294b5c;

            border-radius: 5px;

            font-size: 12px;

            font-weight: 700;

            white-space: nowrap;
        }


        /* =========================================================
           FORM ROW
        ========================================================= */

        .customer-form-row {

            display: grid;

            grid-template-columns:
                repeat(2, 1fr);

            gap: 22px;

            margin-bottom: 24px;
        }


        /* =========================================================
           FORM GROUP
        ========================================================= */

        .customer-form-group {

            width: 100%;

            box-sizing: border-box;
        }


        /* =========================================================
           LABEL
        ========================================================= */

        .customer-form-group label {

            display: block;

            margin-bottom: 8px;

            color: #354854;

            font-size: 13px;

            font-weight: 600;
        }


        .customer-form-group label i {

            width: 18px;

            margin-right: 5px;

            color: #2c5364;
        }


        .required {

            margin-left: 2px;

            color: #c0392b;
        }


        /* =========================================================
           FORM INPUT
        ========================================================= */

        .customer-form-control {

            width: 100%;

            height: 43px;

            padding: 0 12px;

            box-sizing: border-box;

            border: 1px solid #d7dfe5;

            border-radius: 7px;

            background: #ffffff;

            color: #273842;

            font-family: "Segoe UI", Arial, sans-serif;

            font-size: 13px;

            outline: none;

            transition:
                border-color 0.2s ease,
                box-shadow 0.2s ease;
        }


        .customer-form-control:hover {

            border-color: #bdc9d1;
        }


        .customer-form-control:focus {

            border-color: #2c5364;

            box-shadow:
                0 0 0 3px
                rgba(44,83,100,0.08);
        }


        .customer-form-control::placeholder {

            color: #a2abb1;
        }


        /* =========================================================
           READ ONLY
        ========================================================= */

        .customer-form-control[readonly] {

            background: #f5f7f8;

            color: #52616b;

            cursor: default;
        }


        /* =========================================================
           NUMBER INPUT
        ========================================================= */

        input[type="number"].customer-form-control {

            appearance: textfield;
        }


        input[type="number"].customer-form-control::-webkit-inner-spin-button,
        input[type="number"].customer-form-control::-webkit-outer-spin-button {

            margin: 0;
        }


        /* =========================================================
           GENDER
        ========================================================= */

        .customer-gender-options {

            height: 43px;

            display: flex;

            align-items: center;

            gap: 18px;

            padding: 0 5px;

            box-sizing: border-box;
        }


        .customer-gender-options label {

            display: inline-flex;

            align-items: center;

            margin: 0;

            color: #4a5962;

            font-size: 13px;

            font-weight: 500;

            cursor: pointer;
        }


        .customer-gender-options input {

            margin-right: 5px;

            accent-color: #2c5364;
        }


        /* =========================================================
           ADDRESS
        ========================================================= */

        .customer-address-box {

            height: 90px;

            padding: 10px 12px;

            resize: vertical;

            line-height: 1.5;
        }


        /* =========================================================
           SECTION TITLE
        ========================================================= */

        .customer-section-title {

            display: flex;

            align-items: center;

            margin: 30px 0 20px;

            padding-bottom: 9px;

            border-bottom: 1px solid #e5eaee;

            color: #2c5364;

            font-size: 15px;

            font-weight: 700;
        }


        .customer-section-title i {

            margin-right: 8px;
        }


        /* =========================================================
           SAVE BUTTON AREA
        ========================================================= */

        .customer-button-area {

            display: flex;

            justify-content: center;

            margin-top: 30px;

            padding-top: 22px;

            border-top: 1px solid #e5eaee;
        }


        /* =========================================================
           SAVE BUTTON
        ========================================================= */

        .customer-save-button {

            min-width: 230px;

            height: 45px;

            padding: 0 25px;

            border: none;

            border-radius: 7px;

            background: #2c5364;

            color: #ffffff;

            font-family: "Segoe UI", Arial, sans-serif;

            font-size: 14px;

            font-weight: 600;

            cursor: pointer;

            box-shadow:
                0 3px 8px
                rgba(44,83,100,0.12);

            transition:
                background 0.2s ease,
                transform 0.2s ease,
                box-shadow 0.2s ease;
        }


        .customer-save-button:hover {

            background: #203e4b;

            transform: translateY(-1px);

            box-shadow:
                0 6px 14px
                rgba(44,83,100,0.18);
        }


        .customer-save-button:active {

            transform: translateY(0);
        }


        /* =========================================================
           SIDE INFORMATION BOXES
        ========================================================= */

        .customer-side-boxes {

            position: absolute;

            top: 55px;

            width: 260px;

            display: flex;

            flex-direction: column;

            gap: 35px;

            z-index: 2;
        }


        /* =========================================================
           LEFT SIDE
        ========================================================= */

        .customer-side-boxes.left {

            left: 30px;
        }


        /* =========================================================
           RIGHT SIDE
        ========================================================= */

        .customer-side-boxes.right {

            right: 30px;
        }


        /* =========================================================
           SIDE BOX
        ========================================================= */

        .customer-side-box {

            width: 260px;

            height: 260px;

            box-sizing: border-box;

            padding: 35px 28px;

            display: flex;

            flex-direction: column;

            justify-content: center;

            align-items: center;

            text-align: center;

            background: #ffffff;

            border: 1px solid #dce4e9;

            border-radius: 16px;

            box-shadow:
                0 5px 20px
                rgba(0,0,0,0.07);

            transition:
                all 0.25s ease;
        }


        /* =========================================================
           SIDE BOX HOVER
        ========================================================= */

        .customer-side-box:hover {

            transform: translateY(-6px);

            border-color: #2c5364;

            box-shadow:
                0 12px 28px
                rgba(44,83,100,0.15);
        }


        /* =========================================================
           SIDE ICON
        ========================================================= */

        .customer-side-icon {

            width: 72px;

            height: 72px;

            display: flex;

            justify-content: center;

            align-items: center;

            margin-bottom: 20px;

            border-radius: 14px;

            background: #eef2f5;

            color: #2c5364;

            font-size: 30px;
        }


        /* =========================================================
           SIDE BOX TITLE
        ========================================================= */

        .customer-side-box h3 {

            margin: 0 0 12px;

            color: #273842;

            font-size: 20px;

            font-weight: 700;
        }


        /* =========================================================
           SIDE BOX DESCRIPTION
        ========================================================= */

        .customer-side-box p {

            margin: 0;

            max-width: 205px;

            color: #74818a;

            font-size: 13px;

            line-height: 1.7;
        }


        /* =========================================================
           LARGE SCREEN
        ========================================================= */

        @media (min-width: 1400px) {

            .customer-side-boxes {

                width: 285px;

                gap: 40px;
            }


            .customer-side-boxes.left {

                left: 45px;
            }


            .customer-side-boxes.right {

                right: 45px;
            }


            .customer-side-box {

                width: 285px;

                height: 280px;
            }


            .customer-side-icon {

                width: 78px;

                height: 78px;

                font-size: 32px;
            }


            .customer-side-box h3 {

                font-size: 21px;
            }


            .customer-side-box p {

                max-width: 220px;

                font-size: 13px;
            }
        }


        /* =========================================================
           MEDIUM SCREEN
        ========================================================= */

        @media (max-width: 1250px) {

            .customer-side-boxes {

                width: 190px;

                gap: 25px;
            }


            .customer-side-boxes.left {

                left: 12px;
            }


            .customer-side-boxes.right {

                right: 12px;
            }


            .customer-side-box {

                width: 190px;

                height: 205px;

                padding: 20px;
            }


            .customer-side-icon {

                width: 55px;

                height: 55px;

                margin-bottom: 13px;

                font-size: 23px;
            }


            .customer-side-box h3 {

                font-size: 16px;
            }


            .customer-side-box p {

                font-size: 11px;

                line-height: 1.5;
            }
        }


        /* =========================================================
           HIDE SIDE BOXES
        ========================================================= */

        @media (max-width: 1050px) {

            .customer-side-boxes {

                display: none;
            }


            .customer-form-card {

                max-width: 920px;
            }
        }


        /* =========================================================
           TABLET
        ========================================================= */

        @media (max-width: 900px) {

            .customer-form-card {

                max-width: 90%;

                padding: 28px;
            }


            .customer-form-row {

                grid-template-columns:
                    repeat(2, 1fr);
            }
        }


        /* =========================================================
           MOBILE
        ========================================================= */

        @media (max-width: 600px) {

            .customer-form-card {

                max-width: 94%;

                padding: 22px 18px;
            }


            .customer-form-row {

                grid-template-columns: 1fr;

                gap: 18px;

                margin-bottom: 18px;
            }


            .customer-top-info {

                grid-template-columns: 1fr;

                gap: 15px;
            }


            .customer-form-header h1 {

                font-size: 23px;
            }


            .customer-section-title {

                margin-top: 25px;
            }


            .customer-save-button {

                width: 100%;
            }
        }


    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">


    <div class="customer-page-wrapper">


        <!-- =====================================================
             LEFT SIDE BOXES
        ====================================================== -->

        <div class="customer-side-boxes left">


            <!-- BOX 1 -->

            <div class="customer-side-box">

                <div class="customer-side-icon">

                    <i class="fa-solid fa-users"></i>

                </div>


                <h3>
                    Customer Management
                </h3>


                <p>
                    Manage customer information, contact details
                    and customer records from one place.
                </p>

            </div>



            <!-- BOX 2 -->

            <div class="customer-side-box">

                <div class="customer-side-icon">

                    <i class="fa-solid fa-user-check"></i>

                </div>


                <h3>
                    Customer Records
                </h3>


                <p>
                    Maintain organized customer records for
                    faster and more efficient business operations.
                </p>

            </div>

        </div>



        <!-- =====================================================
             RIGHT SIDE BOXES
        ====================================================== -->

        <div class="customer-side-boxes right">


            <!-- BOX 3 -->

            <div class="customer-side-box">

                <div class="customer-side-icon">

                    <i class="fa-solid fa-cart-shopping"></i>

                </div>


                <h3>
                    Sales & Billing
                </h3>


                <p>
                    Connect customers with sales, billing and
                    transaction activities in the system.
                </p>

            </div>



            <!-- BOX 4 -->

            <div class="customer-side-box">

                <div class="customer-side-icon">

                    <i class="fa-solid fa-chart-line"></i>

                </div>


                <h3>
                    Customer Activity
                </h3>


                <p>
                    Keep customer information ready for sales,
                    purchases and future business activities.
                </p>

            </div>

        </div>



        <!-- =====================================================
             MAIN CUSTOMER FORM
        ====================================================== -->

        <div class="customer-form-card">


            <!-- =================================================
                 FORM HEADER
            ================================================== -->

            <div class="customer-form-header">

                <h1>

                    <i class="fa-solid fa-user-plus"></i>

                    Add New Customer

                </h1>


                <p>
                    Enter customer information to register a new
                    customer in the inventory management system.
                </p>

            </div>



            <!-- =================================================
                 CUSTOMER ID + REGISTRATION DATE
            ================================================== -->

            <div class="customer-top-info">


                <!-- CUSTOMER ID -->

                <div class="customer-info-card">

                    <div class="customer-info-label">

                        <i class="fa-solid fa-id-card"></i>

                        Customer ID

                    </div>


                    <asp:Label
                        ID="lblCustomerID"
                        runat="server"
                        CssClass="customer-auto-generated">
                    </asp:Label>

                </div>



                <!-- REGISTRATION DATE -->

                <div class="customer-info-card">

                    <div class="customer-info-label">

                        <i class="fa-solid fa-calendar-check"></i>

                        Registration Date

                    </div>


                    <asp:Label
                        ID="lblRegisterDate"
                        runat="server"
                        CssClass="customer-auto-generated">
                    </asp:Label>

                </div>

            </div>



            <!-- =================================================
                 BASIC INFORMATION
            ================================================== -->

            <div class="customer-section-title">

                <i class="fa-solid fa-user"></i>

                Basic Information

            </div>



            <!-- =================================================
                 ROW 1
                 Customer Name | Age
            ================================================== -->

            <div class="customer-form-row">


                <!-- CUSTOMER NAME -->

                <div class="customer-form-group">

                    <label>

                        <i class="fa-solid fa-user"></i>

                        Customer Name

                        <span class="required">*</span>

                    </label>


                    <asp:TextBox
                        ID="TextBox2"
                        runat="server"
                        CssClass="customer-form-control"
                        placeholder="Enter customer name">
                    </asp:TextBox>

                </div>



                <!-- AGE -->

                <div class="customer-form-group">

                    <label>

                        <i class="fa-solid fa-calendar-days"></i>

                        Age

                    </label>


                    <asp:TextBox
                        ID="TextBox3"
                        runat="server"
                        CssClass="customer-form-control"
                        TextMode="Number"
                        placeholder="Enter age">
                    </asp:TextBox>

                </div>

            </div>



            <!-- =================================================
                 ROW 2
                 Gender | Contact Number
            ================================================== -->

            <div class="customer-form-row">


                <!-- GENDER -->

                <div class="customer-form-group">

                    <label>

                        <i class="fa-solid fa-venus-mars"></i>

                        Gender

                    </label>


                    <div class="customer-gender-options">


                        <asp:RadioButton
                            ID="RadioButton1"
                            runat="server"
                            GroupName="Gender"
                            Text="Male" />


                        <asp:RadioButton
                            ID="RadioButton2"
                            runat="server"
                            GroupName="Gender"
                            Text="Female" />


                        <asp:RadioButton
                            ID="RadioButton3"
                            runat="server"
                            GroupName="Gender"
                            Text="Other" />


                    </div>

                </div>



                <!-- CONTACT -->

                <div class="customer-form-group">

                    <label>

                        <i class="fa-solid fa-phone"></i>

                        Contact Number

                        <span class="required">*</span>

                    </label>


                    <asp:TextBox
                        ID="TextBox4"
                        runat="server"
                        CssClass="customer-form-control"
                        TextMode="Phone"
                        placeholder="Enter contact number">
                    </asp:TextBox>

                </div>

            </div>



            <!-- =================================================
                 ADDRESS INFORMATION
            ================================================== -->

            <div class="customer-section-title">

                <i class="fa-solid fa-location-dot"></i>

                Address Information

            </div>



            <!-- =================================================
                 ADDRESS
            ================================================== -->

            <div class="customer-form-row">


                <div class="customer-form-group">

                    <label>

                        <i class="fa-solid fa-map-location-dot"></i>

                        Address

                    </label>


                    <asp:TextBox
                        ID="TextBox5"
                        runat="server"
                        TextMode="MultiLine"
                        Rows="3"
                        CssClass="customer-form-control customer-address-box"
                        placeholder="Enter complete residential or business address">
                    </asp:TextBox>

                </div>


            </div>



            <!-- =================================================
                 SAVE BUTTON
            ================================================== -->

            <div class="customer-button-area">


                <asp:Button
                    ID="Button1"
                    runat="server"
                    Text="Save Customer Details"
                    CssClass="customer-save-button"
                    OnClick="Button1_Click" />


            </div>


        </div>

    </div>


</asp:Content>