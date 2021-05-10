<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Teacher.aspx.vb" Inherits="Teacher" %>

<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
	<head>
		<title>教師事務 |作業系統管理</title>
        <link rel="shortcut icon" href="images/favicon.ico">
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets2/css/main.css" />

        <style type="text/css">
            .GridviewBorder
            {
                border-right-style: solid;
                border-right-width: 0.8px;
                border-right-color: #3B0086;
                padding-right: 2px;
                padding-left: 2px;
            }
        </style>
	</head>
	<body class="index">
		<div id="page-wrapper">
    <form id="form1" runat="server">
			<!-- Header -->
				<header id="header" class="alt">
					<h1 id="logo"><a href="Teacher.aspx">作業管理系統 Homework</a></h1>
					<nav id="nav">
						<ul>
							<li><asp:LinkButton ID="Button1" runat="server" Text="登出" CssClass="button special" ></asp:LinkButton></li>
						</ul>
					</nav>
				</header>

			<!-- Banner -->

				<section id="banner">
               
					
					<div class="inner">

						<header>
							<h2>教師事務管理</h2>
						</header>
						<p>親愛的  <asp:Label ID="lb_Title_UserName" runat="server" Text="Label"></asp:Label> &nbsp;老師您好</p>
                        <asp:Label ID="lb_User_id" runat="server" Visible="False"></asp:Label>

					</div>

				</section>

			<!-- Main -->
             

				<article id="main">
					<header class="special container">
						<h2>作業管理</h2>
            <h2>Homework Manage</h2>
						<p>以下是作業老師您新增的作業總覽.<br />
						</p>
            <p>&nbsp;</p>
            <p>
					    <asp:Button ID="bt_Add" runat="server" BackColor="#92713F" Font-Names="微軟正黑體" 
                            Font-Size="12pt" ForeColor="#FFF6E9" Height="55px" Text="新增" width="18em" />
                       </p>
					</header>


					<!-- Three -->
						<section class="wrapper style3 container special">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:HWD %>" 
            DeleteCommand="DELETE FROM [Homework] WHERE [Homework_id] = @Homework_id" 
            InsertCommand="INSERT INTO [Homework] ([User_ID], [Homework_Title], [Homework_Description], [Homework_Deadline], [Homework_Class], [Homework_SubFileName], [Homework_File1]) VALUES (@User_ID, @Homework_Title, @Homework_Description, @Homework_Deadline, @Homework_Class, @Homework_SubFileName, @Homework_File1)" 
            SelectCommand="SELECT * FROM [Homework] WHERE ([User_ID] = @User_ID) ORDER BY [Homework_id]" 
            UpdateCommand="UPDATE [Homework] SET [User_ID] = @User_ID, [Homework_Title] = @Homework_Title, [Homework_Description] = @Homework_Description, [Homework_Deadline] = @Homework_Deadline, [Homework_Class] = @Homework_Class, [Homework_SubFileName] = @Homework_SubFileName, [Homework_File1] = @Homework_File1 WHERE [Homework_id] = @Homework_id">
            <DeleteParameters>
                <asp:Parameter Name="Homework_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="User_ID" Type="Int32" />
                <asp:Parameter Name="Homework_Title" Type="String" />
                <asp:Parameter Name="Homework_Description" Type="String" />
                <asp:Parameter Name="Homework_Deadline" Type="String" />
                <asp:Parameter Name="Homework_Class" Type="String" />
                <asp:Parameter Name="Homework_SubFileName" Type="String" />
                <asp:Parameter Name="Homework_File1" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="lb_User_id" Name="User_ID" PropertyName="Text" 
                    Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="User_ID" Type="Int32" />
                <asp:Parameter Name="Homework_Title" Type="String" />
                <asp:Parameter Name="Homework_Description" Type="String" />
                <asp:Parameter Name="Homework_Deadline" Type="String" />
                <asp:Parameter Name="Homework_Class" Type="String" />
                <asp:Parameter Name="Homework_SubFileName" Type="String" />
                <asp:Parameter Name="Homework_File1" Type="String" />
                <asp:Parameter Name="Homework_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
                        
					    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" DataKeyNames="Homework_id" 
            DataSourceID="SqlDataSource1" Width="100%" GridLines="Horizontal" 
                Font-Names="微軟正黑體">
                            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:Button ID="bt_Gridview_Homework_Edit" runat="server" 
                            onclick="bt_Gridview_Homework_Edit_Click" Text="編輯" Width="100%" />
                            <asp:Button ID="Button1" runat="server" CausesValidation="False" 
                            CommandName="Delete" Text="刪除" 
                            onclientclick="return confirm('確定要刪除這項作業及相關資料嗎？')" Width="100%" />
                        <asp:Label ID="lb_Homework_id" runat="server" Text='<%# Eval("Homework_id") %>' 
                            Visible="False"></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Width="10%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="作業名稱" SortExpression="Homework_Title">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Homework_Title") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" 
                            NavigateUrl='<%# "Teacher_Homework_Detail.aspx?hwid=" & Eval("Homework_id") %>' 
                            Text='<%# Eval("Homework_Title") %>'></asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle CssClass="GridviewBorder" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="作業期限" SortExpression="Homework_Deadline">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" 
                            Text='<%# Bind("Homework_Deadline") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Homework_Deadline") %>' style="word-break: break-all;"></asp:Label>
                    </ItemTemplate>
                    <ItemStyle CssClass="GridviewBorder" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="參與班級" SortExpression="Homework_Class">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Homework_Class") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Homework_Class") %>' style="word-break: break-all;"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle ForeColor="#4A3C8C" HorizontalAlign="Right" BackColor="#E7E7FF" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <SortedAscendingCellStyle BackColor="#F4F4FD" />
            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
            <SortedDescendingCellStyle BackColor="#D8D8F0" />
            <SortedDescendingHeaderStyle BackColor="#3E3277" />
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
