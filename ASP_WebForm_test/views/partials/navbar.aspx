<nav class="navbar navbar-light fixed-top navbar-expand-md">
	<a href="/" class="navbar-brand" title="回首頁">ASPdemo</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	
	<div class="collapse navbar-collapse" id="navbarText">
		<ul class="navbar-nav mr-auto">

			<li class="nav-item">
				<div class="btn-group">
					<a href="/comment.aspx" class="nav-link" title="看看大家的文章">留言板</a>
				</div>
			</li>
			<li class="nav-item">
				<a href="/shop.aspx" class="nav-link" title="買商品~">商店</a>
			</li>
		</ul>
		
		<asp:Button ID="Button1" runat="server" Text="測試" />

		<ul class="navbar-nav">
				<li class="nav-item">
					<a href="/shopcart.aspx" class="nav-link" title="現在購物車的商品"><img src="/public/imgs/icos/shopping_cart-24px.svg" ></a>
				</li>
				<li class="nav-item">
					<a href="/register.aspx" class="nav-link">註冊</a>
				</li>
				<li class="nav-item">
					<a href="/login.aspx" class="nav-link">登入</a>
				</li>
				<li class="nav-item">
					<a href="/logout.aspx" class="nav-link">登出</a>
				</li>
		</ul>
	</div>
</nav>