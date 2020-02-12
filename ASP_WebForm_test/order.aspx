<%@ Page Language="C#" AutoEventWireup="true" CodeFile="order.aspx.cs" Inherits="order" %>

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
            <br />
            採購清單：<br />
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="項目" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:TemplateField HeaderText="訂單編號" SortExpression="order_id">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("order_id") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("order_id") %>' NavigateUrl='<%# "/orderdetail?order_id="+Eval("order_id") %>'></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="datetime" HeaderText="時間" SortExpression="datetime" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:asp_demoConnectionString %>" SelectCommand="SELECT * FROM [orders] WHERE ([order_id] = @order_id)">
                <SelectParameters>
                    <asp:SessionParameter Name="order_id" SessionField="currentUser" Type="Object" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
