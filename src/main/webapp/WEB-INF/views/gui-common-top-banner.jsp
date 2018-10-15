<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true" %>
<script>
	function checkout(){
		window.location.href = "/lazz/product/checkout";
	}
</script>
<!-- Header -->
<header class="header1">
	<!-- Header desktop -->
	<div class="container-menu-header">
		<div class="topbar">
			<div class="topbar-social">
				<a href="#" class="topbar-social-item fa fa-facebook"></a>
				<a href="#" class="topbar-social-item fa fa-instagram"></a>
				<a href="#" class="topbar-social-item fa fa-pinterest-p"></a>
				<a href="#" class="topbar-social-item fa fa-snapchat-ghost"></a>
				<a href="#" class="topbar-social-item fa fa-youtube-play"></a>
			</div>

			<span class="topbar-child1">
				Penghantaran Percuma dengan order melebihi RM 1200
			</span>

			<div class="topbar-child2">
				<span class="topbar-email">
					${sessionScope.USER_SESSION.usrdEmail}
				</span>

			</div>
		</div>

		<div class="wrap_header">
			<!-- Logo -->
			<a href="index.html" class="logo">
				<img src="<c:url value='/static/images/icons/logo.png'/>" alt="IMG-LOGO">
			</a>

			<!-- Menu -->
			<div class="wrap_menu">
				<nav class="menu">
					<ul class="main_menu">
						<li class="sale-noti">
							<a href="<c:out value='/'/>">Home</a>
						</li>

						<li>
							<a href="<c:url value='/product/gui-display-products'/>">Shop</a>
						</li>

						<li>
							<a href="<c:url value='/product/view-cart'/>">Cart</a>
						</li>

						<li>
							<a href="blog.html">Blog</a>
						</li>

						<li>
							<a href="about.html">About</a>
						</li>

						<li>
							<a href="contact.html">Contact</a>
						</li>
					</ul>
				</nav>
			</div>

			<!-- Header Icon -->
			<script>
				function validateUserIdAndPassword(){
					var usrName = $('#userName').val();
			    	var usrPassword = $('#password').val();
			    	var json = { "usrName" : usrName, "usrPassword" : usrPassword};
			    	$.ajax({
				       	url: '/lazz/login/login',
				       	headers: { 
					        'Accept': 'application/json',
					        'Content-Type': 'application/json' 
					    },
				        data: JSON.stringify(json),
				        type: "POST",
				        contentType: 'application/json',
    					mimeType: 'application/json',
				        success: function(loginResponseModel) {
				        	if( loginResponseModel.statusCode == "200" ){
				        		window.location.href = '/lazz/login/loginRespond';
				        	} else {
				        		alert("Invalid UserName or Password!");
				        	}
				        },
				        error:function(data,status,er) { 
					        console.log("error: "+data+" status: "+status+" er:"+er);
					    }
				    });
				}
			</script>
			<div class="header-icons">
				<button href="/lazz/login/register" class="btn btn-xs btn-reg">Register</button>
				<div href="#" class="header-wrapicon1 dis-block">
					<img src="<c:url value='/static/images/icons/icon-header-01.png'/>" class="header-icon1 js-show-login-dropdown" alt="ICON">
					<div class="header-cart login-dropdown">
						<span class="s-text19">
							Email
						</span>
						<div class="bo4 of-hidden size15 m-b-20">
							<input id="userName" class="sizefull s-text7 p-l-22 p-r-22" type="email" name="email" placeholder="user@email.com">
						</div>

						<span class="s-text19">
							Password
						</span>
						<div class="bo4 of-hidden size15">
							<input id="password" class="sizefull s-text7 p-l-22 p-r-22" type="password" name="password" placeholder="Enter password">
						</div>
						<p href="#" align="right" class="m-b-20">
							<u>Forgot Password?</u>
						</p>
						<div class="header-cart-buttons">
							<div class="header-cart-wrapbtn">
								<!-- Button -->
								<a href="/lazz/login/register" onclick="" class="flex-c-m size1 btn-outline bo-rad-20 hov1 s-text1 trans-0-4">
									Register
								</a>
							</div>
							<div class="header-cart-wrapbtn" onclick="validateUserIdAndPassword()">
								<!-- Button -->
								<a href="#" class="flex-c-m size1 bg1 bo-rad-20 hov1 s-text1 trans-0-4">
									Login
								</a>
							</div>
						</div>
					</div>
				</div>

				<span class="linedivide1"></span>

				<div class="header-wrapicon2">
					<img src="<c:url value='/static/images/icons/icon-header-02.png'/>" class="header-icon1 js-show-cart-dropdown" alt="ICON">
					<span id="noti-icon" class="header-icons-noti">0</span>

					<!-- Header cart noti -->
					<div class="header-cart cart-dropdown" id="products-cart">
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Header Mobile -->
	<div class="wrap_header_mobile">
		<!-- Logo moblie -->
		<a href="index.html" class="logo-mobile">
			<img src="<c:url value='/static/images/icons/logo.png'/>" alt="IMG-LOGO">
		</a>

		<!-- Button show menu -->
		<div class="btn-show-menu">
			<!-- Header Icon mobile -->
			<div class="header-icons-mobile">
				<div href="#" class="header-wrapicon1 dis-block">
					<img src="<c:url value='/static/images/icons/icon-header-01.png'/>" class="header-icon1 js-show-login-dropdown" alt="ICON">
					<div class="header-cart login-dropdown">
						<span class="s-text19">
							Email
						</span>
						<div class="bo4 of-hidden size15 m-b-20">
							<input class="sizefull s-text7 p-l-22 p-r-22" type="email" name="email" placeholder="user@email.com">
						</div>

						<span class="s-text19">
							Password
						</span>
						<div class="bo4 of-hidden size15">
							<input class="sizefull s-text7 p-l-22 p-r-22" type="password" name="password" placeholder="Enter password">
						</div>
						<p href="#" align="right" class="m-b-20">
							<u>Forgot Password?</u>
						</p>
						<div class="header-cart-buttons">
							<div class="header-cart-wrapbtn">
								<!-- Button -->
								<a href="register.html" class="flex-c-m size1 btn-outline bo-rad-20 hov1 s-text1 trans-0-4">
									Rgister
								</a>
							</div>
							<div class="header-cart-wrapbtn">
								<!-- Button -->
								<a href="#" class="flex-c-m size1 bg1 bo-rad-20 hov1 s-text1 trans-0-4">
									Login
								</a>
							</div>
						</div>
					</div>
				</div>

				<span class="linedivide2"></span>

				<div class="header-wrapicon2">
					<img src="<c:url value='/static/images/icons/icon-header-02.png'/>" class="header-icon1 js-show-cart-dropdown" alt="ICON">
					<span class="header-icons-noti">0</span>

					<div class="header-cart cart-dropdown">
						<ul class="header-cart-wrapitem">
							<li class="header-cart-item">
								<div class="header-cart-item-img">
									<img src="<c:url value='/static/images/item-cart-01.jpg'/>" alt="IMG">
								</div>

								<div class="header-cart-item-txt">
									<a href="#" class="header-cart-item-name">
										Lazz Susu Kambing Asli
									</a>

									<span class="header-cart-item-info">
										1 x RM 45.00
									</span>
								</div>
							</li>

							<li class="header-cart-item">
								<div class="header-cart-item-img">
									<img src="<c:url value='/static/images/item-cart-02.jpg'/>" alt="IMG">
								</div>

								<div class="header-cart-item-txt">
									<a href="#" class="header-cart-item-name">
										Lazz Susu Kambing Kurma
									</a>

									<span class="header-cart-item-info">
										1 x RM 45.00
									</span>
								</div>
							</li>

							<li class="header-cart-item">
								<div class="header-cart-item-img">
									<img src="<c:url value='/static/images/item-cart-03.jpg'/>" alt="IMG">
								</div>

								<div class="header-cart-item-txt">
									<a href="#" class="header-cart-item-name">
										LazzChoco (coklat kurma)
									</a>

									<span class="header-cart-item-info">
										1 x RM 45.00
									</span>
								</div>
							</li>
						</ul>

						<div class="header-cart-total">
							Total: RM 135.00
						</div>

						<div class="header-cart-buttons">
							<div class="header-cart-wrapbtn">
								<!-- Button -->
								<a href="cart.html" class="flex-c-m size1 bg1 bo-rad-20 hov1 s-text1 trans-0-4">
									View Cart
								</a>
							</div>

							<div class="header-cart-wrapbtn">
								<!-- Button -->
								<a href="#" class="flex-c-m size1 bg1 bo-rad-20 hov1 s-text1 trans-0-4">
									Check Out
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="btn-show-menu-mobile hamburger hamburger--squeeze">
				<span class="hamburger-box">
					<span class="hamburger-inner"></span>
				</span>
			</div>
		</div>
	</div>

	<!-- Menu Mobile -->
	<div class="wrap-side-menu">
		<nav class="side-menu">
			<ul class="main-menu">
				<li class="item-topbar-mobile p-l-20 p-t-8 p-b-8">
					<span class="topbar-child1">
						Penghantaran Percuma dengan order melebihi RM 1200
					</span>
				</li>

				<li class="item-topbar-mobile p-l-20 p-t-8 p-b-8">
					<div class="topbar-child2-mobile">
						<span class="topbar-email">
							email@example.com
						</span>

					</div>
				</li>

				<li class="item-topbar-mobile p-l-10">
					<div class="topbar-social-mobile">
						<a href="#" class="topbar-social-item fa fa-facebook"></a>
						<a href="#" class="topbar-social-item fa fa-instagram"></a>
						<a href="#" class="topbar-social-item fa fa-pinterest-p"></a>
						<a href="#" class="topbar-social-item fa fa-snapchat-ghost"></a>
						<a href="#" class="topbar-social-item fa fa-youtube-play"></a>
					</div>
				</li>

				<li class="item-menu-mobile">
					<a href="index.html">Home</a>

					<i class="arrow-main-menu fa fa-angle-right" aria-hidden="true"></i>
				</li>

				<li class="item-menu-mobile">
					<a href="">Shop</a>
				</li>

				<li class="item-menu-mobile">
					<a href="product.html">Sale</a>
				</li>

				<li class="item-menu-mobile">
					<a href="cart.html">Cart</a>
				</li>

				<li class="item-menu-mobile">
					<a href="blog.html">Blog</a>
				</li>

				<li class="item-menu-mobile">
					<a href="about.html">About</a>
				</li>

				<li class="item-menu-mobile">
					<a href="contact.html">Contact</a>
				</li>
			</ul>
		</nav>
	</div>
</header>