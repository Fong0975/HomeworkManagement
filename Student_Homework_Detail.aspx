<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Student_Homework_Detail.aspx.vb" Inherits="Student_Homework_Detail" %>

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
					<h1 id="logo"><a href="AccountManage.aspx"><font color=gray>作業管理系統 Homework</font></a></h1>
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
                <td style="text-align: right; font-family: 微軟正黑體; font-size: 11pt; color: #333333; vertical-align: middle; border-top-style: solid; border-top-width: 4px; border-bottom-style: double; border-bottom-width: 3px; border-right-style: solid; border-right-width: 4px; padding-right: 10px; padding-left: 8px;">
                    
                    <asp:Label ID="lb_Grades" runat="server" Font-Bold="True" Font-Size="16pt" 
                        ForeColor="#A53860"></asp:Label>
                    
                </td>
            </tr>
            <tr>
                <td colspan="2" 
                    
                    style="border-style: none solid dotted solid; border-width: 4px 4px 2px 4px; font-family: 微軟正黑體; font-size: 12pt; color: #333333; vertical-align: middle; text-align: left; padding-left: 8px;">
                    <asp:Label ID="lb_Homework_Detail_Description" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="style1" 
                    
                    style="border-style: none solid dotted solid; border-width: 4px 4px 2px 4px; font-family: 微軟正黑體; font-size: 12pt; color: #333333; vertical-align: middle; text-align: left; padding-left: 8px;">
                    繳交期限：<asp:Label ID="lb_Homework_Detail_DateLine" runat="server" 
                        style="text-align: right"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="style1" 
                    
                    style="border-style: none solid dotted solid; border-width: 4px 4px 2px 4px; font-family: 微軟正黑體; font-size: 12pt; color: #333333; vertical-align: middle; text-align: left; padding-left: 8px;">
                    格式限制：<asp:Label ID="lb_Homework_FileName" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2" 
                    
                    style="border-style: none solid solid solid; border-width: 4px; font-family: 微軟正黑體; font-size: 12pt; color: #333333; vertical-align: middle; text-align: left; padding-left: 8px;">
                    附件檔案：<asp:HyperLink ID="hylink_Homework_Detail_File" runat="server">[hylink_Homework_Detail_File]</asp:HyperLink>
                </td>
            </tr>
        </table>
       </p>
           
					</header>


					<!-- Three -->
                    <section class="wrapper style3 container special">
                        <table class="style1">
        <tr>
            <td 
                
                style="font-family: 微軟正黑體; font-size: 18pt; text-decoration: blink; color: #333333; text-align: left; vertical-align: middle; border-bottom-style: double; border-bottom-width: 4px">
                繳交狀況 
                <asp:Label ID="lb_RemoveOldFile_Message" runat="server" Font-Names="微軟正黑體" 
                    Font-Size="11pt" ForeColor="#FF5050" Text="請先將舊檔案移除，方可重新上傳新檔案" 
                    Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2" 
                
                style="font-family: 微軟正黑體; border-right-style: none; border-right-width: 3px; border-bottom-style: dashed; border-bottom-width: 3px;">
                <asp:Panel ID="Panel_Already" runat="server">
                    <asp:Label ID="lb_Submit_File" runat="server">無檔案</asp:Label>
                    <asp:Panel ID="pn_ModifyFile" runat="server" style="text-align:center;">
                        <asp:DropDownList ID="ddl_FileList" runat="server" style="margin-bottom:20px;margin-top:20px;">
                        </asp:DropDownList>
                        <br />
                        <asp:Button ID="bt_ViewFile" runat="server" Text="檢視" />
                        &nbsp;<asp:Button ID="bt_DeleteFile" runat="server" Text="刪除" 
                            onclientclick="return confirm('刪除後將無法復原，你確定要刪除嗎？')" />
                    </asp:Panel>
                &nbsp;<asp:GridView ID="gv_File_Info" runat="server" CellPadding="4" 
                        ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
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
                </asp:Panel>
               
                <asp:Panel ID="Panel_Upload" runat="server" >
                    <table class="style1">
                        <tr>
                            <td style="border-top-style: dotted; border-top-width: 2px">
                            <p style="padding:5px 2px 5px 2px;">※禁止上傳「exe」檔案<br />※檔案過大(25MB以上)上傳將會不穩定，請同學們注意</p>
                                <asp:FileUpload ID="FileUpload1" runat="server" style="margin:20px 0px 20px 0px;"/>
&nbsp;<asp:Label ID="lb_FileUpload_Error_Message" runat="server" Font-Names="微軟正黑體" 
                    Font-Size="11pt" ForeColor="Red" Visible="False"></asp:Label>
                <asp:Button ID="bt_Homework_Upload" runat="server" Text="上傳" style="margin:20px 0px 20px 0px;"/>
                                
                            </td>
                        </tr>
                    </table>
                
                </asp:Panel>
               
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