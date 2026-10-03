<%@ Page Title="Edit Customer"
    Language="C#"
    MasterPageFile="~/Customer_Module/Customer_Module.Master"
    AutoEventWireup="true"
    CodeBehind="Customer_Edit.aspx.cs"
    Inherits="Inventory_Management_System.Customer_Module.Customer_Edit" %>


<asp:Content
    ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">


    <!-- =========================================================
         FONT AWESOME
         ========================================================= -->

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />


    <style type="text/css">

        /* =========================================================
           CUSTOMER EDIT MAIN LAYOUT
           ========================================================= */

        .customer-edit-layout {

            width: 100%;

            display: flex;

            justify-content: center;

            align-items: flex-start;

            gap: 24px;

            padding: 28px 20px 45px 20px;

            box-sizing: border-box;

            font-family: "Segoe UI", Arial, sans-serif;

        }


        /* =========================================================
           MAIN EDIT AREA
           ========================================================= */

        .edit-container {

            width: 100%;

            max-width: 900px;

            margin: 0;

            padding: 0;

            color: #1f2937;

        }


        /* =========================================================
           SIDE BOX CONTAINER
           ========================================================= */

        .edit-side-boxes {

            width: 205px;

            display: flex;

            flex-direction: column;

            gap: 24px;

            flex-shrink: 0;

        }


        /* =========================================================
           LEFT SIDE POSITION
           ========================================================= */

        .edit-side-boxes.left {

            margin-top: 88px;

        }


        /* =========================================================
           RIGHT SIDE POSITION
           ========================================================= */

        .edit-side-boxes.right {

            margin-top: 88px;

        }


        /* =========================================================
           SIDE INFORMATION BOX
           ========================================================= */

        .edit-side-box {

            min-height: 225px;

            box-sizing: border-box;

            padding: 25px 20px;

            background: #ffffff;

            border: 1px solid #e1e7ea;

            border-radius: 12px;

            box-shadow:
                0 4px 14px rgba(31, 41, 55, 0.06);

            display: flex;

            flex-direction: column;

            align-items: center;

            justify-content: center;

            text-align: center;

            position: relative;

            overflow: hidden;

            transition: all 0.25s ease;

        }


        /* =========================================================
           SIDE BOX TOP ACCENT
           ========================================================= */

        .edit-side-box::before {

            content: "";

            position: absolute;

            top: 0;

            left: 0;

            right: 0;

            height: 3px;

            background: #2c5364;

        }


        /* =========================================================
           SIDE BOX HOVER
           ========================================================= */

        .edit-side-box:hover {

            transform: translateY(-4px);

            border-color: #ccdadd;

            box-shadow:
                0 9px 22px rgba(31, 41, 55, 0.09);

        }


        /* =========================================================
           SIDE BOX ICON
           ========================================================= */

        .edit-side-icon {

            width: 52px;

            height: 52px;

            display: flex;

            align-items: center;

            justify-content: center;

            margin-bottom: 15px;

            background: #f0f5f7;

            color: #2c5364;

            border: 1px solid #dce6e9;

            border-radius: 11px;

            font-size: 19px;

            transition: all 0.25s ease;

        }


        .edit-side-box:hover .edit-side-icon {

            background: #2c5364;

            color: #ffffff;

            border-color: #2c5364;

        }


        /* =========================================================
           SIDE BOX TITLE
           ========================================================= */

        .edit-side-box h3 {

            margin: 0 0 9px 0;

            color: #26313a;

            font-size: 14px;

            font-weight: 650;

            line-height: 1.4;

        }


        /* =========================================================
           SIDE BOX DESCRIPTION
           ========================================================= */

        .edit-side-box p {

            margin: 0;

            color: #737d86;

            font-size: 11px;

            line-height: 1.65;

        }


        /* =========================================================
           PAGE HEADER
           ========================================================= */

        .edit-header {

            display: flex;

            justify-content: space-between;

            align-items: center;

            margin-bottom: 24px;

        }


        /* =========================================================
           HEADER LEFT
           ========================================================= */

        .edit-header-left {

            display: flex;

            align-items: center;

            gap: 14px;

        }


        /* =========================================================
           HEADER ICON
           ========================================================= */

        .edit-header-icon {

            width: 48px;

            height: 48px;

            display: flex;

            align-items: center;

            justify-content: center;

            background: #eef4f6;

            color: #2c5364;

            border: 1px solid #dce7ea;

            border-radius: 10px;

            font-size: 19px;

        }


        /* =========================================================
           PAGE TITLE
           ========================================================= */

        .edit-header h2 {

            margin: 0 0 4px 0;

            font-size: 25px;

            font-weight: 650;

            color: #17212b;

            letter-spacing: -0.4px;

        }


        .edit-header p {

            margin: 0;

            font-size: 13px;

            color: #6b7280;

        }


        /* =========================================================
           HEADER STATUS
           ========================================================= */

        .edit-status {

            display: flex;

            align-items: center;

            gap: 7px;

            padding: 8px 13px;

            background: #f5f8f9;

            border: 1px solid #e1e8ea;

            border-radius: 20px;

            color: #2c5364;

            font-size: 11px;

            font-weight: 600;

        }


        .edit-status-dot {

            width: 7px;

            height: 7px;

            background: #2c5364;

            border-radius: 50%;

        }


        /* =========================================================
           MAIN EDIT CARD
           ========================================================= */

        .edit-card {

            position: relative;

            background: #ffffff;

            border: 1px solid #e3e8eb;

            border-radius: 12px;

            padding: 28px;

            box-shadow:
                0 4px 14px rgba(31, 41, 55, 0.055);

        }


        /* =========================================================
           CARD LEFT ACCENT
           ========================================================= */

        .edit-card::before {

            content: "";

            position: absolute;

            left: 0;

            top: 20px;

            bottom: 20px;

            width: 3px;

            background: #2c5364;

            border-radius: 0 4px 4px 0;

        }


        /* =========================================================
           CUSTOMER INFORMATION BAR
           ========================================================= */

        .customer-info-bar {

            display: grid;

            grid-template-columns: repeat(2, 1fr);

            gap: 15px;

            padding: 15px;

            margin-bottom: 28px;

            background: #f7f9fa;

            border: 1px solid #e2e7e9;

            border-radius: 8px;

        }


        /* =========================================================
           CUSTOMER INFORMATION ITEM
           ========================================================= */

        .customer-info-item {

            display: flex;

            flex-direction: column;

            gap: 5px;

            padding: 3px 5px;

        }


        /* =========================================================
           INFORMATION LABEL
           ========================================================= */

        .customer-info-label {

            font-size: 10px;

            font-weight: 700;

            color: #7b8490;

            text-transform: uppercase;

            letter-spacing: 0.6px;

        }


        /* =========================================================
           INFORMATION VALUE
           ========================================================= */

        .customer-info-value {

            font-size: 14px;

            font-weight: 700;

            color: #2c5364;

        }


        /* =========================================================
           SECTION TITLE
           ========================================================= */

        .section-title {

            display: flex;

            align-items: center;

            gap: 8px;

            margin: 0 0 18px 0;

            padding-bottom: 10px;

            font-size: 12px;

            font-weight: 700;

            color: #2c5364;

            text-transform: uppercase;

            letter-spacing: 0.7px;

            border-bottom: 1px solid #e5e7eb;

        }


        .section-title i {

            font-size: 12px;

        }


        .section-title.contact-section {

            margin-top: 30px;

        }


        /* =========================================================
           FORM GRID
           ========================================================= */

        .form-grid {

            display: grid;

            grid-template-columns: repeat(2, 1fr);

            gap: 20px 24px;

        }


        /* =========================================================
           FORM GROUP
           ========================================================= */

        .form-group {

            display: flex;

            flex-direction: column;

        }


        .form-group.full-width {

            grid-column: span 2;

        }


        /* =========================================================
           FORM LABEL
           ========================================================= */

        .form-group label {

            margin-bottom: 7px;

            font-size: 12px;

            font-weight: 600;

            color: #374151;

        }


        /* =========================================================
           FORM INPUT
           ========================================================= */

        .form-control {

            width: 100%;

            box-sizing: border-box;

            padding: 11px 13px;

            background: #ffffff;

            border: 1px solid #d8dee2;

            border-radius: 7px;

            font-family: inherit;

            font-size: 13px;

            color: #1f2937;

            outline: none;

            transition:
                border-color 0.18s ease,
                box-shadow 0.18s ease,
                background-color 0.18s ease;

        }


        .form-control:hover {

            border-color: #c3cdd2;

        }


        .form-control:focus {

            background: #ffffff;

            border-color: #2c5364;

            box-shadow:
                0 0 0 3px rgba(44, 83, 100, 0.09);

        }


        .form-control::placeholder {

            color: #a0a7ae;

        }


        textarea.form-control {

            resize: vertical;

            min-height: 105px;

        }


        /* =========================================================
           RADIO BUTTON GROUP
           ========================================================= */

        .radio-group {

            display: flex;

            align-items: center;

            gap: 24px;

            min-height: 42px;

        }


        /* =========================================================
           RADIO OPTION
           ========================================================= */

        .radio-option {

            font-size: 13px;

            color: #374151;

            cursor: pointer;

        }


        .radio-option input {

            margin-right: 5px;

            accent-color: #2c5364;

        }


        /* =========================================================
           ACTION AREA
           ========================================================= */

        .form-actions {

            display: flex;

            justify-content: flex-end;

            align-items: center;

            gap: 10px;

            margin-top: 32px;

            padding-top: 22px;

            border-top: 1px solid #e5e7eb;

        }


        /* =========================================================
           BUTTON
           ========================================================= */

        .btn {

            min-width: 145px;

            height: 40px;

            padding: 0 18px;

            display: inline-flex;

            align-items: center;

            justify-content: center;

            gap: 7px;

            border-radius: 7px;

            font-family: inherit;

            font-size: 12px;

            font-weight: 600;

            cursor: pointer;

            transition: all 0.18s ease;

        }


        /* =========================================================
           DELETE BUTTON
           ========================================================= */

        .btn-delete {

            background: #ffffff;

            color: #c0392b;

            border: 1px solid #e3b5b0;

        }


        .btn-delete:hover {

            background: #c0392b;

            color: #ffffff;

            border-color: #c0392b;

            transform: translateY(-1px);

            box-shadow:
                0 4px 9px rgba(192, 57, 43, 0.13);

        }


        /* =========================================================
           UPDATE BUTTON
           ========================================================= */

        .btn-update {

            background: #2c5364;

            color: #ffffff;

            border: 1px solid #2c5364;

        }


        .btn-update:hover {

            background: #203a43;

            border-color: #203a43;

            transform: translateY(-1px);

            box-shadow:
                0 4px 9px rgba(44, 83, 100, 0.16);

        }


        /* =========================================================
           RESPONSIVE - 1250px
           ========================================================= */

        @media (max-width: 1250px) {

            .edit-side-boxes {

                width: 185px;

            }


            .customer-edit-layout {

                gap: 18px;

            }

        }


        /* =========================================================
           RESPONSIVE - 1100px
           ========================================================= */

        @media (max-width: 1100px) {

            .edit-side-boxes {

                display: none;

            }


            .customer-edit-layout {

                display: block;

                padding-left: 20px;

                padding-right: 20px;

            }


            .customer-edit-layout .edit-container {

                max-width: 950px;

                margin: 0 auto;

            }

        }


        /* =========================================================
           RESPONSIVE - 700px
           ========================================================= */

        @media (max-width: 700px) {

            .customer-edit-layout {

                padding-left: 15px;

                padding-right: 15px;

            }


            .edit-header {

                align-items: flex-start;

            }


            .edit-status {

                display: none;

            }


            .edit-card {

                padding: 22px 18px;

            }


            .customer-info-bar {

                grid-template-columns: 1fr;

                gap: 12px;

            }


            .form-grid {

                grid-template-columns: 1fr;

                gap: 17px;

            }


            .form-group.full-width {

                grid-column: span 1;

            }


            .radio-group {

                gap: 16px;

                flex-wrap: wrap;

            }


            .form-actions {

                flex-direction: column;

                align-items: stretch;

            }


            .btn {

                width: 100%;

            }

        }


        /* =========================================================
           RESPONSIVE - 450px
           ========================================================= */

        @media (max-width: 450px) {

            .customer-edit-layout {

                padding-left: 10px;

                padding-right: 10px;

            }


            .edit-header h2 {

                font-size: 21px;

            }


            .edit-header p {

                font-size: 12px;

            }


            .edit-header-icon {

                width: 42px;

                height: 42px;

                font-size: 17px;

            }

        }

    </style>

</asp:Content>



<asp:Content
    ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">


    <!-- =========================================================
         CUSTOMER EDIT MAIN LAYOUT
         ========================================================= -->

    <div class="customer-edit-layout">


        <!-- =====================================================
             LEFT SIDE BOXES
             ===================================================== -->

        <div class="edit-side-boxes left">


            <!-- CUSTOMER MANAGEMENT -->

            <div class="edit-side-box">

                <div class="edit-side-icon">

                    <i class="fa-solid fa-user-gear"></i>

                </div>

                <h3>
                    Customer Management
                </h3>

                <p>
                    Update customer information and
                    keep customer records accurate.
                </p>

            </div>


            <!-- CUSTOMER PROFILE -->

            <div class="edit-side-box">

                <div class="edit-side-icon">

                    <i class="fa-solid fa-id-card"></i>

                </div>

                <h3>
                    Customer Profile
                </h3>

                <p>
                    Manage personal information,
                    contact details and address.
                </p>

            </div>


        </div>



        <!-- =====================================================
             MAIN EDIT AREA
             ===================================================== -->

        <div class="edit-container">


            <!-- =================================================
                 PAGE HEADER
                 ================================================= -->

            <div class="edit-header">


                <div class="edit-header-left">


                    <div class="edit-header-icon">

                        <i class="fa-solid fa-user-pen"></i>

                    </div>


                    <div>

                        <h2>
                            Edit Customer
                        </h2>

                        <p>
                            Update customer information or remove the customer record.
                        </p>

                    </div>


                </div>


                <div class="edit-status">

                    <span class="edit-status-dot"></span>

                    Edit Customer

                </div>


            </div>



            <!-- =================================================
                 MAIN EDIT CARD
                 ================================================= -->

            <div class="edit-card">


                <!-- =================================================
                     CUSTOMER INFORMATION
                     ================================================= -->

                <div class="customer-info-bar">


                    <!-- CUSTOMER ID -->

                    <div class="customer-info-item">

                        <span class="customer-info-label">

                            <i class="fa-regular fa-id-card"></i>

                            Customer ID

                        </span>


                        <asp:Label
                            ID="lblCustomerID"
                            runat="server"
                            CssClass="customer-info-value">
                        </asp:Label>

                    </div>



                    <!-- REGISTRATION DATE -->

                    <div class="customer-info-item">

                        <span class="customer-info-label">

                            <i class="fa-regular fa-calendar"></i>

                            Registration Date

                        </span>


                        <asp:Label
                            ID="lblRegisterDate"
                            runat="server"
                            CssClass="customer-info-value">
                        </asp:Label>

                    </div>


                </div>



                <!-- =================================================
                     PERSONAL INFORMATION
                     ================================================= -->

                <div class="section-title">

                    <i class="fa-solid fa-user"></i>

                    Personal Information

                </div>


                <div class="form-grid">


                    <!-- CUSTOMER NAME -->

                    <div class="form-group">

                        <label for="txtCustomerName">

                            Customer Name

                        </label>


                        <asp:TextBox
                            ID="txtCustomerName"
                            runat="server"
                            CssClass="form-control"
                            placeholder="Enter customer name">
                        </asp:TextBox>

                    </div>



                    <!-- AGE -->

                    <div class="form-group">

                        <label for="txtAge">

                            Age

                        </label>


                        <asp:TextBox
                            ID="txtAge"
                            runat="server"
                            CssClass="form-control"
                            placeholder="Enter age">
                        </asp:TextBox>

                    </div>



                    <!-- GENDER -->

                    <div class="form-group full-width">


                        <label>

                            Gender

                        </label>


                        <div class="radio-group">


                            <label class="radio-option">

                                <asp:RadioButton
                                    ID="rbMale"
                                    runat="server"
                                    GroupName="Gender"
                                    Text="Male" />

                            </label>


                            <label class="radio-option">

                                <asp:RadioButton
                                    ID="rbFemale"
                                    runat="server"
                                    GroupName="Gender"
                                    Text="Female" />

                            </label>


                            <label class="radio-option">

                                <asp:RadioButton
                                    ID="rbOther"
                                    runat="server"
                                    GroupName="Gender"
                                    Text="Other" />

                            </label>


                        </div>

                    </div>


                </div>



                <!-- =================================================
                     CONTACT INFORMATION
                     ================================================= -->

                <div class="section-title contact-section">

                    <i class="fa-solid fa-address-card"></i>

                    Contact Information

                </div>


                <div class="form-grid">


                    <!-- CONTACT -->

                    <div class="form-group">

                        <label for="txtContact">

                            Contact Number

                        </label>


                        <asp:TextBox
                            ID="txtContact"
                            runat="server"
                            CssClass="form-control"
                            placeholder="Enter contact number">
                        </asp:TextBox>

                    </div>



                    <!-- ADDRESS -->

                    <div class="form-group full-width">

                        <label for="txtAddress">

                            Address

                        </label>


                        <asp:TextBox
                            ID="txtAddress"
                            runat="server"
                            CssClass="form-control"
                            TextMode="MultiLine"
                            Rows="4"
                            placeholder="Enter customer address">
                        </asp:TextBox>

                    </div>


                </div>



                <!-- =================================================
                     ACTION BUTTONS
                     ================================================= -->

                <div class="form-actions">


                    <!-- DELETE -->

                    <asp:Button
                        ID="btnDelete"
                        runat="server"
                        Text="Delete Customer"
                        CssClass="btn btn-delete"
                        CausesValidation="false"
                        OnClientClick="return confirm('Are you sure you want to permanently delete this customer?');"
                        OnClick="btnDelete_Click" />


                    <!-- UPDATE -->

                    <asp:Button
                        ID="btnUpdate"
                        runat="server"
                        Text="Update Customer"
                        CssClass="btn btn-update"
                        OnClick="btnUpdate_Click" />


                </div>


            </div>


        </div>



        <!-- =====================================================
             RIGHT SIDE BOXES
             ===================================================== -->

        <div class="edit-side-boxes right">


            <!-- CUSTOMER ACTIVITY -->

            <div class="edit-side-box">

                <div class="edit-side-icon">

                    <i class="fa-solid fa-clock-rotate-left"></i>

                </div>

                <h3>
                    Customer Activity
                </h3>

                <p>
                    Maintain accurate customer information
                    for future sales and billing.
                </p>

            </div>


            <!-- SALES & BILLING -->

            <div class="edit-side-box">

                <div class="edit-side-icon">

                    <i class="fa-solid fa-file-invoice-dollar"></i>

                </div>

                <h3>
                    Sales &amp; Billing
                </h3>

                <p>
                    Updated customer details remain
                    available for sales and billing operations.
                </p>

            </div>


        </div>


    </div>


</asp:Content>