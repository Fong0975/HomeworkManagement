<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Student.aspx.vb" Inherits="Student" %>

<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
	<head>
		<title>學生事務 |作業系統管理</title>
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
					<h1 id="logo"><a href="Student.aspx">作業管理系統 Homework</a></h1>
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
							<h2>學生事務</h2>
						</header>
						<p>親愛的  <asp:Label ID="lb_Title_UserName" runat="server" Text="Label"></asp:Label> &nbsp;同學您好</p>
                        <asp:Label ID="lb_User_id" runat="server" Visible="False"></asp:Label>

					</div>

				</section>

			<!-- Main -->
             

				<article id="main">
					<header class="special container">
						<h2>學生事務</h2>
            <h2>Account Manage</h2>
						<p>以下是所有教師指派作業總覽.<br />
						</p>
            <p>&nbsp;</p>
            <p>
					    &nbsp;</p>
                        <asp:Label ID="lb_Class" runat="server" Visible="False"></asp:Label>
					</header>


					<!-- Three -->
                    <section class="wrapper style3 container special">
                        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:HWD %>" 
            SelectCommand="SELECT * FROM [Homework] WHERE ([Homework_Class] LIKE '%' + @Homework_Class + '%') ORDER BY [Homework_Deadline] DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="lb_Class" Name="Homework_Class" 
                    PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="Homework_id" DataSourceID="SqlDataSource1" Width="100%" 
                CellPadding="4" Font-Names="微軟正黑體" Font-Size="11pt" ForeColor="#333333" 
                GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:TemplateField HeaderText="指導老師" SortExpression="User_ID">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("User_ID") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lb_Homework_Teacher_id" runat="server" 
                            Text='<%# Bind("User_ID") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Width="15%" HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="作業名稱" SortExpression="Homework_Title">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Homework_Title") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink1" runat="server" 
                            NavigateUrl='<%# "Student_Homework_Detail.aspx?hwid=" & Eval("Homework_id") %>' 
                            Text='<%# Eval("Homework_Title") %>'></asp:HyperLink>
                            </ItemTemplate>
                            <HeaderStyle Width="44%" />
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Homework_Deadline" HeaderText="繳交期限" 
                    SortExpression="Homework_Deadline">
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="繳交情況" SortExpression="Homework_File1">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Homework_File1") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="img_Submit" runat="server" ImageUrl="~/images/check_icon.png" 
                            Width="40px" />
                                <asp:Label ID="lb_Homework_id" runat="server" Text='<%# Eval("Homework_id") %>' 
                            Visible="False"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
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