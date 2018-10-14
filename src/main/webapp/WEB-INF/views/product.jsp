<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Product</title>
	<jsp:include page="gui-common-header-include.jsp"></jsp:include>
	<script type="text/javascript">
		function addToCart(prdId){
			var json = { "prdId" : prdId};
			$.ajax({
		        url: "/lazz/product/add-to-cart",
		        data: JSON.stringify(json),
		        type: "POST",
		         
		        beforeSend: function(xhr) {
		            xhr.setRequestHeader("Accept", "application/json");
		            xhr.setRequestHeader("Content-Type", "application/json");
		        },
		        success: function(ajaxResponseModel) {
		        	if( ajaxResponseModel.statusCode == "200" ){
		        		//TODO: need add message that product added successfully
		        		$("#noti-icon").val(ajaxResponseModel.productCount);
		        		
		        		var ulObj = $("<ul class='header-cart-wrapitem'>");
		        		for( x in ajaxResponseModel.productsModelList ){
		        			$(ulObj).append("<li class='header-cart-item'>"+
		        			"<div class='header-cart-item-img'><img src='/static/images/item-cart-01.jpg' alt='IMG'></div>"+
		        			"<div class='header-cart-item-txt'>" +
		        			"<a href='#' class='header-cart-item-name'>"+ajaxResponseModel.productsModelList[x].prdName+""+
		        			"<span class='header-cart-item-info'>"+ajaxResponseModel.productsModelList[x].count+""+
		        			" X RM "+ajaxResponseModel.productsModelList[x].prdRetailPrice+"</span></div></li>");
		        		}
		        		$(ulObj).append("<div class='header-cart-total'>Total: RM "+ajaxResponseModel.totalAmount+"</div>"+
		        		"<div class='header-cart-buttons'><div class='header-cart-wrapbtn'>"+
		        		"<a href='/lazz/product/view-cart' class='flex-c-m size1 bg1 bo-rad-20 hov1 s-text1 trans-0-4'>View Cart</a></div>"+
		        		"<div class='header-cart-wrapbtn'><a href='/lazz/product/checkout' class='flex-c-m size1 bg1 bo-rad-20 hov1 s-text1 trans-0-4'>"+
		        		"Check Out</a></div></div>");
		        		$("#products-cart").empty();
		        		$("#products-cart").append(ulObj);
		        	} 
		        }
		    });
		}
	</script>
</head>

<body class="animsition">

	<jsp:include page="gui-common-top-banner.jsp"></jsp:include>
	<!-- Title Page -->
	<section class="bg-title-page p-t-50 p-b-40 flex-col-c-m" style="background-image: url(<c:out value='/lazz/static/images/heading-pages-02.jpg'/>);">
		<h2 class="l-text2 t-center">
			Lazz Shop
		</h2>
		<p class="m-text13 t-center">
			Pembelian produk Lazz, lebih mudah.
		</p>
	</section>


	<!-- Content page -->
	<section class="bgwhite p-t-55 p-b-65 p-s-55">
		<div class="container">
			<div class="row">

				<!-- Product -->
				<div class="row">
					<c:forEach items="${productsList}" var="product">
						<div class="col-sm-12 col-md-6 col-lg-4 p-b-50">
							<!-- Block2 -->
							<div class="block2">
								<div class="block2-img wrap-pic-w of-hidden pos-relative block2-labelnew">
									<img src="<c:out value='/admin/product/PRD_IMG/${product.prdId}'/>" alt="IMG-PRODUCT">
	
									<div class="block2-overlay trans-0-4">
										<a href="#" class="block2-btn-addwishlist hov-pointer trans-0-4">
											<i class="icon-wishlist icon_heart_alt" aria-hidden="true"></i>
											<i class="icon-wishlist icon_heart dis-none" aria-hidden="true"></i>
										</a>
	
										<div class="block2-btn-addcart w-size1 trans-0-4" onclick="addToCart('${product.prdId}')">
											<!-- Button -->
											<button class="flex-c-m size1 bg4 bo-rad-23 hov1 s-text1 trans-0-4">
												Add to Cart
											</button>
										</div>
									</div>
								</div>
	
								<div class="block2-txt p-t-20">
									<a href="product-detail.html" class="block2-name dis-block s-text3 p-b-5">
										${product.prdName}
									</a>
	
									<span class="block2-price m-text6 p-r-5">
										RM ${product.prdRetailPrice}
									</span>
								</div>
							</div>
						</div>
					</c:forEach>	

				</div>
			</div>
		</div>
	</section>

	<jsp:include page="footer.jsp"></jsp:include>
	
	<!-- Back to top -->
	<div class="btn-back-to-top bg0-hov" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="fa fa-angle-double-up" aria-hidden="true"></i>
		</span>
	</div>

	<!-- Container Selection -->
	<div id="dropDownSelect1"></div>
	<div id="dropDownSelect2"></div>



	<!--===============================================================================================-->
	<script type="text/javascript" src="<c:out value='/lazz/static/vendor/jquery/jquery-3.2.1.min.js'/>"></script>
	<!--===============================================================================================-->
	<script type="text/javascript" src="<c:out value='/lazz/static/vendor/animsition/js/animsition.min.js'/>"></script>
	<!--===============================================================================================-->
	<script type="text/javascript" src="<c:out value='/lazz/static/vendor/bootstrap/js/popper.js'/>"></script>
	<script type="text/javascript" src="<c:out value='/lazz/static/vendor/bootstrap/js/bootstrap.min.js'/>"></script>
	<!--===============================================================================================-->
	<script type="text/javascript" src="<c:out value='/lazz/static/vendor/select2/select2.min.js'/>"></script>
	<script type="text/javascript">
		$(".selection-1").select2({
			minimumResultsForSearch: 20,
			dropdownParent: $('#dropDownSelect1')
		});

		$(".selection-2").select2({
			minimumResultsForSearch: 20,
			dropdownParent: $('#dropDownSelect2')
		});
	</script>
	<!--===============================================================================================-->
	<script type="text/javascript" src="<c:out value='/lazz/static/vendor/daterangepicker/moment.min.js'/>"></script>
	<script type="text/javascript" src="<c:out value='/lazz/static/vendor/daterangepicker/daterangepicker.js'/>"></script>
	<!--===============================================================================================-->
	<script type="text/javascript" src="<c:out value='/lazz/static/vendor/slick/slick.min.js'/>"></script>
	<script type="text/javascript" src="<c:out value='/lazz/static/js/slick-custom.js'/>"></script>
	<!--===============================================================================================-->
	<script type="text/javascript" src="<c:out value='/lazz/static/vendor/sweetalert/sweetalert.min.js'/>"></script>
	<!--  script type="text/javascript">
		$('.block2-btn-addcart').each(function () {
			var nameProduct = $(this).parent().parent().parent().find('.block2-name').html();
			$(this).on('click', function () {
				swal(nameProduct, "is added to cart !", "success");
			});
		});

		$('.block2-btn-addwishlist').each(function () {
			var nameProduct = $(this).parent().parent().parent().find('.block2-name').html();
			$(this).on('click', function () {
				swal(nameProduct, "is added to wishlist !", "success");
			});
		});
	</script-->

	<!--===============================================================================================-->
	<script type="text/javascript" src="<c:out value='/lazz/static/vendor/noui/nouislider.min.js'/>"></script>
	<script type="text/javascript">
		/*[ No ui ]
	    ===========================================================*/
		var filterBar = document.getElementById('filter-bar');

		noUiSlider.create(filterBar, {
			start: [50, 200],
			connect: true,
			range: {
				'min': 50,
				'max': 200
			}
		});

		var skipValues = [
			document.getElementById('value-lower'),
			document.getElementById('value-upper')
		];

		filterBar.noUiSlider.on('update', function (values, handle) {
			skipValues[handle].innerHTML = Math.round(values[handle]);
		});
	</script>
	<!--===============================================================================================-->
	<script src="<c:out value='/lazz/static/js/main.js'/>"></script>

</body>

</html>