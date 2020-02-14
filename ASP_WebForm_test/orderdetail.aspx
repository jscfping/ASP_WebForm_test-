<%@ Page Language="C#" AutoEventWireup="true" CodeFile="orderdetail.aspx.cs" Inherits="orderdetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <a href="/">回首頁</a><br />
            <br />
            <a href="/shop.aspx">商店</a><br />
            <br />
            <a href="/shopcart.aspx">購物車</a><br />
            <br />
            <a href="/order.aspx">交易記錄</a><br />
            <br />
            <a href="/logout.aspx">登出</a><br />
            <br />
            <br />
            訂單如下:<br />
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:TemplateField HeaderText="圖示" SortExpression="img">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("img") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("img") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="item_name" HeaderText="產品名稱" SortExpression="item_name" />
                    <asp:BoundField DataField="price" HeaderText="單價" SortExpression="price" />
                    <asp:BoundField DataField="quantity" HeaderText="數量" SortExpression="quantity" />
                </Columns>
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:asp_demoConnectionString %>" SelectCommand="SELECT  B.img, B.item_name, A.price, A.quantity 
FROM [order_details]A, [items]B, [orders]C, [users]D
WHERE A.item_id=B.item_id
and A.order_id=@oid
and A.order_id=C.order_id and C.customer_id=D.uid and D.uid=@uid">
                <SelectParameters>
                    <asp:QueryStringParameter Name="oid" QueryStringField="oid" />
                    <asp:SessionParameter Name="uid" SessionField="uid" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
        </div>
    </form>
</body>
</html>
