<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AccountManage_NewUser.aspx.vb" Inherits="AccountManage_NewUser" %>

<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
	<head>
		<title>新增使用者 |作業系統管理</title>
        <link rel="shortcut icon" href="images/favicon.ico">
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets2/css/main.css" />
	    <style type="text/css">
            .Tb1
            {
                font-family: 微軟正黑體;
                font-size: 11pt;
                color: #333333;
                vertical-align: middle;
                text-align: center;
                border-right-style: dashed;
                border-right-width: 3px;
            }
        </style>
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
						<h2>新增使用者</h2>
            <h2>New Account</h2>
						<p><br />
						</p>
            <p>
                <asp:Button ID="Bt_NewUse_Back" runat="server" BackColor="#333333" 
                    BorderColor="White" BorderWidth="1px" CssClass="button" Font-Names="微軟正黑體" 
                    Font-Size="12pt" ForeColor="White" Height="60px" Text="返回" Width="95px" />
            </p>
					</header>


					<!-- Three -->
                    <section class="wrapper style3 container special">
                   
					<asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:HWD %>" 
                DeleteCommand="DELETE FROM [Account] WHERE [User_ID] = @User_ID" 
                InsertCommand="INSERT INTO [Account] ([User_Type], [User_Account], [User_Password], [User_Name], [User_Class]) VALUES (@User_Type, @User_Account, @User_Password, @User_Name, @User_Class)" 
                SelectCommand="SELECT * FROM [Account]" 
                UpdateCommand="UPDATE [Account] SET [User_Type] = @User_Type, [User_Account] = @User_Account, [User_Password] = @User_Password, [User_Name] = @User_Name WHERE [User_ID] = @User_ID">
                        <DeleteParameters>
                            <asp:Parameter Name="User_ID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="User_Type" Type="String" />
                            <asp:Parameter Name="User_Account" Type="String" />
                            <asp:Parameter Name="User_Password" Type="String" />
                            <asp:Parameter Name="User_Name" Type="String" />
                            <asp:Parameter Name="User_Class" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="User_Type" Type="String" />
                            <asp:Parameter Name="User_Account" Type="String" />
                            <asp:Parameter Name="User_Password" Type="String" />
                            <asp:Parameter Name="User_Name" Type="String" />
                            <asp:Parameter Name="User_ID" Type="Int32" />
                        </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <table class="style1">
                <tr>
                    <td align="right" class="style3" rowspan="3" 
                        style="font-family: 微軟正黑體; font-size: 12pt; text-align: center; vertical-align: middle; border-top-style: none; border-bottom-style: solid; border-bottom-width: 2px; border-right-style: dashed; border-right-width: 2px" 
                        valign="middle">
                        大量匯入</td>
                    <td class="style2" 
                        style="border-style: none; font-family: 微軟正黑體; font-size: 12pt; text-align: left; vertical-align: middle;">
                        &nbsp;&nbsp; Step1. 下載<asp:HyperLink ID="HyperLink1" runat="server" 
                            NavigateUrl="~/WebFile/Account.xlsx">標準格式檔</asp:HyperLink>
                        檔案輸入資料<font size="3" 
                            style="border-style: none; font-family: 微軟正黑體; font-size: 12pt; text-align: left; vertical-align: middle;">(注意資料完整填寫，以免上傳失敗)</font></td>
                </tr>
                <tr>
                    <td class="style2" 
                        style="border-style: none; font-family: 微軟正黑體; font-size: 12pt; text-align: left; vertical-align: middle;">
                        &nbsp;&nbsp; Step2. 另存 「文字檔(Tab字元分隔)」</td>
                </tr>
                <tr>
                    <td class="style2" 
                        style="border-style: none none solid none; font-family: 微軟正黑體; font-size: 12pt; text-align: left; vertical-align: middle; border-bottom-width: 2px;">
                        &nbsp;&nbsp; Step3.&nbsp;<asp:FileUpload ID="FileUpload1" runat="server" Font-Names="微軟正黑體" 
                            Font-Size="12pt" />
                        &nbsp;<asp:LinkButton ID="bt_UploadUser" runat="server" BackColor="#333333" 
                            Font-Names="微軟正黑體" Font-Size="12pt" ForeColor="White" Height="35px" 
                            Text="確認上傳" Width="130px" />
                        &nbsp;<asp:Label ID="lb_UploadError_Message" runat="server" Font-Names="微軟正黑體" 
                            Font-Size="11pt" ForeColor="Red" Text="僅限上傳 *.txt檔" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="style3複本" valign="middle" 
                        style="font-family: 微軟正黑體; font-size: 12pt; text-align: center; vertical-align: middle; border-top-style: none; border-bottom-style: none; border-bottom-width: 2px; border-right-style: dashed; border-right-width: 2px">
                        單一建檔</td>
                    <td align="center" class="style2複本">
                        &nbsp;<asp:Label ID="lb_SingleUploadError_Message" runat="server" Font-Names="微軟正黑體" 
                            Font-Size="11pt" ForeColor="Red" Text="帳號已建檔，禁止新增" Visible="False"></asp:Label>
                        <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" 
                            DataKeyNames="User_ID" DataSourceID="SqlDataSource2" DefaultMode="Insert" 
                            Font-Names="微軟正黑體" Font-Size="12pt" Height="50px" Width="100%" 
                            CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" />
                            <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                            <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
                            <Fields>
                                <asp:TemplateField HeaderText="使用者類型" SortExpression="User_Type">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("User_Type") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:DropDownList ID="DropDownList2" runat="server" Font-Names="微軟正黑體" 
                                            Font-Size="12pt" SelectedValue='<%# Bind("User_Type") %>'>
                                            <asp:ListItem Value="Admin">管理員</asp:ListItem>
                                            <asp:ListItem Value="Teacher">教職員</asp:ListItem>
                                            <asp:ListItem Value="Student">學生</asp:ListItem>
                                        </asp:DropDownList>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("User_Type") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle ForeColor="Black" Height="60px" HorizontalAlign="Center" 
                                        VerticalAlign="Middle" BorderStyle="None" Width="140px" />
                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="使用者帳號" SortExpression="User_Account">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("User_Account") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox7" runat="server" BackColor="#CCCCCC" 
                                            placeholder="請輸入帳號" Text='<%# Bind("User_Account") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("User_Account") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle ForeColor="Black" Height="60px" HorizontalAlign="Center" 
                                        VerticalAlign="Middle" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="使用者密碼" SortExpression="User_Password">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("User_Password") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox9" runat="server" BackColor="#CCCCCC" 
                                            placeholder="請輸入密碼" Text='<%# Bind("User_Password") %>' TextMode="Password"></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("User_Password") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle ForeColor="Black" Height="60px" HorizontalAlign="Center" 
                                        VerticalAlign="Middle" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="使用者姓名" SortExpression="User_Name">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("User_Name") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox11" runat="server" BackColor="#CCCCCC" 
                                            placeholder="請輸入姓名" Text='<%# Bind("User_Name") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("User_Name") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle ForeColor="Black" Height="60px" HorizontalAlign="Center" 
                                        VerticalAlign="Middle" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="使用者群組" SortExpression="User_Class">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("User_Class") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox12" runat="server" BackColor="#CCCCCC" 
                                            Text='<%# Bind("User_Class") %>' placeholder="
管理員輸入「管理員」；教職員輸入「教師」；學生輸入「班級」"></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("User_Class") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle ForeColor="Black" Height="60px" HorizontalAlign="Center" 
                                        VerticalAlign="Middle" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <InsertItemTemplate>
                                        <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="True" 
                                            CommandName="Insert" ForeColor="#666666" Text="新增"></asp:LinkButton>
                                        &nbsp;<asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="False" 
                                            CommandName="Cancel" ForeColor="#666666" Text="取消"></asp:LinkButton>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton5" runat="server" CausesValidation="False" 
                                            CommandName="New" Text="新增"></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:TemplateField>
                            </Fields>
                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        </asp:DetailsView>
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
			<script src="assets2/js/jquery.min.js"></script>
			<script src="assets2/js/jquery.dropotron.min.js"></script>
			<script src="assets2/js/jquery.scrolly.min.js"></script>
			<script src="assets2/js/jquery.scrollgress.min.js"></script>
			<script src="assets2/js/skel.min.js"></script>
			<script src="assets2/js/util.js"></script>
			<script src="assets2/js/main.js"></script>

	</body>
</html>