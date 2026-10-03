<%@ Page Title="Add New Supplier"
    Language="C#"
    MasterPageFile="~/Supplier_Module/Supplier_Module.Master"
    AutoEventWireup="true"
    CodeBehind="Supplier_AddNew.aspx.cs"
    Inherits="Inventory_Management_System.Supplier_AddNew" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <!-- Font Awesome -->
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />

    <style type="text/css">

        /* =========================================================
           GLOBAL BOX SIZING
        ========================================================= */

        * {
            box-sizing: border-box;
        }


        /* =========================================================
           PAGE WRAPPER
        ========================================================= */

        .supplier-page-wrapper {
            position: relative;
            width: 100%;
            min-height: 100vh;
            padding: 1px 0 50px;
            font-family: "Segoe UI", Arial, sans-serif;
            background: #f6f8fa;
            overflow-x: hidden;
        }


        /* =========================================================
           MAIN FORM CONTAINER
        ========================================================= */

        .form-container {
            position: relative;
            z-index: 5;

            width: calc(100% - 620px);
            max-width: 920px;
            min-width: 650px;

            margin: 32px auto 40px;

            padding: 30px 35px;

            background: #ffffff;

            border: 1px solid #e1e7ec;
            border-radius: 14px;

            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.06);
        }


        /* =========================================================
           FORM HEADER
        ========================================================= */

        .form-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .form-header h1 {
            margin: 0;

            font-size: 27px;
            font-weight: 700;

            color: #243746;
        }

        .form-header h1 i {
            margin-right: 8px;
            color: #2c5364;
        }

        .form-header p {
            margin: 8px 0 0;

            font-size: 13px;
            color: #7b8790;
        }


        /* =========================================================
           THREE COLUMN FORM ROW
        ========================================================= */

        .form-row {
            display: grid;

            grid-template-columns:
                repeat(3, minmax(0, 1fr));

            gap: 22px;

            margin-bottom: 24px;
        }


        /* =========================================================
           FORM GROUP
        ========================================================= */

        .form-group {
            width: 100%;
            min-width: 0;
        }

        .form-group label {
            display: block;

            margin-bottom: 8px;

            font-size: 13px;
            font-weight: 600;

            color: #354854;
        }

        .form-group label i {
            width: 18px;

            margin-right: 5px;

            color: #2c5364;
        }


        /* =========================================================
           INPUT / DROPDOWN
        ========================================================= */

        .form-control {
            display: block;

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
                box-shadow 0.2s ease,
                background 0.2s ease;
        }

        .form-control:focus {
            border-color: #2c5364;

            box-shadow:
                0 0 0 3px rgba(44, 83, 100, 0.08);
        }

        .form-control::placeholder {
            color: #a2abb1;
        }


        /* =========================================================
           READ ONLY
        ========================================================= */

        .form-control[readonly] {
            background: #f5f7f8;
            color: #52616b;
            cursor: default;
        }


        /* =========================================================
           SELECT / DROPDOWN
        ========================================================= */

        select.form-control {
            cursor: pointer;
        }


        /* =========================================================
           GENDER
        ========================================================= */

        .gender-options {
            min-height: 43px;

            display: flex;

            align-items: center;

            gap: 15px;

            padding: 0 5px;
        }

        .gender-options label {
            display: inline-flex;

            align-items: center;

            margin: 0;

            font-size: 13px;
            font-weight: 500;

            color: #4a5962;

            cursor: pointer;
        }

        .gender-options input {
            margin: 0 5px 0 0;
            cursor: pointer;
        }


        /* =========================================================
           ADDRESS
        ========================================================= */

        .address-box {
            height: 75px !important;

            min-height: 75px;

            padding: 10px 12px !important;

            resize: vertical;

            line-height: 1.5;
        }


        /* =========================================================
           SECTION TITLE
        ========================================================= */

        .section-title {
            display: flex;

            align-items: center;

            margin: 30px 0 20px;

            padding-bottom: 9px;

            border-bottom: 1px solid #e5eaee;

            color: #2c5364;

            font-size: 15px;
            font-weight: 700;
        }

        .section-title i {
            margin-right: 8px;
        }


        /* =========================================================
           EMPTY COLUMN
        ========================================================= */

        .empty-field {
            visibility: hidden;
        }


        /* =========================================================
           BUTTON AREA
        ========================================================= */

        .button-area {
            display: flex;

            justify-content: center;

            margin-top: 30px;

            padding-top: 22px;

            border-top: 1px solid #e5eaee;
        }


        /* =========================================================
           SAVE BUTTON
        ========================================================= */

        .save-button {
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

            transition:
                background 0.2s ease,
                transform 0.2s ease,
                box-shadow 0.2s ease;
        }

        .save-button:hover {
            background: #203e4b;

            transform: translateY(-1px);

            box-shadow:
                0 5px 12px rgba(44, 83, 100, 0.20);
        }

        .save-button:active {
            transform: translateY(0);
        }


        /* =========================================================
           SIDE BOX CONTAINER
        ========================================================= */

        .supplier-side-boxes {
            position: absolute;

            top: 55px;

            width: 260px;

            display: flex;

            flex-direction: column;

            gap: 35px;

            z-index: 2;
        }


        /* =========================================================
           LEFT SIDE BOXES
        ========================================================= */

        .supplier-side-boxes.left {
            left: 30px;
        }


        /* =========================================================
           RIGHT SIDE BOXES
        ========================================================= */

        .supplier-side-boxes.right {
            right: 30px;
        }


        /* =========================================================
           SIDE BOX
        ========================================================= */

        .supplier-side-box {
            width: 260px;
            height: 260px;

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
                0 5px 20px rgba(0, 0, 0, 0.07);

            transition:
                transform 0.25s ease,
                border-color 0.25s ease,
                box-shadow 0.25s ease;
        }


        /* =========================================================
           SIDE BOX HOVER
        ========================================================= */

        .supplier-side-box:hover {
            transform: translateY(-6px);

            border-color: #2c5364;

            box-shadow:
                0 12px 28px rgba(44, 83, 100, 0.15);
        }


        /* =========================================================
           SIDE BOX ICON
        ========================================================= */

        .supplier-side-icon {
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

        .supplier-side-box h3 {
            margin: 0 0 12px;

            font-size: 20px;

            font-weight: 700;

            color: #273842;
        }


        /* =========================================================
           SIDE BOX DESCRIPTION
        ========================================================= */

        .supplier-side-box p {
            margin: 0;

            max-width: 205px;

            font-size: 13px;

            line-height: 1.7;

            color: #74818a;
        }


        /* =========================================================
           LARGE DESKTOP
        ========================================================= */

        @media (min-width: 1500px) {

            .supplier-side-boxes {
                width: 285px;
                gap: 40px;
            }

            .supplier-side-boxes.left {
                left: 45px;
            }

            .supplier-side-boxes.right {
                right: 45px;
            }

            .supplier-side-box {
                width: 285px;
                height: 280px;

                padding: 35px 30px;
            }

            .supplier-side-icon {
                width: 78px;
                height: 78px;

                font-size: 32px;
            }

            .supplier-side-box h3 {
                font-size: 21px;
            }

            .supplier-side-box p {
                max-width: 220px;
                font-size: 13px;
            }

            .form-container {
                width: calc(100% - 700px);
                max-width: 920px;
            }
        }


        /* =========================================================
           MEDIUM DESKTOP
        ========================================================= */

        @media (max-width: 1499px) and (min-width: 1201px) {

            .supplier-side-boxes {
                width: 230px;
                gap: 30px;
            }

            .supplier-side-boxes.left {
                left: 20px;
            }

            .supplier-side-boxes.right {
                right: 20px;
            }

            .supplier-side-box {
                width: 230px;
                height: 235px;

                padding: 25px 20px;
            }

            .supplier-side-icon {
                width: 62px;
                height: 62px;

                font-size: 26px;

                margin-bottom: 15px;
            }

            .supplier-side-box h3 {
                font-size: 18px;
            }

            .supplier-side-box p {
                max-width: 190px;

                font-size: 12px;

                line-height: 1.6;
            }

            .form-container {
                width: calc(100% - 520px);
                max-width: 920px;
            }
        }


        /* =========================================================
           SMALL DESKTOP
        ========================================================= */

        @media (max-width: 1200px) and (min-width: 1051px) {

            .supplier-side-boxes {
                width: 180px;

                gap: 25px;
            }

            .supplier-side-boxes.left {
                left: 10px;
            }

            .supplier-side-boxes.right {
                right: 10px;
            }

            .supplier-side-box {
                width: 180px;
                height: 205px;

                padding: 20px 15px;
            }

            .supplier-side-icon {
                width: 55px;
                height: 55px;

                font-size: 23px;

                margin-bottom: 13px;
            }

            .supplier-side-box h3 {
                font-size: 16px;

                margin-bottom: 8px;
            }

            .supplier-side-box p {
                max-width: 155px;

                font-size: 11px;

                line-height: 1.5;
            }

            .form-container {
                width: calc(100% - 410px);
                max-width: 900px;

                padding: 28px 30px;
            }

            .form-row {
                gap: 15px;
            }
        }


        /* =========================================================
           TABLET
        ========================================================= */

        @media (max-width: 1050px) {

            .supplier-side-boxes {
                display: none;
            }

            .form-container {
                width: 90%;

                min-width: 0;

                max-width: 920px;

                margin: 30px auto;

                padding: 28px;
            }
        }


        /* =========================================================
           SMALL TABLET
        ========================================================= */

        @media (max-width: 900px) {

            .form-container {
                width: 92%;

                padding: 26px;
            }

            .form-row {
                grid-template-columns: repeat(2, minmax(0, 1fr));

                gap: 20px;
            }

            .empty-field {
                display: none;
            }
        }


        /* =========================================================
           MOBILE
        ========================================================= */

        @media (max-width: 600px) {

            .supplier-page-wrapper {
                padding-bottom: 30px;
            }

            .form-container {
                width: 94%;

                margin: 20px auto;

                padding: 22px 18px;

                border-radius: 12px;
            }

            .form-header {
                margin-bottom: 25px;
            }

            .form-header h1 {
                font-size: 23px;
            }

            .form-header p {
                font-size: 12px;
            }

            .form-row {
                grid-template-columns: 1fr;

                gap: 18px;

                margin-bottom: 18px;
            }

            .gender-options {
                justify-content: flex-start;
            }

            .section-title {
                margin-top: 25px;
            }

            .button-area {
                margin-top: 25px;
            }

            .save-button {
                width: 100%;
                min-width: 0;
            }
        }


        /* =========================================================
           VERY SMALL MOBILE
        ========================================================= */

        @media (max-width: 400px) {

            .form-container {
                width: 96%;

                padding: 20px 14px;
            }

            .form-header h1 {
                font-size: 21px;
            }

            .gender-options {
                gap: 10px;
            }

            .gender-options label {
                font-size: 12px;
            }
        }

    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="supplier-page-wrapper">


        <!-- =====================================================
             LEFT SIDE BOXES
        ====================================================== -->

        <div class="supplier-side-boxes left">


            <!-- BOX 1 -->

            <div class="supplier-side-box">

                <div class="supplier-side-icon">
                    <i class="fa-solid fa-users"></i>
                </div>

                <h3>Supplier Management</h3>

                <p>
                    Manage supplier information, contact details
                    and supplier records from one place.
                </p>

            </div>


            <!-- BOX 2 -->

            <div class="supplier-side-box">

                <div class="supplier-side-icon">
                    <i class="fa-solid fa-handshake"></i>
                </div>

                <h3>Supplier Network</h3>

                <p>
                    Maintain reliable supplier relationships
                    for smooth inventory operations.
                </p>

            </div>

        </div>



        <!-- =====================================================
             RIGHT SIDE BOXES
        ====================================================== -->

        <div class="supplier-side-boxes right">


            <!-- BOX 3 -->

            <div class="supplier-side-box">

                <div class="supplier-side-icon">
                    <i class="fa-solid fa-boxes-stacked"></i>
                </div>

                <h3>Product Supply</h3>

                <p>
                    Organize suppliers according to the products
                    and categories they provide.
                </p>

            </div>


            <!-- BOX 4 -->

            <div class="supplier-side-box">

                <div class="supplier-side-icon">
                    <i class="fa-solid fa-cart-shopping"></i>
                </div>

                <h3>Purchase Management</h3>

                <p>
                    Connect suppliers with purchasing and
                    inventory management activities.
                </p>

            </div>

        </div>



        <!-- =====================================================
             MAIN FORM
        ====================================================== -->

        <div class="form-container">


            <!-- =================================================
                 HEADER
            ================================================== -->

            <div class="form-header">

                <h1>
                    <i class="fa-solid fa-user-plus"></i>
                    Add New Supplier
                </h1>

                <p>
                    Enter supplier information and account details
                </p>

            </div>



            <!-- =================================================
                 ROW 1
                 Supplier ID | Supplier Name | Supplier Age
            ================================================== -->

            <div class="form-row">


                <!-- Supplier ID -->

                <div class="form-group">

                    <label>
                        <i class="fa-solid fa-id-card"></i>
                        Supplier ID
                    </label>

                    <asp:TextBox
                        ID="lblSupplierID"
                        runat="server"
                        CssClass="form-control"
                        ReadOnly="true">
                    </asp:TextBox>

                </div>


                <!-- Supplier Name -->

                <div class="form-group">

                    <label>
                        <i class="fa-solid fa-user"></i>
                        Supplier Name
                    </label>

                    <asp:TextBox
                        ID="TextBox2"
                        runat="server"
                        CssClass="form-control"
                        placeholder="Enter supplier name">
                    </asp:TextBox>

                </div>


                <!-- Supplier Age -->

                <div class="form-group">

                    <label>
                        <i class="fa-solid fa-calendar-days"></i>
                        Supplier Age
                    </label>

                    <asp:TextBox
                        ID="TextBox3"
                        runat="server"
                        CssClass="form-control"
                        TextMode="Number"
                        placeholder="Enter age">
                    </asp:TextBox>

                </div>

            </div>



            <!-- =================================================
                 ROW 2
                 Gender | Product Category | Registration Date
            ================================================== -->

            <div class="form-row">


                <!-- Gender -->

                <div class="form-group">

                    <label>
                        <i class="fa-solid fa-venus-mars"></i>
                        Gender
                    </label>

                    <div class="gender-options">

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


                <!-- Product Category -->

                <div class="form-group">

                    <label>
                        <i class="fa-solid fa-layer-group"></i>
                        Product Category
                    </label>

                    <asp:DropDownList
                        ID="ddlProductCategory"
                        runat="server"
                        CssClass="form-control">

                        <asp:ListItem Value="">
                            Select Category
                        </asp:ListItem>

                        <asp:ListItem Value="Electronics">
                            Electronics
                        </asp:ListItem>

                        <asp:ListItem Value="Grocery">
                            Grocery
                        </asp:ListItem>

                        <asp:ListItem Value="Clothing">
                            Clothing &amp; Fashion
                        </asp:ListItem>

                        <asp:ListItem Value="Furniture">
                            Furniture
                        </asp:ListItem>

                        <asp:ListItem Value="Stationery">
                            Stationery
                        </asp:ListItem>

                        <asp:ListItem Value="Hardware">
                            Hardware
                        </asp:ListItem>

                        <asp:ListItem Value="Cosmetics">
                            Cosmetics &amp; Personal Care
                        </asp:ListItem>

                        <asp:ListItem Value="Healthcare">
                            Medicines &amp; Healthcare
                        </asp:ListItem>

                        <asp:ListItem Value="Automobile">
                            Automobile Parts
                        </asp:ListItem>

                        <asp:ListItem Value="Sports">
                            Sports &amp; Fitness
                        </asp:ListItem>

                        <asp:ListItem Value="Other">
                            Other
                        </asp:ListItem>

                    </asp:DropDownList>

                </div>


                <!-- Registration Date -->

                <div class="form-group">

                    <label>
                        <i class="fa-solid fa-calendar-check"></i>
                        Date Of Registration
                    </label>

                    <asp:TextBox
                        ID="lblRegistrationDate"
                        runat="server"
                        CssClass="form-control"
                        ReadOnly="true">
                    </asp:TextBox>

                </div>

            </div>



            <!-- =================================================
                 CONTACT DETAILS
            ================================================== -->

            <div class="section-title">

                <i class="fa-solid fa-address-book"></i>

                Contact Details

            </div>



            <!-- =================================================
                 ROW 3
                 Contact | Email | Address
            ================================================== -->

            <div class="form-row">


                <!-- Contact Number -->

                <div class="form-group">

                    <label>
                        <i class="fa-solid fa-phone"></i>
                        Contact Number
                    </label>

                    <asp:TextBox
                        ID="TextBox4"
                        runat="server"
                        CssClass="form-control"
                        TextMode="Phone"
                        placeholder="Enter contact number">
                    </asp:TextBox>

                </div>


                <!-- Email Address -->

                <div class="form-group">

                    <label>
                        <i class="fa-solid fa-envelope"></i>
                        Email Address
                    </label>

                    <asp:TextBox
                        ID="TextBox5"
                        runat="server"
                        CssClass="form-control"
                        TextMode="Email"
                        placeholder="Enter email address">
                    </asp:TextBox>

                </div>


                <!-- Address -->

                <div class="form-group">

                    <label>
                        <i class="fa-solid fa-location-dot"></i>
                        Address
                    </label>

                    <asp:TextBox
                        ID="TextBox6"
                        runat="server"
                        CssClass="form-control address-box"
                        TextMode="MultiLine"
                        Rows="3"
                        placeholder="Enter complete address">
                    </asp:TextBox>

                </div>

            </div>



            <!-- =================================================
                 ACCOUNT CREDENTIALS
            ================================================== -->

            <div class="section-title">

                <i class="fa-solid fa-lock"></i>

                Account Credentials

            </div>



            <!-- =================================================
                 ROW 4
                 User ID | Password | Empty
            ================================================== -->

            <div class="form-row">


                <!-- User ID -->

                <div class="form-group">

                    <label>
                        <i class="fa-solid fa-user-lock"></i>
                        User ID
                    </label>

                    <asp:TextBox
                        ID="TextBox7"
                        runat="server"
                        CssClass="form-control"
                        placeholder="Create user ID">
                    </asp:TextBox>

                </div>


                <!-- Password -->

                <div class="form-group">

                    <label>
                        <i class="fa-solid fa-key"></i>
                        Password
                    </label>

                    <asp:TextBox
                        ID="TextBox8"
                        runat="server"
                        CssClass="form-control"
                        TextMode="Password"
                        placeholder="Create password">
                    </asp:TextBox>

                </div>


                <!-- Empty Column -->

                <div class="form-group empty-field">
                </div>

            </div>



            <!-- =================================================
                 SAVE BUTTON
            ================================================== -->

            <div class="button-area">

                <asp:Button
                    ID="Button1"
                    runat="server"
                    Text="Save Supplier Details"
                    CssClass="save-button"
                    OnClick="Button1_Click1" />

            </div>


        </div>

    </div>

</asp:Content>