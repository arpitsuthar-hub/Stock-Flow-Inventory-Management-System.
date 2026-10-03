
<%@ Page Title="Search Product"
    Language="C#"
    MasterPageFile="~/Product_Module/Product_Module.Master"
    AutoEventWireup="true"
    CodeBehind="Product_Search.aspx.cs"
    Inherits="Inventory_Management_System.Product_Module.SearchProduct" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style>
        /* =========================================
           PAGE
        ========================================= */

        .search-page {
            width: 100%;
            padding-bottom: 30px;
        }


        /* =========================================
           HEADER
        ========================================= */

        .page-header {
            margin-bottom: 25px;
        }

            .page-header h1 {
                font-size: 28px;
                color: #14213d;
                margin-bottom: 6px;
            }

            .page-header p {
                color: #777;
                font-size: 14px;
            }


        /* =========================================
           SEARCH BOX
        ========================================= */

        .search-container {
            background: white;
            padding: 25px;
            border-radius: 14px;
            box-shadow: 0 4px 18px rgba(0,0,0,0.07);
            margin-bottom: 25px;
        }


        /* =========================================
           SEARCH TITLE
        ========================================= */

        .search-title {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 20px;
            padding-bottom: 17px;
            border-bottom: 1px solid #e5e8ed;
        }

        .search-icon {
            width: 45px;
            height: 45px;
            border-radius: 10px;
            background: #eee7ff;
            color: #7048d8;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 21px;
        }

        .search-title h2 {
            font-size: 19px;
            color: #14213d;
        }

        .search-title p {
            color: #888;
            font-size: 12px;
            margin-top: 3px;
        }


        /* =========================================
           SEARCH FORM
        ========================================= */

        .search-form {
            display: grid;
            grid-template-columns: 180px 1fr auto;
            gap: 12px;
            align-items: end;
        }


        /* =========================================
           LABEL
        ========================================= */

        .search-field {
            display: flex;
            flex-direction: column;
        }

            .search-field label {
                font-size: 13px;
                font-weight: bold;
                color: #444;
                margin-bottom: 8px;
            }


        /* =========================================
           INPUT
        ========================================= */

        .input-box,
        .select-box {
            width: 100%;
            padding: 12px 13px;
            border: 1px solid #d8dde5;
            border-radius: 7px;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 14px;
            color: #333;
            background: white;
            outline: none;
            transition: 0.2s;
        }

            .input-box:focus,
            .select-box:focus {
                border-color: #7048d8;
                box-shadow: 0 0 0 3px rgba(112,72,216,0.10);
            }


        /* =========================================
           SEARCH BUTTON
        ========================================= */

        .search-button {
            border: none;
            background: #7048d8;
            color: white;
            padding: 12px 25px;
            border-radius: 7px;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.2s;
        }

            .search-button:hover {
                background: #5d38bd;
                transform: translateY(-1px);
            }


        /* =========================================
           RESULT CONTAINER
        ========================================= */

        .result-container {
            background: white;
            padding: 25px;
            border-radius: 14px;
            box-shadow: 0 4px 18px rgba(0,0,0,0.07);
        }


        /* =========================================
           RESULT HEADER
        ========================================= */

        .result-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 1px solid #e5e8ed;
        }

            .result-header h2 {
                font-size: 19px;
                color: #14213d;
            }

        .result-count {
            background: #e4efff;
            color: #1769e0;
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: bold;
        }


        /* =========================================
           PRODUCT DETAILS
        ========================================= */

        .product-details {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 18px;
        }


        /* =========================================
           DETAIL ITEM
        ========================================= */

        .detail-item {
            background: #f8f9fb;
            padding: 15px;
            border-radius: 8px;
            border-left: 3px solid #7048d8;
        }

        .detail-label {
            display: block;
            color: #888;
            font-size: 11px;
            text-transform: uppercase;
            font-weight: bold;
            margin-bottom: 6px;
        }

        .detail-value {
            display: block;
            color: #14213d;
            font-size: 15px;
            font-weight: bold;
        }


        /* =========================================
           STATUS
        ========================================= */

        .status-active {
            display: inline-block;
            background: #e3f7ec;
            color: #16a05d;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: bold;
        }

        .status-inactive {
            display: inline-block;
            background: #ffe5e5;
            color: #e53935;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: bold;
        }


        /* =========================================
           ACTION BUTTONS
        ========================================= */

        .action-container {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
            margin-top: 25px;
            padding-top: 20px;
            border-top: 1px solid #e5e8ed;
        }

        .action-button {
            border: none;
            padding: 11px 22px;
            border-radius: 7px;
            font-size: 13px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.2s;
        }


        /* EDIT */

        .edit-button {
            background: #1769e0;
            color: white;
        }

            .edit-button:hover {
                background: #1258bd;
            }


        /* DELETE */

        .delete-button {
            background: #ffe5e5;
            color: #e53935;
        }

            .delete-button:hover {
                background: #ffd5d5;
            }


        /* =========================================
           MESSAGE
        ========================================= */

        .message {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #777;
            font-size: 14px;
        }


        /* =========================================
           RESPONSIVE
        ========================================= */

        @media (max-width: 900px) {

            .search-form {
                grid-template-columns: 1fr 1fr;
            }

            .search-button {
                grid-column: span 2;
            }

            .product-details {
                grid-template-columns: repeat(2, 1fr);
            }
        }


        @media (max-width: 600px) {

            .search-container,
            .result-container {
                padding: 18px;
            }

            .search-form {
                grid-template-columns: 1fr;
            }

            .search-button {
                grid-column: span 1;
            }

            .product-details {
                grid-template-columns: 1fr;
            }

            .action-container {
                flex-direction: column;
            }

            .action-button {
                width: 100%;
            }
        }
    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="search-page">


        <!-- =========================================
             PAGE HEADER
        ========================================== -->

        <div class="page-header">

            <h1>Search Product</h1>

            <p>
                Search, view, update or delete product information
            </p>

        </div>


        <!-- =========================================
             SEARCH SECTION
        ========================================== -->

        <div class="search-container">

            <div class="search-title">

                <div class="search-icon">
                    🔍
                </div>

                <div>

                    <h2>Find Product</h2>

                    <p>
                        Search using Product ID, Product Name or Category
                    </p>

                </div>

            </div>


            <div class="search-form">


                <!-- SEARCH TYPE -->

                <div class="search-field">

                    <label>
                        Search By
                    </label>

                    <asp:DropDownList
                        ID="ddlSearchBy"
                        runat="server"
                        CssClass="select-box">

                        <asp:ListItem
                            Text="Product ID"
                            Value="ProductID">
                        </asp:ListItem>

                        <asp:ListItem
                            Text="Product Name"
                            Value="ProductName">
                        </asp:ListItem>

                        <asp:ListItem
                            Text="Category"
                            Value="Category">
                        </asp:ListItem>

                    </asp:DropDownList>

                </div>


                <!-- SEARCH VALUE -->

                <div class="search-field">

                    <label>
                        Search
                    </label>

                    <asp:TextBox
                        ID="txtSearch"
                        runat="server"
                        CssClass="input-box"
                        placeholder="Enter product information">
                    </asp:TextBox>

                </div>


                <!-- SEARCH BUTTON -->

                <asp:Button
                    ID="btnSearch"
                    runat="server"
                    Text="🔍 Search Product"
                    CssClass="search-button"
                    OnClick="btnSearch_Click" />

            </div>

        </div>


        <!-- =========================================
             SINGLE PRODUCT RESULT
             Used for Product ID / Product Name
        ========================================== -->

        <asp:Panel
            ID="pnlProductDetails"
            runat="server"
            CssClass="result-container"
            Visible="false">


            <div class="result-header">

                <h2>
                    Product Details
                </h2>

                <asp:Label
                    ID="lblResultCount"
                    runat="server"
                    CssClass="result-count"
                    Text="Product Found">
                </asp:Label>

            </div>


            <div class="product-details">


                <!-- PRODUCT ID -->

                <div class="detail-item">

                    <span class="detail-label">
                        Product ID
                    </span>

                    <asp:Label
                        ID="lblProductID"
                        runat="server"
                        CssClass="detail-value"
                        Text="-">
                    </asp:Label>

                </div>


                <!-- PRODUCT NAME -->

                <div class="detail-item">

                    <span class="detail-label">
                        Product Name
                    </span>

                    <asp:Label
                        ID="lblProductName"
                        runat="server"
                        CssClass="detail-value"
                        Text="-">
                    </asp:Label>

                </div>


                <!-- CATEGORY -->

                <div class="detail-item">

                    <span class="detail-label">
                        Category
                    </span>

                    <asp:Label
                        ID="lblCategory"
                        runat="server"
                        CssClass="detail-value"
                        Text="-">
                    </asp:Label>

                </div>


                <!-- BRAND -->

                <div class="detail-item">

                    <span class="detail-label">
                        Brand
                    </span>

                    <asp:Label
                        ID="lblBrand"
                        runat="server"
                        CssClass="detail-value"
                        Text="-">
                    </asp:Label>

                </div>


                <!-- UNIT -->

                <div class="detail-item">

                    <span class="detail-label">
                        Unit
                    </span>

                    <asp:Label
                        ID="lblUnit"
                        runat="server"
                        CssClass="detail-value"
                        Text="-">
                    </asp:Label>

                </div>


                <!-- SELLING PRICE -->

                <div class="detail-item">

                    <span class="detail-label">
                        Selling Price
                    </span>

                    <asp:Label
                        ID="lblSellingPrice"
                        runat="server"
                        CssClass="detail-value"
                        Text="-">
                    </asp:Label>

                </div>


                <!-- MINIMUM STOCK -->

                <div class="detail-item">

                    <span class="detail-label">
                        Minimum Stock
                    </span>

                    <asp:Label
                        ID="lblMinimumStock"
                        runat="server"
                        CssClass="detail-value"
                        Text="-">
                    </asp:Label>

                </div>

            </div>


            <!-- SINGLE PRODUCT ACTIONS -->

            <div class="action-container">

                <asp:Button
                    ID="btnEdit"
                    runat="server"
                    Text="✏ Edit Product"
                    CssClass="action-button edit-button"
                    OnClick="btnEdit_Click" />

                <asp:Button
                    ID="btnDelete"
                    runat="server"
                    Text="🗑 Delete Product"
                    CssClass="action-button delete-button"
                    OnClick="btnDelete_Click" />

            </div>

        </asp:Panel>


        <!-- =========================================
             CATEGORY RESULT
             Used when Search By = Category
        ========================================== -->

        <asp:Panel
            ID="pnlCategoryResults"
            runat="server"
            CssClass="result-container"
            Visible="false">


            <div class="result-header">

                <h2>
                    Category Products
                </h2>

                <asp:Label
                    ID="lblCategoryCount"
                    runat="server"
                    CssClass="result-count"
                    Text="0 Products">
                </asp:Label>

            </div>


            <!-- =====================================
                 CATEGORY GRIDVIEW
            ====================================== -->

            <asp:GridView
                ID="gvCategoryProducts"
                runat="server"
                AutoGenerateColumns="False"
                Width="100%"
                GridLines="None"
                DataKeyNames="ProductID" OnRowCommand="gvCategoryProducts_RowCommand">


                <Columns>


                    

                    <asp:BoundField
                        DataField="ProductID"
                        HeaderText="Product ID" />


                   

                    <asp:BoundField
                        DataField="ProductName"
                        HeaderText="Product Name" />



                    <asp:BoundField
                        DataField="Category"
                        HeaderText="Category" />



                    <asp:BoundField
                        DataField="Brand"
                        HeaderText="Brand" />



                    <asp:BoundField
                        DataField="Unit"
                        HeaderText="Unit" />



                    <asp:BoundField
                        DataField="SellingPrice"
                        HeaderText="Selling Price"
                        DataFormatString="₹ {0:N2}" />



                    <asp:BoundField
                        DataField="MaximumStock"
                        HeaderText="Maximum Stock" />


                    <asp:TemplateField
                        HeaderText="Edit">

                        <ItemTemplate>

                            <asp:LinkButton
                                ID="lnkEdit"
                                runat="server"
                                Text="✏ Edit"
                                CommandName="EditProduct"
                                CommandArgument='<%# Eval("ProductID") %>'>
                            </asp:LinkButton>

                        </ItemTemplate>

                    </asp:TemplateField>



                    <asp:TemplateField
                        HeaderText="Delete">

                        <ItemTemplate>

                            <asp:LinkButton
                                ID="lnkDelete"
                                runat="server"
                                Text="🗑 Delete"
                                CommandName="DeleteProduct"
                                CommandArgument='<%# Eval("ProductID") %>'
                                OnClientClick="return confirm('Are you sure you want to delete this product?');">
                            </asp:LinkButton>

                        </ItemTemplate>

                    </asp:TemplateField>


                </Columns>


                <EmptyDataTemplate>

                    <div style="text-align:center; padding:25px; color:#777;">
                        No products found in this category.
                    </div>

                </EmptyDataTemplate>


            </asp:GridView>


        </asp:Panel>


        <!-- =========================================
             MESSAGE
        ========================================== -->

        <asp:Label
            ID="lblMessage"
            runat="server"
            CssClass="message">
        </asp:Label>


    </div>

</asp:Content>