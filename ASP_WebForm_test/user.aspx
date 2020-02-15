<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user.aspx.cs" Inherits="user" %>

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
                <h3 class="card-header">個人首頁</h3>

                <div class="card-body">
                    <p class="card-text">uid: <%= ASPdemo.Middle.GetCurrentUser().Uid %></p>
                    <p class="card-text">user: <%= ASPdemo.Middle.GetCurrentUser().Username %></p>

                    <div class="card alert-success">
                        <h3 class="card-header">交易記錄</h3>
                        <div class="card-body">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" CellPadding="4" GridLines="None" ForeColor="#333333">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField HeaderText="項目">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex + 1%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="datetime" HeaderText="時間" SortExpression="datetime" DataFormatString="{0:yyyy/MM/dd HH:mm:ss}" />
                                    <asp:TemplateField HeaderText="訂單編號" SortExpression="order_id">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("order_id") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "/orderdetail.aspx?oid=" + Eval("order_id") %>' Text='<%# Eval("order_id") %>'></asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                </Columns>
                                <EditRowStyle BackColor="#7C6F57" />
                                <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#E3EAEB" />
                                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                <SortedDescendingHeaderStyle BackColor="#15524A" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:asp_demoConnectionString %>" SelectCommand="SELECT A.* 
FROM [orders]A, [users]B
WHERE A.customer_id=B.uid and B.uid=@uid


">
                                <SelectParameters>
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
