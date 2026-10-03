<%@ Page Title="Edit Supplier"
    Language="C#"
    MasterPageFile="~/Supplier_Module/Supplier_Module.Master"
    AutoEventWireup="true"
    CodeBehind="Supplier_Edit.aspx.cs"
    Inherits="Inventory_Management_System.Supplier_Module.Supplier_Edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">

        /* =========================================
           PAGE
        ========================================= */

        .edit-supplier-page {
            width: 100%;
            max-width: 1450px;
            margin: 0 auto;
            padding: 28px 25px 45px;
            box-sizing: border-box;
            font-family: "Segoe UI", Arial, sans-serif;
            color: #1f2937;
        }

        /* =========================================
           PAGE HEADER
        ========================================= */

        .page-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .page-header h2 {
            margin: 0 0 7px;
            font-size: 28px;
            font-weight: 650;
            color: #2c5364;
        }

        .page-header h2 i {
            margin-right: 8px;
        }

        .page-header p {
            margin: 0;
            font-size: 14px;
            color: #6b7280;
        }

        /* =========================================
           MAIN LAYOUT
        ========================================= */

        .edit-layout {
            width: 100%;
            display: flex;
            align-items: flex-start;
            justify-content: center;
            gap: 24px;
        }

        /* =========================================
           SIDE BOXES
        ========================================= */

        .side-boxes {
            width: 205px;
            flex-shrink: 0;
            display: flex;
            flex-direction: column;
            gap: 18px;
            margin-top: 5px;
        }

        .side-box {
            position: relative;
            background: #ffffff;
            border: 1px solid #e3e8eb;
            border-radius: 10px;
            padding: 20px 17px;
            box-shadow: 0 3px 12px rgba(0, 0, 0, 0.055);
            overflow: hidden;
            transition: transform .2s ease,
                        box-shadow .2s ease;
        }

        .side-box:hover {
            transform: translateY(-2px);
            box-shadow: 0 7px 18px rgba(0, 0, 0, 0.08);
        }

        .side-box::before {
            content: "";
            position: absolute;
            left: 0;
            top: 0;
            bottom: 0;
            width: 4px;
            background: #2c5364;
        }

        .side-box-icon {
            width: 42px;
            height: 42px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #eef4f6;
            color: #2c5364;
            border-radius: 8px;
            font-size: 18px;
            margin-bottom: 13px;
        }

        .side-box h3 {
            margin: 0 0 7px;
            color: #263238;
            font-size: 14px;
            font-weight: 650;
        }

        .side-box p {
            margin: 0;
            color: #7a858b;
            font-size: 12px;
            line-height: 1.6;
        }

        /* =========================================
           FORM CONTENT
        ========================================= */

        .form-content {
            flex: 1;
            min-width: 0;
            max-width: 930px;
        }

        .supplier-edit-card {
            width: 100%;
            background: #ffffff;
            border: 1px solid #dfe6ea;
            border-radius: 12px;
            box-shadow:
                0 4px 14px rgba(0, 0, 0, 0.05),
                0 1px 3px rgba(0, 0, 0, 0.03);
            overflow: hidden;
        }

        /* =========================================
           CARD HEADER
        ========================================= */

        .form-card-header {
            position: relative;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 20px 24px;
            background: linear-gradient(
                180deg,
                #ffffff 0%,
                #fafcfd 100%
            );
            border-bottom: 1px solid #e8edef;
        }

        .form-card-header::before {
            content: "";
            position: absolute;
            left: 0;
            top: 0;
            width: 100%;
            height: 3px;
            background: #2c5364;
        }

        .form-card-title {
            display: flex;
            align-items: center;
            gap: 11px;
            color: #263f4b;
            font-size: 16px;
            font-weight: 700;
        }

        .form-card-title i {
            width: 34px;
            height: 34px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #edf4f6;
            color: #2c5364;
            border-radius: 8px;
            font-size: 15px;
        }

        .edit-status {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 6px 11px;
            background: #f1f6f8;
            color: #2c5364;
            border: 1px solid #dbe7eb;
            border-radius: 20px;
            font-size: 11px;
            font-weight: 700;
            white-space: nowrap;
        }

        .edit-status::before {
            content: "";
            width: 6px;
            height: 6px;
            background: #2c5364;
            border-radius: 50%;
        }

        /* =========================================
           FORM BODY
        ========================================= */

        .form-body {
            padding: 25px 26px 24px;
            background: #ffffff;
        }

        /* =========================================
           FORM GRID - 3 COLUMNS
        ========================================= */

        .form-grid {
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            column-gap: 18px;
            row-gap: 20px;
            width: 100%;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            min-width: 0;
        }

        .form-label {
            display: flex;
            align-items: center;
            margin-bottom: 8px;
            color: #37474f;
            font-size: 12.5px;
            font-weight: 700;
            letter-spacing: .15px;
        }

        .form-label::after {
            content: "*";
            margin-left: 3px;
            color: #9aa6ad;
            font-size: 11px;
        }

        .supplier-id-group .form-label::after {
            content: "";
        }

        /* =========================================
           INPUTS
        ========================================= */

        .form-control {
            width: 100%;
            height: 45px;
            padding: 0 13px;
            box-sizing: border-box;

            background: #fbfcfd;
            border: 1px solid #d7dfe3;
            border-radius: 8px;

            color: #263238;
            font-family: inherit;
            font-size: 13.5px;

            outline: none;

            transition:
                border-color .2s ease,
                background-color .2s ease,
                box-shadow .2s ease;
        }

        .form-control::placeholder {
            color: #a3adb3;
        }

        .form-control:focus {
            background: #ffffff;
            border-color: #2c5364;
            box-shadow: 0 0 0 3px rgba(44, 83, 100, .09);
        }

        .form-control:hover:not(:focus) {
            border-color: #b8c5cb;
            background: #ffffff;
        }

        select.form-control {
            cursor: pointer;
            padding-right: 35px;
        }

        /* =========================================
           READONLY FIELD
        ========================================= */

        .readonly-field {
            background: #f1f4f5 !important;
            color: #66747b !important;
            border-color: #dce2e5 !important;
            font-weight: 600;
            cursor: not-allowed;
        }

        .readonly-field:focus {
            box-shadow: none !important;
        }

        /* =========================================
           ADDRESS
        ========================================= */

        .address-control {
            height: 45px !important;
            resize: none;
            padding-top: 12px !important;
        }

        /* =========================================
           BUTTON AREA
        ========================================= */

        .button-area {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 12px;

            margin-top: 29px;
            padding-top: 23px;

            border-top: 1px solid #e9edef;
        }

        .btn {
            min-width: 155px;
            height: 43px;

            border-radius: 8px;
            padding: 0 22px;

            font-family: inherit;
            font-size: 13px;
            font-weight: 700;

            cursor: pointer;

            transition:
                background-color .2s ease,
                border-color .2s ease,
                box-shadow .2s ease,
                transform .2s ease;
        }

        .btn:hover {
            transform: translateY(-1px);
        }

        .btn:active {
            transform: translateY(0);
        }

        /* =========================================
           UPDATE BUTTON
        ========================================= */

        .btn-update {
            background: #2c5364;
            color: #ffffff;
            border: 1px solid #2c5364;
            box-shadow: 0 4px 10px rgba(44, 83, 100, .18);
        }

        .btn-update:hover {
            background: #234653;
            border-color: #234653;
            box-shadow: 0 6px 14px rgba(44, 83, 100, .23);
        }

        /* =========================================
           DELETE BUTTON
        ========================================= */

        .btn-delete {
            background: #ffffff;
            color: #a33a3a;
            border: 1px solid #d9b6b6;
        }

        .btn-delete:hover {
            background: #fff5f5;
            border-color: #c98e8e;
            box-shadow: 0 4px 10px rgba(150, 60, 60, .10);
        }

        /* =========================================
           MESSAGE
        ========================================= */

        .message {
            display: block;
            min-height: 18px;
            margin-top: 16px;
            padding: 0 10px;

            text-align: center;

            color: #2c5364;
            font-size: 12.5px;
            font-weight: 600;
        }

        /* =========================================
           FOOTER
        ========================================= */

        .form-footer {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 7px;

            padding: 12px 20px;

            background: #f8fafb;
            border-top: 1px solid #e9edef;

            color: #7b878d;
            font-size: 11px;
            text-align: center;
        }

        .form-footer::before {
            content: "\f05a";
            font-family: "Font Awesome 6 Free";
            font-weight: 900;
            color: #8c9ba2;
            font-size: 11px;
        }

        /* =========================================
           TABLET
        ========================================= */

        @media (max-width: 1150px) {

            .side-boxes {
                width: 180px;
            }

            .edit-layout {
                gap: 18px;
            }

            .form-content {
                max-width: 820px;
            }
        }

        /* =========================================
           HIDE SIDE BOXES
        ========================================= */

        @media (max-width: 1000px) {

            .side-boxes {
                display: none;
            }

            .form-content {
                width: 100%;
                max-width: 930px;
            }
        }

        /* =========================================
           2 COLUMNS
        ========================================= */

        @media (max-width: 850px) {

            .form-grid {
                grid-template-columns: repeat(2, minmax(0, 1fr));
                column-gap: 18px;
                row-gap: 18px;
            }
        }

        /* =========================================
           MOBILE
        ========================================= */

        @media (max-width: 600px) {

            .edit-supplier-page {
                padding: 20px 12px 35px;
            }

            .page-header {
                margin-bottom: 22px;
            }

            .page-header h2 {
                font-size: 23px;
            }

            .page-header p {
                font-size: 13px;
            }

            .form-body {
                padding: 21px 18px 20px;
            }

            .form-grid {
                grid-template-columns: 1fr;
                gap: 18px;
            }

            .form-card-header {
                padding: 18px;
            }

            .form-card-title {
                font-size: 14px;
            }

            .form-card-title i {
                width: 32px;
                height: 32px;
            }

            .edit-status {
                font-size: 10px;
            }

            .button-area {
                flex-direction: column;
                gap: 10px;
            }

            .btn {
                width: 100%;
            }
        }

        /* =========================================
           SMALL MOBILE
        ========================================= */

        @media (max-width: 450px) {

            .edit-supplier-page {
                padding: 18px 10px 30px;
            }

            .page-header h2 {
                font-size: 21px;
            }

            .page-header p {
                font-size: 12px;
            }

            .supplier-edit-card {
                border-radius: 10px;
            }

            .form-body {
                padding: 17px 15px 18px;
            }

            .form-card-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 11px;
                padding: 17px 15px;
            }

            .edit-status {
                align-self: flex-start;
            }

            .form-control {
                height: 44px;
            }
        }

    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="edit-supplier-page">

        <!-- =========================================
             PAGE HEADER
        ========================================== -->

        <div class="page-header">

            <h2>
                <i class="fa-solid fa-user-pen"></i>
                Edit Supplier
            </h2>

            <p>
                Update supplier information and account details.
            </p>

        </div>


        <!-- =========================================
             MAIN LAYOUT
        ========================================== -->

        <div class="edit-layout">


            <!-- =====================================
                 LEFT SIDE BOXES
            ====================================== -->

            <div class="side-boxes">

                <div class="side-box">

                    <div class="side-box-icon">
                        <i class="fa-solid fa-user-gear"></i>
                    </div>

                    <h3>Supplier Account</h3>

                    <p>
                        Update the supplier's personal
                        and account information.
                    </p>

                </div>


                <div class="side-box">

                    <div class="side-box-icon">
                        <i class="fa-solid fa-id-card"></i>
                    </div>

                    <h3>Supplier Identity</h3>

                    <p>
                        Supplier ID is automatically assigned
                        and cannot be changed.
                    </p>

                </div>

            </div>


            <!-- =====================================
                 CENTER FORM
            ====================================== -->

            <div class="form-content">

                <div class="supplier-edit-card">


                    <!-- CARD HEADER -->

                    <div class="form-card-header">

                        <div class="form-card-title">

                            <i class="fa-solid fa-pen-to-square"></i>

                            <span>
                                Supplier Information
                            </span>

                        </div>

                        <div class="edit-status">
                            Edit Mode
                        </div>

                    </div>


                    <!-- FORM BODY -->

                    <div class="form-body">

                        <div class="form-grid">


                            <!-- =================================
                                 ROW 1
                                 Supplier ID | Supplier Name | Age
                            ================================== -->

                            <div class="form-group supplier-id-group">

                                <label class="form-label">
                                    Supplier ID
                                </label>

                                <asp:TextBox
                                    ID="txtSupplierId"
                                    runat="server"
                                    CssClass="form-control readonly-field"
                                    ReadOnly="true">
                                </asp:TextBox>

                            </div>


                            <div class="form-group">

                                <label class="form-label">
                                    Supplier Name
                                </label>

                                <asp:TextBox
                                    ID="txtSupplierName"
                                    runat="server"
                                    CssClass="form-control">
                                </asp:TextBox>

                            </div>


                            <div class="form-group">

                                <label class="form-label">
                                    Age
                                </label>

                                <asp:TextBox
                                    ID="txtAge"
                                    runat="server"
                                    CssClass="form-control"
                                    TextMode="Number">
                                </asp:TextBox>

                            </div>


                            <!-- =================================
                                 ROW 2
                                 Gender | Product Category | Empty
                            ================================== -->

                            <div class="form-group">

                                <label class="form-label">
                                    Gender
                                </label>

                                <asp:DropDownList
                                    ID="ddlGender"
                                    runat="server"
                                    CssClass="form-control">

                                    <asp:ListItem
                                        Text="Select Gender"
                                        Value="">
                                    </asp:ListItem>

                                    <asp:ListItem
                                        Text="Male"
                                        Value="Male">
                                    </asp:ListItem>

                                    <asp:ListItem
                                        Text="Female"
                                        Value="Female">
                                    </asp:ListItem>

                                    <asp:ListItem
                                        Text="Other"
                                        Value="Other">
                                    </asp:ListItem>

                                </asp:DropDownList>

                            </div>


                            <div class="form-group">

                                <label class="form-label">
                                    Product Category
                                </label>

                                <asp:DropDownList
                                    ID="ddlCategory"
                                    runat="server"
                                    CssClass="form-control">

                                    <asp:ListItem
                                        Text="Select Category"
                                        Value="">
                                    </asp:ListItem>

                                    <asp:ListItem
                                        Text="Electronics"
                                        Value="Electronics">
                                    </asp:ListItem>

                                    <asp:ListItem
                                        Text="Grocery"
                                        Value="Grocery">
                                    </asp:ListItem>

                                    <asp:ListItem
                                        Text="Clothing"
                                        Value="Clothing">
                                    </asp:ListItem>

                                    <asp:ListItem
                                        Text="Furniture"
                                        Value="Furniture">
                                    </asp:ListItem>

                                    <asp:ListItem
                                        Text="Stationery"
                                        Value="Stationery">
                                    </asp:ListItem>

                                    <asp:ListItem
                                        Text="Hardware"
                                        Value="Hardware">
                                    </asp:ListItem>

                                    <asp:ListItem
                                        Text="Cosmetics"
                                        Value="Cosmetics">
                                    </asp:ListItem>

                                    <asp:ListItem
                                        Text="Healthcare"
                                        Value="Healthcare">
                                    </asp:ListItem>

                                    <asp:ListItem
                                        Text="Automobile"
                                        Value="Automobile">
                                    </asp:ListItem>

                                    <asp:ListItem
                                        Text="Sports"
                                        Value="Sports">
                                    </asp:ListItem>

                                    <asp:ListItem
                                        Text="Other"
                                        Value="Other">
                                    </asp:ListItem>

                                </asp:DropDownList>

                            </div>


                            <!-- Empty third column -->

                            <div></div>


                            <!-- =================================
                                 ROW 3
                                 Contact | Email ID | Address
                            ================================== -->

                            <div class="form-group">

                                <label class="form-label">
                                    Contact
                                </label>

                                <asp:TextBox
                                    ID="txtContact"
                                    runat="server"
                                    CssClass="form-control"
                                    TextMode="Phone">
                                </asp:TextBox>

                            </div>


                            <div class="form-group">

                                <label class="form-label">
                                    Email ID
                                </label>

                                <asp:TextBox
                                    ID="txtEmail"
                                    runat="server"
                                    CssClass="form-control"
                                    TextMode="Email">
                                </asp:TextBox>

                            </div>


                            <div class="form-group">

                                <label class="form-label">
                                    Address
                                </label>

                                <asp:TextBox
                                    ID="txtAddress"
                                    runat="server"
                                    CssClass="form-control address-control"
                                    TextMode="MultiLine">
                                </asp:TextBox>

                            </div>


                            <!-- =================================
                                 ROW 4
                                 User ID | Password | Empty
                            ================================== -->

                            <div class="form-group">

                                <label class="form-label">
                                    User ID
                                </label>

                                <asp:TextBox
                                    ID="txtUserId"
                                    runat="server"
                                    CssClass="form-control">
                                </asp:TextBox>

                            </div>


                            <div class="form-group">

                                <label class="form-label">
                                    Password
                                </label>

                                <asp:TextBox
                                    ID="txtPassword"
                                    runat="server"
                                    CssClass="form-control"
                                    TextMode="Password">
                                </asp:TextBox>

                            </div>


                            <!-- Empty third column -->

                            <div></div>

                        </div>


                        <!-- =================================
                             BUTTONS
                        ================================== -->

                        <div class="button-area">

                            <asp:Button
                                ID="btnUpdate"
                                runat="server"
                                Text="Update Supplier"
                                CssClass="btn btn-update"
                                OnClick="btnUpdate_Click" />

                            <asp:Button
                                ID="btnCancel"
                                runat="server"
                                Text="Delete Supplier"
                                CssClass="btn btn-delete"
                                OnClick="btnCancel_Click"
                                OnClientClick="return confirm('Are you sure you want to delete this supplier?');" />

                        </div>


                        <!-- MESSAGE -->

                        <asp:Label
                            ID="lblMessage"
                            runat="server"
                            CssClass="message">
                        </asp:Label>

                    </div>


                    <!-- =================================
                         FOOTER
                    ================================== -->

                    <div class="form-footer">

                        Supplier information is managed through the
                        Inventory Management System.

                    </div>

                </div>

            </div>


            <!-- =====================================
                 RIGHT SIDE BOXES
            ====================================== -->

            <div class="side-boxes">

                <div class="side-box">

                    <div class="side-box-icon">
                        <i class="fa-solid fa-boxes-stacked"></i>
                    </div>

                    <h3>Product Category</h3>

                    <p>
                        Select the category that represents
                        the supplier's products.
                    </p>

                </div>


                <div class="side-box">

                    <div class="side-box-icon">
                        <i class="fa-solid fa-shield-halved"></i>
                    </div>

                    <h3>Account Security</h3>

                    <p>
                        Keep the supplier User ID and password
                        updated for secure access.
                    </p>

                </div>

            </div>


        </div>

    </div>

</asp:Content>
