<%@ Page Title="" Language="C#" MasterPageFile="~/I-M-S.Master" AutoEventWireup="true" CodeBehind="Bills.aspx.cs" Inherits="Invantory_Management_System.Bills" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        /* ==========================================================================
           Internal Styles for Daily Transaction Report Page
           ========================================================================== */

        /* Main Container */
        .report-container {
            max-width: 550px;
            margin: 40px auto;
            padding: 0 20px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        /* Page Header */
        .page-header {
            margin-bottom: 24px;
            text-align: center;
        }

        .page-header h2 {
            font-size: 24px;
            font-weight: 700;
            color: #1a252f;
            margin-bottom: 6px;
        }

        .page-header p {
            font-size: 14px;
            color: #7f8c8d;
        }

        /* Form Card */
        .filter-card {
            background: #ffffff;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 4px 18px rgba(0, 0, 0, 0.08);
            border: 1px solid #eef2f5;
        }

        /* Form Controls */
        .form-group {
            display: flex;
            flex-direction: column;
            margin-bottom: 24px;
        }

        .form-group label {
            font-size: 13px;
            font-weight: 600;
            color: #34495e;
            margin-bottom: 8px;
        }

        .form-control {
            width: 100%;
            padding: 10px 14px;
            font-size: 14px;
            color: #2c3e50;
            background-color: #f8f9fa;
            border: 1.5px solid #dcdfe6;
            border-radius: 6px;
            outline: none;
            box-sizing: border-box;
            transition: all 0.2s ease-in-out;
        }

        .form-control:focus {
            background-color: #ffffff;
            border-color: #2c5364;
            box-shadow: 0 0 0 3px rgba(44, 83, 100, 0.12);
        }

        /* Action Link Button Styling */
        .form-actions {
            text-align: center;
        }

        .btn-submit {
            display: inline-block;
            width: 100%;
            padding: 12px 24px;
            background: linear-gradient(135deg, #2c5364 0%, #203a43 100%);
            color: #ffffff !important;
            border: none;
            border-radius: 6px;
            font-size: 15px;
            font-weight: 600;
            text-decoration: none;
            cursor: pointer;
            box-shadow: 0 4px 10px rgba(44, 83, 100, 0.25);
            transition: all 0.25s ease;
            box-sizing: border-box;
        }

        .btn-submit:hover {
            background: linear-gradient(135deg, #203a43 0%, #0f2027 100%);
            box-shadow: 0 6px 14px rgba(44, 83, 100, 0.35);
            transform: translateY(-1px);
        }

        .btn-submit:active {
            transform: translateY(0);
        }

        /* Mobile Adjustments */
        @media (max-width: 600px) {
            .filter-card {
                padding: 20px 15px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="report-container">
        
        <!-- Page Header -->
        <div class="page-header">
            <h2>Daily Transaction Report</h2>
            <p>Select a date to filter and view daily financial transaction statements.</p>
        </div>

        <!-- Filter Card Container -->
        <div class="filter-card">
            
            <div class="form-group">
                <label for="TextBox1">Select Date</label>
                <asp:TextBox ID="TextBox1" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-actions">
                <asp:LinkButton ID="LinkButton1" runat="server" Text="Get Details" OnClick="LinkButton1_Click1" CssClass="btn-submit"></asp:LinkButton>
            </div>

        </div>

    </div>
</asp:Content>