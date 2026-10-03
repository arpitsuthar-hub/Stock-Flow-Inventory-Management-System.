<%@ Page Title="Edit Product"
    Language="C#"
    MasterPageFile="~/Product_Module/Product_Module.Master"
    AutoEventWireup="true"
    CodeBehind="Product_Edit.aspx.cs"
    Inherits="Inventory_Management_System.Product_Module.Product_Edit" %>


<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style>
        /* =========================================
           PAGE
        ========================================= */

        .edit-page-header {
            margin-bottom: 28px;
        }

            .edit-page-header h1 {
                font-size: 30px;
                color: #14213d;
                margin-bottom: 7px;
            }

            .edit-page-header p {
                color: #667085;
                font-size: 15px;
            }


        /* =========================================
           MAIN CARD
        ========================================= */

        .product-edit-card {
            width: 100%;
            max-width: 1000px;
            background: #ffffff;
            border-radius: 14px;
            padding: 30px;
            box-shadow: 0 4px 18px rgba(0,0,0,0.07);
            border-top: 4px solid #1769e0;
        }


        /* =========================================
           CARD HEADER
        ========================================= */

        .edit-card-header {
            display: flex;
            align-items: center;
            gap: 14px;
            padding-bottom: 20px;
            margin-bottom: 25px;
            border-bottom: 1px solid #eaecf0;
        }


        .edit-card-icon {
            width: 50px;
            height: 50px;
            background: #e4efff;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 23px;
        }


        .edit-card-header h2 {
            font-size: 20px;
            color: #14213d;
            margin-bottom: 4px;
        }


        .edit-card-header p {
            font-size: 13px;
            color: #667085;
        }


        /* =========================================
           PRODUCT ID
        ========================================= */

        .product-id-box {
            background: #f5f8fc;
            border: 1px solid #e4e7ec;
            border-radius: 9px;
            padding: 14px 16px;
            margin-bottom: 25px;
        }


            .product-id-box label {
                display: block;
                font-size: 12px;
                font-weight: bold;
                color: #667085;
                margin-bottom: 5px;
            }


            .product-id-box span {
                font-size: 16px;
                font-weight: bold;
                color: #14213d;
            }


        /* =========================================
           FORM GRID
        ========================================= */

        .edit-form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
        }


        .form-group {
            display: flex;
            flex-direction: column;
        }


            .form-group label {
                font-size: 13px;
                font-weight: bold;
                color: #344054;
                margin-bottom: 7px;
            }


            .form-group input,
            .form-group select {
                width: 100%;
                padding: 12px 14px;
                border: 1px solid #d0d5dd;
                border-radius: 8px;
                font-size: 14px;
                outline: none;
                font-family: Arial, Helvetica, sans-serif;
            }


                .form-group input:focus,
                .form-group select:focus {
                    border-color: #1769e0;
                    box-shadow: 0 0 0 3px rgba(23,105,224,0.10);
                }


        /* READ ONLY */

        .readonly-field {
            background: #f5f7fa;
            color: #667085;
            cursor: not-allowed;
        }


        /* =========================================
           BUTTON AREA
        ========================================= */

        .edit-buttons {
            display: flex;
            justify-content: flex-end;
            gap: 12px;
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #eaecf0;
        }


        .update-button,
        .delete-button,
        .cancel-button {
            padding: 12px 22px;
            border-radius: 8px;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.25s;
        }


        /* UPDATE */

        .update-button {
            border: none;
            background: #1769e0;
            color: white;
        }


            .update-button:hover {
                background: #1257bd;
            }


        /* DELETE */

        .delete-button {
            border: none;
            background: #e53935;
            color: white;
        }


            .delete-button:hover {
                background: #c62828;
            }


        /* CANCEL */

        .cancel-button {
            background: white;
            color: #475467;
            border: 1px solid #d0d5dd;
        }


            .cancel-button:hover {
                background: #f5f7fb;
            }


        /* =========================================
           MESSAGE
        ========================================= */

        .message {
            margin-top: 18px;
            font-size: 14px;
            font-weight: 600;
            color: #1769e0;
        }


        /* =========================================
           RESPONSIVE
        ========================================= */

        @media (max-width: 750px) {

            .edit-form-grid {
                grid-template-columns: 1fr;
            }


            .edit-buttons {
                flex-direction: column;
            }


            .update-button,
            .delete-button,
            .cancel-button {
                width: 100%;
            }
        }
    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <center>
        <div class="product-edit-container">


            <!-- =========================================
             PAGE HEADER
        ========================================= -->

            <div class="edit-page-header">

                <h1>Edit Product</h1>

                <p>
                    Update the information of an existing product.
                </p>

            </div>



            <!-- =========================================
             EDIT PRODUCT CARD
        ========================================= -->

            <div class="product-edit-card">


                <!-- CARD HEADER -->

                <div class="edit-card-header">

                    <div class="edit-card-icon">
                        ✏️
                    </div>


                    <div>

                        <h2>Product Information</h2>

                        <p>
                            Modify the product details and save your changes.
                        </p>

                    </div>

                </div>



                <!-- =========================================
                 PRODUCT ID
            ========================================= -->

                <div class="product-id-box">

                    <label>PRODUCT ID</label>

                    <asp:Label
                        ID="txtProductId"
                        runat="server"
                        Text="-">
                    </asp:Label>

                </div>



                <!-- =========================================
                 FORM
            ========================================= -->

                <div class="edit-form-grid">


                    <!-- PRODUCT NAME -->

                    <div class="form-group">

                        <label>Product Name</label>

                        <asp:TextBox
                            ID="txtProductName"
                            runat="server"
                            placeholder="Enter product name">
                        </asp:TextBox>

                    </div>



                    <!-- PRODUCT BRAND -->

                    <div class="form-group">

                        <label>Brand</label>

                        <asp:TextBox
                            ID="txtProductBrand"
                            runat="server"
                            placeholder="Enter brand name">
                        </asp:TextBox>

                    </div>



                    <!-- CATEGORY -->

                    <div class="form-group">

                        <label>Category</label>

                        <asp:DropDownList
                            ID="ddlCategory"
                            runat="server">

                            <asp:ListItem Text="-- Select Category --" Value=""></asp:ListItem>

                            <asp:ListItem Text="Electronics" Value="Electronics"></asp:ListItem>

                            <asp:ListItem Text="Grocery" Value="Grocery"></asp:ListItem>

                            <asp:ListItem Text="Clothing &amp; Fashion" Value="Clothing"></asp:ListItem>

                            <asp:ListItem Text="Furniture" Value="Furniture"></asp:ListItem>

                            <asp:ListItem Text="Stationery" Value="Stationery"></asp:ListItem>

                            <asp:ListItem Text="Hardware" Value="Hardware"></asp:ListItem>

                            <asp:ListItem Text="Cosmetics &amp; Personal Care" Value="Cosmetics"></asp:ListItem>

                            <asp:ListItem Text="Medicines &amp; Healthcare" Value="Healthcare"></asp:ListItem>

                            <asp:ListItem Text="Automobile Parts" Value="Automobile"></asp:ListItem>

                            <asp:ListItem Text="Sports &amp; Fitness" Value="Sports"></asp:ListItem>

                            <asp:ListItem Text="Other" Value="Other"></asp:ListItem>

                        </asp:DropDownList>

                    </div>



                    <!-- SUPPLIER -->

                    <div class="form-group">

                        <label>Supplier</label>

                        <asp:TextBox
                            ID="txtSupplier"
                            runat="server"
                            placeholder="Enter supplier">
                        </asp:TextBox>

                    </div>



                    <!-- UNIT -->

                    <div class="form-group">

                        <label>Unit</label>

                        <asp:TextBox
                            ID="txtUnit"
                            runat="server"
                            placeholder="e.g. Piece, Box, Kg">
                        </asp:TextBox>

                    </div>



                    <!-- SELLING PRICE -->

                    <div class="form-group">

                        <label>Selling Price</label>

                        <asp:TextBox
                            ID="txtSellingPrice"
                            runat="server"
                            TextMode="Number"
                            step="0.01"
                            placeholder="Enter selling price">
                        </asp:TextBox>

                    </div>



                    <!-- MINIMUM STOCK -->

                    <div class="form-group">

                        <label>Maximum Stock</label>

                        <asp:TextBox
                            ID="txtMaximumStock"
                            runat="server"
                            TextMode="Number"
                            placeholder="Enter minimum stock">
                        </asp:TextBox>

                    </div>



                    <!-- CREATE DATE -->

                    <div class="form-group">

                        <label>Created Date</label>

                        <asp:TextBox
                            ID="txtCreateDate"
                            runat="server"
                            ReadOnly="true"
                            CssClass="readonly-field">
                        </asp:TextBox>

                    </div>


                </div>



                <!-- MESSAGE -->

                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="message">
                </asp:Label>



                <!-- =========================================
                 BUTTONS
            ========================================= -->

                <div class="edit-buttons">


                    <asp:Button
                        ID="btnCancel"
                        runat="server"
                        Text="Cancel"
                        CssClass="cancel-button"
                        CausesValidation="false" OnClick="btnCancel_Click" />


                    <asp:Button
                        ID="btnDelete"
                        runat="server"
                        Text="Delete Product"
                        CssClass="delete-button"
                        CausesValidation="false"
                        OnClientClick="return confirm('Are you sure you want to delete this product?');" OnClick="btnDelete_Click" />


                    <asp:Button
                        ID="btnUpdate"
                        runat="server"
                        Text="Update Product"
                        CssClass="update-button" OnClick="btnUpdate_Click" />


                </div>


            </div>


        </div>
    </center>

</asp:Content>
