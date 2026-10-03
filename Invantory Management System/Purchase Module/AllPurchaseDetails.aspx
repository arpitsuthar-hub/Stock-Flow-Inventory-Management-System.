<%@ Page Title="Purchase Details"
    Language="C#"
    MasterPageFile="~/Purchase Module/Purchase_Module.Master"
    AutoEventWireup="true"
    CodeBehind="AllPurchaseDetails.aspx.cs"
    Inherits="Inventory_Management_System.Purchase_Module.AllPurchaseDetails" %>


<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style>
        .details-page {
            width: 100%;
            padding-bottom: 30px;
        }

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

        .purchase-info {
            background: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.06);
            margin-bottom: 20px;
        }

            .purchase-info span {
                font-weight: bold;
                color: #1769e0;
            }

        .table-container {
            background: white;
            padding: 25px;
            border-radius: 14px;
            box-shadow: 0 4px 18px rgba(0,0,0,0.07);
            overflow-x: auto;
        }

        .details-grid {
            width: 100%;
            border-collapse: collapse;
            min-width: 900px;
        }

            .details-grid th {
                background: #1769e0;
                color: white;
                padding: 14px 12px;
                font-size: 12px;
                text-transform: uppercase;
                white-space: nowrap;
            }

            .details-grid td {
                padding: 14px 12px;
                font-size: 13px;
                color: #333;
                border-bottom: 1px solid #edf0f3;
                white-space: nowrap;
            }

            .details-grid tr:nth-child(even) td {
                background: #f8faff;
            }

            .details-grid tr:hover td {
                background: #eef5ff;
            }

        .back-button {
            display: inline-block;
            margin-bottom: 20px;
            background: #14213d;
            color: white !important;
            padding: 8px 14px;
            border-radius: 6px;
            text-decoration: none;
            font-size: 13px;
            font-weight: bold;
        }

            .back-button:hover {
                background: #0d1628;
                text-decoration: none;
            }

        /* =========================================
   PRODUCT
========================================= */

.product-info {
    display: flex;
    flex-direction: column;
    gap: 3px;
}

.product-id {
    color: #1769e0;
    font-size: 12px;
    font-weight: bold;
}

.product-name {
    color: #14213d;
    font-size: 13px;
    font-weight: 600;
}


/* =========================================
   QUANTITY
========================================= */

.quantity {
    color: #7048d8;
    font-weight: bold;
}

.unit {
    color: #777;
    font-size: 12px;
    margin-left: 3px;
}


/* =========================================
   AMOUNTS
========================================= */

.details-grid td:nth-child(5),
.details-grid td:nth-child(6),
.details-grid td:nth-child(8),
.details-grid td:nth-child(9) {
    font-weight: 600;
}


/* Net Amount */

.details-grid td:nth-child(9) {
    color: #16a05d;
    font-weight: bold;
}
    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="details-page">

        <a href="AllPurchase.aspx" class="back-button">← Back to All Purchases
        </a>


        <div class="page-header">

            <h1>Purchase Details</h1>

            <p>
                All products included in this purchase
            </p>

        </div>


        <div class="purchase-info">
            Purchase ID:
            <span>
                <asp:Label
                    ID="lblPurchaseID"
                    runat="server">
                </asp:Label>
            </span>

        </div>


        <div class="table-container">

            <asp:GridView
                ID="GridView1"
                runat="server"
                CssClass="details-grid"
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


                    <asp:BoundField
                        DataField="pro_category"
                        HeaderText="Category" />


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
                        DataField="grossamount"
                        HeaderText="Gross Amount"
                        DataFormatString="₹{0:N2}" />


                    <asp:BoundField
                        DataField="discountpercent"
                        HeaderText="Discount %"
                        DataFormatString="{0:N2}%" />


                    <asp:BoundField
                        DataField="discountamount"
                        HeaderText="Discount"
                        DataFormatString="₹{0:N2}" />


                    <asp:BoundField
                        DataField="netamount"
                        HeaderText="Net Amount"
                        DataFormatString="₹{0:N2}" />

                </Columns>

            </asp:GridView>

        </div>

    </div>

</asp:Content>
