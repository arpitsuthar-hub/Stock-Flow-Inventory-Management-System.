<%@ Page Title="All Suppliers"
    Language="C#"
    MasterPageFile="~/Supplier_Module/Supplier_Module.Master"
    AutoEventWireup="true"
    CodeBehind="AllSupplier.aspx.cs"
    Inherits="Inventory_Management_System.AllSupplier" %>


<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style type="text/css">

        /* =========================================
           MAIN PAGE
        ========================================= */

        .supplier-page {
            width: 100%;
            max-width: 1450px;
            margin: 0 auto;
            padding: 30px 25px 45px;
            box-sizing: border-box;
            font-family: "Segoe UI", Arial, sans-serif;
            color: #1f2937;
        }


        /* =========================================
           PAGE HEADER
        ========================================= */

        .page-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .page-header h2 {
            margin: 0 0 7px;
            font-size: 28px;
            font-weight: 650;
            color: #2c5364;
            letter-spacing: -0.4px;
        }

        .page-header h2 i {
            margin-right: 8px;
        }

        .page-header p {
            margin: 0;
            color: #6b7280;
            font-size: 14px;
        }


        /* =========================================
           THREE COLUMN LAYOUT
        ========================================= */

        .supplier-layout {
            display: flex;
            align-items: flex-start;
            justify-content: center;
            gap: 24px;
            width: 100%;
        }


        /* =========================================
           SIDE BOX CONTAINER
        ========================================= */

        .side-boxes {
            width: 205px;
            flex-shrink: 0;

            display: flex;
            flex-direction: column;
            gap: 18px;

            margin-top: 5px;
        }


        /* =========================================
           SIDE BOX
        ========================================= */

        .side-box {
            background: #ffffff;

            border: 1px solid #e4e9ec;
            border-radius: 10px;

            padding: 20px 17px;

            box-shadow: 0 3px 12px rgba(0,0,0,0.055);

            position: relative;
            overflow: hidden;
        }

        .side-box::before {
            content: "";
            position: absolute;

            left: 0;
            top: 0;
            bottom: 0;

            width: 4px;

            background: #2c5364;
        }


        /* =========================================
           SIDE BOX ICON
        ========================================= */

        .side-box-icon {
            width: 42px;
            height: 42px;

            display: flex;
            align-items: center;
            justify-content: center;

            background: #eef4f6;
            color: #2c5364;

            border-radius: 8px;

            font-size: 18px;

            margin-bottom: 13px;
        }


        /* =========================================
           SIDE BOX TITLE
        ========================================= */

        .side-box h3 {
            margin: 0 0 7px;

            font-size: 14px;
            font-weight: 650;

            color: #263238;
        }


        .side-box p {
            margin: 0;

            font-size: 12px;
            line-height: 1.6;

            color: #7a858b;
        }


        /* =========================================
           CENTER CONTENT
        ========================================= */

        .main-content {
            flex: 1;
            min-width: 0;
            max-width: 850px;
        }


        /* =========================================
           TABLE CARD
        ========================================= */

        .table-card {
            width: 100%;

            background: #ffffff;

            border: 1px solid #e4e9ec;
            border-radius: 10px;

            box-shadow: 0 3px 12px rgba(0,0,0,0.055);

            overflow: hidden;
        }


        /* =========================================
           TABLE TOP BAR
        ========================================= */

        .table-top {
            display: flex;
            align-items: center;
            justify-content: space-between;

            padding: 17px 20px;

            border-bottom: 1px solid #edf0f2;

            background: #ffffff;
        }

        .table-title {
            display: flex;
            align-items: center;
            gap: 9px;

            font-size: 16px;
            font-weight: 650;

            color: #2c5364;
        }

        .table-title i {
            font-size: 17px;
        }

        .table-status {
            padding: 5px 10px;

            background: #eef5f7;
            color: #2c5364;

            border: 1px solid #dce8eb;
            border-radius: 5px;

            font-size: 11px;
            font-weight: 600;
        }


        /* =========================================
           SCROLL AREA
        ========================================= */

        .table-scroll {
            width: 100%;

            max-height: 570px;

            overflow-y: auto;
            overflow-x: auto;

            box-sizing: border-box;
        }


        /* =========================================
           GRID
        ========================================= */

        .custom-grid {
            width: 100%;
            min-width: 800px;

            border-collapse: separate;
            border-spacing: 0;

            font-family: "Segoe UI", Arial, sans-serif;

            font-size: 14px;
            color: #1f2937;
        }


        /* =========================================
           GRID HEADER
        ========================================= */

        .custom-grid th {
            position: sticky;
            top: 0;

            z-index: 10;

            padding: 14px 15px;

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


        /* =========================================
           GRID DATA
        ========================================= */

        .custom-grid td {
            padding: 15px 15px;

            background: #ffffff;

            border: none;
            border-bottom: 1px solid #edf0f2;

            text-align: center;
            vertical-align: middle;

            white-space: nowrap;
        }


        /* =========================================
           ALTERNATE ROW
        ========================================= */

        .custom-grid tr:nth-child(even) td {
            background: #fcfcfd;
        }


        /* =========================================
           HOVER
        ========================================= */

        .custom-grid tr:hover td {
            background: #f7fafb;
        }


        /* =========================================
           SUPPLIER ID
        ========================================= */

        .custom-grid td strong {
            display: inline-block;

            padding: 4px 8px;

            background: #f3f6f8;
            color: #2c5364;

            border: 1px solid #e1e7ea;

            border-radius: 5px;

            font-size: 12px;
            font-weight: 700;
        }


        /* =========================================
           SCROLLBAR
        ========================================= */

        .table-scroll::-webkit-scrollbar {
            width: 8px;
            height: 8px;
        }

        .table-scroll::-webkit-scrollbar-track {
            background: #f1f3f4;
        }

        .table-scroll::-webkit-scrollbar-thumb {
            background: #aab4b9;
            border-radius: 10px;
        }

        .table-scroll::-webkit-scrollbar-thumb:hover {
            background: #2c5364;
        }


        /* =========================================
           FOOTER
        ========================================= */

        .table-footer {
            padding: 13px 18px;

            border-top: 1px solid #edf0f2;

            font-size: 12px;

            color: #7a858b;

            background: #fafbfc;

            text-align: center;
        }


        /* =========================================
           RESPONSIVE
        ========================================= */

        @media (max-width: 1150px) {

            .side-boxes {
                width: 180px;
            }

            .supplier-layout {
                gap: 18px;
            }

        }


        @media (max-width: 1000px) {

            .side-boxes {
                display: none;
            }

            .main-content {
                max-width: 900px;
                width: 100%;
            }

        }


        @media (max-width: 700px) {

            .supplier-page {
                padding: 22px 12px 35px;
            }

            .page-header {
                margin-bottom: 22px;
            }

            .page-header h2 {
                font-size: 23px;
            }

            .page-header p {
                font-size: 13px;
            }

            .table-card {
                border-radius: 8px;
            }

            .table-top {
                padding: 14px;
            }

            .table-scroll {
                max-height: 520px;
            }

            .custom-grid {
                min-width: 800px;
            }

        }


        @media (max-width: 450px) {

            .supplier-page {
                padding: 18px 10px 30px;
            }

            .page-header h2 {
                font-size: 21px;
            }

            .page-header p {
                font-size: 12px;
            }

        }

    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">


    <div class="supplier-page">


        <!-- =========================================
             PAGE HEADER
        ========================================== -->

        <div class="page-header">

            <h2>
                <i class="fa-solid fa-users"></i>
                All Suppliers
            </h2>

            <p>
                View and manage all registered suppliers in the inventory system.
            </p>

        </div>


        <!-- =========================================
             THREE COLUMN LAYOUT
        ========================================== -->

        <div class="supplier-layout">


            <!-- =====================================
                 LEFT SIDE
            ====================================== -->

            <div class="side-boxes">


                <!-- BOX 1 -->

                <div class="side-box">

                    <div class="side-box-icon">
                        <i class="fa-solid fa-user-plus"></i>
                    </div>

                    <h3>
                        Supplier Registration
                    </h3>

                    <p>
                        View all suppliers registered in the inventory system.
                    </p>

                </div>


                <!-- BOX 2 -->

                <div class="side-box">

                    <div class="side-box-icon">
                        <i class="fa-solid fa-id-card"></i>
                    </div>

                    <h3>
                        Supplier Details
                    </h3>

                    <p>
                        Supplier ID, name, contact, address and category information.
                    </p>

                </div>

            </div>


            <!-- =====================================
                 CENTER
            ====================================== -->

            <div class="main-content">

                <div class="table-card">


                    <!-- TABLE HEADER -->

                    <div class="table-top">

                        <div class="table-title">

                            <i class="fa-solid fa-table-list"></i>

                            Supplier List

                        </div>


                        <div class="table-status">

                            Registered Suppliers

                        </div>

                    </div>


                    <!-- SCROLLING TABLE -->

                    <div class="table-scroll">

                        <asp:GridView
                            ID="GridView1"
                            runat="server"
                            AutoGenerateColumns="False"
                            CssClass="custom-grid"
                            GridLines="None"
                            BorderStyle="None">

                            <Columns>


                               

                                <asp:TemplateField HeaderText="Supplier ID">

                                    <ItemTemplate>

                                        <strong>
                                            <%# Eval("sup_id") %>
                                        </strong>

                                    </ItemTemplate>

                                </asp:TemplateField>


                            

                                <asp:TemplateField HeaderText="Supplier Name">

                                    <ItemTemplate>

                                        <%# Eval("sup_name") %>

                                    </ItemTemplate>

                                </asp:TemplateField>



                                <asp:TemplateField HeaderText="Age">

                                    <ItemTemplate>

                                        <%# Eval("sup_age") %>

                                    </ItemTemplate>

                                </asp:TemplateField>


                      

                                <asp:TemplateField HeaderText="Contact Number">

                                    <ItemTemplate>

                                        <%# Eval("sup_contact") %>

                                    </ItemTemplate>

                                </asp:TemplateField>


                                <asp:TemplateField HeaderText="Address">

                                    <ItemTemplate>

                                        <%# Eval("sup_address") %>

                                    </ItemTemplate>

                                </asp:TemplateField>


                                

                                <asp:TemplateField HeaderText="Category">

                                    <ItemTemplate>

                                        <%# Eval("sup_category") %>

                                    </ItemTemplate>

                                </asp:TemplateField>


                            </Columns>

                        </asp:GridView>

                    </div>


                    <!-- TABLE FOOTER -->

                    <div class="table-footer">

                        Supplier information is managed through the Inventory Management System.

                    </div>


                </div>

            </div>


            <!-- =====================================
                 RIGHT SIDE
            ====================================== -->

            <div class="side-boxes">


                <!-- BOX 3 -->

                <div class="side-box">

                    <div class="side-box-icon">
                        <i class="fa-solid fa-layer-group"></i>
                    </div>

                    <h3>
                        Supplier Categories
                    </h3>

                    <p>
                        Suppliers are organized according to their product categories.
                    </p>

                </div>


                <!-- BOX 4 -->

                <div class="side-box">

                    <div class="side-box-icon">
                        <i class="fa-solid fa-chart-line"></i>
                    </div>

                    <h3>
                        Supplier Management
                    </h3>

                    <p>
                        Manage supplier records and keep supplier information organized.
                    </p>

                </div>

            </div>


        </div>

    </div>

</asp:Content>