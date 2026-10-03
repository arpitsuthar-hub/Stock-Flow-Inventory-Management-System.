<%@ Page Title="My Sales"
Language="C#"
MasterPageFile="~/Supplier_Master/Supplier.Master"
AutoEventWireup="true"
CodeBehind="Supplier_MySell.aspx.cs"
Inherits="Inventory_Management_System.Supplier_MySell" %>

<asp:Content ID="Content1"
ContentPlaceHolderID="head"
runat="server">

<!-- Font Awesome -->
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />

<style type="text/css">

    /* =========================================================
       PAGE
    ========================================================= */

    .sales-page
    {
        width: 100%;
        min-height: calc(100vh - 70px);
        background: #f5f7f9;
        padding: 30px 20px 50px;
        box-sizing: border-box;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }


    /* =========================================================
       MAIN CONTAINER
    ========================================================= */

    .sales-container
    {
        width: 100%;
        max-width: 1250px;
        margin: 0 auto;
    }


    /* =========================================================
       PAGE HEADER
    ========================================================= */

    .page-header
    {
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 20px;
        margin-bottom: 22px;
    }

    .page-title-area
    {
        display: flex;
        align-items: center;
        gap: 13px;
    }

    .page-title-icon
    {
        width: 46px;
        height: 46px;
        background: #2c5364;
        color: #ffffff;
        border-radius: 9px;

        display: flex;
        align-items: center;
        justify-content: center;

        font-size: 19px;

        box-shadow: 0 4px 12px rgba(44,83,100,0.20);
        flex-shrink: 0;
    }

    .page-title-text h2
    {
        margin: 0 0 4px 0;
        font-size: 23px;
        font-weight: 650;
        color: #26343d;
    }

    .page-title-text p
    {
        margin: 0;
        color: #7b858d;
        font-size: 12px;
    }

    .sales-status
    {
        display: inline-flex;
        align-items: center;
        gap: 7px;

        padding: 8px 13px;

        background: #ffffff;
        border: 1px solid #dfe5e9;
        border-radius: 7px;

        color: #53616a;
        font-size: 11px;
        font-weight: 600;

        white-space: nowrap;
    }

    .sales-status i
    {
        color: #2c5364;
        font-size: 10px;
    }


    /* =========================================================
       SEARCH CARD
    ========================================================= */

    .search-card
    {
        background: #ffffff;
        border: 1px solid #e1e6e9;
        border-radius: 11px;

        padding: 20px 22px;

        margin-bottom: 22px;

        box-shadow: 0 4px 16px rgba(0,0,0,0.05);

        position: relative;
        overflow: hidden;
    }

    .search-card::before
    {
        content: "";
        position: absolute;
        left: 0;
        top: 0;
        bottom: 0;
        width: 4px;
        background: #2c5364;
    }

    .search-title
    {
        display: flex;
        align-items: center;
        gap: 9px;

        color: #2d3b44;
        font-size: 15px;
        font-weight: 650;

        margin-bottom: 17px;
    }

    .search-title i
    {
        color: #2c5364;
        font-size: 14px;
    }

    .search-row
    {
        display: flex;
        align-items: flex-end;
        gap: 15px;
        flex-wrap: wrap;
    }

    .search-field
    {
        display: flex;
        flex-direction: column;
        gap: 6px;
    }

    .search-field label
    {
        font-size: 11px;
        font-weight: 600;
        color: #66737c;
        text-transform: uppercase;
        letter-spacing: 0.3px;
    }

    .search-input
    {
        width: 225px;
        height: 40px;

        padding: 8px 12px;

        border: 1px solid #d8dee3;
        border-radius: 6px;

        background: #ffffff;

        color: #34424a;
        font-size: 13px;

        outline: none;
        box-sizing: border-box;

        transition: 0.2s;
    }

    .search-input:focus
    {
        border-color: #2c5364;
        box-shadow: 0 0 0 3px rgba(44,83,100,0.08);
    }

    .search-input::placeholder
    {
        color: #a2abb1;
    }


    /* =========================================================
       BUTTONS
    ========================================================= */

    .search-button,
    .reset-button
    {
        height: 40px;

        padding: 0 20px;

        border: none;
        border-radius: 6px;

        font-size: 13px;
        font-weight: 600;

        cursor: pointer;

        transition: 0.2s;

        display: inline-flex;
        align-items: center;
        justify-content: center;
    }

    .search-button
    {
        background: #2c5364;
        color: #ffffff;
    }

    .search-button:hover
    {
        background: #234555;
    }

    .reset-button
    {
        background: #eef1f3;
        color: #45525a;
    }

    .reset-button:hover
    {
        background: #e1e6e9;
    }


    /* =========================================================
       RESULT HEADER
    ========================================================= */

    .result-header
    {
        display: flex;
        justify-content: space-between;
        align-items: center;

        margin-bottom: 12px;
    }

    .result-title
    {
        display: flex;
        align-items: center;
        gap: 9px;

        font-size: 17px;
        font-weight: 650;
        color: #2d3b44;
    }

    .result-title i
    {
        color: #2c5364;
        font-size: 14px;
    }


    /* =========================================================
       TABLE CARD
    ========================================================= */

    .table-card
    {
        background: #ffffff;

        border: 1px solid #e1e6e9;
        border-radius: 11px;

        padding: 20px;

        box-shadow: 0 4px 16px rgba(0,0,0,0.05);

        overflow-x: auto;
    }


    /* =========================================================
       GRID
    ========================================================= */

    .custom-grid
    {
        width: 100%;

        border-collapse: separate;
        border-spacing: 0;

        font-size: 12.5px;
        color: #35434b;

        border: 1px solid #e4e8eb;
        border-radius: 7px;

        overflow: hidden;
    }


    /* HEADER */

    .custom-grid th
    {
        background: #2c5364;

        color: #ffffff;

        font-weight: 600;

        text-transform: uppercase;

        font-size: 10.5px;

        letter-spacing: 0.35px;

        padding: 13px 12px;

        text-align: center;

        border: none;

        white-space: nowrap;
    }


    /* CELLS */

    .custom-grid td
    {
        padding: 13px 12px;

        border-bottom: 1px solid #edf0f2;

        text-align: center;

        vertical-align: middle;

        white-space: nowrap;

        background: #ffffff;
    }


    /* REMOVE LAST BORDER */

    .custom-grid tr:last-child td
    {
        border-bottom: none;
    }


    /* HOVER */

    .custom-grid tr:hover td
    {
        background: #f3f7f8;
    }

    .custom-grid .grid-alt-row td
    {
        background: #fafbfc;
    }

    .custom-grid .grid-alt-row:hover td
    {
        background: #f3f7f8;
    }


    /* =========================================================
       PRODUCT / BRAND
    ========================================================= */

    .product-name
    {
        font-weight: 650;
        color: #263842;
    }

    .brand-name
    {
        color: #657078;
    }


    /* =========================================================
       PRICE
    ========================================================= */

    .price-value
    {
        font-weight: 600;
        color: #3d505b;
    }

    .gross-value
    {
        font-weight: 600;
        color: #3d505b;
    }


    /* =========================================================
       DISCOUNT
    ========================================================= */

    .discount-value
    {
        color: #b87508;
        font-weight: 600;
    }


    /* =========================================================
       NET AMOUNT
    ========================================================= */

    .net-amount
    {
        font-weight: 700;
        color: #25834b;
    }


    /* =========================================================
       TOTAL SECTION
    ========================================================= */

    .overall-total-row
    {
        margin-top: 20px;

        display: flex;
        justify-content: flex-end;

        gap: 12px;

        flex-wrap: wrap;
    }

    .total-box
    {
        min-width: 185px;

        padding: 14px 17px;

        background: #fafbfc;

        border: 1px solid #e2e7ea;

        border-radius: 8px;

        box-sizing: border-box;
    }

    .total-label
    {
        font-size: 10px;

        color: #89939a;

        margin-bottom: 5px;

        font-weight: 600;

        text-transform: uppercase;

        letter-spacing: 0.3px;
    }

    .total-value
    {
        font-size: 19px;

        font-weight: 700;

        color: #2e3d45;
    }

    .total-discount
    {
        color: #b87508;
    }

    .total-net
    {
        color: #25834b;
    }


    /* =========================================================
       EMPTY MESSAGE
    ========================================================= */

    .empty-message
    {
        text-align: center !important;

        padding: 35px !important;

        color: #8a949a;

        font-size: 13px;
    }


    /* =========================================================
       MOBILE 768px
    ========================================================= */

    @media (max-width: 768px)
    {
        .sales-page
        {
            padding: 20px 12px 35px;
        }

        .page-header
        {
            flex-direction: column;
            align-items: flex-start;
            gap: 12px;
        }

        .page-title-text h2
        {
            font-size: 21px;
        }

        .sales-status
        {
            align-self: flex-start;
        }

        .search-card
        {
            padding: 18px 16px;
        }

        .search-row
        {
            flex-direction: column;
            align-items: stretch;
            gap: 12px;
        }

        .search-field
        {
            width: 100%;
        }

        .search-input
        {
            width: 100%;
        }

        .search-button,
        .reset-button
        {
            width: 100%;
        }

        .table-card
        {
            padding: 12px;
        }

        .overall-total-row
        {
            justify-content: stretch;
            flex-direction: column;
        }

        .total-box
        {
            width: 100%;
        }
    }


    /* =========================================================
       MOBILE 500px
    ========================================================= */

    @media (max-width: 500px)
    {
        .page-title-icon
        {
            width: 42px;
            height: 42px;
            font-size: 17px;
        }

        .page-title-text h2
        {
            font-size: 19px;
        }

        .page-title-text p
        {
            font-size: 11px;
        }

        .result-title
        {
            font-size: 16px;
        }

        .table-card
        {
            overflow-x: auto;
        }

        .custom-grid
        {
            min-width: 950px;
        }
    }

</style>
</asp:Content>

<asp:Content ID="Content2"
ContentPlaceHolderID="ContentPlaceHolder1"
runat="server">

<div class="sales-page">

    <div class="sales-container">


        <!-- =====================================================
             PAGE HEADER
        ====================================================== -->

        <div class="page-header">

            <div class="page-title-area">

                <div class="page-title-icon">
                    <i class="fa-solid fa-chart-line"></i>
                </div>

                <div class="page-title-text">

                    <h2>
                        My Sales
                    </h2>

                    <p>
                        View your sales and search sales by product or date.
                    </p>

                </div>

            </div>


            <div class="sales-status">

                <i class="fa-solid fa-circle-check"></i>

                Supplier Sales

            </div>

        </div>


        <!-- =====================================================
             SEARCH CARD
        ====================================================== -->

        <div class="search-card">

            <div class="search-title">

                <i class="fa-solid fa-magnifying-glass"></i>

                Search Sales

            </div>


            <div class="search-row">


                <!-- PRODUCT NAME -->

                <div class="search-field">

                    <label>
                        Product Name
                    </label>

                    <asp:TextBox
                        ID="txtProductName"
                        runat="server"
                        CssClass="search-input"
                        placeholder="Enter product name">
                    </asp:TextBox>

                </div>


                <!-- DATE -->

                <div class="search-field">

                    <label>
                        Date
                    </label>

                    <asp:TextBox
                        ID="txtDate"
                        runat="server"
                        TextMode="Date"
                        CssClass="search-input">
                    </asp:TextBox>

                </div>


                <!-- SEARCH BUTTON -->

                <div class="search-field">

                    <label>
                        &nbsp;
                    </label>

                    <asp:Button
                        ID="btnSearch"
                        runat="server"
                        Text="Search"
                        CssClass="search-button"
                        OnClick="btnSearch_Click" />

                </div>


                <!-- TODAY / RESET -->

                <div class="search-field">

                    <label>
                        &nbsp;
                    </label>

                    <asp:Button
                        ID="btnReset"
                        runat="server"
                        Text="Today"
                        CssClass="reset-button"
                        OnClick="btnReset_Click" />

                </div>

            </div>

        </div>


        <!-- =====================================================
             RESULT HEADER
        ====================================================== -->

        <div class="result-header">

            <div class="result-title">

                <i class="fa-solid fa-receipt"></i>

                <asp:Label
                    ID="lblResultTitle"
                    runat="server"
                    Text="Today's Sales">
                </asp:Label>

            </div>

        </div>


        <!-- =====================================================
             SALES TABLE
        ====================================================== -->

        <div class="table-card">

            <asp:GridView
                ID="GridView1"
                runat="server"
                AutoGenerateColumns="False"
                CssClass="custom-grid"
                GridLines="None"
                BorderStyle="None"
                EmptyDataText="No sales found."
                EmptyDataRowStyle-CssClass="empty-message">

                <AlternatingRowStyle
                    CssClass="grid-alt-row" />


                <Columns>



                    <asp:TemplateField
                        HeaderText="Product Name">

                        <ItemTemplate>

                            <span class="product-name">

                                <%# Eval("product_name") %>

                            </span>

                        </ItemTemplate>

                    </asp:TemplateField>


                   

                    <asp:TemplateField
                        HeaderText="Brand">

                        <ItemTemplate>

                            <span class="brand-name">

                                <%# Eval("brand") %>

                            </span>

                        </ItemTemplate>

                    </asp:TemplateField>


                  

                    <asp:TemplateField
                        HeaderText="Quantity">

                        <ItemTemplate>

                            <%# Eval("quantity") %>

                        </ItemTemplate>

                    </asp:TemplateField>


                   

                    <asp:TemplateField
                        HeaderText="Our Price">

                        <ItemTemplate>

                            <span class="price-value">

                                ₹ <%# Eval("selling_price", "{0:N2}") %>

                            </span>

                        </ItemTemplate>

                    </asp:TemplateField>


                    
                    <asp:TemplateField
                        HeaderText="Gross Amount">

                        <ItemTemplate>

                            <span class="gross-value">

                                ₹ <%# Eval("grossamount", "{0:N2}") %>

                            </span>

                        </ItemTemplate>

                    </asp:TemplateField>


                    

                    <asp:TemplateField
                        HeaderText="Discount Applied">

                        <ItemTemplate>

                            <span class="discount-value">

                                <%# Eval("discountpercent", "{0:N2}") %> %

                            </span>

                        </ItemTemplate>

                    </asp:TemplateField>



                    <asp:TemplateField
                        HeaderText="Discount Amount">

                        <ItemTemplate>

                            <span class="discount-value">

                                ₹ <%# Eval("discountamount", "{0:N2}") %>

                            </span>

                        </ItemTemplate>

                    </asp:TemplateField>



                    <asp:TemplateField
                        HeaderText="Net Amount">

                        <ItemTemplate>

                            <span class="net-amount">

                                ₹ <%# Eval("netamount", "{0:N2}") %>

                            </span>

                        </ItemTemplate>

                    </asp:TemplateField>



                    <asp:TemplateField
                        HeaderText="Date">

                        <ItemTemplate>

                            <%# Eval("sell_date", "{0:dd-MM-yyyy}") %>

                        </ItemTemplate>

                    </asp:TemplateField>


                </Columns>

            </asp:GridView>


            <!-- =================================================
                 OVERALL TOTALS
            ================================================== -->

            <div class="overall-total-row">


                <!-- OVERALL GROSS -->

                <div class="total-box">

                    <div class="total-label">
                        Overall Gross Amount
                    </div>

                    <div class="total-value">

                        ₹

                        <asp:Label
                            ID="lblOverallGross"
                            runat="server"
                            Text="0.00">
                        </asp:Label>

                    </div>

                </div>


                <!-- OVERALL DISCOUNT -->

                <div class="total-box">

                    <div class="total-label">
                        Overall Discount Amount
                    </div>

                    <div class="total-value total-discount">

                        ₹

                        <asp:Label
                            ID="lblOverallDiscount"
                            runat="server"
                            Text="0.00">
                        </asp:Label>

                    </div>

                </div>


                <!-- OVERALL NET -->

                <div class="total-box">

                    <div class="total-label">
                        Overall Net Amount
                    </div>

                    <div class="total-value total-net">

                        ₹

                        <asp:Label
                            ID="lblOverallNet"
                            runat="server"
                            Text="0.00">
                        </asp:Label>

                    </div>

                </div>


            </div>

        </div>


    </div>

</div>
</asp:Content>

