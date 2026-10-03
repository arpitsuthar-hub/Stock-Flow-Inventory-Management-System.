<%@ Page Title="All Customers"
    Language="C#"
    MasterPageFile="~/Customer_Module/Customer_Module.Master"
    AutoEventWireup="true"
    CodeBehind="AllCustomer.aspx.cs"
    Inherits="Inventory_Management_System.AllCustomer" %>


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

        .customer-table-layout {

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
           MAIN TABLE CONTAINER
           ========================================================= */

        .table-page-container {

            width: 100%;

            max-width: 900px;

            margin: 0;

            padding: 0;

            color: #1f2937;

            min-width: 0;

        }


        /* =========================================================
           SIDE BOX CONTAINER
           ========================================================= */

        .customer-side-boxes {

            width: 205px;

            display: flex;

            flex-direction: column;

            gap: 24px;

            flex-shrink: 0;

        }


        /* =========================================================
           LEFT SIDE
           ========================================================= */

        .customer-side-boxes.left {

            margin-top: 88px;

        }


        /* =========================================================
           RIGHT SIDE
           ========================================================= */

        .customer-side-boxes.right {

            margin-top: 88px;

        }


        /* =========================================================
           SIDE INFORMATION BOX
           ========================================================= */

        .customer-side-box {

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

        .customer-side-box::before {

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

        .customer-side-box:hover {

            transform: translateY(-4px);

            border-color: #ccdadd;

            box-shadow:
                0 9px 22px rgba(31, 41, 55, 0.09);

        }


        /* =========================================================
           SIDE ICON
           ========================================================= */

        .customer-side-icon {

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


        .customer-side-box:hover .customer-side-icon {

            background: #2c5364;

            color: #ffffff;

            border-color: #2c5364;

        }


        /* =========================================================
           SIDE TITLE
           ========================================================= */

        .customer-side-box h3 {

            margin: 0 0 9px 0;

            color: #26313a;

            font-size: 14px;

            font-weight: 650;

            line-height: 1.4;

        }


        /* =========================================================
           SIDE DESCRIPTION
           ========================================================= */

        .customer-side-box p {

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
           TABLE CARD
           ========================================================= */

        .table-card {

            width: 100%;

            background: #ffffff;

            border: 1px solid #e3e8eb;

            border-radius: 12px;

            box-shadow:
                0 4px 14px rgba(31, 41, 55, 0.055);

            overflow: hidden;

            position: relative;

        }


        /* =========================================================
           TABLE TOP ACCENT
           ========================================================= */

        .table-card::before {

            content: "";

            position: absolute;

            left: 0;

            top: 20px;

            bottom: 20px;

            width: 3px;

            background: #2c5364;

            border-radius: 0 4px 4px 0;

            z-index: 2;

        }


        /* =========================================================
           IMPORTANT:
           SCROLL ONLY INSIDE GRID
           ========================================================= */

        .grid-scroll {

            width: 100%;

    max-height: 570px;

    overflow-x: auto;
    overflow-y: auto;

    -webkit-overflow-scrolling: touch;

    scrollbar-width: thin;

    scrollbar-color: #b8c5ca #f1f4f5;

        }


        /* =========================================================
           CHROME / EDGE SCROLLBAR
           ========================================================= */

        .grid-scroll::-webkit-scrollbar-track {

    background: #f1f4f5;

}


.grid-scroll::-webkit-scrollbar-thumb {

    background: #b8c5ca;

    border-radius: 10px;

}


.grid-scroll::-webkit-scrollbar-thumb:hover {

    background: #8fa1a8;

}


        /* =========================================================
           GRIDVIEW
           ========================================================= */

        .custom-grid {

            width: 100%;

    min-width: 820px;

    border-collapse: separate;

    border-spacing: 0;

    font-family: "Segoe UI", Arial, sans-serif;

    font-size: 14px;

    color: #1f2937;

    border: none;
        }


        /* =========================================================
           HEADER
           ========================================================= */

        .custom-grid th {

            padding: 14px 16px;

            background: #f7f9fa;

            color: #374151;

            border: none;

            border-bottom: 1px solid #e5e7eb;

            font-size: 11px;

            font-weight: 700;

            text-transform: uppercase;

            letter-spacing: 0.5px;

            text-align: center;

            white-space: nowrap;

        }


        .custom-grid th:first-child {

            border-top-left-radius: 9px;

        }


        .custom-grid th:last-child {

            border-top-right-radius: 9px;

        }


        /* =========================================================
           CELLS
           ========================================================= */

        .custom-grid td {

            padding: 15px 16px;

            background: #ffffff;

            border: none;

            border-bottom: 1px solid #edf0f2;

            text-align: center;

            vertical-align: middle;

            white-space: nowrap;

        }


        .custom-grid tr:last-child td {

            border-bottom: none;

        }


        /* =========================================================
           ROW HOVER
           ========================================================= */

        .custom-grid tr:hover td {

            background: #f9fafb;

        }


        /* =========================================================
           ALTERNATE ROW
           ========================================================= */

        .custom-grid .grid-alt-row td {

            background: #fcfcfd;

        }


        .custom-grid .grid-alt-row:hover td {

            background: #f9fafb;

        }


        /* =========================================================
           CUSTOMER ID
           ========================================================= */

        .customer-id {

            display: inline-block;

            padding: 4px 9px;

            background: #f3f6f8;

            color: #2c5364;

            border: 1px solid #e1e7ea;

            border-radius: 5px;

            font-size: 12px;

            font-weight: 700;

        }


        /* =========================================================
           CUSTOMER NAME
           ========================================================= */

        .customer-name {

            font-weight: 600;

            color: #263238;

        }


        /* =========================================================
           CONTACT
           ========================================================= */

        .customer-contact {

            color: #4b5563;

            font-size: 13px;

        }


        /* =========================================================
           GENDER
           ========================================================= */

        .customer-gender {

            color: #4b5563;

            font-size: 13px;

        }


        /* =========================================================
           DATE
           ========================================================= */

        .customer-date {

            color: #6b7280;

            font-size: 13px;

        }


        /* =========================================================
           ACTION CELL
           ========================================================= */

        .action-cell {

            display: flex;

            justify-content: center;

            align-items: center;

            gap: 8px;

        }


        /* =========================================================
           ACTION BUTTON
           ========================================================= */

        .btn-action {

            display: inline-flex;

            align-items: center;

            justify-content: center;

            min-width: 70px;

            padding: 7px 12px;

            border-radius: 5px;

            font-family: inherit;

            font-size: 12px;

            font-weight: 600;

            text-decoration: none;

            cursor: pointer;

            border: 1px solid transparent;

            transition:
                background-color 0.18s ease,
                border-color 0.18s ease,
                color 0.18s ease;

        }


        /* =========================================================
           DELETE
           ========================================================= */

        .btn-delete {

            background: #fff5f5;

            color: #c0392b;

            border-color: #f1d8d5;

        }


        .btn-delete:hover {

            background: #c0392b;

            color: #ffffff;

            border-color: #c0392b;

        }


        /* =========================================================
           PAGER
           ========================================================= */

        .grid-pager td {

            padding: 14px !important;

            background: #ffffff !important;

            border-top: 1px solid #e5e7eb !important;

            border-bottom: none !important;

        }


        .grid-pager a,
        .grid-pager span {

            display: inline-block;

            margin: 0 3px;

            padding: 5px 9px;

            border-radius: 5px;

            font-size: 12px;

            font-weight: 600;

            text-decoration: none;

        }


        /* =========================================================
           RESPONSIVE - 1250px
           ========================================================= */

        @media (max-width: 1250px) {

            .customer-side-boxes {

                width: 185px;

            }

            .customer-table-layout {

                gap: 18px;

            }

        }


        /* =========================================================
           RESPONSIVE - 1100px
           ========================================================= */

        @media (max-width: 1100px) {

            .customer-side-boxes {

                display: none;

            }


            .customer-table-layout {

                display: block;

                padding-left: 20px;

                padding-right: 20px;

            }


            .customer-table-layout .table-page-container {

                max-width: 950px;

                margin: 0 auto;

            }

        }


        /* =========================================================
           RESPONSIVE - 700px
           ========================================================= */

        @media (max-width: 700px) {

            .customer-table-layout {

                padding-left: 15px;

                padding-right: 15px;

            }


            .page-header {

                align-items: flex-start;

            }


            .page-status {

                display: none;

            }


            .page-header h2 {

                font-size: 22px;

            }


            .page-header p {

                font-size: 12px;

            }


            .table-card {

                border-radius: 9px;

            }


            .custom-grid th,
            .custom-grid td {

                padding: 12px 13px;

            }


            .action-cell {

                flex-direction: column;

                gap: 6px;

            }


            .btn-action {

                width: 70px;

            }

        }


        /* =========================================================
           RESPONSIVE - 450px
           ========================================================= */

        @media (max-width: 450px) {

            .customer-table-layout {

                padding-left: 10px;

                padding-right: 10px;

            }


            .page-header h2 {

                font-size: 20px;

            }


            .page-header p {

                font-size: 12px;

            }


            .page-header-icon {

                width: 42px;

                height: 42px;

                font-size: 17px;

            }

        }

    </style>

</asp:Content>



<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">


    <!-- =========================================================
         MAIN CUSTOMER PAGE
         ========================================================= -->

    <div class="customer-table-layout">


        <!-- =====================================================
             LEFT SIDE BOXES
             ===================================================== -->

        <div class="customer-side-boxes left">


            <!-- CUSTOMER DIRECTORY -->

            <div class="customer-side-box">

                <div class="customer-side-icon">

                    <i class="fa-solid fa-address-book"></i>

                </div>

                <h3>
                    Customer Directory
                </h3>

                <p>
                    View all registered customers and
                    access their basic information.
                </p>

            </div>



            <!-- CUSTOMER RECORDS -->

            <div class="customer-side-box">

                <div class="customer-side-icon">

                    <i class="fa-solid fa-users"></i>

                </div>

                <h3>
                    Customer Records
                </h3>

                <p>
                    Keep customer records organized
                    and easy to manage.
                </p>

            </div>


        </div>



        <!-- =====================================================
             MAIN TABLE AREA
             ===================================================== -->

        <div class="table-page-container">


            <!-- =================================================
                 PAGE HEADER
                 ================================================= -->

            <div class="page-header">


                <div class="page-header-left">


                    <div class="page-header-icon">

                        <i class="fa-solid fa-users"></i>

                    </div>


                    <div>

                        <h2>
                            All Customers
                        </h2>

                        <p>
                            View and manage all registered customers in the inventory system.
                        </p>

                    </div>


                </div>


                <div class="page-status">

                    <span class="page-status-dot"></span>

                    Customer Records

                </div>


            </div>



            <!-- =================================================
                 CUSTOMER TABLE
                 ================================================= -->

            <div class="table-card">


                <!--
                    IMPORTANT:
                    Horizontal scrolling is limited to this area.
                    The complete page will NOT scroll horizontally.
                -->

                <div class="grid-scroll">


                    <asp:GridView
                        ID="GridView1"
                        runat="server"

                        AutoGenerateColumns="False"

                        CssClass="custom-grid"

                        GridLines="None"

                        BorderStyle="None"

                        OnRowCommand="GridView1_RowCommand">


                        <AlternatingRowStyle
                            CssClass="grid-alt-row" />


                        <Columns>


                            

                            <asp:TemplateField
                                HeaderText="Customer ID">

                                <ItemTemplate>

                                    <span class="customer-id">

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

                                    <span class="customer-gender">

                                        <%# Eval("cust_gender") %>

                                    </span>

                                </ItemTemplate>

                            </asp:TemplateField>



                            

                            <asp:TemplateField
                                HeaderText="Contact">

                                <ItemTemplate>

                                    <span class="customer-contact">

                                        <%# Eval("cust_contact") %>

                                    </span>

                                </ItemTemplate>

                            </asp:TemplateField>



                          

                            <asp:TemplateField
                                HeaderText="Registration Date">

                                <ItemTemplate>

                                    <span class="customer-date">

                                        <%#
                                            Eval(
                                                "cust_registerdate",
                                                "{0:dd-MM-yyyy}"
                                            )
                                        %>

                                    </span>

                                </ItemTemplate>

                            </asp:TemplateField>




                            <asp:TemplateField
                                HeaderText="Actions">

                                <ItemTemplate>

                                    <div class="action-cell">


                                        <asp:LinkButton
                                            ID="btnDelete"
                                            runat="server"

                                            Text="Delete"

                                            CommandName="DeleteCustomer"

                                            CommandArgument='<%# Eval("cust_id") %>'

                                            CssClass="btn-action btn-delete"

                                            OnClientClick="return confirm('Are you sure you want to delete this customer?');">

                                        </asp:LinkButton>


                                    </div>

                                </ItemTemplate>

                            </asp:TemplateField>


                        </Columns>


                        <PagerStyle
                            CssClass="grid-pager"
                            HorizontalAlign="Center" />


                    </asp:GridView>


                </div>


            </div>


        </div>



        <!-- =====================================================
             RIGHT SIDE BOXES
             ===================================================== -->

        <div class="customer-side-boxes right">


            <!-- CUSTOMER ACTIVITY -->

            <div class="customer-side-box">

                <div class="customer-side-icon">

                    <i class="fa-solid fa-clock-rotate-left"></i>

                </div>

                <h3>
                    Customer Activity
                </h3>

                <p>
                    Customer information can be used
                    for sales and billing operations.
                </p>

            </div>



            <!-- SALES & BILLING -->

            <div class="customer-side-box">

                <div class="customer-side-icon">

                    <i class="fa-solid fa-file-invoice-dollar"></i>

                </div>

                <h3>
                    Sales &amp; Billing
                </h3>

                <p>
                    Maintain customer details for
                    invoices and transaction records.
                </p>

            </div>


        </div>


    </div>


</asp:Content>