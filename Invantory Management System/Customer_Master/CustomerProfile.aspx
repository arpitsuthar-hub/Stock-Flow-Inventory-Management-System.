<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/Customer.Master" AutoEventWireup="true" CodeBehind="CustomerProfile.aspx.cs" Inherits="Inventory_Management_System.CustomerProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <h1>Customer Profile</h1>
        <table border="1" cellpadding="10" width="400px">
            <tr align="center">
                <td>Customer ID</td>
                <td>
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </td>
            </tr>
            <tr align="center">
                <td>Customer Name</td>
                <td>
                    <asp:Label ID="Label2" runat="server"></asp:Label>
                </td>
            </tr>
            <tr align="center">
                <td>Customer Age</td>
                <td>
                    <asp:Label ID="Label3" runat="server"></asp:Label>
                </td>
            </tr>
            <tr align="center">
                <td>Customer Gender</td>
                <td>
                    <asp:Label ID="Label4" runat="server"></asp:Label>
                </td>
            </tr>
            <tr align="center">
                <td>Customer Contact</td>
                <td>
                    <asp:Label ID="Label5" runat="server"></asp:Label>
                </td>
            </tr>
            <tr align="center">
                <td>Customer G-Mail</td>
                <td>
                    <asp:Label ID="Label6" runat="server"></asp:Label>
                </td>
            </tr>
            <tr align="center">
                <td>Customer Address</td>
                <td>
                    <asp:Label ID="Label7" runat="server"></asp:Label>
                </td>
            </tr>
            <tr align="center">
                <td>Iamge Of Item</td>
                <td><asp:image ID="Image1" runat="server" Height="50%" Width="50%"></asp:image></td>
            </tr>
            <tr align="center">
                <td>Customer User ID</td>
                <td>
                    <asp:Label ID="Label8" runat="server"></asp:Label>
                </td>
            </tr>
            <tr align="center">
                <td>Customer Password ID</td>
                <td>
                    <asp:Label ID="Label9" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </center>
</asp:Content>
