<%@ Page Language="C#" AutoEventWireup="true" CodeFile="shopcart.aspx.cs" Inherits="shopcart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <br />
            購物車清單如下:<br />
            <br />
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1">
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="確定購買" />
            <br />
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
