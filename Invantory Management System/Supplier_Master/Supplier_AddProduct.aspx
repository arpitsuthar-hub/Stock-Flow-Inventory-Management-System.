<%@ Page Title="Add Product"
    Language="C#"
    MasterPageFile="~/Supplier_Master/Supplier.Master"
    AutoEventWireup="true"
    CodeBehind="Supplier_AddProduct.aspx.cs"
    Inherits="Inventory_Management_System.Supplier_Master.Supplier_AddProduct" %>


<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">


    <!-- =========================================================
         FONT AWESOME
         ========================================================= -->

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />


    <style type="text/css">

        /* =========================================================
           MAIN PAGE LAYOUT
           ========================================================= */

        .supplier-product-layout {

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
           MAIN CONTENT
           ========================================================= */

        .product-main-container {

            width: 100%;

            max-width: 900px;

            min-width: 0;

            color: #1f2937;

        }


        /* =========================================================
           SIDE BOXES
           ========================================================= */

        .product-side-boxes {

            width: 205px;

            display: flex;

            flex-direction: column;

            gap: 24px;

            flex-shrink: 0;

        }


        .product-side-boxes.left,
        .product-side-boxes.right {

            margin-top: 88px;

        }


        /* =========================================================
           SIDE INFORMATION BOX
           ========================================================= */

        .product-side-box {

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
           TOP ACCENT
           ========================================================= */

        .product-side-box::before {

            content: "";

            position: absolute;

            top: 0;

            left: 0;

            right: 0;

            height: 3px;

            background: #2c5364;

        }


        /* =========================================================
           HOVER
           ========================================================= */

        .product-side-box:hover {

            transform: translateY(-4px);

            border-color: #ccdadd;

            box-shadow:
                0 9px 22px rgba(31, 41, 55, 0.09);

        }


        /* =========================================================
           SIDE ICON
           ========================================================= */

        .product-side-icon {

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


        .product-side-box:hover .product-side-icon {

            background: #2c5364;

            color: #ffffff;

            border-color: #2c5364;

        }


        /* =========================================================
           SIDE TITLE
           ========================================================= */

        .product-side-box h3 {

            margin: 0 0 9px 0;

            color: #26313a;

            font-size: 14px;

            font-weight: 650;

            line-height: 1.4;

        }


        /* =========================================================
           SIDE DESCRIPTION
           ========================================================= */

        .product-side-box p {

            margin: 0;

            color: #737d86;

            font-size: 11px;

            line-height: 1.65;

        }


        /* =========================================================
           PAGE HEADER
           ========================================================= */

        .page-header {

            display: flex;

            justify-content: space-between;

            align-items: center;

            margin-bottom: 24px;

        }


        /* =========================================================
           HEADER LEFT
           ========================================================= */

        .page-header-left {

            display: flex;

            align-items: center;

            gap: 14px;

        }


        /* =========================================================
           HEADER ICON
           ========================================================= */

        .page-header-icon {

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

            flex-shrink: 0;

        }


        /* =========================================================
           PAGE TITLE
           ========================================================= */

        .page-title {

            margin: 0 0 4px 0;

            font-size: 25px;

            font-weight: 650;

            color: #17212b;

            letter-spacing: -0.4px;

        }


        /* =========================================================
           PAGE SUBTITLE
           ========================================================= */

        .page-subtitle {

            margin: 0;

            font-size: 13px;

            color: #6b7280;

        }


        /* =========================================================
           STATUS
           ========================================================= */

        .page-status {

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

            white-space: nowrap;

        }


        .page-status-dot {

            width: 7px;

            height: 7px;

            background: #2c5364;

            border-radius: 50%;

        }


        /* =========================================================
           PRODUCT CARD
           ========================================================= */

        .product-card {

            position: relative;

            background: #ffffff;

            border: 1px solid #e3e8eb;

            border-radius: 12px;

            padding: 30px;

            box-shadow:
                0 4px 14px rgba(31, 41, 55, 0.055);

        }


        /* =========================================================
           CARD LEFT ACCENT
           ========================================================= */

        .product-card::before {

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
           FORM HEADER
           ========================================================= */

        .form-title {

            display: flex;

            align-items: center;

            gap: 9px;

            margin-bottom: 25px;

            padding-bottom: 14px;

            color: #2c5364;

            font-size: 13px;

            font-weight: 700;

            text-transform: uppercase;

            letter-spacing: 0.7px;

            border-bottom: 1px solid #e5e7eb;

        }


        .form-title i {

            font-size: 13px;

        }


        /* =========================================================
           FORM ROW
           ========================================================= */

        .form-row {

            display: flex;

            gap: 22px;

            margin-bottom: 20px;

        }


        /* =========================================================
           FORM GROUP
           ========================================================= */

        .form-group {

            flex: 1;

            min-width: 0;

        }


        .form-group.full {

            width: 100%;

        }


        /* =========================================================
           LABEL
           ========================================================= */

        .form-label {

            display: block;

            margin-bottom: 7px;

            font-size: 12px;

            font-weight: 600;

            color: #374151;

        }


        /* =========================================================
           REQUIRED
           ========================================================= */

        .required {

            color: #c0392b;

            margin-left: 2px;

        }


        /* =========================================================
           INPUT / SELECT
           ========================================================= */

        .form-control {

            width: 100%;

            height: 42px;

            box-sizing: border-box;

            padding: 10px 13px;

            background: #ffffff;

            border: 1px solid #d8dee2;

            border-radius: 7px;

            font-family: "Segoe UI", Arial, sans-serif;

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


        /* =========================================================
           NUMBER INPUT
           ========================================================= */

        .form-control[type="number"] {

            appearance: textfield;

            -moz-appearance: textfield;

        }


        .form-control[type="number"]::-webkit-inner-spin-button,
        .form-control[type="number"]::-webkit-outer-spin-button {

            opacity: 0.6;

        }


        /* =========================================================
           BUTTON SECTION
           ========================================================= */

        .button-section {

            display: flex;

            justify-content: flex-end;

            align-items: center;

            gap: 10px;

            margin-top: 30px;

            padding-top: 22px;

            border-top: 1px solid #e5e7eb;

        }


        /* =========================================================
           COMMON BUTTON
           ========================================================= */

        .btn {

            min-width: 135px;

            height: 40px;

            padding: 0 18px;

            border-radius: 7px;

            font-family: "Segoe UI", Arial, sans-serif;

            font-size: 12px;

            font-weight: 600;

            cursor: pointer;

            transition: all 0.18s ease;

        }


        /* =========================================================
           CLEAR BUTTON
           ========================================================= */

        .btn-clear {

            background: #ffffff;

            color: #4b5563;

            border: 1px solid #d7dde0;

        }


        .btn-clear:hover {

            background: #f4f6f7;

            border-color: #c7d0d4;

            color: #263238;

            transform: translateY(-1px);

        }


        /* =========================================================
           ADD PRODUCT BUTTON
           ========================================================= */

        .btn-add {

            background: #2c5364;

            color: #ffffff;

            border: 1px solid #2c5364;

        }


        .btn-add:hover {

            background: #203a43;

            border-color: #203a43;

            transform: translateY(-1px);

            box-shadow:
                0 4px 10px rgba(44, 83, 100, 0.16);

        }


        /* =========================================================
           MESSAGE
           ========================================================= */

        .message {

            display: block;

            margin-top: 18px;

            text-align: center;

            font-size: 12px;

            font-weight: 600;

        }


        .success {

            color: #1e8449;

        }


        .error {

            color: #c0392b;

        }


        /* =========================================================
           HELPER TEXT
           ========================================================= */

        .field-note {

            display: block;

            margin-top: 5px;

            color: #929aa1;

            font-size: 10px;

        }


        /* =========================================================
           RESPONSIVE - 1250px
           ========================================================= */

        @media (max-width: 1250px) {

            .product-side-boxes {

                width: 185px;

            }

            .supplier-product-layout {

                gap: 18px;

            }

        }


        /* =========================================================
           RESPONSIVE - 1100px
           ========================================================= */

        @media (max-width: 1100px) {

            .product-side-boxes {

                display: none;

            }


            .supplier-product-layout {

                display: block;

                padding-left: 20px;

                padding-right: 20px;

            }


            .supplier-product-layout .product-main-container {

                max-width: 950px;

                margin: 0 auto;

            }

        }


        /* =========================================================
           RESPONSIVE - 768px
           ========================================================= */

        @media (max-width: 768px) {

            .supplier-product-layout {

                padding-left: 15px;

                padding-right: 15px;

            }


            .page-header {

                align-items: flex-start;

            }


            .page-status {

                display: none;

            }


            .product-card {

                padding: 24px 20px;

            }


            .form-row {

                flex-direction: column;

                gap: 0;

                margin-bottom: 0;

            }


            .form-group {

                margin-bottom: 20px;

            }


            .button-section {

                justify-content: center;

            }

        }


        /* =========================================================
           RESPONSIVE - 450px
           ========================================================= */

        @media (max-width: 450px) {

            .supplier-product-layout {

                padding-left: 10px;

                padding-right: 10px;

            }


            .page-title {

                font-size: 21px;

            }


            .page-subtitle {

                font-size: 12px;

            }


            .page-header-icon {

                width: 42px;

                height: 42px;

                font-size: 17px;

            }


            .product-card {

                padding: 20px 16px;

            }


            .button-section {

                flex-direction: column;

                align-items: stretch;

            }


            .btn {

                width: 100%;

            }

        }

    </style>

</asp:Content>



<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">


    <!-- =========================================================
         MAIN PRODUCT PAGE
         ========================================================= -->

    <div class="supplier-product-layout">


        <!-- =====================================================
             LEFT SIDE BOXES
             ===================================================== -->

        <div class="product-side-boxes left">


            <!-- PRODUCT MANAGEMENT -->

            <div class="product-side-box">

                <div class="product-side-icon">

                    <i class="fa-solid fa-boxes-stacked"></i>

                </div>

                <h3>
                    Product Management
                </h3>

                <p>
                    Add and maintain the products
                    supplied to the inventory.
                </p>

            </div>



            <!-- PRODUCT DETAILS -->

            <div class="product-side-box">

                <div class="product-side-icon">

                    <i class="fa-solid fa-circle-info"></i>

                </div>

                <h3>
                    Product Details
                </h3>

                <p>
                    Enter accurate product name,
                    brand and unit information.
                </p>

            </div>


        </div>



        <!-- =====================================================
             MAIN CONTENT
             ===================================================== -->

        <div class="product-main-container">


            <!-- =================================================
                 PAGE HEADER
                 ================================================= -->

            <div class="page-header">


                <div class="page-header-left">


                    <div class="page-header-icon">

                        <i class="fa-solid fa-box"></i>

                    </div>


                    <div>

                        <div class="page-title">

                            Add Product

                        </div>


                        <div class="page-subtitle">

                            Add a product that you supply to the inventory system.

                        </div>

                    </div>


                </div>


                <div class="page-status">

                    <span class="page-status-dot"></span>

                    New Product

                </div>


            </div>



            <!-- =================================================
                 PRODUCT FORM CARD
                 ================================================= -->

            <div class="product-card">


                <!-- FORM TITLE -->

                <div class="form-title">

                    <i class="fa-solid fa-box-open"></i>

                    Product Information

                </div>



                <!-- =================================================
                     PRODUCT NAME
                     ================================================= -->

                <div class="form-row">


                    <div class="form-group full">


                        <label class="form-label">

                            Name Of Product

                            <span class="required">*</span>

                        </label>


                        <asp:TextBox
                            ID="txtProductName"
                            runat="server"
                            CssClass="form-control"
                            placeholder="Enter product name">
                        </asp:TextBox>


                    </div>


                </div>



                <!-- =================================================
                     BRAND + UNIT
                     ================================================= -->

                <div class="form-row">


                    <!-- BRAND -->

                    <div class="form-group">


                        <label class="form-label">

                            Brand

                            <span class="required">*</span>

                        </label>


                        <asp:TextBox
                            ID="txtBrand"
                            runat="server"
                            CssClass="form-control"
                            placeholder="Enter brand name">
                        </asp:TextBox>


                    </div>



                    <!-- UNIT -->

                    <div class="form-group">


                        <label class="form-label">

                            Unit

                            <span class="required">*</span>

                        </label>


                        <asp:DropDownList
                            ID="ddlUnit"
                            runat="server"
                            CssClass="form-control">


                            <asp:ListItem
                                Text="Select Unit"
                                Value="">
                            </asp:ListItem>


                            <asp:ListItem
                                Text="Piece"
                                Value="Piece">
                            </asp:ListItem>


                            <asp:ListItem
                                Text="Box"
                                Value="Box">
                            </asp:ListItem>


                            <asp:ListItem
                                Text="Packet"
                                Value="Packet">
                            </asp:ListItem>


                            <asp:ListItem
                                Text="Kg"
                                Value="Kg">
                            </asp:ListItem>


                            <asp:ListItem
                                Text="Gram"
                                Value="Gram">
                            </asp:ListItem>


                            <asp:ListItem
                                Text="Liter"
                                Value="Liter">
                            </asp:ListItem>


                            <asp:ListItem
                                Text="Meter"
                                Value="Meter">
                            </asp:ListItem>


                            <asp:ListItem
                                Text="Dozen"
                                Value="Dozen">
                            </asp:ListItem>


                        </asp:DropDownList>


                    </div>


                </div>



                <!-- =================================================
                     QUANTITY + SELLING PRICE
                     ================================================= -->

                <div class="form-row">


                    <!-- QUANTITY -->

                    <div class="form-group">


                        <label class="form-label">

                            Quantity

                            <span class="required">*</span>

                        </label>


                        <asp:TextBox
                            ID="txtQuantity"
                            runat="server"
                            CssClass="form-control"
                            TextMode="Number"
                            placeholder="Enter quantity">
                        </asp:TextBox>


                        <span class="field-note">

                            Enter the quantity supplied.

                        </span>


                    </div>



                    <!-- SELLING PRICE -->

                    <div class="form-group">


                        <label class="form-label">

                            Selling Price

                            <span class="required">*</span>

                        </label>


                        <asp:TextBox
                            ID="txtSellingPrice"
                            runat="server"
                            CssClass="form-control"
                            TextMode="Number"
                            placeholder="Enter selling price">
                        </asp:TextBox>


                        <span class="field-note">

                            Enter the price per selected unit.

                        </span>


                    </div>


                </div>



                <!-- =================================================
                     BUTTONS
                     ================================================= -->

                <div class="button-section">


                    <!-- CLEAR -->

                    <asp:Button
                        ID="btnClear"
                        runat="server"
                        Text="Clear"
                        CssClass="btn btn-clear"
                        CausesValidation="false"
                        OnClick="btnClear_Click" />



                    <!-- ADD PRODUCT -->

                    <asp:Button
                        ID="btnAddProduct"
                        runat="server"
                        Text="Add Product"
                        CssClass="btn btn-add"
                        OnClick="btnAddProduct_Click" />


                </div>



                <!-- =================================================
                     MESSAGE
                     ================================================= -->

                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="message">
                </asp:Label>


            </div>


        </div>



        <!-- =====================================================
             RIGHT SIDE BOXES
             ===================================================== -->

        <div class="product-side-boxes right">


            <!-- STOCK INFORMATION -->

            <div class="product-side-box">

                <div class="product-side-icon">

                    <i class="fa-solid fa-chart-column"></i>

                </div>

                <h3>
                    Stock Information
                </h3>

                <p>
                    Quantity information helps keep
                    supplier stock records updated.
                </p>

            </div>



            <!-- SUPPLIER INVENTORY -->

            <div class="product-side-box">

                <div class="product-side-icon">

                    <i class="fa-solid fa-truck-ramp-box"></i>

                </div>

                <h3>
                    Supplier Inventory
                </h3>

                <p>
                    Products added here become part
                    of your supplier product records.
                </p>

            </div>


        </div>


    </div>


</asp:Content>