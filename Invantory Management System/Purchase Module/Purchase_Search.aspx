<%@ Page Title="Search Purchase"
    Language="C#"
    MasterPageFile="~/Purchase Module/Purchase_Module.Master"
    AutoEventWireup="true"
    CodeBehind="Purchase_Search.aspx.cs"
    Inherits="Inventory_Management_System.Purchase_Module.SearchPurchase" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style>

        /* =========================================================
           PAGE
        ========================================================= */

        .search-page {
            padding: 25px;
            min-height: calc(100vh - 70px);
            background: #f5f7fa;
        }

        /* =========================================================
           PAGE HEADER
        ========================================================= */

        .page-header {
            margin-bottom: 25px;
        }

        .page-header h1 {
            margin: 0;
            font-size: 28px;
            font-weight: 700;
            color: #1f2937;
        }

        .page-header p {
            margin: 6px 0 0;
            color: #6b7280;
            font-size: 14px;
        }

        /* =========================================================
           SEARCH CARD
        ========================================================= */

        .search-card {
            background: #ffffff;
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.06);
            margin-bottom: 25px;
        }

        .search-card-title {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 18px;
            font-weight: 700;
            color: #1f2937;
            margin-bottom: 20px;
        }

        .search-card-title i {
            color: #2563eb;
            font-size: 18px;
        }

        /* =========================================================
           SEARCH GRID
        ========================================================= */

        .search-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 18px;
            align-items: end;
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

        .form-control {
            width: 100%;
            height: 42px;
            padding: 0 12px;
            border: 1px solid #d1d5db;
            border-radius: 7px;
            font-size: 14px;
            color: #1f2937;
            background: #ffffff;
            outline: none;
            box-sizing: border-box;
            transition: 0.2s;
        }

        .form-control:focus {
            border-color: #2563eb;
            box-shadow: 0 0 0 3px rgba(37,99,235,0.10);
        }

        .search-button-container {
            display: flex;
            align-items: end;
        }

        .search-btn {
            width: 100%;
            height: 42px;
            border: none;
            border-radius: 7px;
            background: #2563eb;
            color: #ffffff;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: 0.2s;
        }

        .search-btn:hover {
            background: #1d4ed8;
        }

        .search-btn i {
            margin-right: 7px;
        }

        /* =========================================================
           SEARCH HINT
        ========================================================= */

        .search-hint {
            margin-top: 15px;
            padding: 12px 15px;
            border-radius: 7px;
            background: #f8fafc;
            border: 1px solid #e5e7eb;
            color: #6b7280;
            font-size: 13px;
        }

        .search-hint i {
            color: #2563eb;
            margin-right: 6px;
        }

        /* =========================================================
           RESULT CARD
        ========================================================= */

        .result-card {
            background: #ffffff;
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.06);
        }

        .result-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .result-title {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 18px;
            font-weight: 700;
            color: #1f2937;
        }

        .result-title i {
            color: #2563eb;
        }

        /* =========================================================
           GRIDVIEW
        ========================================================= */

        .purchase-grid {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            overflow: hidden;
            border: 1px solid #e5e7eb;
            border-radius: 9px;
        }

        .purchase-grid th {
            background: #f8fafc;
            color: #374151;
            font-size: 12px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.3px;
            padding: 14px 12px;
            border-bottom: 1px solid #e5e7eb;
            white-space: nowrap;
        }

        .purchase-grid td {
            padding: 14px 12px;
            font-size: 13px;
            color: #374151;
            border-bottom: 1px solid #f1f5f9;
            vertical-align: middle;
        }

        .purchase-grid tr:last-child td {
            border-bottom: none;
        }

        .purchase-grid tr:hover td {
            background: #f8fafc;
        }

        /* =========================================================
           PRODUCT
        ========================================================= */

        .product-info {
            display: flex;
            flex-direction: column;
            gap: 3px;
        }

        .product-id {
            font-size: 11px;
            font-weight: 700;
            color: #2563eb;
        }

        .product-name {
            font-size: 13px;
            font-weight: 600;
            color: #1f2937;
        }

        /* =========================================================
           PURCHASE ID
        ========================================================= */

        .purchase-id {
            font-weight: 700;
            color: #2563eb;
        }

        /* =========================================================
           SUPPLIER
        ========================================================= */

        .supplier-info {
            display: flex;
            flex-direction: column;
            gap: 3px;
        }

        .supplier-id {
            font-size: 11px;
            font-weight: 700;
            color: #2563eb;
        }

        .supplier-name {
            font-size: 13px;
            font-weight: 600;
            color: #1f2937;
        }

        /* =========================================================
           CATEGORY
        ========================================================= */

        .category {
            display: inline-block;
            padding: 5px 9px;
            border-radius: 5px;
            background: #eff6ff;
            color: #1d4ed8;
            font-size: 11px;
            font-weight: 700;
        }

        /* =========================================================
           QUANTITY
        ========================================================= */

        .quantity {
            font-weight: 700;
            color: #111827;
        }

        .unit {
            margin-left: 3px;
            font-size: 11px;
            color: #6b7280;
        }

        /* =========================================================
           AMOUNTS
        ========================================================= */

        .amount {
            font-weight: 600;
            color: #374151;
        }

        .net-amount {
            font-weight: 700;
            color: #059669;
        }

        .discount {
            color: #dc2626;
            font-weight: 600;
        }

        /* =========================================================
           NO RESULT
        ========================================================= */

        .no-result {
            padding: 35px 20px;
            text-align: center;
            color: #9ca3af;
            font-size: 14px;
        }

        .no-result i {
            display: block;
            font-size: 32px;
            margin-bottom: 10px;
            color: #cbd5e1;
        }

        /* =========================================================
           RESPONSIVE
        ========================================================= */

        @media (max-width: 1100px) {

            .search-grid {
                grid-template-columns: repeat(2, 1fr);
            }

        }

        @media (max-width: 650px) {

            .search-page {
                padding: 15px;
            }

            .search-grid {
                grid-template-columns: 1fr;
            }

            .search-card,
            .result-card {
                padding: 18px;
            }

        }

    </style>


</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="search-page">

        <!-- =====================================================
             PAGE HEADER
        ====================================================== -->

        <div class="page-header">

            <h1>
                <i class="fa-solid fa-magnifying-glass"></i>
                Purchase Search
            </h1>

            <p>
                Search purchase records using supplier, product,
                category or purchase date.
            </p>

        </div>


        <!-- =====================================================
             SEARCH CARD
        ====================================================== -->

        <div class="search-card">

            <div class="search-card-title">

                <i class="fa-solid fa-filter"></i>

                Search Purchase Records

            </div>


            <div class="search-grid">

                <!-- Supplier Name -->

                <div class="form-group">

                    <label for="txtSupplier">
                        Supplier Name
                    </label>

                    <asp:TextBox
                        ID="txtSupplier"
                        runat="server"
                        CssClass="form-control"
                        placeholder="Enter supplier name">
                    </asp:TextBox>

                </div>


                <!-- Product Name -->

                <div class="form-group">

                    <label for="txtProduct">
                        Product Name
                    </label>

                    <asp:TextBox
                        ID="txtProduct"
                        runat="server"
                        CssClass="form-control"
                        placeholder="Enter product name">
                    </asp:TextBox>

                </div>


                <!-- Category -->

                <div class="form-group">

                    <label for="txtCategory">
                        Category
                    </label>

                    <asp:TextBox
                        ID="txtCategory"
                        runat="server"
                        CssClass="form-control"
                        placeholder="Enter category">
                    </asp:TextBox>

                </div>


                <!-- Purchase Date -->

                <div class="form-group">

                    <label for="txtDate">
                        Purchase Date
                    </label>

                    <asp:TextBox
                        ID="txtDate"
                        runat="server"
                        CssClass="form-control"
                        TextMode="Date">
                    </asp:TextBox>

                </div>


                <!-- Search Button -->

                <div class="search-button-container">

                    <asp:Button
                        ID="btnSearch"
                        runat="server"
                        Text="Search"
                        CssClass="search-btn" OnClick="btnSearch_Click"
                         />

                </div>

            </div>


            <div class="search-hint">

                <i class="fa-solid fa-circle-info"></i>

                Enter information in
                <strong>one search field at a time</strong>
                and click Search.

            </div>

        </div>


        <!-- =====================================================
             RESULT CARD
        ====================================================== -->

        <div class="result-card">

            <div class="result-header">

                <div class="result-title">

                    <i class="fa-solid fa-table"></i>

                    Search Results

                </div>

            </div>


            <!-- =================================================
                 SUPPLIER SEARCH
            ================================================== -->

            <asp:Panel
                ID="pnlSupplierResult"
                runat="server"
                Visible="false">

                <asp:GridView
                    ID="gvSupplier"
                    runat="server"
                    CssClass="purchase-grid"
                    AutoGenerateColumns="false"
                    GridLines="None">

                    <Columns>

                        <asp:BoundField
                            DataField="purchaseid"
                            HeaderText="Purchase ID"
                            ItemStyle-CssClass="purchase-id" />


                        <asp:TemplateField HeaderText="Product">

                            <ItemTemplate>

                                <div class="product-info">

                                    <span class="product-id">
                                        <%# Eval("pro_id") %>
                                    </span>

                                    <span class="product-name">
                                        <%# Eval("pro_name") %>
                                    </span>

                                </div>

                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Category">

                            <ItemTemplate>

                                <span class="category">
                                    <%# Eval("pro_category") %>
                                </span>

                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Quantity">

                            <ItemTemplate>

                                <span class="quantity">
                                    <%# Eval("quantity") %>
                                </span>

                                <span class="unit">
                                    <%# Eval("pro_unit") %>
                                </span>

                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:BoundField
                            DataField="purchaseprice"
                            HeaderText="Purchase Price"
                            DataFormatString="₹{0:N2}" />


                        <asp:BoundField
                            DataField="netamount"
                            HeaderText="Net Amount"
                            DataFormatString="₹{0:N2}"
                            ItemStyle-CssClass="net-amount" />

                    </Columns>

                    <EmptyDataTemplate>

                        <div class="no-result">

                            <i class="fa-solid fa-box-open"></i>

                            No products found for this supplier.

                        </div>

                    </EmptyDataTemplate>

                </asp:GridView>

            </asp:Panel>


            <!-- =================================================
                 PRODUCT SEARCH
            ================================================== -->

            <asp:Panel
                ID="pnlProductResult"
                runat="server"
                Visible="false">

                <asp:GridView
                    ID="gvProduct"
                    runat="server"
                    CssClass="purchase-grid"
                    AutoGenerateColumns="false"
                    GridLines="None">

                    <Columns>

                        <asp:BoundField
                            DataField="purchaseid"
                            HeaderText="Purchase ID"
                            ItemStyle-CssClass="purchase-id" />


                        <asp:TemplateField HeaderText="Product">

                            <ItemTemplate>

                                <div class="product-info">

                                    <span class="product-id">
                                        <%# Eval("pro_id") %>
                                    </span>

                                    <span class="product-name">
                                        <%# Eval("pro_name") %>
                                    </span>

                                </div>

                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:BoundField
                            DataField="pro_brand"
                            HeaderText="Brand" />


                        <asp:TemplateField HeaderText="Category">

                            <ItemTemplate>

                                <span class="category">
                                    <%# Eval("pro_category") %>
                                </span>

                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Supplier">

                            <ItemTemplate>

                                <div class="supplier-info">

                                    <span class="supplier-id">
                                        <%# Eval("sup_id") %>
                                    </span>

                                    <span class="supplier-name">
                                        <%# Eval("sup_name") %>
                                    </span>

                                </div>

                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Quantity">

                            <ItemTemplate>

                                <span class="quantity">
                                    <%# Eval("quantity") %>
                                </span>

                                <span class="unit">
                                    <%# Eval("pro_unit") %>
                                </span>

                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:BoundField
                            DataField="purchaseprice"
                            HeaderText="Purchase Price"
                            DataFormatString="₹{0:N2}" />


                        <asp:BoundField
                            DataField="discountpercent"
                            HeaderText="Discount %"
                            DataFormatString="{0:N2}%" />


                        <asp:BoundField
                            DataField="grossamount"
                            HeaderText="Gross Amount"
                            DataFormatString="₹{0:N2}" />


                        <asp:BoundField
                            DataField="discountamount"
                            HeaderText="Discount"
                            DataFormatString="₹{0:N2}"
                            ItemStyle-CssClass="discount" />


                        <asp:BoundField
                            DataField="netamount"
                            HeaderText="Net Amount"
                            DataFormatString="₹{0:N2}"
                            ItemStyle-CssClass="net-amount" />

                    </Columns>

                    <EmptyDataTemplate>

                        <div class="no-result">

                            <i class="fa-solid fa-box-open"></i>

                            No purchase details found for this product.

                        </div>

                    </EmptyDataTemplate>

                </asp:GridView>

            </asp:Panel>


            <!-- =================================================
                 CATEGORY SEARCH
            ================================================== -->

            <asp:Panel
                ID="pnlCategoryResult"
                runat="server"
                Visible="false">

                <asp:GridView
                    ID="gvCategory"
                    runat="server"
                    CssClass="purchase-grid"
                    AutoGenerateColumns="false"
                    GridLines="None">

                    <Columns>

                        <asp:TemplateField HeaderText="Product">

                            <ItemTemplate>

                                <div class="product-info">

                                    <span class="product-id">
                                        <%# Eval("pro_id") %>
                                    </span>

                                    <span class="product-name">
                                        <%# Eval("pro_name") %>
                                    </span>

                                </div>

                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:BoundField
                            DataField="pro_brand"
                            HeaderText="Brand" />


                        <asp:TemplateField HeaderText="Category">

                            <ItemTemplate>

                                <span class="category">
                                    <%# Eval("pro_category") %>
                                </span>

                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Supplier">

                            <ItemTemplate>

                                <div class="supplier-info">

                                    <span class="supplier-id">
                                        <%# Eval("sup_id") %>
                                    </span>

                                    <span class="supplier-name">
                                        <%# Eval("sup_name") %>
                                    </span>

                                </div>

                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Quantity">

                            <ItemTemplate>

                                <span class="quantity">
                                    <%# Eval("quantity") %>
                                </span>

                                <span class="unit">
                                    <%# Eval("pro_unit") %>
                                </span>

                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:BoundField
                            DataField="purchaseprice"
                            HeaderText="Purchase Price"
                            DataFormatString="₹{0:N2}" />


                        <asp:BoundField
                            DataField="discountpercent"
                            HeaderText="Discount %"
                            DataFormatString="{0:N2}%" />


                        <asp:BoundField
                            DataField="grossamount"
                            HeaderText="Gross Amount"
                            DataFormatString="₹{0:N2}" />


                        <asp:BoundField
                            DataField="discountamount"
                            HeaderText="Discount"
                            DataFormatString="₹{0:N2}"
                            ItemStyle-CssClass="discount" />


                        <asp:BoundField
                            DataField="netamount"
                            HeaderText="Net Amount"
                            DataFormatString="₹{0:N2}"
                            ItemStyle-CssClass="net-amount" />

                    </Columns>

                    <EmptyDataTemplate>

                        <div class="no-result">

                            <i class="fa-solid fa-box-open"></i>

                            No products found under this category.

                        </div>

                    </EmptyDataTemplate>

                </asp:GridView>

            </asp:Panel>


            <!-- =================================================
                 DATE SEARCH
            ================================================== -->

            <asp:Panel
                ID="pnlDateResult"
                runat="server"
                Visible="false">

                <asp:GridView
                    ID="gvDate"
                    runat="server"
                    CssClass="purchase-grid"
                    AutoGenerateColumns="false"
                    GridLines="None">

                    <Columns>

                        <asp:BoundField
                            DataField="purchaseid"
                            HeaderText="Purchase ID"
                            ItemStyle-CssClass="purchase-id" />


                        <asp:TemplateField HeaderText="Supplier">

                            <ItemTemplate>

                                <div class="supplier-info">

                                    <span class="supplier-id">
                                        <%# Eval("sup_id") %>
                                    </span>

                                    <span class="supplier-name">
                                        <%# Eval("sup_name") %>
                                    </span>

                                </div>

                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Category">

                            <ItemTemplate>

                                <span class="category">
                                    <%# Eval("category") %>
                                </span>

                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:BoundField
                            DataField="purchasedate"
                            HeaderText="Purchase Date"
                            DataFormatString="{0:dd-MM-yyyy}" />


                        <asp:BoundField
                            DataField="totalgross"
                            HeaderText="Gross Amount"
                            DataFormatString="₹{0:N2}"
                            ItemStyle-CssClass="amount" />


                        <asp:BoundField
                            DataField="totaldiscount"
                            HeaderText="Discount"
                            DataFormatString="₹{0:N2}"
                            ItemStyle-CssClass="discount" />


                        <asp:BoundField
                            DataField="totalnet"
                            HeaderText="Net Amount"
                            DataFormatString="₹{0:N2}"
                            ItemStyle-CssClass="net-amount" />

                    </Columns>

                    <EmptyDataTemplate>

                        <div class="no-result">

                            <i class="fa-solid fa-calendar-xmark"></i>

                            No purchases found on this date.

                        </div>

                    </EmptyDataTemplate>

                </asp:GridView>

            </asp:Panel>


            <!-- =================================================
                 INITIAL MESSAGE
            ================================================== -->

            <asp:Panel
                ID="pnlInitial"
                runat="server">

                <div class="no-result">

                    <i class="fa-solid fa-magnifying-glass"></i>

                    Enter a Supplier Name, Product Name, Category
                    or Purchase Date to search.

                </div>

            </asp:Panel>

        </div>

    </div>

</asp:Content>