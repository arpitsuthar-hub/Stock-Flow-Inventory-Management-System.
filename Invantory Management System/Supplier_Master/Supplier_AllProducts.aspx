<%@ Page Title="All Products"
    Language="C#"
    MasterPageFile="~/Supplier_Master/Supplier.Master"
    AutoEventWireup="true"
    CodeBehind="Supplier_AllProducts.aspx.cs"
    Inherits="Inventory_Management_System.Supplier_Master.Supplier_AllProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">

        /* =========================================
           MAIN CONTAINER
        ========================================= */

        .products-container {
            padding: 25px;
            width: 100%;
            box-sizing: border-box;
        }


        /* =========================================
           PAGE TITLE
        ========================================= */

        .page-title {
            font-size: 26px;
            font-weight: 600;
            color: #2c5364;
            margin-bottom: 20px;
        }


        /* =========================================
           SEARCH SECTION
        ========================================= */

        .search-section {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 20px;
            max-width: 700px;
        }

        .search-box {
            flex: 1;
            padding: 11px 14px;
            border: 1px solid #d5d8dc;
            border-radius: 6px;
            font-size: 14px;
            outline: none;
            box-sizing: border-box;
            min-width: 0;
        }

        .search-box:focus {
            border-color: #2c5364;
            box-shadow: 0 0 0 2px rgba(44,83,100,0.10);
        }


        /* =========================================
           SEARCH BUTTON
        ========================================= */

        .btn-search {
            background: #2c5364;
            color: white;
            border: none;
            padding: 11px 22px;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            white-space: nowrap;
        }

        .btn-search:hover {
            background: #203e4b;
        }


        /* =========================================
           CLEAR BUTTON
        ========================================= */

        .btn-clear-search {
            background: #ecf0f1;
            color: #34495e;
            border: none;
            padding: 11px 18px;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            white-space: nowrap;
        }

        .btn-clear-search:hover {
            background: #d5d8dc;
        }


        /* =========================================
           GRID SCROLL CONTAINER
        ========================================= */

        .products-grid-wrapper {
            width: 100%;
            max-height: 570px;

            overflow-y: auto;
            overflow-x: auto;

            background: #ffffff;

            border: 1px solid #e5e8eb;
            border-radius: 8px;

            box-shadow: 0 3px 12px rgba(0,0,0,0.08);

            box-sizing: border-box;
        }


        /* =========================================
           GRIDVIEW
        ========================================= */

        .products-grid {
            width: 100%;
            min-width: 850px;

            border-collapse: collapse;

            background: #ffffff;
        }


        /* =========================================
           TABLE HEADER
        ========================================= */

        .products-grid th {
            position: sticky;
            top: 0;
            z-index: 10;

            background: #2c5364;
            color: #ffffff;

            padding: 14px 15px;

            text-align: left;

            font-size: 14px;
            font-weight: 600;

            white-space: nowrap;

            border-bottom: 1px solid #203e4b;
        }


        /* =========================================
           TABLE DATA
        ========================================= */

        .products-grid td {
            padding: 13px 15px;

            font-size: 14px;
            color: #34495e;

            border-bottom: 1px solid #edf0f2;

            white-space: nowrap;

            background: #ffffff;
        }


        /* =========================================
           ROW HOVER
        ========================================= */

        .products-grid tr:hover td {
            background-color: #f5f8fa;
        }


        /* =========================================
           STOCK
        ========================================= */

        .stock {
            font-weight: 600;
            color: #2c5364;
        }


        /* =========================================
           PRICE
        ========================================= */

        .price {
            font-weight: 600;
            color: #2c5364;
        }


        /* =========================================
           EMPTY MESSAGE
        ========================================= */

        .empty-message {
            padding: 20px;
            text-align: center;
            color: #777;
        }


        /* =========================================
           SCROLLBAR
        ========================================= */

        .products-grid-wrapper::-webkit-scrollbar {
            width: 8px;
            height: 8px;
        }

        .products-grid-wrapper::-webkit-scrollbar-track {
            background: #f1f3f4;
            border-radius: 10px;
        }

        .products-grid-wrapper::-webkit-scrollbar-thumb {
            background: #9aa7ad;
            border-radius: 10px;
        }

        .products-grid-wrapper::-webkit-scrollbar-thumb:hover {
            background: #2c5364;
        }


        /* =========================================
           MOBILE
        ========================================= */

        @media (max-width: 768px) {

            .products-container {
                padding: 18px 12px;
            }

            .page-title {
                font-size: 22px;
            }

            .search-section {
                flex-direction: column;
                align-items: stretch;
                max-width: 100%;
            }

            .search-box {
                width: 100%;
            }

            .btn-search,
            .btn-clear-search {
                width: 100%;
            }

            .products-grid-wrapper {
                max-height: 500px;
            }

            .products-grid {
                min-width: 850px;
            }
        }

    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="products-container">

        <!-- =========================================
             PAGE TITLE
        ========================================== -->

        <div class="page-title">
            <i class="fa-solid fa-boxes-stacked"></i>
            My Products
        </div>


        <!-- =========================================
             SEARCH SECTION
        ========================================== -->

        <div class="search-section">

            <asp:TextBox
                ID="txtSearch"
                runat="server"
                CssClass="search-box"
                placeholder="Search by product name or brand...">
            </asp:TextBox>


            <asp:Button
                ID="btnSearch"
                runat="server"
                Text="Search"
                CssClass="btn-search"
                OnClick="btnSearch_Click" />


            <asp:Button
                ID="btnClearSearch"
                runat="server"
                Text="Clear"
                CssClass="btn-clear-search"
                CausesValidation="false"
                OnClick="btnClearSearch_Click" />

        </div>


        <!-- =========================================
             SCROLLABLE GRID
        ========================================== -->

        <div class="products-grid-wrapper">

            <asp:GridView
                ID="gvProducts"
                runat="server"
                AutoGenerateColumns="False"
                CssClass="products-grid"
                EmptyDataText="No products found."
                GridLines="None">

                <Columns>

                    <asp:BoundField
                        DataField="supplier_product_id"
                        HeaderText="Product ID" />

                    <asp:BoundField
                        DataField="product_name"
                        HeaderText="Product Name" />

                    <asp:BoundField
                        DataField="brand"
                        HeaderText="Brand" />

                    <asp:BoundField
                        DataField="unit"
                        HeaderText="Unit" />

                    <asp:BoundField
                        DataField="quantity"
                        HeaderText="Stock Available" />

                    <asp:BoundField
                        DataField="selling_price"
                        HeaderText="Selling Price"
                        DataFormatString="₹ {0:N2}" />

                </Columns>

            </asp:GridView>

        </div>

    </div>

</asp:Content>