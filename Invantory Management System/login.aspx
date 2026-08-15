<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Invantory_Management_System.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <style type="text/css">
        /* ==========================================================================
           Internal Styles for Login Page
           ========================================================================== */

        /* Page Background & Centering */
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7f6;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        /* Login Card Container */
        .login-container {
            width: 100%;
            max-width: 400px;
            background-color: #ffffff;
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
            border: 1px solid #eef2f5;
            box-sizing: border-box;
            margin: 20px;
        }

        /* Heading */
        .login-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .login-header h1 {
            color: #1a252f;
            font-size: 24px;
            font-weight: 700;
            margin: 0 0 8px 0;
            letter-spacing: 0.5px;
        }

        .login-header p {
            color: #7f8c8d;
            font-size: 14px;
            margin: 0;
        }

        /* Form Controls */
        .form-group {
            display: flex;
            flex-direction: column;
            margin-bottom: 20px;
        }

        .form-group label {
            font-size: 13px;
            font-weight: 600;
            color: #34495e;
            margin-bottom: 8px;
        }

        .form-control {
            width: 100%;
            padding: 12px 14px;
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

        /* Action Buttons Area */
        .form-actions {
            margin-top: 10px;
        }

        .btn-primary {
            width: 100%;
            padding: 12px 0;
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

        .btn-primary:hover {
            background: linear-gradient(135deg, #203a43 0%, #0f2027 100%);
            box-shadow: 0 6px 14px rgba(44, 83, 100, 0.35);
            transform: translateY(-1px);
        }

        .btn-primary:active {
            transform: translateY(0);
        }

        /* Mobile Adjustments */
        @media (max-width: 480px) {
            .login-container {
                padding: 30px 20px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            
            <!-- Header Section -->
            <div class="login-header">
                <h1>LOGIN PANEL</h1>
                <p>Welcome back! Please enter your credentials.</p>
            </div>

            <!-- Form Section -->
            <div class="form-group">
                <label for="TextBox1">User ID</label>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="Enter User ID"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="TextBox2">Password</label>
                <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter Password"></asp:TextBox>
            </div>

            <div class="form-actions">
                <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" CssClass="btn-primary" />
            </div>

        </div>
    </form>
</body>
</html>