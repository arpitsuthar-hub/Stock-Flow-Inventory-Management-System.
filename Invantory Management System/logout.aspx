<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="logout.aspx.cs" Inherits="Invantory_Management_System.Logout" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Logout</title>
    <style type="text/css">
        /* ==========================================================================
           Internal Styles for Logout Page
           ========================================================================== */
        
        /* Page Styling */
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

        /* Logout Container Card */
        .logout-container {
            width: 100%;
            max-width: 440px;
            background-color: #ffffff;
            padding: 40px 30px;
            text-align: center;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
            border: 1px solid #eef2f5;
            box-sizing: border-box;
            margin: 20px;
        }

        /* Logout Icon Container */
        .icon-circle {
            width: 70px;
            height: 70px;
            background-color: #eef9f2;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px auto;
        }

        .icon-circle svg {
            width: 36px;
            height: 36px;
            fill: #27ae60;
        }

        /* Heading */
        .logout-container h1 {
            color: #1a252f;
            font-size: 22px;
            font-weight: 700;
            margin: 0 0 10px 0;
        }

        /* Subtitle / Description */
        .logout-container p {
            color: #7f8c8d;
            font-size: 14px;
            margin-bottom: 25px;
            line-height: 1.5;
        }

        /* Line Divider */
        .logout-container hr {
            border: none;
            height: 1px;
            background-color: #eef2f5;
            margin: 0 0 25px 0;
        }

        /* Login Button (HyperLink) */
        .login-link {
            display: block;
            width: 100%;
            text-decoration: none;
            background: linear-gradient(135deg, #1e3a5f 0%, #2f5a8c 100%);
            color: #ffffff !important;
            padding: 12px 0;
            border-radius: 6px;
            font-size: 15px;
            font-weight: 600;
            box-shadow: 0 4px 10px rgba(30, 58, 95, 0.25);
            transition: all 0.25s ease;
            box-sizing: border-box;
        }

        .login-link:hover {
            background: linear-gradient(135deg, #2f5a8c 0%, #1a252f 100%);
            box-shadow: 0 6px 14px rgba(30, 58, 95, 0.35);
            transform: translateY(-1px);
        }

        .login-link:active {
            transform: translateY(0);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="logout-container">
            <!-- Decorative Success Check Icon -->
            <div class="icon-circle">
                <svg viewBox="0 0 24 24">
                    <path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z"/>
                </svg>
            </div>

            <h1>Successfully Logged Out</h1>
            <p>You have been safely signed out of your account session.</p>
            
            <hr />

            <asp:HyperLink
                ID="HyperLink1"
                runat="server"
                Text="Click Here To Login"
                NavigateUrl="~/login.aspx"
                CssClass="login-link">
            </asp:HyperLink>
        </div>
    </form>
</body>
</html>