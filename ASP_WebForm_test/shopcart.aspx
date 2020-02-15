<%@ Page Language="C#" AutoEventWireup="true" CodeFile="shopcart.aspx.cs" Inherits="shopcart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!--#include file= ".\views\partials\header.aspx" -->
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="Panel1" runat="server">
            <nav class="navbar navbar-light fixed-top navbar-expand-md">
                <a href="/" class="navbar-brand" title="回首頁">ASPdemo</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarText">
                    <ul class="navbar-nav mr-auto">

                        <li class="nav-item">
                            <div class="btn-group">
                                <a href="/comment.aspx" class="nav-link" title="看看大家的留言">留言板</a>
                                <% if (Session["currentUser"] != null) %>
                                <% { %>
                                <button type="button" class="btn btn-sm dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="sr-only">Toggle Dropdown</span>
                                </button>
                                <div class="dropdown-menu">
                                    <a href="/mycomment.aspx" class="nav-link" title="看看你的留言">我的留言</a>
                                </div>
                                <% } %>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a href="/shop.aspx" class="nav-link" title="買商品~">商店</a>
                        </li>
                    </ul>

                    <ul class="navbar-nav">
                        <% if (Session["currentUser"] == null) %>
                        <% { %>
                        <li class="nav-item">
                            <a href="/register.aspx" class="nav-link">註冊</a>
                        </li>
                        <li class="nav-item">
                            <a href="/login.aspx" class="nav-link">登入</a>
                        </li>
                        <% } %>
                        <% else %>
                        <% { %>
                        <li class="nav-item">
                            <a href="/shopcart.aspx" class="nav-link" title="現在購物車的商品">
                                <img src="/public/imgs/icos/shopping_cart-24px.svg"></a>
                        </li>
                        <li class="nav-item">
                            <a href="/user.aspx" class="nav-link">個人首頁</a>
                        </li>
                        <li class="nav-item">
                            <a href="/logout.aspx" class="nav-link">登出</a>
                        </li>
                        <% } %>
                    </ul>
                </div>
            </nav>
        </asp:Panel>
        <div class="container">
            <h1 class="alert alert-success">您的購物車：</h1>
            <asp:Panel ID="PanelFlash" runat="server" CssClass="alert alert-danger" Visible="False">
                <asp:Label ID="LabelFlash" runat="server"></asp:Label>
            </asp:Panel>
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="id" Style="text-align: center">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" Visible="False" />
                    <asp:TemplateField HeaderText="圖示" SortExpression="img">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("img") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("img") %>' Height="70px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="item_name" HeaderText="產品名稱" SortExpression="item_name" />
                    <asp:BoundField DataField="price" HeaderText="單價" SortExpression="price" />
                    <asp:BoundField DataField="quantity" HeaderText="數量" SortExpression="quantity" />
                    <asp:CommandField DeleteText="取消購買" ShowDeleteButton="True" ControlStyle-CssClass="btn btn-warning">
                        <ControlStyle CssClass="btn btn-warning"></ControlStyle>
                    </asp:CommandField>
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <EmptyDataTemplate>
                    <asp:Label ID="Label1" runat="server" CssClass="alert alert-warning" Text="購物車內尚無產品"></asp:Label>
                </EmptyDataTemplate>
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
WHERE A.order_id=D.shop_cart_id and A.item_id=B.item_id and D.customer_id=C.uid and c.uid=@uid"
                DeleteCommand="DELETE
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
            <asp:Button ID="Button1" runat="server" Text="確定購買" OnClick="Button1_Click" CssClass="btn btn-primary" />
        </div>
    </form>
    <!--#include file= ".\views\partials\js.aspx" -->
</body>
</html>
