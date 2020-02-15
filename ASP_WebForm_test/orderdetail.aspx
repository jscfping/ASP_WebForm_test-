<%@ Page Language="C#" AutoEventWireup="true" CodeFile="orderdetail.aspx.cs" Inherits="orderdetail" %>

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
            <asp:Panel ID="PanelFlash" runat="server" CssClass="alert alert-danger" Visible="False">
                <asp:Label ID="LabelFlash" runat="server"></asp:Label>
            </asp:Panel>

            <div class="card">
                <h3 class="card-header">詳細交易記錄 <a href="/user.aspx" class="btn btn-outline-primary">返回個人首頁</a></h3>
                
                <div class="card-body">
                    <div class="card alert-primary">
                        <h3 class="card-header">
                            交易記錄<asp:Literal ID="Literal1" runat="server"></asp:Literal>:
                        </h3>
                        <div class="card-body">
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
                                <EmptyDataTemplate>
                                    <asp:Label ID="Label1" runat="server" CssClass="alert alert-warning" Text="查無資料..."></asp:Label>
                                </EmptyDataTemplate>
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
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <!--#include file= ".\views\partials\js.aspx" -->
</body>
</html>
