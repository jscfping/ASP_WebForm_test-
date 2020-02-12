<%@ Page Language="C#" AutoEventWireup="true" CodeFile="orderdetail.aspx.cs" Inherits="orderdetail" %>

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
            訂單<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            :<br />
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1">
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
            <br />
        </div>
    </form>
</body>
</html>
