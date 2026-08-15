<%@ Page Title="" Language="C#" MasterPageFile="~/I-M-S.Master" AutoEventWireup="true" CodeBehind="SupplierDetails.aspx.cs" Inherits="Invantory_Management_System.SupplierDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <h1>Supplier Detail's</h1>
        <table border="1" cellpadding="10" style="width: 450px">
            <tr align="center">
                <td>Supplier ID</td>
                <td>
                    <asp:Label ID="Label1" runat="server"></asp:Label></td>
            </tr>
            <tr align="center">
                <td>Supplier Name</td>
                <td>
                    <asp:Label ID="Label2" runat="server"></asp:Label></td>
            </tr>
            <tr align="center">
                <td>Supplier Age</td>
                <td>
                    <asp:Label ID="Label3" runat="server"></asp:Label></td>
            </tr>
            <tr align="center">
                <td>Supplier Gender</td>
                <td>
                    <asp:Label ID="Label4" runat="server"></asp:Label></td>
            </tr>
            <tr align="center">
                <td>Supplier Contact Number</td>
                <td>
                    <asp:Label ID="Label5" runat="server"></asp:Label></td>
            </tr>
            <tr align="center">
                <td>Supplier G-Mail</td>
                <td>
                    <asp:Label ID="Label6" runat="server"></asp:Label></td>
            </tr>
            <tr align="center">
                <td>Supplier Address</td>
                <td>
                    <asp:Label ID="Label7" runat="server"></asp:Label></td>
            </tr>
            <tr align="center">
                <td>Image Of Supplier</td>
                <td>
                    <asp:Image ID="Image1" runat="server" Height="50%" Width="50%"></asp:Image></td>
            </tr>
            <tr align="center">
                <td>Supplier User ID</td>
                <td>
                    <asp:Label ID="Label8" runat="server"></asp:Label>
                </td>
            </tr>
            <tr align="center">
                <td>Supplier Password</td>
                <td>
                    <asp:Label ID="Label9" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </center>
</asp:Content>
