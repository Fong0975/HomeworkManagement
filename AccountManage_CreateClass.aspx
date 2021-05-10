<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AccountManage_CreateClass.aspx.vb" Inherits="AccountManage_Teaching" %>

<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
	<head>
		<title>班級群組管理 |作業系統管理</title>
        <link rel="shortcut icon" href="images/favicon.ico">
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets2/css/main.css" />

        <script src="SweetAlert/sweetalert.min.js"></script> 
        <link rel="stylesheet" type="text/css" href="SweetAlert/sweetalert.css">
	</head>


	<body class="index">
		<div id="page-wrapper">
    <form id="form1" runat="server">
			<!-- Header -->
				<header id="header" class="alt">
					<h1 id="logo"><a href="AccountManage.aspx"><font color=gray>作業管理系統 Homework</font></a></h1>
				</header>


			<!-- Main -->
             

				<article id="main">
					<header class="special container">
						<h2>班級群組管理</h2>
                        <h2>New Class</h2>
						<p>
                        <br />
						</p>
            <p>
            
            <p>

                <asp:Button ID="Bt_NewUse_Back" runat="server" BackColor="#333333" 
                    BorderColor="White" BorderWidth="1px" CssClass="button" Font-Names="微軟正黑體" 
                    Font-Size="12pt" ForeColor="White" Height="60px" Text="返回" Width="95px" 
                    PostBackUrl="~/AccountManage_Teaching.aspx" />
            </p>
            
					</header>


					<!-- Three -->
                    <section class="wrapper style3 container special">
                        
					<table cellpadding="0" cellspacing="0" 
                style="border: 3px solid #333333; width: 100%">
                        <tr>
                            <td style="border-right-style: dashed; border-width: 2px; border-color: #666666; color: #666666; vertical-align: middle; text-align: center; border-bottom-style: solid;">
                                班級名稱</td>
                            <td style="border-bottom-style: solid; border-width: 3px; border-color: #666666">
                                <asp:TextBox ID="tb_NewGroup_Name" runat="server" placeholder="請輸入班級群組名稱，如：「專題小組」"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="border-right-style: dashed; border-width: 2px; border-color: #666666; color: #666666; vertical-align: middle; text-align: center; border-bottom-style: solid;">
                                班級導師</td>
                            <td style="border-width: 3px; border-color: #666666; padding-left: 15px; padding-right: 15px; border-bottom-style: solid;">
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:HWD %>" 
                                    
                                    SelectCommand="SELECT * FROM [Account] WHERE ([User_Type] = @User_Type) ORDER BY [User_Class], [User_Account]">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="Teacher" Name="User_Type" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:DropDownList ID="ddl_Teacher_List" runat="server" 
                                    DataSourceID="SqlDataSource2" DataTextField="User_Name" 
                                    DataValueField="User_ID" Width="100%">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style="border-right-style: dashed; border-width: 2px; border-color: #666666; color: #666666; vertical-align: middle; text-align: center; border-bottom-style: solid;">
                                班級成員</td>
                            <td style="border-width: 3px; border-color: #666666; padding-left: 15px; padding-right: 15px; border-bottom-style: solid;">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:HWD %>" 
                                    SelectCommand="SELECT * FROM [Account] WHERE ([User_Type] = @User_Type) ORDER BY [User_Class], [User_Account]">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="Student" Name="User_Type" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:CheckBoxList ID="cbl_Student_List" runat="server" 
                                    DataSourceID="SqlDataSource1" DataTextField="User_Name" 
                                    DataValueField="User_ID" style="text-align:left;">
                                </asp:CheckBoxList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td style="padding: 10px; text-align: right; ">
                                <asp:Button ID="Button1" runat="server" Text="建立" />
                            </td>
                        </tr>
            </table>
                        
					</section>


				</article>
    </form>
			<!-- CTA -->
				<section id="cta">
					<footer>
						<ul class="copyright">
						    <li>&copy; Untitled Design: <a href="http://html5up.net">HTML5 UP</a></li>
                            <li>&copy; Untitled Program: 60th Data3 ShengFeng</li>
					    </ul>
					</footer>

				</section>


		</div>

		<!-- Scripts -->
             <script type="text/javascript">

                 function confirmReset() {
                     swal({
                         title: "班級群組新增完成", text: "此班級群組已新增完成，您現在可以針對此班級進行管理了",
                         type: "success",
                         showCancelButton: false,
                         confirmButtonText: "OK",
                         closeOnConfirm: false
                     }, function () {
                         window.location.href = "AccountManage_Teaching.aspx";
                     });
                 }

            </script>
			<script src="assets2/js/jquery.min.js"></script>
			<script src="assets2/js/jquery.dropotron.min.js"></script>
			<script src="assets2/js/jquery.scrolly.min.js"></script>
			<script src="assets2/js/jquery.scrollgress.min.js"></script>
			<script src="assets2/js/skel.min.js"></script>
			<script src="assets2/js/util.js"></script>
			<script src="assets2/js/main.js"></script>

	</body>
</html>
