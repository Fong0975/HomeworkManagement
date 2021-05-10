<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AccountManage.aspx.vb" Inherits="AccountManage" %>

<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
	<head>
		<title>系統帳戶管理 |作業系統管理</title>
        <link rel="shortcut icon" href="images/favicon.ico">
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets2/css/main.css" />
	    <style type="text/css">
            .style1
            {
                width: 100%;
            }
        </style>
	</head>
	<body class="index">
		<div id="page-wrapper">
    <form id="form1" runat="server">
			<!-- Header -->
				<header id="header" class="alt">
					<h1 id="logo"><a href="AccountManage.aspx">作業管理系統 Homework</a></h1>
                    <nav id="nav">
						<ul>
							<li class="current"><a href="AccountManage_NewUser.aspx">新增使用者</a></li>
							<li class="current"><a href="AccountManage_Teaching.aspx">新增教室關係</a></li>
                            <li class="current"><a href="AccountManage_DeleteUser.aspx">刪除使用者</a></li>
							<li><asp:LinkButton ID="Button1" runat="server" Text="登出" CssClass="button special" ></asp:LinkButton></li>
						</ul>
					</nav>
				</header>

			<!-- Banner -->

				<section id="banner">
               
					
					<div class="inner">

						<header>
							<h2>系統帳戶管理</h2>
						</header>
						<p>親愛的  <asp:Label ID="lb_Title_UserName" runat="server" Text="Label"></asp:Label> &nbsp;管理員您好</p>
                        <asp:Label ID="lb_User_id" runat="server" Visible="False"></asp:Label>

					</div>

				</section>

			<!-- Main -->
             

				<article id="main">
					<header class="special container">
						<h2>帳戶管理</h2>
            <h2>Account Manage</h2>
						<p>以下是系統所有使用者資料的總覽.<br />
						</p>
            <p>&nbsp;</p>
            <p>
					    &nbsp;</p>
					</header>


					<!-- Three -->
                
                    <section class="wrapper style3 container special">
                    
                      <table class="style1">
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                               身分別：
                    <asp:DropDownList ID="ddl_Ident" runat="server" AutoPostBack="True" 
            Font-Names="微軟正黑體" Font-Size="14pt">
            <asp:ListItem Value="Admin">管理員</asp:ListItem>
            <asp:ListItem Value="Teacher">教職員</asp:ListItem>
            <asp:ListItem Value="Student">學生</asp:ListItem>
        </asp:DropDownList> 
                                 &nbsp; 
                                 群組：
                    <asp:DropDownList ID="ddl_Ident0" runat="server" AutoPostBack="True" 
            Font-Names="微軟正黑體" Font-Size="14pt" DataSourceID="SqlDataSource2" 
                DataTextField="User_Class" DataValueField="User_Class">
            <asp:ListItem Value="Admin">管理員</asp:ListItem>
            <asp:ListItem Value="Teacher">教職員</asp:ListItem>
            <asp:ListItem Value="Student">學生</asp:ListItem>
        </asp:DropDownList>   
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
            </table>


        <br />

                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:HWD %>" 
            DeleteCommand="DELETE FROM [Account] WHERE [User_ID] = @User_ID" 
            InsertCommand="INSERT INTO [Account] ([User_Type], [User_Account], [User_Password], [User_Name]) VALUES (@User_Type, @User_Account, @User_Password, @User_Name)" 
            SelectCommand="SELECT * FROM [Account] WHERE ([User_Type] = @User_Type And [User_Class] = @User_Class) ORDER BY [User_Class], [User_Account],[User_ID]" 
            
                UpdateCommand="UPDATE [Account] SET  [User_Password] = @User_Password, [User_Name] = @User_Name,[User_Class] = @User_Class WHERE [User_ID] = @User_ID">
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
                <asp:ControlParameter ControlID="ddl_Ident" DefaultValue="" Name="User_Type" 
                    PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="ddl_Ident0" Name="User_Class" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="User_Password" Type="String" />
                <asp:Parameter Name="User_Name" Type="String" />
                <asp:Parameter Name="User_Class" Type="String" />
                <asp:Parameter Name="User_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:HWD %>" 
                SelectCommand="SELECT DISTINCT [User_Type], [User_Class] FROM [Account] WHERE ([User_Type] = @User_Type) ORDER BY [User_Class]">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddl_Ident" Name="User_Type" 
                        PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="User_ID" DataSourceID="SqlDataSource1" 
            Font-Names="微軟正黑體" Font-Size="12pt" ForeColor="#333333" GridLines="None" 
            Width="100%">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="群組" SortExpression="User_Class">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("User_Class") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("User_Class") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="帳號" SortExpression="User_Account">
                    <EditItemTemplate>
                        <asp:Label ID="Label1_1" runat="server" Font-Size="12pt" 
                            Text='<%# Bind("User_Account") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Font-Size="12pt" 
                            Text='<%# Bind("User_Account") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="密碼" SortExpression="User_Password">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Font-Size="12pt" 
                            Text='<%# Bind("User_Password") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        *****
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="姓名" SortExpression="User_Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Font-Size="12pt" 
                            Text='<%# Bind("User_Name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Font-Size="12pt" 
                            Text='<%# Bind("User_Name") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:Button ID="bt_Gridview_Admin_Update" runat="server" CommandName="Update" 
                            CssClass="Button" Text="更新" />
                        <asp:Button ID="bt_Gridview_Admin_Cancel" runat="server" CommandName="Cancel" 
                            CssClass="Button" Text="取消" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Button ID="bt_Gridview_Admin_Edit" runat="server" CommandName="Edit" 
                            CssClass="Button" Text="編輯" />
                        <asp:Button ID="bt_Gridview_Admin_Edit0" runat="server" CommandName="Delete" 
                            CssClass="Button" onclientclick="return confirm('確定要刪除這位使用者及相關資料嗎？')" 
                            Text="刪除" />
                        <asp:Label ID="lb_DelUse_id" runat="server" Text='<%# Eval("User_ID") %>' 
                            Visible="False"></asp:Label>
                        <asp:Label ID="lb_User_Type" runat="server" Text='<%# Eval("User_Type") %>' 
                            Visible="False"></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                    <ItemStyle Height="60px" HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
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