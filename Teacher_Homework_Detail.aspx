<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Teacher_Homework_Detail.aspx.vb" Inherits="Teacher_Homework_Detail" %>

<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
	<head>
		<title>作業資訊 |作業系統管理</title>
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
            }
            .GridviewBorder_File
            {
                padding: 2px 5px 2px 5px;
                border-right-style: solid;
                border-right-width: 0.8px;
                border-right-color: #3B0086;
            }
        </style>
        </head>


	<body class="index">
		<div id="page-wrapper">
    <form id="form1" runat="server">
			<!-- Header -->
				<header id="header" class="alt">
					<h1 id="logo"><a href="Teacher.aspx"><font color=gray>作業管理系統 Homework</font></a></h1>
				</header>


			<!-- Main -->
             

				<article id="main">
					<header class="special container">
						<h2>作業資訊</h2>
            <h2>Homework Detail</h2>
             <p>
                <asp:Button ID="Bt_NewUse_Back" runat="server" BackColor="#333333" 
                    BorderColor="White" BorderWidth="1px" CssClass="button" Font-Names="微軟正黑體" 
                    Font-Size="12pt" ForeColor="White" Height="60px" Text="返回" Width="95px" />
            </p>

						<p>
                        <table class="style1">
            <tr>
                <td style="font-family: 微軟正黑體; font-size: 28pt; color: #333333; vertical-align: middle; text-align: left; border-top-style: solid; border-top-width: 4px; border-bottom-style: double; border-bottom-width: 3px; border-left-style: solid; border-left-width: 4px;">
                    <asp:Label ID="lb_Homework_Detail_Titile" runat="server" Font-Names="微軟正黑體" 
                        Font-Size="20pt"></asp:Label>
                </td>
                <td style="text-align: right; font-family: 微軟正黑體; font-size: 11pt; color: #333333; vertical-align: middle; border-top-style: solid; border-top-width: 4px; border-bottom-style: double; border-bottom-width: 3px; border-right-style: solid; border-right-width: 4px;">
                    繳交期限：<asp:Label ID="lb_Homework_Detail_DateLine" runat="server" 
                        style="text-align: right"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2" 
                    style="border-style: none solid dotted solid; border-width: 4px 4px 2px 4px; font-family: 微軟正黑體; font-size: 12pt; color: #333333; vertical-align: middle; text-align: left;">
                    <asp:Label ID="lb_Homework_Detail_Description" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="style1" 
                    style="border-style: none solid dotted solid; border-width: 4px 4px 2px 4px; font-family: 微軟正黑體; font-size: 12pt; color: #333333; vertical-align: middle; text-align: left;">
                    參與班級：<asp:Label ID="lb_Homework_Class" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="style1" 
                    style="border-style: none solid dotted solid; border-width: 4px 4px 2px 4px; font-family: 微軟正黑體; font-size: 12pt; color: #333333; vertical-align: middle; text-align: left;">
                    格式限制：<asp:Label ID="lb_Homework_FileName" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2" 
                    style="border-style: none solid solid solid; border-width: 4px; font-family: 微軟正黑體; font-size: 12pt; color: #333333; vertical-align: middle; text-align: left;">
                    附件檔案：<asp:HyperLink ID="hylink_Homework_Detail_File" runat="server">[hylink_Homework_Detail_File]</asp:HyperLink>
                </td>
            </tr>
        </table>
       </p>
             <asp:Label ID="lb_User_id" runat="server" Visible="False"></asp:Label>
					</header>
                    

					<!-- Three -->
                    <section class="wrapper style3 container special">
                    <asp:Panel ID="pn_Download" runat="server">
                        <asp:Button ID="lb_Pickup" runat="server" Text="打包下載" 
                BackColor="#333333" Font-Names="微軟正黑體" Font-Size="11pt" ForeColor="White" 
                Height="50px" style="margin-bottom:20px;"></asp:Button>
                        <asp:Button ID="bt_Download_Choose" runat="server" BackColor="#333333" 
                            Font-Names="微軟正黑體" Font-Size="11pt" ForeColor="White" Height="50px" 
                            style="margin-bottom:20px;" Text="批量下載" />
                        <asp:Panel ID="pn_Download_Choose" runat="server" Visible="False">
                            <asp:CheckBoxList ID="cbl_FileList" runat="server">
                            </asp:CheckBoxList>
                            <br />
                            <asp:Button ID="bt_Download_Choose_Submit" runat="server" Text="下載" style="margin:5px 2px 5px 2px; display:inline-block;" />
                            <asp:Button ID="bt_Download_Choose_Cancel" runat="server" Text="取消" style="margin:5px 2px 5px 2px; display:inline-block;" />
                        </asp:Panel>
                        <br />
            </asp:Panel>

            <asp:Panel ID="pn_Grade" runat="server" style="text-align:center; margin-bottom:15px;">
                <p style="text-align:left;">※送出後無論是否存在成績都將覆蓋<br />※送出空值成績及代表「移除該學生成績」<br />※若存在成績，學生將被禁止繼續更新、上傳檔案</p>
                <asp:DropDownList ID="ddl_Grades_StudentList" runat="server" Font-Names="微軟正黑體">
                </asp:DropDownList>
                &nbsp;<asp:TextBox ID="tb_Grading" runat="server" Width="150px" style="display:inline;" placeholder="如：'98'、'A+'"></asp:TextBox>
                &nbsp;<asp:Button ID="bt_Gradeing_Submit" runat="server" Text="送出" />
            </asp:Panel>

            <asp:GridView ID="GridView1" runat="server" 
        AutoGenerateColumns="False" DataKeyNames="User_ID" Width="100%" 
        Font-Names="微軟正黑體" Font-Size="11pt" BackColor="White" BorderColor="#290628" 
                BorderStyle="None" BorderWidth="3px" CellPadding="3" 
                GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:BoundField DataField="User_Class" HeaderText="班級" 
                SortExpression="User_Class">
            <HeaderStyle Width="5%" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" 
                CssClass="GridviewBorder" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="座號" SortExpression="User_Account">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("User_Account") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lb_Student_Num" runat="server" Text='<%# Bind("User_Account") %>'></asp:Label>
                    <asp:Label ID="lb_Student_Userid" runat="server" Text='<%# Eval("User_ID") %>' 
                        Visible="False"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Width="5%" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" 
                    CssClass="GridviewBorder" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="姓名" SortExpression="User_Name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("User_Name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lb_Student_Name" runat="server" Text='<%# Bind("User_Name") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Width="5%" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" 
                    CssClass="GridviewBorder" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="檔案" InsertVisible="False">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("User_ID") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate >
                    <asp:Label ID="lb_FileName" runat="server" style="word-break: break-all; "></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" 
                    CssClass="GridviewBorder_File" />
            </asp:TemplateField>
             <asp:TemplateField HeaderText="成績" InsertVisible="False">
                <EditItemTemplate>
                   
                </EditItemTemplate>
                <ItemTemplate>
                   <asp:Label ID="lb_Grades" runat="server" Font-Bold="True" Font-Size="14pt" 
                        ForeColor="#A53860"></asp:Label>
                </ItemTemplate>
                 <HeaderStyle Width="8%" />
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
					
					
        <div style="text-align: center; vertical-align: middle; margin-top: 20px;" ><a href="#top">Go Top</a></div>
					
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