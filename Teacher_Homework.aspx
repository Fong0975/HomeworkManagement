<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Teacher_Homework.aspx.vb" Inherits="Teacher_Homework" %>

<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
	<head>
		<title>作業編輯 |作業系統管理</title>
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
					<h1 id="logo"><a href="Teacher.aspx"><font color=gray>作業管理系統 Homework</font></a></h1>
				</header>


			<!-- Main -->
             

				<article id="main">
					<header class="special container">
						<h2>作業編輯</h2>
            <h2>Homework Edit</h2>
             <p>
                <asp:Button ID="Bt_NewUse_Back" runat="server" BackColor="#333333" 
                    BorderColor="White" BorderWidth="1px" CssClass="button" Font-Names="微軟正黑體" 
                    Font-Size="12pt" ForeColor="White" Height="60px" Text="返回" Width="95px" />
            </p>
             <asp:Label ID="lb_User_id" runat="server" Visible="False"></asp:Label>
					</header>


					<!-- Three -->
                    <section class="wrapper style3 container special">
                       
<table class="style1">
            <tr>
                <td style="font-family: 微軟正黑體; font-size: 14pt; color: #333333; vertical-align: middle; text-align: center; border-right-style: dashed; border-right-width: 3px; border-bottom-style: solid; border-bottom-width: 2px">
                    作業名稱</td>
                <td style="font-family: 微軟正黑體; font-size: 12pt; color: #333333; vertical-align: middle; text-align: left; border-right-style: none; border-right-width: 3px; border-bottom-style: solid; border-bottom-width: 2px">
                    ※若作業名稱含有「\ / : * ? : &lt; &gt; |」等字元，批量下載功能將會受阻。<asp:TextBox ID="tb_Homework_Title" runat="server" placeholder="請輸入作業的標題名稱"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="font-family: 微軟正黑體; font-size: 14pt; color: #333333; vertical-align: middle; text-align: center; border-right-style: dashed; border-right-width: 3px; border-bottom-style: solid; border-bottom-width: 2px">
                    作業描述</td>
                <td style="font-family: 微軟正黑體; font-size: 12pt; color: #333333; vertical-align: middle; text-align: left; border-right-style: none; border-right-width: 3px; border-bottom-style: solid; border-bottom-width: 2px">
                    <asp:TextBox ID="tb_Homework_Description" runat="server" Height="197px" 
                        TextMode="MultiLine" Width="100%" placeholder="請輸入作業的說明描述"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="font-family: 微軟正黑體; font-size: 14pt; color: #333333; vertical-align: middle; text-align: center; border-right-style: dashed; border-right-width: 3px; border-bottom-style: solid; border-bottom-width: 2px">
                    作業期限</td>
                <td style="font-family: 微軟正黑體; font-size: 12pt; color: #333333; vertical-align: middle; text-align: left; border-right-style: none; border-right-width: 3px; border-bottom-style: solid; border-bottom-width: 2px">
                    <asp:TextBox ID="tb_Homework_Date" runat="server" placeholder="如「2012/12/6」"></asp:TextBox>
                    <asp:DropDownList ID="ddl_Homework_Date_H" runat="server" Font-Names="微軟正黑體" 
                        Font-Size="12pt">
                        <asp:ListItem>00</asp:ListItem>
                        <asp:ListItem>01</asp:ListItem>
                        <asp:ListItem>02</asp:ListItem>
                        <asp:ListItem>03</asp:ListItem>
                        <asp:ListItem>04</asp:ListItem>
                        <asp:ListItem>05</asp:ListItem>
                        <asp:ListItem>06</asp:ListItem>
                        <asp:ListItem>07</asp:ListItem>
                        <asp:ListItem>08</asp:ListItem>
                        <asp:ListItem>09</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                        <asp:ListItem>13</asp:ListItem>
                        <asp:ListItem>14</asp:ListItem>
                        <asp:ListItem>15</asp:ListItem>
                        <asp:ListItem>16</asp:ListItem>
                        <asp:ListItem>17</asp:ListItem>
                        <asp:ListItem>18</asp:ListItem>
                        <asp:ListItem>19</asp:ListItem>
                        <asp:ListItem>20</asp:ListItem>
                        <asp:ListItem>21</asp:ListItem>
                        <asp:ListItem>22</asp:ListItem>
                        <asp:ListItem>23</asp:ListItem>
                    </asp:DropDownList>
                    點</td>
            </tr>
            <tr>
                <td class="style3" 
                    style="font-family: 微軟正黑體; font-size: 14pt; color: #333333; vertical-align: middle; text-align: center; border-right-style: dashed; border-right-width: 3px; border-bottom-style: solid; border-bottom-width: 2px">
                    指定班級</td>
                <td class="style3" 
                    style="font-family: 微軟正黑體; font-size: 12pt; color: #333333; vertical-align: middle; text-align: left; border-right-style: none; border-right-width: 3px; border-bottom-style: solid; border-bottom-width: 2px">
                    <asp:SqlDataSource ID="SQL_ClassList" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:HWD %>" 
                        SelectCommand="SELECT * FROM [Teaching] WHERE ([Teacher_ID] = @Teacher_ID) ORDER BY [Class_Name]">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="lb_User_id" Name="Teacher_ID" 
                                PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:CheckBoxList ID="CheckBoxList1" runat="server" 
                        DataSourceID="SQL_ClassList" DataTextField="Class_Name" 
                        DataValueField="Class_Name" RepeatDirection="Horizontal">
                    </asp:CheckBoxList>
                </td>
            </tr>
            <tr>
                <td class="style2" 
                    style="font-family: 微軟正黑體; font-size: 14pt; color: #333333; vertical-align: middle; text-align: center; border-right-style: dashed; border-right-width: 3px; border-bottom-style: solid; border-bottom-width: 2px">
                    檔案限制</td>
                <td class="style2" 
                    style="font-family: 微軟正黑體; font-size: 12pt; color: #333333; vertical-align: middle; text-align: left; border-right-style: none; border-right-width: 3px; border-bottom-style: solid; border-bottom-width: 2px">
                    <asp:TextBox ID="tb_Homework_SubFileName" runat="server" placeholder="如「txt」"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="font-family: 微軟正黑體; font-size: 14pt; color: #333333; vertical-align: middle; text-align: center; border-right-style: dashed; border-right-width: 3px; border-bottom-style: none; border-bottom-width: 2px">
                    附件檔案</td>
                <td style="font-family: 微軟正黑體; font-size: 12pt; color: #333333; vertical-align: middle; text-align: left; border-right-style: none; border-right-width: 3px; border-bottom-style: none; border-bottom-width: 2px">
                    <asp:Label ID="lb_FileUpload_NameRepeate" runat="server" Font-Names="微軟正黑體" 
                        Font-Size="11pt" ForeColor="Red" Visible="False"></asp:Label>
                    <br />
                    <asp:FileUpload ID="FileUpload1" runat="server" />
&nbsp;<asp:Label ID="lb_FileUpload_File" runat="server" Visible="False"></asp:Label>
&nbsp;<asp:Button ID="bt_FileUpload_Remove" runat="server" Text="移除" Visible="False" />
                </td>
            </tr>
        </table>        
        <br />
        <asp:Button ID="bt_Homework_Insert" runat="server" Text="建立" BackColor="#333333" 
                Font-Names="微軟正黑體" Font-Size="12pt" ForeColor="White" />
&nbsp;<asp:Button ID="bt_Homework_Insert_Cancel" runat="server" Text="取消" 
                BackColor="#333333" Font-Names="微軟正黑體" Font-Size="12pt" ForeColor="White" />
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