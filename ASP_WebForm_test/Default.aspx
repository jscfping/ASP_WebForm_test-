<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="index" %>

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
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">

                        <a href="/">
                            <img src="public/imgs/banners/banner01.png" class="d-block w-100" alt="..."></a>
                    </div>
                    <div class="carousel-item">
                        <a href="/">
                            <img src="public/imgs/banners/banner02.png" class="d-block w-100" alt="..."></a>
                    </div>
                    <div class="carousel-item">
                        <a href="/">
                            <img src="public/imgs/banners/banner03.png" class="d-block w-100" alt="..."></a>
                    </div>
                    <div class="carousel-item">
                        <a href="/">
                            <img src="public/imgs/banners/banner04.png" class="d-block w-100" alt="..."></a>
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <hr>
            <h5>此網站為使用ASP.NET Web Form + Bootstrap搭配SQL Server創建之簡易購物車、留言板網站</h5>
            <h5>活動功能準備中，範例請參考<a href="https://webstie-cloud-demo.herokuapp.com/">此網站</a></h5>


        </div>
    </form>
    <!--#include file= ".\views\partials\js.aspx" -->
</body>
</html>
