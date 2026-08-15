<%@ Page Title="" Language="C#" MasterPageFile="~/I-M-S.Master" AutoEventWireup="true" CodeBehind="Purchase.aspx.cs" Inherits="Invantory_Management_System.Purchase" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        /* ==========================================================================
           Internal Styles for Purchase Items Page
           ========================================================================== */

        /* Main Container */
        .purchase-container {
            max-width: 800px;
            margin: 30px auto;
            padding: 0 20px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        /* Page Header */
        .page-header {
            margin-bottom: 24px;
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
        .form-card {
            background: #ffffff;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 4px 18px rgba(0, 0, 0, 0.08);
            border: 1px solid #eef2f5;
        }

        /* Section Headers */
        .form-section-title {
            font-size: 13px;
            font-weight: 600;
            color: #2c5364;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin: 20px 0 15px 0;
            padding-bottom: 6px;
            border-bottom: 2px solid #eef2f5;
        }

        .form-section-title:first-child {
            margin-top: 0;
        }

        /* 2-Column Grid Layout */
        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 18px 24px;
        }

        /* Form Controls */
        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group.full-width {
            grid-column: span 2;
        }

        .form-group label {
            font-size: 13px;
            font-weight: 600;
            color: #34495e;
            margin-bottom: 6px;
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

        /* Radio Buttons Layout */
        .discount-radio-group {
            display: flex;
            align-items: center;
            gap: 20px;
            background-color: #f8f9fa;
            padding: 10px 14px;
            border: 1.5px solid #dcdfe6;
            border-radius: 6px;
            min-height: 42px;
            box-sizing: border-box;
        }

        .discount-radio-group label {
            font-size: 14px;
            color: #2c3e50;
            margin-bottom: 0;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 4px;
        }

        .discount-radio-group input[type="radio"] {
            accent-color: #2c5364;
            cursor: pointer;
        }

        /* File Upload Control */
        .file-upload-wrapper {
            background: #f8f9fa;
            border: 1.5px dashed #dcdfe6;
            border-radius: 6px;
            padding: 10px 14px;
            transition: border-color 0.2s ease;
        }

        .file-upload-wrapper:hover {
            border-color: #2c5364;
        }

        .file-control {
            font-size: 13px;
            color: #555;
        }

        /* Button Styling */
        .btn-secondary {
            padding: 10px 20px;
            background-color: #eef2f5;
            color: #2c5364;
            border: 1px solid #dcdfe6;
            border-radius: 6px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s ease;
            width: 100%;
            margin-top: 8px;
        }

        .btn-secondary:hover {
            background-color: #e2e8f0;
            border-color: #cbd5e1;
        }

        .btn-primary {
            padding: 12px 28px;
            background: linear-gradient(135deg, #2c5364 0%, #203a43 100%);
            color: #ffffff;
            border: none;
            border-radius: 6px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            box-shadow: 0 4px 10px rgba(44, 83, 100, 0.25);
            transition: all 0.25s ease;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, #203a43 0%, #0f2027 100%);
            box-shadow: 0 6px 14px rgba(44, 83, 100, 0.35);
            transform: translateY(-1px);
        }

        /* Calculation Summary Results Card */
        .summary-box {
            background-color: #f8f9fa;
            border: 1px solid #eef2f5;
            border-radius: 8px;
            padding: 16px;
            margin-top: 15px;
        }

        .summary-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 8px 0;
            border-bottom: 1px dashed #e2e8f0;
        }

        .summary-row:last-child {
            border-bottom: none;
            padding-top: 12px;
            margin-top: 4px;
        }

        .summary-row .label-title {
            font-size: 13px;
            color: #64748b;
            font-weight: 600;
        }

        .summary-row .label-value {
            font-size: 14px;
            color: #1e293b;
            font-weight: 600;
        }

        .summary-row.total .label-title {
            font-size: 15px;
            color: #0f172a;
            font-weight: 700;
        }

        .summary-row.total .label-value {
            font-size: 18px;
            color: #27ae60;
            font-weight: 700;
        }

        /* Action Buttons Area */
        .form-actions {
            margin-top: 25px;
            padding-top: 20px;
            border-top: 1px solid #eef2f5;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .btn-link {
            font-size: 14px;
            font-weight: 600;
            color: #2980b9;
            text-decoration: none;
            transition: color 0.2s ease;
        }

        .btn-link:hover {
            color: #1a5276;
            text-decoration: underline;
        }

        /* Mobile Adjustments */
        @media (max-width: 600px) {
            .form-grid {
                grid-template-columns: 1fr;
            }

            .form-group.full-width {
                grid-column: span 1;
            }

            .discount-radio-group {
                flex-wrap: wrap;
                gap: 12px;
            }

            .form-actions {
                flex-direction: column-reverse;
                gap: 15px;
                align-items: stretch;
                text-align: center;
            }

            .btn-primary {
                width: 100%;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="purchase-container">

        <!-- Page Header -->
        <div class="page-header">
            <h2>Purchase Items</h2>
            <p>Record new inventory purchases, calculate discounts, and upload receipts.</p>
        </div>

        <!-- Form Card -->
        <div class="form-card">
            
            <!-- Item Details Section -->
            <div class="form-section-title">Purchase & Item Details</div>
            <div class="form-grid">
                
                <div class="form-group full-width">
                    <label for="DropList1">Select Supplier</label>
                    <asp:DropDownList ID="DropList1" runat="server" CssClass="form-control">
                        <asp:ListItem Text="-- Select Supplier --" Value=""></asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="form-group">
                    <label for="TextBox1">Item Name</label>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="Enter item name"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="TextBox2">Quantity</label>
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" placeholder="Enter quantity"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="TextBox3">Price per Unit (₹)</label>
                    <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" placeholder="Enter price"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label>Apply Discount (%)</label>
                    <div class="discount-radio-group">
                        <asp:RadioButton ID="RadioButton1" runat="server" Text="5%" GroupName="Discount" />
                        <asp:RadioButton ID="RadioButton2" runat="server" Text="10%" GroupName="Discount" />
                        <asp:RadioButton ID="RadioButton3" runat="server" Text="15%" GroupName="Discount" />
                        <asp:RadioButton ID="RadioButton4" runat="server" Text="20%" GroupName="Discount" />
                    </div>
                </div>

                <div class="form-group full-width">
                    <asp:Button ID="Button1" runat="server" Text="Calculate Amount" OnClick="Button1_Click" CssClass="btn-secondary" />
                </div>

            </div>

            <!-- Calculation Summary Section -->
            <div class="form-section-title">Calculation Summary</div>
            
            <div class="summary-box">
                <div class="summary-row">
                    <span class="label-title">Gross Amount</span>
                    <span class="label-value"><asp:Label ID="Label1" runat="server" Text="-"></asp:Label></span>
                </div>
                
                <div class="summary-row">
                    <span class="label-title">Discount Amount</span>
                    <span class="label-value"><asp:Label ID="Label2" runat="server" Text="-"></asp:Label></span>
                </div>

                <div class="summary-row">
                    <span class="label-title">Date of Purchase</span>
                    <span class="label-value"><asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></span>
                </div>

                <div class="summary-row total">
                    <span class="label-title">Net Amount Payable</span>
                    <span class="label-value"><asp:Label ID="Label3" runat="server" Text="-"></asp:Label></span>
                </div>
            </div>

            <!-- Attachment Section -->
            <div class="form-section-title">Item Attachment</div>
            <div class="form-grid">
                <div class="form-group full-width">
                    <label for="File1">Item Image / Receipt</label>
                    <div class="file-upload-wrapper">
                        <asp:FileUpload ID="File1" runat="server" CssClass="file-control" />
                    </div>
                </div>
            </div>

            <!-- Form Actions -->
            <div class="form-actions">
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton_Click" CssClass="btn-link">
                    &larr; View All Purchases
                </asp:LinkButton>
                
                <asp:Button ID="Button2" runat="server" Text="Complete Purchase" OnClick="Button2_Click" CssClass="btn-primary" />
            </div>

        </div>

    </div>
</asp:Content>
