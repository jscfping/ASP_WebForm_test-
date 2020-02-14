<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" type="text/css" href="/public/stylesheets/style.css">
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <br />
            請登入<br />
            username:
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" CssClass="danger" ErrorMessage="請勿空白"></asp:RequiredFieldValidator>

            <br />
            password:<asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>

            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" CssClass="danger" ErrorMessage="請勿空白"></asp:RequiredFieldValidator>

            <br />
            <asp:Button ID="Button1" runat="server" Text="登錄" OnClick="Button1_Click" />
            <br />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/register.aspx">前往註冊</asp:HyperLink>
            <br />
            <br />
            <a href="/">回首頁</a><br />
            <br />
        </div>
    </form>
</body>
</html>
