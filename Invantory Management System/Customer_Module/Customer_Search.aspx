<%@ Page Title="Search Customer"
    Language="C#"
    MasterPageFile="~/Customer_Module/Customer_Module.Master"
    AutoEventWireup="true"
    CodeBehind="Customer_Search.aspx.cs"
    Inherits="Inventory_Management_System.SearchCustomer" %>


<asp:Content
    ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">


    <!-- =========================================================
         FONT AWESOME
         ========================================================= -->

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />


    <style type="text/css">

        /* =========================================================
           CUSTOMER SEARCH MAIN LAYOUT
           ========================================================= */

        .customer-search-layout {

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
           MAIN SEARCH AREA
           ========================================================= */

        .search-page {

            width: 100%;

            max-width: 900px;

            margin: 0;

            padding: 0;

            color: #1f2937;

        }


        /* =========================================================
           SIDE BOX CONTAINER
           ========================================================= */

        .search-side-boxes {

            width: 205px;

            display: flex;

            flex-direction: column;

            gap: 24px;

            flex-shrink: 0;

        }


        /* =========================================================
           LEFT SIDE POSITION
           ========================================================= */

        .search-side-boxes.left {

            margin-top: 88px;

        }


        /* =========================================================
           RIGHT SIDE POSITION
           ========================================================= */

        .search-side-boxes.right {

            margin-top: 88px;

        }


        /* =========================================================
           SIDE INFORMATION BOX
           ========================================================= */

        .search-side-box {

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
           SIDE BOX TOP ACCENT
           ========================================================= */

        .search-side-box::before {

            content: "";

            position: absolute;

            top: 0;

            left: 0;

            right: 0;

            height: 3px;

            background: #2c5364;

        }


        /* =========================================================
           SIDE BOX HOVER
           ========================================================= */

        .search-side-box:hover {

            transform: translateY(-4px);

            border-color: #ccdadd;

            box-shadow:
                0 9px 22px rgba(31, 41, 55, 0.09);

        }


        /* =========================================================
           SIDE BOX ICON
           ========================================================= */

        .side-box-icon {

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


        .search-side-box:hover .side-box-icon {

            background: #2c5364;

            color: #ffffff;

            border-color: #2c5364;

        }


        /* =========================================================
           SIDE BOX TITLE
           ========================================================= */

        .search-side-box h3 {

            margin: 0 0 9px 0;

            color: #26313a;

            font-size: 14px;

            font-weight: 650;

            line-height: 1.4;

        }


        /* =========================================================
           SIDE BOX DESCRIPTION
           ========================================================= */

        .search-side-box p {

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

        .header-left {

            display: flex;

            align-items: center;

            gap: 14px;

        }


        /* =========================================================
           HEADER ICON
           ========================================================= */

        .header-icon {

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

        }


        /* =========================================================
           PAGE TITLE
           ========================================================= */

        .page-header h2 {

            margin: 0 0 4px 0;

            font-size: 25px;

            font-weight: 650;

            color: #17212b;

            letter-spacing: -0.4px;

        }


        .page-header p {

            margin: 0;

            font-size: 13px;

            color: #6b7280;

        }


        /* =========================================================
           HEADER STATUS
           ========================================================= */

        .header-status {

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

        }


        .status-dot {

            width: 7px;

            height: 7px;

            background: #2c5364;

            border-radius: 50%;

        }


        /* =========================================================
           SEARCH CARD
           ========================================================= */

        .search-card {

            position: relative;

            background: #ffffff;

            border: 1px solid #e3e8eb;

            border-radius: 12px;

            padding: 25px 27px 24px 27px;

            margin-bottom: 27px;

            box-shadow:
                0 3px 12px rgba(31, 41, 55, 0.05);

        }


        /* =========================================================
           SEARCH CARD ACCENT
           ========================================================= */

        .search-card::before {

            content: "";

            position: absolute;

            left: 0;

            top: 18px;

            bottom: 18px;

            width: 3px;

            background: #2c5364;

            border-radius: 0 4px 4px 0;

        }


        /* =========================================================
           SEARCH TITLE
           ========================================================= */

        .search-title {

            display: flex;

            align-items: center;

            gap: 12px;

            margin-bottom: 20px;

        }


        .search-title-icon {

            width: 38px;

            height: 38px;

            display: flex;

            align-items: center;

            justify-content: center;

            background: #f1f6f8;

            color: #2c5364;

            border: 1px solid #dfe9ec;

            border-radius: 8px;

            font-size: 15px;

        }


        .search-title h3 {

            margin: 0 0 3px 0;

            font-size: 17px;

            font-weight: 650;

            color: #1f2937;

        }


        .search-title p {

            margin: 0;

            font-size: 12px;

            color: #7b8490;

        }


        /* =========================================================
           SEARCH CONTROLS
           ========================================================= */

        .search-controls {

            display: grid;

            grid-template-columns: 170px 1fr 105px;

            gap: 10px;

            align-items: center;

        }


        /* =========================================================
           SEARCH TYPE
           ========================================================= */

        .search-type {

            width: 100%;

            height: 44px;

            box-sizing: border-box;

            padding: 0 13px;

            background: #f8fafb;

            border: 1px solid #d5dde1;

            border-radius: 7px;

            color: #374151;

            font-size: 13px;

            outline: none;

            cursor: pointer;

            transition: all 0.2s ease;

        }


        .search-type:hover {

            border-color: #b9c8ce;

        }


        /* =========================================================
           SEARCH INPUT
           ========================================================= */

        .search-input {

            width: 100%;

            height: 44px;

            box-sizing: border-box;

            padding: 0 14px;

            background: #f8fafb;

            border: 1px solid #d5dde1;

            border-radius: 7px;

            color: #1f2937;

            font-family: inherit;

            font-size: 13px;

            outline: none;

            transition: all 0.2s ease;

        }


        .search-input::placeholder {

            color: #9ca3af;

        }


        .search-input:focus,
        .search-type:focus {

            background: #ffffff;

            border-color: #2c5364;

            box-shadow:
                0 0 0 3px rgba(44, 83, 100, 0.09);

        }


        /* =========================================================
           SEARCH BUTTON
           ========================================================= */

        .btn-search {

            height: 44px;

            padding: 0 16px;

            display: flex;

            align-items: center;

            justify-content: center;

            gap: 7px;

            background: #2c5364;

            color: #ffffff;

            border: 1px solid #2c5364;

            border-radius: 7px;

            font-family: inherit;

            font-size: 12px;

            font-weight: 600;

            cursor: pointer;

            transition: all 0.2s ease;

        }


        .btn-search:hover {

            background: #203a43;

            border-color: #203a43;

            transform: translateY(-1px);

            box-shadow:
                0 4px 10px rgba(44, 83, 100, 0.18);

        }


        .btn-search:active {

            transform: translateY(0);

        }


        /* =========================================================
           SEARCH HINT
           ========================================================= */

        .search-hint {

            display: flex;

            align-items: center;

            gap: 6px;

            margin-top: 12px;

            color: #8a929b;

            font-size: 11px;

        }


        .search-hint i {

            color: #2c5364;

        }


        /* =========================================================
           RESULT HEADER
           ========================================================= */

        .result-header {

            display: flex;

            justify-content: space-between;

            align-items: center;

            margin-bottom: 12px;

        }


        .result-heading {

            display: flex;

            align-items: center;

            gap: 10px;

        }


        .result-icon {

            width: 34px;

            height: 34px;

            display: flex;

            align-items: center;

            justify-content: center;

            background: #f1f6f8;

            color: #2c5364;

            border: 1px solid #dfe8eb;

            border-radius: 7px;

            font-size: 13px;

        }


        .result-header h3 {

            margin: 0;

            font-size: 17px;

            font-weight: 650;

            color: #1f2937;

        }


        /* =========================================================
           RESULT COUNT
           ========================================================= */

        .result-count {

            display: inline-flex;

            align-items: center;

            gap: 6px;

            padding: 7px 11px;

            background: #f3f6f8;

            color: #2c5364;

            border: 1px solid #e0e7ea;

            border-radius: 20px;

            font-size: 11px;

            font-weight: 650;

        }


        /* =========================================================
           GRID CARD
           ========================================================= */

        .grid-card {

            background: #ffffff;

            border: 1px solid #e2e7e9;

            border-radius: 11px;

            overflow-x: auto;

            box-shadow:
                0 3px 12px rgba(31, 41, 55, 0.045);

        }


        /* =========================================================
           CUSTOMER GRID
           ========================================================= */

        .customer-grid {

            width: 100%;

            border-collapse: separate;

            border-spacing: 0;

            font-size: 13px;

            color: #374151;

        }


        /* =========================================================
           GRID HEADER
           ========================================================= */

        .customer-grid th {

            padding: 14px 15px;

            background: #f7f9fa;

            color: #5b6570;

            border-bottom: 1px solid #e3e8ea;

            font-size: 10px;

            font-weight: 700;

            text-transform: uppercase;

            letter-spacing: 0.6px;

            text-align: center;

            white-space: nowrap;

        }


        .customer-grid th:first-child {

            border-top-left-radius: 10px;

        }


        .customer-grid th:last-child {

            border-top-right-radius: 10px;

        }


        /* =========================================================
           GRID DATA
           ========================================================= */

        .customer-grid td {

            padding: 14px 15px;

            background: #ffffff;

            border-bottom: 1px solid #edf0f2;

            text-align: center;

            vertical-align: middle;

            white-space: nowrap;

        }


        .customer-grid tr:last-child td {

            border-bottom: none;

        }


        .customer-grid tr:hover td {

            background: #fafcfc;

        }


        /* =========================================================
           CUSTOMER ID
           ========================================================= */

        .customer-id {

            display: inline-flex;

            align-items: center;

            justify-content: center;

            min-width: 68px;

            padding: 5px 9px;

            background: #f2f6f8;

            color: #2c5364;

            border: 1px solid #dce6e9;

            border-radius: 5px;

            font-size: 11px;

            font-weight: 700;

            letter-spacing: 0.2px;

        }


        .customer-id i {

            margin-right: 5px;

            font-size: 10px;

        }


        /* =========================================================
           CUSTOMER NAME
           ========================================================= */

        .customer-name {

            font-weight: 600;

            color: #26313a;

        }


        /* =========================================================
           CUSTOMER CONTACT
           ========================================================= */

        .customer-contact {

            color: #59636d;

            font-size: 12px;

        }


        .customer-contact i {

            margin-right: 5px;

            font-size: 10px;

            color: #2c5364;

        }


        /* =========================================================
           GRID ACTIONS
           ========================================================= */

        .grid-actions {

            display: flex;

            justify-content: center;

            align-items: center;

            gap: 7px;

        }


        /* =========================================================
           ACTION BUTTON
           ========================================================= */

        .btn-action {

            display: inline-flex;

            align-items: center;

            justify-content: center;

            gap: 6px;

            min-width: 68px;

            height: 32px;

            padding: 0 10px;

            border-radius: 6px;

            font-family: inherit;

            font-size: 11px;

            font-weight: 600;

            cursor: pointer;

            text-decoration: none;

            border: 1px solid transparent;

            transition: all 0.18s ease;

        }


        /* =========================================================
           EDIT BUTTON
           ========================================================= */

        .btn-edit {

            background: #f1f6f8;

            color: #2c5364;

            border-color: #dce7ea;

        }


        .btn-edit:hover {

            background: #2c5364;

            color: #ffffff;

            border-color: #2c5364;

            transform: translateY(-1px);

            box-shadow:
                0 3px 7px rgba(44, 83, 100, 0.15);

        }


        /* =========================================================
           DELETE BUTTON
           ========================================================= */

        .btn-delete {

            background: #fff6f5;

            color: #c0392b;

            border-color: #f0d8d5;

        }


        .btn-delete:hover {

            background: #c0392b;

            color: #ffffff;

            border-color: #c0392b;

            transform: translateY(-1px);

            box-shadow:
                0 3px 7px rgba(192, 57, 43, 0.14);

        }


        /* =========================================================
           MESSAGE BOX
           ========================================================= */

        .message-box {

            display: block;

            padding: 15px 17px;

            margin-top: 17px;

            background: #f8fafb;

            border: 1px solid #e2e7e9;

            border-radius: 8px;

            color: #6b7280;

            font-size: 12px;

            text-align: center;

        }


        /* =========================================================
           MESSAGE ICON
           ========================================================= */

        .message-box:before {

            content: "\f05a";

            font-family: "Font Awesome 6 Free";

            font-weight: 900;

            margin-right: 7px;

            color: #2c5364;

        }


        /* =========================================================
           RESPONSIVE - 1250px
           ========================================================= */

        @media (max-width: 1250px) {

            .search-side-boxes {

                width: 185px;

            }


            .customer-search-layout {

                gap: 18px;

            }

        }


        /* =========================================================
           RESPONSIVE - 1100px
           ========================================================= */

        @media (max-width: 1100px) {

            .search-side-boxes {

                display: none;

            }


            .customer-search-layout {

                display: block;

                padding-left: 20px;

                padding-right: 20px;

            }


            .customer-search-layout .search-page {

                max-width: 1050px;

                margin: 0 auto;

            }

        }


        /* =========================================================
           RESPONSIVE - 700px
           ========================================================= */

        @media (max-width: 700px) {

            .customer-search-layout {

                padding-left: 15px;

                padding-right: 15px;

            }


            .page-header {

                align-items: flex-start;

            }


            .header-status {

                display: none;

            }


            .search-card {

                padding: 22px;

            }


            .search-controls {

                display: flex;

                flex-direction: column;

                align-items: stretch;

            }


            .search-type,
            .search-input,
            .btn-search {

                width: 100%;

            }


            .result-header {

                align-items: flex-start;

                gap: 10px;

            }


            .grid-actions {

                flex-direction: column;

            }

        }


        /* =========================================================
           RESPONSIVE - 500px
           ========================================================= */

        @media (max-width: 500px) {

            .customer-search-layout {

                padding-left: 10px;

                padding-right: 10px;

            }


            .page-header h2 {

                font-size: 21px;

            }


            .header-icon {

                width: 42px;

                height: 42px;

                font-size: 17px;

            }


            .search-card {

                padding: 19px;

            }


            .result-header {

                flex-direction: column;

            }


            .result-count {

                align-self: flex-start;

            }


            .customer-grid th,
            .customer-grid td {

                padding: 12px;

            }

        }

    </style>

</asp:Content>



<asp:Content
    ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">


    <!-- =========================================================
         MAIN CUSTOMER SEARCH LAYOUT
         ========================================================= -->

    <div class="customer-search-layout">


        <!-- =====================================================
             LEFT SIDE BOXES
             ===================================================== -->

        <div class="search-side-boxes left">


            <!-- CUSTOMER MANAGEMENT -->

            <div class="search-side-box">

                <div class="side-box-icon">

                    <i class="fa-solid fa-users"></i>

                </div>

                <h3>
                    Customer Management
                </h3>

                <p>
                    Search, edit and manage customer
                    information from one central place.
                </p>

            </div>


            <!-- CUSTOMER RECORDS -->

            <div class="search-side-box">

                <div class="side-box-icon">

                    <i class="fa-solid fa-address-book"></i>

                </div>

                <h3>
                    Customer Records
                </h3>

                <p>
                    Quickly find customer records using
                    Customer ID or customer name.
                </p>

            </div>


        </div>



        <!-- =====================================================
             MAIN SEARCH AREA
             ===================================================== -->

        <div class="search-page">


            <!-- =================================================
                 PAGE HEADER
                 ================================================= -->

            <div class="page-header">


                <div class="header-left">


                    <div class="header-icon">

                        <i class="fa-solid fa-magnifying-glass"></i>

                    </div>


                    <div>

                        <h2>
                            Search Customer
                        </h2>

                        <p>
                            Search and manage registered customer records.
                        </p>

                    </div>


                </div>


                <div class="header-status">

                    <span class="status-dot"></span>

                    Customer Records

                </div>


            </div>



            <!-- =================================================
                 SEARCH CARD
                 ================================================= -->

            <div class="search-card">


                <div class="search-title">


                    <div class="search-title-icon">

                        <i class="fa-solid fa-user-magnifying-glass"></i>

                    </div>


                    <div>

                        <h3>
                            Find Customer
                        </h3>

                        <p>
                            Search customers using their ID or registered name.
                        </p>

                    </div>


                </div>



                <!-- SEARCH CONTROLS -->

                <div class="search-controls">


                    <!-- SEARCH TYPE -->

                    <asp:DropDownList
                        ID="ddlSearchType"
                        runat="server"
                        CssClass="search-type">

                        <asp:ListItem
                            Text="Search by ID"
                            Value="ID">
                        </asp:ListItem>

                        <asp:ListItem
                            Text="Search by Name"
                            Value="Name">
                        </asp:ListItem>

                    </asp:DropDownList>


                    <!-- SEARCH INPUT -->

                    <asp:TextBox
                        ID="TextBox1"
                        runat="server"
                        CssClass="search-input"
                        placeholder="Enter Customer ID or Name">
                    </asp:TextBox>


                    <!-- SEARCH BUTTON -->

                    <asp:Button
                        ID="Button1"
                        runat="server"
                        Text="Search"
                        CssClass="btn-search"
                        OnClick="Button1_Click2" />


                </div>



                <!-- SEARCH HINT -->

                <div class="search-hint">

                    <i class="fa-solid fa-circle-info"></i>

                    Use Customer ID such as CUST-101
                    or enter the customer's name.

                </div>


            </div>



            <!-- =================================================
                 SEARCH RESULTS
                 ================================================= -->

            <asp:Panel
                ID="pnlGrid"
                runat="server"
                Visible="false">


                <!-- RESULT HEADER -->

                <div class="result-header">


                    <div class="result-heading">


                        <div class="result-icon">

                            <i class="fa-solid fa-users"></i>

                        </div>


                        <h3>
                            Customer Search Results
                        </h3>


                    </div>


                    <span class="result-count">

                        <i class="fa-solid fa-user"></i>

                        <asp:Label
                            ID="lblResultCount"
                            runat="server"
                            Text="0 Customers">
                        </asp:Label>

                    </span>


                </div>



                <!-- =================================================
                     GRID CARD
                     ================================================= -->

                <div class="grid-card">


                    <asp:GridView
                        ID="GridView1"
                        runat="server"
                        AutoGenerateColumns="False"
                        CssClass="customer-grid"
                        GridLines="None"
                        BorderStyle="None"
                        OnRowCommand="GridView1_RowCommand">


                        <Columns>


                           

                            <asp:TemplateField
                                HeaderText="Customer ID">

                                <ItemTemplate>

                                    <span class="customer-id">

                                        <i class="fa-regular fa-id-card"></i>

                                        <%# Eval("cust_id") %>

                                    </span>

                                </ItemTemplate>

                            </asp:TemplateField>



                          

                            <asp:TemplateField
                                HeaderText="Customer Name">

                                <ItemTemplate>

                                    <span class="customer-name">

                                        <%# Eval("cust_name") %>

                                    </span>

                                </ItemTemplate>

                            </asp:TemplateField>



                           

                            <asp:TemplateField
                                HeaderText="Age">

                                <ItemTemplate>

                                    <%# Eval("cust_age") %>

                                </ItemTemplate>

                            </asp:TemplateField>



                           

                            <asp:TemplateField
                                HeaderText="Gender">

                                <ItemTemplate>

                                    <%# Eval("cust_gender") %>

                                </ItemTemplate>

                            </asp:TemplateField>




                            <asp:TemplateField
                                HeaderText="Contact">

                                <ItemTemplate>

                                    <span class="customer-contact">

                                        <i class="fa-solid fa-phone"></i>

                                        <%# Eval("cust_contact") %>

                                    </span>

                                </ItemTemplate>

                            </asp:TemplateField>



                           

                            <asp:TemplateField
                                HeaderText="Actions">

                                <ItemTemplate>

                                    <div class="grid-actions">


                                        

                                        <asp:LinkButton
                                            ID="btnEdit"
                                            runat="server"
                                            Text="Edit"
                                            CommandName="EditCustomer"
                                            CommandArgument='<%# Eval("cust_id") %>'
                                            CssClass="btn-action btn-edit">

                                            <i class="fa-solid fa-pen"></i>

                                            Edit

                                        </asp:LinkButton>



                                        

                                        <asp:LinkButton
                                            ID="btnDelete"
                                            runat="server"
                                            Text="Delete"
                                            CommandName="DeleteCustomer"
                                            CommandArgument='<%# Eval("cust_id") %>'
                                            OnClientClick="return confirm('Are you sure you want to delete this customer?');"
                                            CssClass="btn-action btn-delete">

                                            <i class="fa-solid fa-trash"></i>

                                            Delete

                                        </asp:LinkButton>


                                    </div>

                                </ItemTemplate>

                            </asp:TemplateField>


                        </Columns>


                        <PagerStyle
                            HorizontalAlign="Center" />


                    </asp:GridView>


                </div>


            </asp:Panel>



            <!-- =================================================
                 MESSAGE
                 ================================================= -->

            <asp:Label
                ID="lblMessage"
                runat="server"
                CssClass="message-box"
                Visible="false">
            </asp:Label>


        </div>



        <!-- =====================================================
             RIGHT SIDE BOXES
             ===================================================== -->

        <div class="search-side-boxes right">


            <!-- SALES & BILLING -->

            <div class="search-side-box">

                <div class="side-box-icon">

                    <i class="fa-solid fa-file-invoice-dollar"></i>

                </div>

                <h3>
                    Sales &amp; Billing
                </h3>

                <p>
                    Customer information can be used
                    while creating sales and bills.
                </p>

            </div>


            <!-- CUSTOMER ACTIVITY -->

            <div class="search-side-box">

                <div class="side-box-icon">

                    <i class="fa-solid fa-chart-line"></i>

                </div>

                <h3>
                    Customer Activity
                </h3>

                <p>
                    Keep customer records organized
                    for smoother daily operations.
                </p>

            </div>


        </div>


    </div>

</asp:Content>