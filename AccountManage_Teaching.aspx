<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AccountManage_Teaching.aspx.vb" Inherits="AccountManage_Teaching" %>

<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
	<head>
		<title>新增教室關係 |作業系統管理</title>
        <link rel="shortcut icon" href="images/favicon.ico">
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets2/css/main.css" />
	    <style type="text/css">
            .style1
            {
                height: 58px;
            }
            .style2
            {
                height: 73px;
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
						<h2>新增教室關係</h2>
            <h2>New Teaching</h2>
						<p><br />
						</p>
            <p>
            
            <p>

                <asp:Button ID="Bt_NewUse_Back" runat="server" BackColor="#333333" 
                    BorderColor="White" BorderWidth="1px" CssClass="button" Font-Names="微軟正黑體" 
                    Font-Size="12pt" ForeColor="White" Height="60px" Text="返回" Width="95px" />
            </p>
             <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:HWD %>" 
                    SelectCommand="SELECT DISTINCT [User_Class] FROM [Account] WHERE (([User_Class] &lt;&gt; @User_Class) AND ([User_Class] &lt;&gt; @User_Class2)) ORDER BY [User_Class]">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="管理員" Name="User_Class" Type="String" />
                                    <asp:Parameter DefaultValue="教師" Name="User_Class2" Type="String" />
                                </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:HWD %>" 
                    SelectCommand="SELECT [User_Type], [User_Name], [User_ID] FROM [Account] WHERE ([User_Type] = @User_Type) ORDER BY [User_Name]">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="Teacher" Name="User_Type" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:HWD %>" 
                    DeleteCommand="DELETE FROM [Teaching] WHERE [Teaching_ID] = @Teaching_ID" 
                    InsertCommand="INSERT INTO [Teaching] ([Teacher_ID], [Class_Name]) VALUES (@Teacher_ID, @Class_Name)" 
                    SelectCommand="SELECT * FROM [Teaching] ORDER BY [Teacher_ID], [Class_Name]" 
                    UpdateCommand="UPDATE [Teaching] SET [Teacher_ID] = @Teacher_ID, [Class_Name] = @Class_Name WHERE [Teaching_ID] = @Teaching_ID">
                    <DeleteParameters>
                        <asp:Parameter Name="Teaching_ID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Teacher_ID" Type="Int32" />
                        <asp:Parameter Name="Class_Name" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Teacher_ID" Type="Int32" />
                        <asp:Parameter Name="Class_Name" Type="String" />
                        <asp:Parameter Name="Teaching_ID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                    <asp:Button ID="bt_CreateClass" runat="server" 
                PostBackUrl="~/AccountManage_CreateClass.aspx" Text="新班級群組" style="margin-bottom:20px;"/>
                    <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="3" DataKeyNames="Teaching_ID" DataSourceID="SqlDataSource5" 
            Font-Names="微軟正黑體" Font-Size="12pt" GridLines="Horizontal" 
            Width="100%" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" 
                BorderWidth="1px">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                            CommandName="Delete" onclientclick="return confirm('確定要刪除這筆關係嗎？')" Text="刪除"></asp:LinkButton>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="60px" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="教師姓名" SortExpression="Teacher_ID">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("Teacher_ID") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lb_TeachingReleation_TeacherID" runat="server" 
                            Text='<%# Bind("Teacher_ID") %>' Visible="False"></asp:Label>
                        <asp:Label ID="lb_TeachingReleation_TeacherName" runat="server"></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="班級名稱" SortExpression="Class_Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Class_Name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:HyperLink ID="hl_ClassName" runat="server" 
                            Text='<%# Bind("Class_Name") %>'></asp:HyperLink>
                        <asp:Label ID="lb_ClassMember" runat="server" 
                            Text='<%# Eval("Class_Member") %>' Visible="False"></asp:Label>
                        <asp:Label ID="lb_TeachingID" runat="server" Text='<%# Eval("Teaching_ID") %>' 
                            Visible="False"></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>
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
            
            &nbsp;</p>
            
					</header>


					<!-- Three -->
                    <section class="wrapper style3 container special">
                              <table class="style1">
            <tr>
                <td class="style2" 
                    style="font-family: 微軟正黑體; font-size: 12pt; color: #333333; vertical-align: middle; text-align: center; border-style: none dashed dotted none; border-right-width: 4px; border-bottom-width: 2px">
                    教師姓名</td>
                <td class="style2" 
                    style="font-family: 微軟正黑體; font-size: 12pt; color: #333333; vertical-align: middle; text-align: center; border-style: none none dotted none; border-right-width: 4px; border-bottom-width: 2px; height: 60px;">
                    班級名稱</td>
                <td class="style1" rowspan="2" 
                    style="font-family: 微軟正黑體; font-size: 12pt; color: #333333; vertical-align: middle; text-align: center; border-style: none none none double; border-right-width: 4px; border-bottom-width: 2px; border-left-width: 4px;">
                    <asp:Button ID="bt_TeachingReleation_Add" runat="server" BackColor="#666666" 
                        Font-Names="微軟正黑體" ForeColor="White" Text="建立關係" />
                </td>
            </tr>
            <tr>
                <td class="Teaching_Add_Content" 
                    style="font-family: 微軟正黑體; font-size: 12pt; color: #333333; vertical-align: middle; text-align: center; border-style: none dashed none none; border-right-width: 4px; border-bottom-width: 2px">
                    <asp:DropDownList ID="ddl_TeachingAdd_Teacher" runat="server" 
                        AutoPostBack="True" DataSourceID="SqlDataSource4" DataTextField="User_Name" 
                        DataValueField="User_ID" Font-Names="微軟正黑體" Font-Size="12pt">
                    </asp:DropDownList>
                </td>
                <td class="Teaching_Add_Content" 
                    style="font-family: 微軟正黑體; font-size: 12pt; color: #333333; vertical-align: middle; text-align: center; border-style: none; border-right-width: 4px; border-bottom-width: 2px; height: 60px;">
                    <asp:DropDownList ID="ddl_TeachingAdd_Class" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource3" DataTextField="User_Class" 
                        DataValueField="User_Class" Font-Names="微軟正黑體" Font-Size="12pt">
                    </asp:DropDownList>
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
