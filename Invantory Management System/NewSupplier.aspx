<%@ Page Title="Add New Supplier" Language="C#" MasterPageFile="~/I-M-S.Master" AutoEventWireup="true" CodeBehind="NewSupplier.aspx.cs" Inherits="Invantory_Management_System.NewSupplier" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        /* ==========================================================================
           Internal Styles for New Supplier Form
           ========================================================================== */

        /* Main Container */
        .form-container {
            max-width: 850px;
            margin: 30px auto;
            padding: 0 20px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        /* Header Section */
        .form-header {
            margin-bottom: 24px;
        }

        .form-header h2 {
            font-size: 24px;
            font-weight: 700;
            color: #1a252f;
            margin-bottom: 6px;
        }

        .form-header p {
            font-size: 14px;
            color: #7f8c8d;
        }

        /* Main Form Card */
        .form-card {
            background: #ffffff;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 4px 18px rgba(0, 0, 0, 0.08);
            border: 1px solid #eef2f5;
        }

        /* Section Dividers */
        .form-section-title {
            font-size: 14px;
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

        /* Grid Layout */
        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 18px 24px;
            margin-bottom: 10px;
        }

        /* Form Fields */
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

        /* Inputs & Textareas */
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

        textarea.form-control {
            resize: vertical;
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

        /* Radio Button Group (Inline Layout) */
        .radio-group {
            display: flex;
            align-items: center;
            gap: 18px;
            height: 40px;
        }

        .radio-label {
            font-size: 14px;
            color: #444;
            cursor: pointer;
        }

        .radio-label input[type="radio"] {
            margin-right: 5px;
            accent-color: #2c5364;
        }

        /* Submit Button & Actions */
        .form-actions {
            margin-top: 25px;
            text-align: right;
            border-top: 1px solid #eef2f5;
            padding-top: 20px;
        }

        .btn-submit {
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
        }

        .btn-submit:hover {
            background: linear-gradient(135deg, #203a43 0%, #0f2027 100%);
            box-shadow: 0 6px 14px rgba(44, 83, 100, 0.35);
            transform: translateY(-1px);
        }

        .btn-submit:active {
            transform: translateY(0);
        }

        /* Responsive View for Smaller Screens */
        @media (max-width: 600px) {
            .form-grid {
                grid-template-columns: 1fr;
            }
            
            .form-group.full-width {
                grid-column: span 1;
            }

            .form-card {
                padding: 20px 15px;
            }

            .btn-submit {
                width: 100%;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-container">
        <div class="form-header">
            <h2>Add New Supplier</h2>
            <p>Fill in the required information to register a new supplier in the system.</p>
        </div>

        <div class="form-card">
            
            <!-- Section 1: Basic Information -->
            <div class="form-section-title">Basic Information</div>
            <div class="form-grid">
                
                <div class="form-group">
                    <label for="TextBox1">Supplier ID</label>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="e.g. SUP-1001"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="TextBox2">Supplier Name</label>
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" placeholder="Full name or company name"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="TextBox3">Age</label>
                    <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" placeholder="Age"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label>Gender</label>
                    <div class="radio-group">
                        <label class="radio-label">
                            <asp:RadioButton ID="RadioButton1" runat="server" GroupName="Gender" Text="Male" />
                        </label>
                        <label class="radio-label">
                            <asp:RadioButton ID="RadioButton2" runat="server" GroupName="Gender" Text="Female" />
                        </label>
                        <label class="radio-label">
                            <asp:RadioButton ID="RadioButton3" runat="server" GroupName="Gender" Text="Other" />
                        </label>
                    </div>
                </div>

            </div>

            <!-- Section 2: Contact Information -->
            <div class="form-section-title">Contact & Address Details</div>
            <div class="form-grid">

                <div class="form-group">
                    <label for="TextBox4">Contact Number</label>
                    <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" placeholder="+1 (555) 000-0000"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="TextBox5">Email Address</label>
                    <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" placeholder="supplier@example.com"></asp:TextBox>
                </div>

                <div class="form-group full-width">
                    <label for="TextBox6">Address</label>
                    <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" placeholder="Enter full address details"></asp:TextBox>
                </div>

                <div class="form-group full-width">
                    <label for="File1">Supplier Image / Logo</label>
                    <div class="file-upload-wrapper">
                        <asp:FileUpload ID="File1" runat="server" CssClass="file-control" />
                    </div>
                </div>

            </div>

            <!-- Section 3: Credentials -->
            <div class="form-section-title">Account Credentials</div>
            <div class="form-grid">

                <div class="form-group">
                    <label for="TextBox7">User ID</label>
                    <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control" placeholder="Create User ID"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="TextBox8">Password</label>
                    <asp:TextBox ID="TextBox8" runat="server" TextMode="Password" CssClass="form-control" placeholder="••••••••"></asp:TextBox>
                </div>

            </div>

            <!-- Submit Action -->
            <div class="form-actions">
                <asp:Button ID="Button1" runat="server" Text="Save Supplier Details" OnClick="Button1_Click" CssClass="btn-submit" />
            </div>

        </div>
    </div>
</asp:Content>