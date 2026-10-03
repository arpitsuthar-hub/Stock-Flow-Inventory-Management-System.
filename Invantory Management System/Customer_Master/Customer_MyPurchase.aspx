<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/Customer.Master" AutoEventWireup="true" CodeBehind="Customer_MyPurchase.aspx.cs" Inherits="Inventory_Management_System.Customer_MyPurchase" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <h1>My Purchase</h1>
        <asp:GridView ID="Gridview1" runat="server" AutoGenerateColumns="false" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
            <Columns>
                <asp:TemplateField HeaderText="Customer ID">
                    <ItemTemplate><%#Eval("cid") %></ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Customer Name">
                    <ItemTemplate><%#Eval("cname") %></ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Quantity">
                    <ItemTemplate><%#Eval("cqty") %></ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Price">
                    <ItemTemplate><%#Eval("cprice") %></ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Discount">
                    <ItemTemplate><%#Eval("discount") %></ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Gross Amount">
                    <ItemTemplate><%#Eval("grsamount") %></ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Dsicount Amount">
                    <ItemTemplate><%#Eval("disamount") %></ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Net Amount">
                    <ItemTemplate><%#Eval("netamount") %></ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Purchase Date">
                    <ItemTemplate><%#Eval("datesell") %></ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Item Image">
                    <ItemTemplate><%#Eval("pick") %></ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>
    </center>
</asp:Content>
