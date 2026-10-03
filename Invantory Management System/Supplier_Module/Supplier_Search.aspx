<%@ Page Title="Search Supplier"
    Language="C#"
    MasterPageFile="~/Supplier_Module/Supplier_Module.Master"
    AutoEventWireup="true"
    CodeBehind="Supplier_Search.aspx.cs"
    Inherits="Inventory_Management_System.SearchSupplier" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style>

        /* =========================================================
           MAIN PAGE
        ========================================================= */

        .search-page-container {
            width: 100%;
            max-width: 1450px;
            margin: 0 auto;
            padding: 28px 25px 45px;
            box-sizing: border-box;
        }


        /* =========================================================
           PAGE HEADER
        ========================================================= */

        .page-header {
            text-align: center;
            margin-bottom: 28px;
        }

        .page-header h2 {
            margin: 0;
            color: #2c5364;
            font-size: 29px;
            font-weight: 700;
            letter-spacing: .2px;
        }

        .page-header h2 i {
            margin-right: 9px;
        }

        .page-header p {
            margin: 8px 0 0;
            color: #7c898f;
            font-size: 14px;
        }


        /* =========================================================
           SEARCH CARD
        ========================================================= */

        .search-card {
            background: #ffffff;
            border: 1px solid #e1e7ea;
            border-radius: 12px;
            box-shadow: 0 4px 18px rgba(0,0,0,.07);
            overflow: hidden;
            margin-bottom: 28px;
        }

        .search-card-header {
            height: 62px;
            padding: 0 24px;
            display: flex;
            align-items: center;
            background: linear-gradient(135deg,#2c5364,#203a43);
            color: #ffffff;
        }

        .search-card-header .header-icon {
            width: 38px;
            height: 38px;
            border-radius: 9px;
            background: rgba(255,255,255,.14);
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 12px;
            font-size: 16px;
        }

        .search-card-header h3 {
            margin: 0;
            font-size: 17px;
            font-weight: 600;
        }

        .search-card-header span {
            margin-left: auto;
            color: rgba(255,255,255,.75);
            font-size: 12px;
        }

        .search-card-body {
            padding: 24px;
        }


        /* =========================================================
           SEARCH CONTROLS
        ========================================================= */

        .search-controls {
            display: grid;
            grid-template-columns: 210px minmax(0,1fr) 125px;
            gap: 15px;
            align-items: end;
        }

        .search-field {
            min-width: 0;
        }

        .search-label {
            display: block;
            margin-bottom: 7px;
            color: #3d4b52;
            font-size: 13px;
            font-weight: 600;
        }

        .search-label i {
            color: #2c5364;
            margin-right: 5px;
        }

        .search-control {
            width: 100%;
            height: 44px;
            padding: 0 13px;
            border: 1px solid #d5dee2;
            border-radius: 7px;
            background: #ffffff;
            color: #35444b;
            font-size: 14px;
            outline: none;
            box-sizing: border-box;
            transition: .2s ease;
        }

        .search-control:focus {
            border-color: #2c5364;
            box-shadow: 0 0 0 3px rgba(44,83,100,.10);
        }

        .search-button {
            width: 100%;
            height: 44px;
            border: none;
            border-radius: 7px;
            background: #2c5364;
            color: #ffffff;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: .2s ease;
        }

        .search-button:hover {
            background: #203a43;
            transform: translateY(-1px);
        }

        .search-button i {
            margin-right: 6px;
        }


        /* =========================================================
           RESULT HEADING
        ========================================================= */

        .result-section {
            margin-top: 4px;
            margin-bottom: 25px;
        }

        .result-heading {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }

        .result-heading-left {
            display: flex;
            align-items: center;
            gap: 11px;
        }

        .result-heading-icon {
            width: 38px;
            height: 38px;
            border-radius: 9px;
            background: #eef4f6;
            color: #2c5364;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .result-heading h3 {
            margin: 0;
            color: #293940;
            font-size: 19px;
            font-weight: 700;
        }

        .result-heading p {
            margin: 3px 0 0;
            color: #8a969c;
            font-size: 12px;
        }


        /* =========================================================
           SUPPLIER DETAILS CARD
        ========================================================= */

        .supplier-detail-card {
            background: #ffffff;
            border: 1px solid #e1e7ea;
            border-radius: 12px;
            box-shadow: 0 4px 18px rgba(0,0,0,.06);
            overflow: hidden;
        }

        .supplier-detail-header {
            display: flex;
            align-items: center;
            padding: 18px 22px;
            background: #f7f9fa;
            border-bottom: 1px solid #e5eaed;
        }

        .supplier-avatar {
            width: 46px;
            height: 46px;
            border-radius: 50%;
            background: linear-gradient(135deg,#2c5364,#203a43);
            color: #ffffff;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 13px;
            font-size: 18px;
        }

        .supplier-heading-text h4 {
            margin: 0;
            color: #293940;
            font-size: 16px;
            font-weight: 700;
        }

        .supplier-heading-text span {
            display: block;
            margin-top: 4px;
            color: #89959b;
            font-size: 12px;
        }

        .supplier-detail-body {
            padding: 22px;
        }


        /* =========================================================
           DETAIL ROWS
        ========================================================= */

        .detail-row {
            display: grid;
            grid-template-columns: 17% 33% 17% 33%;
            border-left: 1px solid #e3e8eb;
            border-top: 1px solid #e3e8eb;
        }

        .detail-label {
            padding: 14px 15px;
            background: #f5f7f8;
            border-right: 1px solid #e3e8eb;
            border-bottom: 1px solid #e3e8eb;
            color: #59666d;
            font-size: 13px;
            font-weight: 600;
        }

        .detail-value {
            padding: 14px 15px;
            background: #ffffff;
            border-right: 1px solid #e3e8eb;
            border-bottom: 1px solid #e3e8eb;
            color: #293940;
            font-size: 13px;
            overflow-wrap: anywhere;
        }

        .detail-label i {
            width: 18px;
            color: #2c5364;
            margin-right: 4px;
        }


        /* =========================================================
           ACTION BUTTONS
        ========================================================= */

        .supplier-actions {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
            margin-top: 20px;
        }

        .btn-edit,
        .btn-delete,
        .btn-view {
            min-width: 90px;
            height: 38px;
            padding: 0 15px;
            border-radius: 6px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            text-decoration: none !important;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            transition: .2s ease;
            box-sizing: border-box;
        }

        .btn-edit {
            background: #2c5364;
            border: 1px solid #2c5364;
            color: #ffffff !important;
        }

        .btn-edit:hover {
            background: #203a43;
            border-color: #203a43;
            transform: translateY(-1px);
        }

        .btn-delete {
            background: #ffffff;
            border: 1px solid #e0b8b3;
            color: #c0392b !important;
        }

        .btn-delete:hover {
            background: #fff5f4;
            border-color: #c0392b;
            transform: translateY(-1px);
        }

        .btn-view {
            min-width: 80px;
            background: #eef5f7;
            border: 1px solid #d6e3e7;
            color: #2c5364 !important;
        }

        .btn-view:hover {
            background: #2c5364;
            border-color: #2c5364;
            color: #ffffff !important;
        }

        .btn-edit i,
        .btn-delete i,
        .btn-view i {
            margin-right: 6px;
        }


        /* =========================================================
           NO RESULT
        ========================================================= */

        .no-result {
            background: #ffffff;
            border: 1px solid #e1e7ea;
            border-radius: 12px;
            padding: 45px 20px;
            text-align: center;
            box-shadow: 0 4px 16px rgba(0,0,0,.05);
        }

        .no-result i {
            display: block;
            margin-bottom: 12px;
            color: #b7c1c5;
            font-size: 38px;
        }

        .no-result h4 {
            margin: 0 0 5px;
            color: #56636a;
            font-size: 16px;
        }

        .no-result p {
            margin: 0;
            color: #8a969c;
            font-size: 13px;
        }


        /* =========================================================
           SEARCH RESULT TABLE CARD
        ========================================================= */

        .supplier-grid-card {
            background: #ffffff;
            border: 1px solid #e1e7ea;
            border-radius: 12px;
            box-shadow: 0 4px 18px rgba(0,0,0,.06);
            overflow: hidden;
        }

        .grid-card-header {
            min-height: 58px;
            padding: 0 21px;
            display: flex;
            align-items: center;
            background: #f8fafb;
            border-bottom: 1px solid #e5eaed;
            box-sizing: border-box;
        }

        .grid-card-icon {
            width: 37px;
            height: 37px;
            border-radius: 8px;
            background: #eef4f6;
            color: #2c5364;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 11px;
        }

        .grid-card-header h4 {
            margin: 0;
            color: #293940;
            font-size: 16px;
            font-weight: 700;
        }

        .grid-card-header span {
            margin-left: auto;
            color: #8a969c;
            font-size: 12px;
        }


        /* =========================================================
           GRID SCROLL
        ========================================================= */

        .supplier-grid-wrapper {
            width: 100%;
            max-height: 570px;
            overflow-y: auto;
            overflow-x: auto;
            box-sizing: border-box;
        }

        .supplier-grid-wrapper::-webkit-scrollbar {
            width: 8px;
            height: 8px;
        }

        .supplier-grid-wrapper::-webkit-scrollbar-track {
            background: #f1f3f4;
        }

        .supplier-grid-wrapper::-webkit-scrollbar-thumb {
            background: #c2ccd1;
            border-radius: 10px;
        }

        .supplier-grid-wrapper::-webkit-scrollbar-thumb:hover {
            background: #9eabb1;
        }


        /* =========================================================
           GRIDVIEW
        ========================================================= */

        .supplier-grid {
            width: 100%;
            min-width: 950px;
            border-collapse: separate;
            border-spacing: 0;
            table-layout: fixed;
            color: #35444b;
            font-size: 13px;
        }

        .supplier-grid th {
            position: sticky;
            top: 0;
            z-index: 10;
            height: 48px;
            padding: 0 10px;
            background: #2c5364;
            color: #ffffff;
            border: none;
            font-size: 12px;
            font-weight: 600;
            text-align: left;
            white-space: nowrap;
            box-sizing: border-box;
        }

        .supplier-grid td {
            height: 47px;
            padding: 8px 10px;
            background: #ffffff;
            border-bottom: 1px solid #edf0f2;
            color: #3d4c53;
            vertical-align: middle;
            box-sizing: border-box;
            overflow-wrap: anywhere;
        }

        .supplier-grid tr:hover td {
            background: #f8fafb;
        }

        .supplier-grid tr:last-child td {
            border-bottom: none;
        }


        /* =========================================================
           TABLE COLUMN WIDTHS
        ========================================================= */

        .supplier-grid th:nth-child(1),
        .supplier-grid td:nth-child(1) {
            width: 105px;
        }

        .supplier-grid th:nth-child(2),
        .supplier-grid td:nth-child(2) {
            width: 155px;
        }

        .supplier-grid th:nth-child(3),
        .supplier-grid td:nth-child(3) {
            width: 70px;
            text-align: center;
        }

        .supplier-grid th:nth-child(4),
        .supplier-grid td:nth-child(4) {
            width: 100px;
        }

        .supplier-grid th:nth-child(5),
        .supplier-grid td:nth-child(5) {
            width: 140px;
        }

        .supplier-grid th:nth-child(6),
        .supplier-grid td:nth-child(6) {
            width: 130px;
        }

        .supplier-grid th:nth-child(7),
        .supplier-grid td:nth-child(7) {
            width: 210px;
        }

        .supplier-grid th:nth-child(8),
        .supplier-grid td:nth-child(8) {
            width: 110px;
            text-align: center;
        }

        .supplier-grid td:first-child {
            color: #2c5364;
            font-weight: 700;
        }


        /* =========================================================
           RESPONSIVE
        ========================================================= */

        @media (max-width:1100px) {

            .search-page-container {
                padding-left: 18px;
                padding-right: 18px;
            }

            .detail-row {
                grid-template-columns: 18% 32% 18% 32%;
            }
        }


        @media (max-width:850px) {

            .search-page-container {
                padding: 22px 15px 35px;
            }

            .page-header h2 {
                font-size: 25px;
            }

            .search-controls {
                grid-template-columns: 1fr;
                gap: 13px;
            }

            .search-button {
                width: 140px;
            }

            .detail-row {
                grid-template-columns: 135px 1fr;
            }
        }


        @media (max-width:600px) {

            .search-page-container {
                padding: 18px 10px 30px;
            }

            .page-header {
                margin-bottom: 20px;
            }

            .page-header h2 {
                font-size: 22px;
            }

            .page-header p {
                font-size: 12px;
                line-height: 1.5;
            }

            .search-card-header {
                padding: 0 16px;
            }

            .search-card-header span {
                display: none;
            }

            .search-card-body {
                padding: 17px;
            }

            .search-button {
                width: 100%;
            }

            .result-heading h3 {
                font-size: 17px;
            }

            .supplier-detail-header {
                padding: 15px;
            }

            .supplier-detail-body {
                padding: 15px;
            }

            .detail-row {
                display: block;
            }

            .detail-label {
                border-bottom: none;
                padding-bottom: 7px;
            }

            .detail-value {
                padding-top: 7px;
                margin-bottom: 4px;
            }

            .supplier-actions {
                justify-content: stretch;
            }

            .btn-edit,
            .btn-delete {
                flex: 1;
            }

            .grid-card-header {
                padding: 0 15px;
            }

            .grid-card-header span {
                display: none;
            }

            .supplier-grid-wrapper {
                max-height: 500px;
            }
        }

    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="search-page-container">


        <!-- =====================================================
             PAGE HEADER
        ====================================================== -->

        <div class="page-header">

            <h2>
                <i class="fa-solid fa-magnifying-glass"></i>
                Search Supplier
            </h2>

            <p>
                Search suppliers by Supplier ID, Supplier Name or Product Category.
            </p>

        </div>


        <!-- =====================================================
             SEARCH CARD
        ====================================================== -->

        <div class="search-card">

            <div class="search-card-header">

                <div class="header-icon">
                    <i class="fa-solid fa-filter"></i>
                </div>

                <h3>Supplier Search</h3>

                <span>
                    Search supplier information
                </span>

            </div>


            <div class="search-card-body">

                <div class="search-controls">


                    <!-- SEARCH TYPE -->

                    <div class="search-field">

                        <label class="search-label">
                            <i class="fa-solid fa-list"></i>
                            Search By
                        </label>

                        <asp:DropDownList
                            ID="ddlSearchType"
                            runat="server"
                            CssClass="search-control">

                            <asp:ListItem
                                Text="Supplier ID"
                                Value="ID">
                            </asp:ListItem>

                            <asp:ListItem
                                Text="Supplier Name"
                                Value="NAME">
                            </asp:ListItem>

                            <asp:ListItem
                                Text="Product Category"
                                Value="CATEGORY">
                            </asp:ListItem>

                        </asp:DropDownList>

                    </div>


                    <!-- SEARCH TEXT -->

                    <div class="search-field">

                        <label class="search-label">
                            <i class="fa-solid fa-keyboard"></i>
                            Search
                        </label>

                        <asp:TextBox
                            ID="txtSearch"
                            runat="server"
                            CssClass="search-control"
                            placeholder="Enter supplier ID, name or category...">
                        </asp:TextBox>

                    </div>


                    <!-- SEARCH BUTTON -->

                    <div class="search-field">

                        <asp:Button
                            ID="btnSearch"
                            runat="server"
                            Text="Search"
                            CssClass="search-button"
                            OnClick="btnSearch_Click" />

                    </div>

                </div>

            </div>

        </div>


        <!-- =====================================================
             SUPPLIER ID RESULT
        ====================================================== -->

        <asp:Panel
            ID="pnlIdResult"
            runat="server"
            Visible="false"
            CssClass="result-section">


            <div class="result-heading">

                <div class="result-heading-left">

                    <div class="result-heading-icon">
                        <i class="fa-solid fa-user-check"></i>
                    </div>

                    <div>

                        <h3>Supplier Details</h3>

                        <p>
                            Supplier information
                        </p>

                    </div>

                </div>

            </div>


            <asp:Repeater
                ID="rptSupplierById"
                runat="server"
                OnItemCommand="rptSupplierById_ItemCommand">

                <ItemTemplate>

                    <div class="supplier-detail-card">


                        <!-- SUPPLIER HEADER -->

                        <div class="supplier-detail-header">

                            <div class="supplier-avatar">
                                <i class="fa-solid fa-user"></i>
                            </div>

                            <div class="supplier-heading-text">

                                <h4>
                                    <%# Eval("sup_name") %>
                                </h4>

                                <span>
                                    Supplier ID:
                                    <%# Eval("sup_id") %>
                                </span>

                            </div>

                        </div>


                        <!-- SUPPLIER DETAILS -->

                        <div class="supplier-detail-body">


                            <!-- ROW 1 -->

                            <div class="detail-row">

                                <div class="detail-label">
                                    <i class="fa-solid fa-id-card"></i>
                                    Supplier ID
                                </div>

                                <div class="detail-value">
                                    <%# Eval("sup_id") %>
                                </div>


                                <div class="detail-label">
                                    <i class="fa-solid fa-user"></i>
                                    Supplier Name
                                </div>

                                <div class="detail-value">
                                    <%# Eval("sup_name") %>
                                </div>

                            </div>


                            <!-- ROW 2 -->

                            <div class="detail-row">

                                <div class="detail-label">
                                    <i class="fa-solid fa-calendar"></i>
                                    Age
                                </div>

                                <div class="detail-value">
                                    <%# Eval("sup_age") %>
                                </div>


                                <div class="detail-label">
                                    <i class="fa-solid fa-venus-mars"></i>
                                    Gender
                                </div>

                                <div class="detail-value">
                                    <%# Eval("sup_gender") %>
                                </div>

                            </div>


                            <!-- ROW 3 -->

                            <div class="detail-row">

                                <div class="detail-label">
                                    <i class="fa-solid fa-box"></i>
                                    Product Category
                                </div>

                                <div class="detail-value">
                                    <%# Eval("sup_category") %>
                                </div>


                                <div class="detail-label">
                                    <i class="fa-solid fa-phone"></i>
                                    Contact Number
                                </div>

                                <div class="detail-value">
                                    <%# Eval("sup_contact") %>
                                </div>

                            </div>


                            <!-- ROW 4 -->

                            <div class="detail-row">

                                <div class="detail-label">
                                    <i class="fa-solid fa-envelope"></i>
                                    Email
                                </div>

                                <div class="detail-value">
                                    <%# Eval("sup_email") %>
                                </div>


                                <div class="detail-label">
                                    <i class="fa-solid fa-location-dot"></i>
                                    Address
                                </div>

                                <div class="detail-value">
                                    <%# Eval("sup_address") %>
                                </div>

                            </div>


                            <!-- ROW 5 -->

                            <div class="detail-row">

                                <div class="detail-label">
                                    <i class="fa-solid fa-user-lock"></i>
                                    User ID
                                </div>

                                <div class="detail-value">
                                    <%# Eval("sup_userid") %>
                                </div>


                                <div class="detail-label">
                                </div>

                                <div class="detail-value">
                                </div>

                            </div>


                            <!-- ACTION BUTTONS -->

                            <div class="supplier-actions">

                                <asp:LinkButton
                                    ID="btnEdit"
                                    runat="server"
                                    Text="Edit"
                                    CommandName="EditSupplier"
                                    CommandArgument='<%# Eval("sup_id") %>'
                                    CssClass="btn-edit">

                                    <i class="fa-solid fa-pen-to-square"></i>
                                    Edit

                                </asp:LinkButton>


                                <asp:LinkButton
                                    ID="btnDelete"
                                    runat="server"
                                    Text="Delete"
                                    CommandName="DeleteSupplier"
                                    CommandArgument='<%# Eval("sup_id") %>'
                                    CssClass="btn-delete">

                                    <i class="fa-solid fa-trash"></i>
                                    Delete

                                </asp:LinkButton>

                            </div>

                        </div>

                    </div>

                </ItemTemplate>

            </asp:Repeater>


            <!-- NO RESULT -->

            <asp:Label
                ID="lblIdNoResult"
                runat="server"
                Visible="false">

                <div class="no-result">

                    <i class="fa-regular fa-circle-xmark"></i>

                    <h4>Supplier Not Found</h4>

                    <p>
                        No supplier was found with the entered Supplier ID.
                    </p>

                </div>

            </asp:Label>

        </asp:Panel>


        <!-- =====================================================
             SEARCH RESULT GRID
        ====================================================== -->

        <asp:Panel
            ID="pnlSearchResult"
            runat="server"
            Visible="false"
            CssClass="result-section">


            <div class="result-heading">

                <div class="result-heading-left">

                    <div class="result-heading-icon">
                        <i class="fa-solid fa-table-list"></i>
                    </div>

                    <div>

                        <h3>Search Results</h3>

                        <p>
                            Suppliers matching your search
                        </p>

                    </div>

                </div>

            </div>


            <div class="supplier-grid-card">


                <div class="grid-card-header">

                    <div class="grid-card-icon">
                        <i class="fa-solid fa-users"></i>
                    </div>

                    <h4>Supplier List</h4>

                    <span>
                        Supplier Information
                    </span>

                </div>


                <div class="supplier-grid-wrapper">

                    <asp:Label
    ID="lblSearchNoResult"
    runat="server"
    Visible="false"
    CssClass="no-result">

    <i class="fa-regular fa-circle-xmark"></i>

    <h4>No Suppliers Found</h4>

    <p>
        No supplier matched your search criteria.
    </p>

</asp:Label>

                    <asp:GridView
                        ID="gvSupplierSearch"
                        runat="server"
                        AutoGenerateColumns="False"
                        DataKeyNames="sup_id"
                        CssClass="supplier-grid"
                        OnRowCommand="gvSupplierSearch_RowCommand"
                        GridLines="None">

                        <Columns>


                            

                            <asp:BoundField
                                DataField="sup_id"
                                HeaderText="Supplier ID" />



                            <asp:BoundField
                                DataField="sup_name"
                                HeaderText="Supplier Name" />



                            <asp:BoundField
                                DataField="sup_age"
                                HeaderText="Age" />



                            <asp:BoundField
                                DataField="sup_gender"
                                HeaderText="Gender" />


                           

                            <asp:BoundField
                                DataField="sup_category"
                                HeaderText="Product Category" />



                            <asp:BoundField
                                DataField="sup_contact"
                                HeaderText="Contact" />



                            <asp:BoundField
                                DataField="sup_email"
                                HeaderText="Email" />



                            <asp:TemplateField
                                HeaderText="Action">

                                <ItemTemplate>

                                    <asp:LinkButton
                                        ID="btnView"
                                        runat="server"
                                        Text="View"
                                        CommandName="ViewSupplier"
                                        CommandArgument='<%# Eval("sup_id") %>'
                                        CssClass="btn-view">

                                        <i class="fa-solid fa-eye"></i>
                                        View

                                    </asp:LinkButton>

                                </ItemTemplate>

                            </asp:TemplateField>


                        </Columns>

                    </asp:GridView>

                </div>

            </div>

        </asp:Panel>


    </div>

</asp:Content>
