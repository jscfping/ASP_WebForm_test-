<%@ Page Language="C#" AutoEventWireup="true" CodeFile="shopcart.aspx.cs" Inherits="shopcart" %>

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
            購物車清單如下:<br />
            <br />
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="id">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" Visible="False" />
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
                    <asp:CommandField DeleteText="取消購買" ShowDeleteButton="True" />
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:asp_demoConnectionString %>" SelectCommand="SELECT A.id, B.img, B.item_name, A.price, A.quantity 
FROM [order_details]A, [items]B, [users]C, [shop_carts]D
WHERE A.order_id=D.shop_cart_id and A.item_id=B.item_id and D.customer_id=C.uid and c.uid=@uid" DeleteCommand="DELETE
FROM [order_details]
WHERE [id]=@id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="uid" SessionField="uid" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="確定購買" OnClick="Button1_Click" />
            <br />
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
