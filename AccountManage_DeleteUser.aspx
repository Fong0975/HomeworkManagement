<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AccountManage_DeleteUser.aspx.vb" Inherits="Account_DeleteUser" %>

<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
	<head>
		<title>刪除使用者 |作業系統管理</title>
        <link rel="shortcut icon" href="images/favicon.ico">
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets2/css/main.css" />
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
						<h2>刪除使用者</h2>
            <h2>Delete Account</h2>
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
                        <asp:SqlDataSource ID="SQL_DelUser" runat="server" 
            ConnectionString="<%$ ConnectionStrings:HWD %>" 
            DeleteCommand="DELETE FROM [Account] WHERE [User_ID] = @User_ID" 
            InsertCommand="INSERT INTO [Account] ([User_Type], [User_Account], [User_Password], [User_Name]) VALUES (@User_Type, @User_Account, @User_Password, @User_Name)" 
            SelectCommand="SELECT * FROM [Account] WHERE (([User_Type] = @User_Type2) OR ([User_Type] = @User_Type)) ORDER BY [User_Type] DESC, [User_Account], [User_ID]" 
            UpdateCommand="UPDATE [Account] SET [User_Type] = @User_Type, [User_Account] = @User_Account, [User_Password] = @User_Password, [User_Name] = @User_Name WHERE [User_ID] = @User_ID">
            <DeleteParameters>
                <asp:Parameter Name="User_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="User_Type" Type="String" />
                <asp:Parameter Name="User_Account" Type="String" />
                <asp:Parameter Name="User_Password" Type="String" />
                <asp:Parameter Name="User_Name" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="Teacher" Name="User_Type2" Type="String" />
                <asp:Parameter DefaultValue="Student" Name="User_Type" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="User_Type" Type="String" />
                <asp:Parameter Name="User_Account" Type="String" />
                <asp:Parameter Name="User_Password" Type="String" />
                <asp:Parameter Name="User_Name" Type="String" />
                <asp:Parameter Name="User_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="gv_DelUser" runat="server" AutoGenerateColumns="False" 
            CellPadding="3" DataKeyNames="User_ID" DataSourceID="SQL_DelUser" 
            Font-Names="微軟正黑體" Font-Size="12pt" GridLines="Horizontal" 
            Width="100%" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" 
                BorderWidth="1px">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:CheckBox ID="ck_DelUse" runat="server" />
                    </ItemTemplate>
                    <HeaderStyle Width="25px" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="序號" InsertVisible="False" 
                    SortExpression="User_ID">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("User_ID") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lb_DelUse_id" runat="server" Text='<%# Bind("User_ID") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="使用者類型" SortExpression="User_Type">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("User_Type") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lb_User_Type" runat="server" Text='<%# Bind("User_Type") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle Height="45px" HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>
                <asp:BoundField DataField="User_Account" HeaderText="使用者帳號" 
                    SortExpression="User_Account">
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="User_Name" HeaderText="使用者姓名" 
                    SortExpression="User_Name">
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <SortedAscendingCellStyle BackColor="#F4F4FD" />
            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
            <SortedDescendingCellStyle BackColor="#D8D8F0" />
            <SortedDescendingHeaderStyle BackColor="#3E3277" />
        </asp:GridView>
                   <br />
                   <div align=center>
                   <asp:Button ID="bt_DelUser" runat="server" BackColor="#333333" 
            BorderColor="White" BorderWidth="1px" CssClass="button" Font-Names="微軟正黑體" 
            Font-Size="12pt" ForeColor="White" Height="50px" 
            onclientclick="return confirm('確定要刪除這位使用者及相關資料嗎？')" Text="刪除勾選使用者" 
            Width="250px" />
                    </div>
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
