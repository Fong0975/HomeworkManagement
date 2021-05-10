<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="SignIn" %>

<!DOCTYPE HTML>
<!--
	Eventually by HTML5 UP
	html5up.net | @n33co
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>使用者登入 |作業系統管理</title>
        <link rel="shortcut icon" href="images/favicon.ico">
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body>
      <form id="form1" runat="server">

		<!-- Header -->
			<header id="header">
                <font face="微軟正黑體">
				    <h1>學生作業管理系統</h1>
				    <p>現在就登入查看個人的作業吧！</p>
                </font>
			</header>

		<!-- Signup Form -->
			<form id="signup-form" method="post" action="#">
                <asp:Label ID="lb_SignIn_ErrorMessage" runat="server" Text="登入失敗，請檢查後再次嘗試" 
                    Font-Names="微軟正黑體" Font-Size="11pt" ForeColor="Red" Visible="False"></asp:Label>
                <asp:TextBox ID="tb_SignIn_Account"  type="text" runat="server" 
                    placeholder="請輸入帳號" ></asp:TextBox> 
                <asp:TextBox ID="tb_SignIn_Password" type="password" runat="server" 
                    placeholder="請輸入密碼" TextMode="Password" ></asp:TextBox><br />
                <asp:Button ID="bt_SignIn_Submit" runat="server" Text="登入" />
			</form>

		<!-- Footer -->
			<footer id="footer">
				<ul class="copyright">
					<li>&copy; Untitled.</li><li>Credits: <a href="http://html5up.net">HTML5 UP</a></li>
					<li> Program: 60th Data3 ShengFeng</li>
				</ul>
			</footer>

		<!-- Scripts -->
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="assets/js/main.js"></script>
       </form>
	</body>
</html>
