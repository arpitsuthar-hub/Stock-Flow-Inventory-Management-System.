```aspx
<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="login.aspx.cs"
    Inherits="Inventory_Management_System.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <meta charset="utf-8" />

    <meta name="viewport"
        content="width=device-width, initial-scale=1.0" />

    <title>StockFlow - Login</title>

    <!-- Font Awesome -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />

    <style>

        /* ============================================================
           PAGE
           ============================================================ */

        * {
            box-sizing: border-box;
        }

        html,
        body {
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
        }

        body {

            font-family: 'Segoe UI',
                         Tahoma,
                         Geneva,
                         Verdana,
                         sans-serif;

            display: flex;

            justify-content: center;

            align-items: center;

            min-height: 100vh;

            overflow: hidden;

            /* Warehouse Background */

            background-image:
                linear-gradient(
                    rgba(8, 32, 55, 0.28),
                    rgba(8, 32, 55, 0.40)
                ),
                url('Images/Login_Background.png');

            background-size: cover;

            background-position: center;

            background-repeat: no-repeat;

            position: relative;
        }


        /* ============================================================
           DARK BLUE OVERLAY
           ============================================================ */

        body::before {

            content: "";

            position: absolute;

            inset: 0;

            background:
                radial-gradient(
                    circle at center,
                    rgba(30, 125, 190, 0.05),
                    rgba(3, 20, 35, 0.25)
                );

            pointer-events: none;
        }


        /* ============================================================
           LOGIN CONTAINER - TRANSPARENT GLASS
           ============================================================ */

        .login-container {

            position: relative;

            z-index: 2;

            width: 540px;

            min-height: 620px;

            padding: 38px 40px;

            border-radius: 28px;

            /* More Transparent Glass */

            background:
                linear-gradient(
                    135deg,
                    rgba(12, 48, 78, 0.42),
                    rgba(15, 47, 73, 0.28)
                );

            /* Stronger Glass Blur */

            backdrop-filter: blur(12px);

            -webkit-backdrop-filter: blur(12px);

            /* Thin Glass Border */

            border: 1px solid rgba(190, 225, 255, 0.45);

            /* Glow + Shadow */

            box-shadow:
                0 25px 60px rgba(0, 0, 0, 0.30),
                inset 0 1px 1px rgba(255, 255, 255, 0.16);

            display: flex;

            flex-direction: column;

            justify-content: center;
        }


        /* ============================================================
           TOP ICON
           ============================================================ */

        .logo-icon {

            text-align: center;

            margin-bottom: 5px;
        }

        .logo-icon i {

            color: white;

            font-size: 58px;

            filter:
                drop-shadow(
                    0 4px 8px rgba(0, 0, 0, 0.25)
                );
        }


        /* ============================================================
           STOCKFLOW LOGO
           ============================================================ */

        .brand-name {

            text-align: center;

            margin-top: 0;

            margin-bottom: 3px;

            font-size: 52px;

            line-height: 1;

            font-weight: 700;

            letter-spacing: -2px;

            color: white;

            text-shadow:
                0 3px 10px rgba(0, 0, 0, 0.25);
        }

        .brand-flow {

            color: #27a9ff;
        }


        /* ============================================================
           SUB TITLE
           ============================================================ */

        .brand-subtitle {

            text-align: center;

            color: white;

            font-size: 15px;

            font-weight: 600;

            letter-spacing: 4px;

            margin-top: 12px;

            margin-bottom: 12px;

            text-shadow:
                0 2px 5px rgba(0, 0, 0, 0.3);
        }


        /* ============================================================
           BLUE LINE
           ============================================================ */

        .blue-line {

            width: 70px;

            height: 4px;

            margin: 0 auto 22px auto;

            border-radius: 20px;

            background:
                linear-gradient(
                    90deg,
                    #168df5,
                    #43b8ff
                );

            box-shadow:
                0 0 12px rgba(30, 160, 255, 0.65);
        }


        /* ============================================================
           WELCOME TEXT
           ============================================================ */

        .welcome-text {

            text-align: center;

            color: rgba(255, 255, 255, 0.92);

            font-size: 16px;

            margin-bottom: 25px;
        }


        /* ============================================================
           INPUT GROUP
           ============================================================ */

        .input-group {

            position: relative;

            width: 100%;

            margin-bottom: 20px;
        }


        /* Input Icons */

        .input-icon {

            position: absolute;

            left: 21px;

            top: 50%;

            transform: translateY(-50%);

            color: white;

            font-size: 21px;

            z-index: 3;
        }


        /* ============================================================
           TEXTBOX
           ============================================================ */

        .form-control {

            width: 100%;

            height: 59px;

            padding:
                0 52px 0 72px;

            border-radius: 13px;

            border: 1.5px solid
                rgba(150, 207, 255, 0.55);

            outline: none;

            /* Transparent Input */

            background:
                rgba(15, 53, 82, 0.25);

            color: white;

            font-size: 16px;

            font-family:
                'Segoe UI',
                Tahoma,
                Geneva,
                Verdana,
                sans-serif;

            backdrop-filter: blur(5px);

            -webkit-backdrop-filter: blur(5px);

            transition: 0.25s ease;

            box-shadow:
                inset 0 1px 5px rgba(0, 0, 0, 0.08);
        }

        .form-control::placeholder {

            color:
                rgba(255, 255, 255, 0.72);

            opacity: 1;
        }

        .form-control:focus {

            border-color: #42b5ff;

            background:
                rgba(20, 69, 105, 0.38);

            box-shadow:
                0 0 0 3px
                rgba(45, 166, 255, 0.15),

                0 0 18px
                rgba(45, 166, 255, 0.15);
        }


        /* ============================================================
           PASSWORD EYE
           ============================================================ */

        .password-eye {

            position: absolute;

            right: 20px;

            top: 50%;

            transform: translateY(-50%);

            color:
                rgba(220, 240, 255, 0.9);

            font-size: 20px;

            cursor: pointer;

            z-index: 4;

            transition: 0.2s;
        }

        .password-eye:hover {

            color: white;

            transform:
                translateY(-50%)
                scale(1.08);
        }


        /* ============================================================
           LOGIN BUTTON
           ============================================================ */

        .btn-primary {

            width: 100%;

            height: 65px;

            margin-top: 5px;

            border: none;

            border-radius: 13px;

            cursor: pointer;

            color: white;

            font-size: 22px;

            font-weight: 600;

            font-family:
                'Segoe UI',
                Tahoma,
                Geneva,
                Verdana,
                sans-serif;

            background:
                linear-gradient(
                    135deg,
                    #39aaff 0%,
                    #1487e8 100%
                );

            box-shadow:
                0 7px 20px
                rgba(18, 137, 235, 0.35),

                inset 0 1px 1px
                rgba(255, 255, 255, 0.35);

            transition:
                transform 0.2s ease,
                box-shadow 0.2s ease,
                background 0.2s ease;
        }

        .btn-primary:hover {

            background:
                linear-gradient(
                    135deg,
                    #4bb4ff 0%,
                    #1282e2 100%
                );

            transform: translateY(-2px);

            box-shadow:
                0 10px 25px
                rgba(18, 137, 235, 0.48);
        }

        .btn-primary:active {

            transform: translateY(0);

            box-shadow:
                0 5px 12px
                rgba(18, 137, 235, 0.35);
        }


        /* ============================================================
           LOGIN ICON
           ============================================================ */

        .login-button-icon {

            margin-right: 10px;
        }


        /* ============================================================
           BOTTOM TEXT
           ============================================================ */

        .bottom-section {

            display: flex;

            align-items: center;

            justify-content: center;

            margin-top: 27px;

            color:
                rgba(255, 255, 255, 0.75);

            font-size: 15px;

            letter-spacing: 0.5px;
        }

        .bottom-line {

            width: 100px;

            height: 1px;

            background:
                rgba(255, 255, 255, 0.65);

            margin: 0 20px;
        }

        .bottom-text {

            white-space: nowrap;
        }


        /* ============================================================
           RESPONSIVE
           ============================================================ */

        @media (max-width: 700px) {

            body {

                overflow-y: auto;

                padding: 20px;
            }

            .login-container {

                width: 100%;

                max-width: 540px;

                min-height: auto;

                padding:
                    35px 25px;
            }

            .brand-name {

                font-size: 42px;
            }

            .brand-subtitle {

                font-size: 12px;

                letter-spacing: 3px;
            }
        }


        @media (max-width: 450px) {

            .login-container {

                padding:
                    30px 20px;

                border-radius: 20px;
            }

            .brand-name {

                font-size: 36px;
            }

            .logo-icon i {

                font-size: 48px;
            }

            .welcome-text {

                font-size: 14px;
            }

            .bottom-line {

                width: 50px;

                margin: 0 10px;
            }
        }

    </style>

</head>

<body>

<form id="form1" runat="server">

    <div class="login-container">

        <!-- =====================================================
             LOGO ICON
             ===================================================== -->

        <div class="logo-icon">

            <i class="fa-solid fa-cube"></i>

        </div>


        <!-- =====================================================
             STOCKFLOW
             ===================================================== -->

        <div class="brand-name">

            Stock<span class="brand-flow">Flow</span>

        </div>


        <!-- =====================================================
             SUBTITLE
             ===================================================== -->

        <div class="brand-subtitle">

            INVENTORY MANAGEMENT SYSTEM

        </div>


        <!-- BLUE LINE -->

        <div class="blue-line"></div>


        <!-- =====================================================
             WELCOME
             ===================================================== -->

        <div class="welcome-text">

            Welcome back! Please enter your credentials.

        </div>


        <!-- =====================================================
             USER ID
             ===================================================== -->

        <div class="input-group">

            <i class="fa-solid fa-user input-icon"></i>

            <asp:TextBox
                ID="TextBox1"
                runat="server"
                CssClass="form-control"
                placeholder="Enter User ID">
            </asp:TextBox>

        </div>


        <!-- =====================================================
             PASSWORD
             ===================================================== -->

        <div class="input-group">

            <i class="fa-solid fa-lock input-icon"></i>

            <asp:TextBox
                ID="TextBox2"
                runat="server"
                TextMode="Password"
                CssClass="form-control"
                placeholder="Enter Password">
            </asp:TextBox>

            <i
                class="fa-solid fa-eye password-eye"
                id="passwordEye"
                onclick="showPassword()">
            </i>

        </div>


        <!-- =====================================================
             LOGIN BUTTON
             ===================================================== -->

        <asp:Button
            ID="Button1"
            runat="server"
            Text="Login"
            OnClick="Button1_Click"
            CssClass="btn-primary" />


        <!-- =====================================================
             BOTTOM
             ===================================================== -->

        <div class="bottom-section">

            <div class="bottom-line"></div>

            <div class="bottom-text">
                Manage&nbsp;&nbsp; • &nbsp;&nbsp;Track&nbsp;&nbsp; • &nbsp;&nbsp;Grow
            </div>

            <div class="bottom-line"></div>

        </div>

    </div>

</form>


<!-- =============================================================
     PASSWORD SHOW / HIDE
     ============================================================= -->

<script>

    function showPassword() {

        var passwordBox =
            document.getElementById('<%= TextBox2.ClientID %>');

        var eye =
            document.getElementById('passwordEye');

        if (passwordBox.type === "password") {

            passwordBox.type = "text";

            eye.classList.remove("fa-eye");

            eye.classList.add("fa-eye-slash");

        }
        else {

            passwordBox.type = "password";

            eye.classList.remove("fa-eye-slash");

            eye.classList.add("fa-eye");

        }
    }

</script>

</body>

</html>
