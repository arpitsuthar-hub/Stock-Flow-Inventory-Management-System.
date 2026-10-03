<%@ Page Title="All Products"
    Language="C#"
    MasterPageFile="~/Product_Module/Product_Module.Master"
    AutoEventWireup="true"
    CodeBehind="AllProduct.aspx.cs"
    Inherits="Inventory_Management_System.Product_Module.AllProduct" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">


    <style>
        /* =========================================================
       PAGE
    ========================================================= */

        .product-page {
            width: 100%;
            padding-bottom: 35px;
        }


        /* =========================================================
       PAGE HEADER
    ========================================================= */

        .page-header {
            margin-bottom: 25px;
        }

            .page-header h1 {
                margin: 0 0 7px;
                font-size: 28px;
                font-weight: 700;
                color: #14213d;
            }

            .page-header p {
                margin: 0;
                color: #777;
                font-size: 14px;
            }


        /* =========================================================
       PRODUCT SUMMARY
    ========================================================= */

        .product-summary {
            display: grid;
            grid-template-columns: 1fr;
            gap: 18px;
            margin-bottom: 20px;
        }


        /* =========================================================
       TOTAL PRODUCT LINK
    ========================================================= */

        .category-summary-link {
            text-decoration: none;
            display: block;
        }


        /* =========================================================
       SUMMARY BOX
    ========================================================= */

        .summary-box {
            background: #ffffff;
            padding: 22px 20px;
            border-radius: 12px;
            box-shadow: 0 4px 16px rgba(0,0,0,0.06);
            border: 1px solid #edf0f3;
            border-left: 4px solid #1769e0;
            cursor: pointer;
            transition: transform 0.2s ease, box-shadow 0.2s ease, border-color 0.2s ease;
        }


            .summary-box:hover {
                transform: translateY(-4px);
                box-shadow: 0 8px 22px rgba(0,0,0,0.10);
                border-left-color: #14213d;
            }


            /* =========================================================
       SUMMARY TITLE
    ========================================================= */

            .summary-box h3 {
                margin: 0 0 10px;
                font-size: 13px;
                font-weight: 600;
                color: #777;
                text-transform: uppercase;
                letter-spacing: 0.4px;
            }


        /* =========================================================
       TOTAL VALUE
    ========================================================= */

        .summary-value {
            font-size: 30px;
            font-weight: 700;
            color: #1769e0;
            margin-bottom: 7px;
        }


        /* =========================================================
       CLICK TEXT
    ========================================================= */

        .summary-click-text {
            font-size: 12px;
            color: #888;
        }


        .summary-box:hover .summary-click-text {
            color: #1769e0;
        }


        /* =========================================================
       CATEGORY DROPDOWN
    ========================================================= */

        .category-container {
            background: #ffffff;
            padding: 20px;
            margin-bottom: 25px;
            border-radius: 12px;
            box-shadow: 0 4px 16px rgba(0,0,0,0.06);
            border: 1px solid #edf0f3;
        }


            .category-container h3 {
                margin: 0 0 12px;
                font-size: 16px;
                font-weight: 700;
                color: #14213d;
            }


        .category-dropdown {
            width: 100%;
            max-width: 350px;
            padding: 10px 12px;
            border: 1px solid #d9dee5;
            border-radius: 7px;
            background: #ffffff;
            color: #333;
            font-size: 14px;
            outline: none;
            cursor: pointer;
        }


            .category-dropdown:focus {
                border-color: #1769e0;
            }


        /* =========================================================
       TABLE CONTAINER
    ========================================================= */

        .table-container {
            background: #ffffff;
            border-radius: 14px;
            padding: 25px;
            box-shadow: 0 4px 18px rgba(0,0,0,0.07);
            border: 1px solid #edf0f3;
            overflow-x: auto;
        }


        /* =========================================================
       TABLE HEADER
    ========================================================= */

        .table-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            padding-bottom: 16px;
            border-bottom: 1px solid #e5e8ed;
        }


            .table-header h2 {
                margin: 0;
                font-size: 19px;
                font-weight: 700;
                color: #14213d;
            }


        .selected-category {
            display: inline-block;
            padding: 6px 12px;
            background: #eef5ff;
            color: #1769e0;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
        }


        /* =========================================================
       GRIDVIEW
    ========================================================= */

        .product-grid {
            width: 100%;
            border-collapse: collapse;
            min-width: 900px;
            font-family: Arial, sans-serif;
            font-size: 13px;
        }


            /* =========================================================
       HEADER
    ========================================================= */

            .product-grid th {
                background: #f4f6fa;
                color: #555;
                font-size: 11px;
                font-weight: 700;
                text-transform: uppercase;
                letter-spacing: 0.5px;
                padding: 14px 12px;
                text-align: left;
                border-bottom: 2px solid #e1e5eb;
                white-space: nowrap;
            }


            /* =========================================================
       ROW
    ========================================================= */

            .product-grid td {
                padding: 15px 12px;
                color: #333;
                border-bottom: 1px solid #edf0f3;
                vertical-align: middle;
            }


            /* =========================================================
       HOVER
    ========================================================= */

            .product-grid tr:hover td {
                background: #f8faff;
            }


            /* =========================================================
       ALTERNATE ROW
    ========================================================= */

            .product-grid .grid-alt-row td {
                background: #fbfcfe;
            }


        /* =========================================================
       PRODUCT ID
    ========================================================= */

        .product-id {
            font-weight: 700;
            color: #1769e0;
        }


        /* =========================================================
       PRODUCT NAME
    ========================================================= */

        .product-name {
            font-weight: 700;
            color: #14213d;
        }


        /* =========================================================
       CATEGORY BADGE
    ========================================================= */

        .category-badge {
            display: inline-block;
            background: #eee7ff;
            color: #7048d8;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: 600;
            white-space: nowrap;
        }


        /* =========================================================
       PRICE
    ========================================================= */

        .price {
            font-weight: 700;
            color: #14213d;
        }


        /* =========================================================
       EMPTY DATA
    ========================================================= */

        .empty-message {
            text-align: center;
            padding: 40px;
            color: #888;
            font-size: 14px;
        }


        /* =========================================================
       FOOTER
    ========================================================= */

        .table-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 18px;
            padding-top: 16px;
            border-top: 1px solid #edf0f3;
            color: #777;
            font-size: 12px;
        }


        /* =========================================================
       RESPONSIVE
    ========================================================= */

        @media (max-width: 600px) {

            .table-container {
                padding: 16px;
            }


            .table-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 10px;
            }


            .table-footer {
                flex-direction: column;
                align-items: flex-start;
                gap: 8px;
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

            <h1>All Products
            </h1>

            <p>
                Browse all products and filter them by category.
            </p>

        </div>



        <!-- =====================================================
         TOTAL PRODUCTS
    ====================================================== -->

        <div class="product-summary">

            <asp:LinkButton
                ID="btnTotalProducts"
                runat="server"
                CssClass="category-summary-link"
                OnClick="btnTotalProducts_Click">

                <div class="summary-box">

                    <h3>Total Products
                    </h3>

                    <div class="summary-value">

                        <asp:Label
                            ID="lblTotalProducts"
                            runat="server"
                            Text="0">
                        </asp:Label>

                    </div>

                    <div class="summary-click-text">
                        Click to select category →

                    </div>

                </div>

            </asp:LinkButton>

        </div>



        <!-- =====================================================
         CATEGORY DROPDOWN
    ====================================================== -->

        <asp:Panel
            ID="pnlCategory"
            runat="server"
            Visible="false"
            CssClass="category-container">

            <h3>Select Category
            </h3>


            <asp:DropDownList
                ID="ddlCategory"
                runat="server"
                CssClass="category-dropdown"
                AutoPostBack="true" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">


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
                    Text="Clothing & Fashion"
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
                    Text="Cosmetics & Personal Care"
                    Value="Cosmetics">
                </asp:ListItem>


                <asp:ListItem
                    Text="Medicines & Healthcare"
                    Value="Healthcare">
                </asp:ListItem>


                <asp:ListItem
                    Text="Automobile Parts"
                    Value="Automobile">
                </asp:ListItem>


                <asp:ListItem
                    Text="Sports & Fitness"
                    Value="Sports">
                </asp:ListItem>


                <asp:ListItem
                    Text="Other"
                    Value="Other">
                </asp:ListItem>


            </asp:DropDownList>

        </asp:Panel>



        <!-- =====================================================
         PRODUCT TABLE
    ====================================================== -->

        <div class="table-container">


            <!-- TABLE HEADER -->

            <div class="table-header">

                <h2>Product List
                </h2>


                <asp:Label
                    ID="lblSelectedCategory"
                    runat="server"
                    CssClass="selected-category"
                    Text="All Products">
                </asp:Label>

            </div>



            <!-- GRIDVIEW -->

            <asp:GridView
                ID="GridView1"
                runat="server"
                AutoGenerateColumns="False"
                CssClass="product-grid"
                GridLines="None"
                BorderStyle="None"
                EmptyDataText="No products available.">


                <AlternatingRowStyle
                    CssClass="grid-alt-row" />


                <EmptyDataRowStyle
                    CssClass="empty-message" />


                <Columns>


                    

                    <asp:TemplateField
                        HeaderText="Product ID">

                        <ItemTemplate>

                            <span class="product-id">

                                <%# Eval("ProductID") %>

                            </span>

                        </ItemTemplate>

                    </asp:TemplateField>




                    <asp:TemplateField
                        HeaderText="Product Name">

                        <ItemTemplate>

                            <span class="product-name">

                                <%# Eval("ProductName") %>

                            </span>

                        </ItemTemplate>

                    </asp:TemplateField>



                   

                    <asp:TemplateField
                        HeaderText="Category">

                        <ItemTemplate>

                            <span class="category-badge">

                                <%# Eval("Category") %>

                            </span>

                        </ItemTemplate>

                    </asp:TemplateField>



                    

                    <asp:BoundField
                        DataField="Brand"
                        HeaderText="Brand" />




                    <asp:BoundField
                        DataField="Unit"
                        HeaderText="Unit" />




                    <asp:TemplateField
                        HeaderText="Selling Price">

                        <ItemTemplate>

                            <span class="price">₹ <%# Eval("SellingPrice") %>

                            </span>

                        </ItemTemplate>

                    </asp:TemplateField>




                    <asp:BoundField
                        DataField="MaximumStock"
                        HeaderText="Maximum Stock" />


                </Columns>

            </asp:GridView>



            <!-- =================================================
             FOOTER
        ================================================== -->

            <div class="table-footer">

                <span>Click Total Products to select a category.

                </span>


                <span>Inventory Product Management

                </span>

            </div>


        </div>


    </div>
</asp:Content>
