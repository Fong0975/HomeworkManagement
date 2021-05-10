<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:HWD %>" 
            SelectCommand="SELECT * FROM [Ficon] ORDER BY [FIcon_Icon], [FIcon_SubNameList]">
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" DataKeyNames="FIcon_ID" 
            DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="FIcon_ID" HeaderText="FIcon_ID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="FIcon_ID" />
                <asp:BoundField DataField="FIcon_SubNameList" HeaderText="FIcon_SubNameList" 
                    SortExpression="FIcon_SubNameList" />
                <asp:BoundField DataField="FIcon_Icon" HeaderText="FIcon_Icon" 
                    SortExpression="FIcon_Icon" />
            </Columns>
        </asp:GridView>
        <br />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <asp:DropDownList ID="DropDownList1" runat="server">
        </asp:DropDownList>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Button" />
    
    </div>
    </form>
</body>
</html>
