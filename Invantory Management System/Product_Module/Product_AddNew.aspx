<%@ Page Title="Add New Products"
    Language="C#"
    MasterPageFile="~/Product_Module/Product_Module.Master"
    AutoEventWireup="true"
    CodeBehind="Product_AddNew.aspx.cs"
    Inherits="Inventory_Management_System.Product_Module.Product_AddNew" %>


<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style>

        /* =========================================================
           PAGE
        ========================================================= */

        .product-page {
            padding: 25px;
            background: #f5f7fb;
            min-height: calc(100vh - 70px);
        }


        .product-card {
            max-width: 1450px;
            margin: auto;
            background: #ffffff;
            border-radius: 14px;
            box-shadow: 0 5px 25px rgba(0,0,0,0.08);
            overflow: hidden;
        }


        /* =========================================================
           PAGE HEADER
        ========================================================= */

        .page-header {
            margin-bottom: 18px;
        }


        .page-header h1 {
            margin: 0;
            font-size: 24px;
            font-weight: 700;
            color: #1f2937;
        }


        .page-header p {
            margin: 6px 0 0;
            color: #6b7280;
            font-size: 14px;
        }


        /* =========================================================
           CARD HEADER
        ========================================================= */

        .card-header {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 22px 28px;
            border-bottom: 1px solid #e5e7eb;
        }


        .card-icon {
            width: 38px;
            height: 38px;
            border-radius: 8px;
            background: #e8f1ff;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #2563eb;
            font-size: 17px;
            flex-shrink: 0;
        }


        .card-header-text h2 {
            margin: 0;
            font-size: 17px;
            color: #1f2937;
            font-weight: 700;
        }


        .card-header-text p {
            margin: 4px 0 0;
            color: #9ca3af;
            font-size: 11px;
        }


        /* =========================================================
           FORM SECTION
        ========================================================= */

        .form-section {
            padding: 25px 28px;
        }


        .section-title {
            font-size: 17px;
            font-weight: 700;
            color: #1f2937;
            margin-bottom: 18px;
            padding-bottom: 10px;
            border-bottom: 1px solid #e5e7eb;
        }


        /* =========================================================
           FORM GRID
        ========================================================= */

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 18px 25px;
        }


        .form-grid-three {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 18px 20px;
        }


        .form-group {
            display: flex;
            flex-direction: column;
        }


        .form-group label {
            font-size: 13px;
            font-weight: 600;
            color: #374151;
            margin-bottom: 7px;
        }


        .required {
            color: #dc2626;
        }


        .form-control {
            width: 100%;
            box-sizing: border-box;
            height: 42px;
            padding: 0 12px;
            border: 1px solid #d1d5db;
            border-radius: 7px;
            font-size: 14px;
            color: #111827;
            background: #ffffff;
            outline: none;
        }


        .form-control:focus {
            border-color: #2563eb;
            box-shadow: 0 0 0 2px rgba(37,99,235,0.10);
        }


        .readonly-field {
            background: #f3f4f6;
            cursor: not-allowed;
        }


        .help-text {
            margin-top: 5px;
            color: #9ca3af;
            font-size: 10px;
        }


        /* =========================================================
           ADD PRODUCT BUTTON
        ========================================================= */

        .add-product-area {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            margin-top: 20px;
            padding-top: 18px;
            border-top: 1px solid #e5e7eb;
        }


        .btn-add {
            height: 40px;
            padding: 0 18px;
            border: 1px solid #2563eb;
            border-radius: 7px;
            background: #2563eb;
            color: #ffffff;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
        }


        .btn-add:hover {
            background: #1d4ed8;
            border-color: #1d4ed8;
        }


        /* =========================================================
           MESSAGE
        ========================================================= */

        .message {
            display: block;
            margin-top: 10px;
            font-size: 13px;
            font-weight: 600;
        }


        /* =========================================================
           ADDED PRODUCTS
        ========================================================= */

        .added-products-title {
            margin-top: 25px;
            margin-bottom: 0;
            padding-bottom: 10px;
            border-bottom: 1px solid #e5e7eb;
            font-size: 15px;
            font-weight: 700;
            color: #374151;
        }


        /* =========================================================
           PRODUCT TABLE
        ========================================================= */

        .product-table-wrapper {
            width: 100%;
            overflow-x: auto;
            border: 1px solid #e5e7eb;
            border-radius: 9px;
            margin-top: 10px;
        }


        .product-table {
            width: 100%;
            min-width: 1100px;
            border-collapse: collapse;
        }


        .product-table thead {
            background: #111111;
            color: #ffffff;
        }


        .product-table th {
            padding: 13px 10px;
            font-size: 12px;
            font-weight: 700;
            text-align: left;
            white-space: nowrap;
        }


        .product-table td {
            padding: 10px;
            border-bottom: 1px solid #e5e7eb;
            font-size: 13px;
            color: #374151;
            white-space: nowrap;
            vertical-align: middle;
        }


        .product-table tbody tr:last-child td {
            border-bottom: none;
        }


        .product-table tbody tr:hover {
            background: #f9fafb;
        }


        /* =========================================================
           DELETE BUTTON
        ========================================================= */

        .delete-btn {
            width: 35px;
            height: 35px;
            border: none;
            border-radius: 6px;
            background: #fee2e2;
            color: #dc2626;
            cursor: pointer;
            font-size: 17px;
            font-weight: bold;
        }


        .delete-btn:hover {
            background: #fecaca;
        }


        /* =========================================================
           BOTTOM ACTIONS
        ========================================================= */

        .bottom-buttons {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            gap: 10px;
            padding: 20px 28px;
            border-top: 1px solid #e5e7eb;
        }


        .btn-reset {
            height: 40px;
            padding: 0 18px;
            border: none;
            border-radius: 7px;
            background: #eef1f5;
            color: #374151;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
        }


        .btn-reset:hover {
            background: #e2e6eb;
        }


        .btn-save {
            min-width: 170px;
            height: 44px;
            padding: 0 25px;
            border: none;
            border-radius: 7px;
            background: #16a34a;
            color: #ffffff;
            font-size: 14px;
            font-weight: 700;
            cursor: pointer;
        }


        .btn-save:hover {
            background: #15803d;
        }


        /* =========================================================
           RESPONSIVE
        ========================================================= */

        @media (max-width: 900px) {

            .form-grid-three {
                grid-template-columns: 1fr;
            }

        }


        @media (max-width: 700px) {

            .product-page {
                padding: 15px;
            }


            .form-grid {
                grid-template-columns: 1fr;
            }


            .product-card {
                border-radius: 10px;
            }


            .form-section {
                padding: 20px;
            }


            .card-header {
                padding: 18px 20px;
            }


            .bottom-buttons {
                padding: 18px 20px;
                flex-direction: column;
                align-items: stretch;
            }


            .btn-reset,
            .btn-save {
                width: 100%;
            }

        }

    </style>

</asp:Content>



<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">


    <div class="product-page">


        <!-- =====================================================
             PAGE HEADER
        ====================================================== -->

        <div class="page-header">

            <h1>
                Add New Products
            </h1>

            <p>
                Select supplier and category, then add multiple products at once.
            </p>

        </div>



        <!-- =====================================================
             MAIN CARD
        ====================================================== -->

        <div class="product-card">


            <!-- =================================================
                 CARD HEADER
            ================================================== -->

            <div class="card-header">

                <div class="card-icon">

                    <i class="fa-solid fa-cube"></i>

                </div>


                <div class="card-header-text">

                    <h2>
                        Product Information
                    </h2>

                    <p>
                        Add multiple products for the selected supplier and category.
                    </p>

                </div>

            </div>



            <!-- =================================================
                 PRODUCT INFORMATION
            ================================================== -->

            <div class="form-section">


                <div class="section-title">
                    Product Information
                </div>



                <div class="form-grid">


                    <!-- PRODUCT ID -->

                    <div class="form-group">

                        <label>
                            Product ID
                        </label>


                        <asp:TextBox
                            ID="lblProductID"
                            runat="server"
                            CssClass="form-control readonly-field"
                            ReadOnly="true">
                        </asp:TextBox>


                        <span class="help-text">
                            Product ID is automatically generated.
                        </span>

                    </div>



                    <!-- PRODUCT DATE -->

                    <div class="form-group">

                        <label>
                            Product Date
                        </label>


                        <asp:TextBox
                            ID="lblProductDate"
                            runat="server"
                            CssClass="form-control readonly-field"
                            ReadOnly="true">
                        </asp:TextBox>


                        <span class="help-text">
                            Product date is automatically generated.
                        </span>

                    </div>


                </div>



                <!-- =================================================
                     SUPPLIER & CATEGORY
                ================================================== -->

                <div class="section-title"
                     style="margin-top:25px;">

                    Supplier &amp; Category

                </div>



                <div class="form-grid">


                    <!-- CATEGORY -->

                    <div class="form-group">

                        <label>
                            Select Category
                            <span class="required">*</span>
                        </label>


                        <asp:DropDownList
                            ID="ddlCategory"
                            runat="server"
                            CssClass="form-control"
                            AutoPostBack="true"
                            OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">


                            <asp:ListItem
                                Text="-- Select Category --"
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
                                Text="Clothing &amp; Fashion"
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
                                Text="Cosmetics &amp; Personal Care"
                                Value="Cosmetics">
                            </asp:ListItem>


                            <asp:ListItem
                                Text="Medicines &amp; Healthcare"
                                Value="Healthcare">
                            </asp:ListItem>


                            <asp:ListItem
                                Text="Automobile Parts"
                                Value="Automobile">
                            </asp:ListItem>


                            <asp:ListItem
                                Text="Sports &amp; Fitness"
                                Value="Sports">
                            </asp:ListItem>


                            <asp:ListItem
                                Text="Other"
                                Value="Other">
                            </asp:ListItem>


                        </asp:DropDownList>


                        <span class="help-text">
                            Products added below will belong to this category.
                        </span>

                    </div>



                    <!-- SUPPLIER -->

                    <div class="form-group">

                        <label>
                            Select Supplier
                            <span class="required">*</span>
                        </label>


                        <asp:DropDownList
                            ID="ddlSupplier"
                            runat="server"
                            CssClass="form-control"
                            AutoPostBack="true"
                            OnSelectedIndexChanged="ddlSupplier_SelectedIndexChanged">


                            <asp:ListItem
                                Text="-- Select Supplier --"
                                Value="">
                            </asp:ListItem>


                        </asp:DropDownList>


                        <span class="help-text">
                            Select the supplier who provides the products.
                        </span>

                    </div>


                </div>



                <!-- =================================================
                     ADD PRODUCT DETAILS
                ================================================== -->

                <div class="section-title"
                     style="margin-top:25px;">

                    Add Product Details

                </div>



                <div class="form-grid-three">


                    <!-- PRODUCT -->

                    <div class="form-group">

                        <label>
                            Product Name
                            <span class="required">*</span>
                        </label>


                        <asp:DropDownList
                            ID="ddlProduct"
                            runat="server"
                            CssClass="form-control"
                            AutoPostBack="true"
                            OnSelectedIndexChanged="ddlProduct_SelectedIndexChanged">


                            <asp:ListItem
                                Text="-- Select Product --"
                                Value="">
                            </asp:ListItem>


                        </asp:DropDownList>

                    </div>



                    <!-- BRAND -->

                    <div class="form-group">

                        <label>
                            Brand
                            <span class="required">*</span>
                        </label>


                        <asp:DropDownList
                            ID="ddlBrand"
                            runat="server"
                            CssClass="form-control"
                            AutoPostBack="true"
                             OnSelectedIndexChanged="ddlBrand_SelectedIndexChanged">


                            <asp:ListItem
                                Text="-- Select Brand --"
                                Value="">
                            </asp:ListItem>


                        </asp:DropDownList>

                    </div>



                    <!-- UNIT -->

                    <div class="form-group">

                        <label>
                            Unit
                            <span class="required">*</span>
                        </label>


                        <asp:TextBox
                            ID="txtUnit"
                            runat="server"
                            CssClass="form-control readonly-field"
                            ReadOnly="true">
                        </asp:TextBox>

                    </div>



                    <!-- PURCHASE PRICE -->

                    <div class="form-group">

                        <label>
                            Purchase Price
                        </label>


                        <asp:TextBox
                            ID="txtPurchasePrice"
                            runat="server"
                            CssClass="form-control readonly-field"
                            ReadOnly="true">
                        </asp:TextBox>


                        <span class="help-text">
                            Supplier price automatically loaded.
                        </span>

                    </div>



                    <!-- SELLING PRICE -->

                    <div class="form-group">

                        <label>
                            Selling Price
                            <span class="required">*</span>
                        </label>


                        <asp:TextBox
                            ID="txtSellingPrice"
                            runat="server"
                            CssClass="form-control"
                            TextMode="Number"
                            min="0"
                            step="0.01">
                        </asp:TextBox>


                        <span class="help-text">
                            Enter your selling price.
                        </span>

                    </div>



                    <!-- MAXIMUM STOCK -->

                    <div class="form-group">

                        <label>
                            Maximum Stock
                            <span class="required">*</span>
                        </label>


                        <asp:TextBox
                            ID="txtMaximumStock"
                            runat="server"
                            CssClass="form-control"
                            TextMode="Number"
                            min="1"
                            step="1">
                        </asp:TextBox>


                        <span class="help-text">
                            Maximum quantity allowed for this product.
                        </span>

                    </div>


                </div>



                <!-- =================================================
                     ADD PRODUCT
                ================================================== -->

                <div class="add-product-area">


                    <asp:Button
                        ID="btnAddProduct"
                        runat="server"
                        Text="+ Add Product"
                        CssClass="btn-add" OnClick="btnAddProduct_Click1"
                        />


                </div>



                <!-- MESSAGE -->

                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="message">
                </asp:Label>



                <!-- =================================================
                     ADDED PRODUCTS
                ================================================== -->

                <div class="added-products-title">

                    Added Products

                </div>



                <div class="product-table-wrapper">


                    <table class="product-table">


                        <thead>

                            <tr>

                                <th>
                                    PRODUCT ID
                                </th>

                                <th>
                                    DATE
                                </th>

                                <th>
                                    SUPPLIER
                                </th>

                                <th>
                                    CATEGORY
                                </th>

                                <th>
                                    PRODUCT NAME
                                </th>

                                <th>
                                    BRAND
                                </th>

                                <th>
                                    UNIT
                                </th>

                                <th>
                                    SELLING PRICE
                                </th>

                                <th>
                                    MAXIMUM STOCK
                                </th>

                                <th>
                                    ACTION
                                </th>

                            </tr>

                        </thead>



                        <tbody
                            id="productTablebody"
                            runat="server">


                            <tr>

                                <td
                                    colspan="10"
                                    style="text-align:center;
                                           padding:25px;
                                           color:#999;
                                           font-size:13px;">

                                    No products added yet.

                                </td>

                            </tr>


                        </tbody>


                    </table>


                </div>


            </div>



            <!-- =================================================
                 BOTTOM BUTTONS
            ================================================== -->

            <div class="bottom-buttons">


                <asp:Button
                    ID="btnReset"
                    runat="server"
                    Text="Reset"
                    CssClass="btn-reset" OnClick="btnReset_Click"
                    />


                <asp:Button
                    ID="btnSaveAll"
                    runat="server"
                    Text="Save All Products"
                    CssClass="btn-save" OnClick="btnSaveAll_Click"
                     />


            </div>


        </div>


    </div>


</asp:Content>