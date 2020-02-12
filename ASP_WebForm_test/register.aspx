<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
.danger {
    color:red;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">

            <br />
            <br />
            會員註冊<br />
            username:<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" CssClass="danger" ErrorMessage="請勿空白"></asp:RequiredFieldValidator>

            <br />
            password:<asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>

            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" CssClass="danger" ErrorMessage="請勿空白"></asp:RequiredFieldValidator>

            <br />
            <asp:Button ID="Button1" runat="server" Text="註冊" OnClick="Button1_Click" />

            <br />
            <br />
            <br />

        <div>
        </div>
    </form>
</body>
</html>
