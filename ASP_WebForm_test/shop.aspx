<%@ Page Language="C#" AutoEventWireup="true" CodeFile="shop.aspx.cs" Inherits="shop" %>

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
            <h1 class="alert alert-success">歡迎光臨，商店</h1>
            <asp:Panel ID="PanelFlash" runat="server" CssClass="alert alert-danger" Visible="False">
                <asp:Label ID="LabelFlash" runat="server"></asp:Label>
            </asp:Panel>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Style="text-align: center">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="項目" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:TemplateField HeaderText="圖示" SortExpression="img">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("img") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("img") %>' Style="text-align: center" Height="70px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="產品名稱" SortExpression="item_name">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("item_name") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_itemid" runat="server" Text='<%# Eval("item_id") %>' Visible="False"></asp:Label>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("item_name") %>' Width="100px"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="描述" SortExpression="item_desc">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("item_desc") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("item_desc") %>' Width="200px"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="單價" SortExpression="price">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("price") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("price") %>' Width="100px"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="訂購" ShowHeader="False">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" TextMode="Number" placeholder="數量" CssClass="form-control"></asp:TextBox>
                            <asp:Button ID="Button1" runat="server" Text="放入購物車" OnClick="Button1_Click" CssClass="btn btn-primary" />
                        </ItemTemplate>
                    </asp:TemplateField>
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:asp_demoConnectionString %>" SelectCommand="SELECT * FROM [items]"></asp:SqlDataSource>
            <% if (Session["currentUser"] != null) %>
            <% { %>
            <a href="/shopcart.aspx" class="btn btn-outline-success float-right">至購物車結帳</a>
            <% } %>
        </div>
    </form>
    <!--#include file= ".\views\partials\js.aspx" -->
</body>
</html>
