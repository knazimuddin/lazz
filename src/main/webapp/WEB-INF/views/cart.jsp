<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Cart</title>
	<jsp:include page="gui-common-header-include.jsp"></jsp:include>
	<script type="text/javascript">
		function deleteProduct(prdId){
			if( confirm("Are you sure ?")  ){
	    		var formObj = document.getElementById("cartwrappermodel");
	    		formObj.action = "/lazz/product/deleteprdfromcart"+prdId;
	    		formObj.method = "POST";
	    		formObj.submit();
	    	}
		}
		
		function decrementProdCount(prdId){
			var formObj = document.getElementById("cartwrappermodel");
    		formObj.action = "/lazz/product/dec-prd-count"+prdId;
    		formObj.method = "POST";
    		formObj.submit();
		}
		
		function incrementProdCount(prdId){
			var formObj = document.getElementById("cartwrappermodel");
    		formObj.action = "/lazz/product/inc-prd-count"+prdId;
    		formObj.method = "POST";
    		formObj.submit();
		}
	</script>
</head>

<body class="animsition">

	<jsp:include page="gui-common-top-banner.jsp"></jsp:include>

	<!-- Title Page -->
	<section class="bg-title-page p-t-40 p-b-50 flex-col-c-m" style="background-image: url(<c:out value='images/heading-pages-01.jpg'/>);">
		<h2 class="l-text2 t-center">
			Cart
		</h2>
	</section>

	<form:form action="/lazz/product/createproduct" id="cartwrappermodel" modelAttribute="cartwrappermodel" method="post">
		<!-- Cart -->
		<section class="cart bgwhite p-t-70 p-b-100">
			<div class="container">
				<!-- Cart item -->
				<div class="container-table-cart pos-relative">
					<div class="wrap-table-shopping-cart bgwhite">
						<table class="table-shopping-cart">
							<tr class="table-head">
								<th class="column-1"></th>
								<th class="column-2">Product</th>
								<th class="column-3">Price</th>
								<th class="column-4 p-l-70">Quantity</th>
								<th class="column-5">Total</th>
								<th class="column-6">Action</th>
							</tr>
							<c:forEach items="${cartwrapper.products}" var="prdObj" varStatus="status">
								<tr class="table-row">
									<td class="column-1">
										<div class="cart-img-product b-rad-4 o-f-hidden">
											<img src="<c:out value='/lazz/admin/product/PRD_IMG/${prdObj.prdId}'/>" alt="IMG-PRODUCT">
										</div>
									</td>
									<td class="column-2">${prdObj.prdName}<input type="hidden" name="products[${status.index}].prdName" value="${prdObj.prdName}"/></td>
									<td class="column-3">RM ${prdObj.prdRetailPrice}<input type="hidden" name="products[${status.index}].prdRetailPrice" value="${prdObj.prdRetailPrice}"/></td>
									<td class="column-4">
										<input type="hidden" name="products[${status.index}].prdId" value="${prdObj.prdId}"/>
										<div class="flex-w bo5 of-hidden w-size17" >
											<button class="btn-num-product-down color1 flex-c-m size7 bg8 eff2" onclick="decrementProdCount('${prdObj.prdId}')">
												<i class="fs-12 fa fa-minus" aria-hidden="true"></i>
											</button>
		
											<input class="size8 m-text18 t-center num-product" type="number" name="num-product1" value="${prdObj.count}">
											<input type="hidden" name="products[${status.index}].count" value="${prdObj.count}"/>
		
											<button class="btn-num-product-up color1 flex-c-m size7 bg8 eff2" onclick="incrementProdCount('${prdObj.prdId}')">
												<i class="fs-12 fa fa-plus" aria-hidden="true"></i>
											</button>
										</div>
									</td>
									<td class="column-5">RM ${prdObj.quantityTotal}<input type="hidden" name="products[${status.index}].quantityTotal" value="${prdObj.quantityTotal}"/></td>
									<td class="column-6 delete-prompt" onclick="deleteProduct('${prdObj.prdId}')">Delete</td>
								</tr>
							</c:forEach>
							<!-- tr class="table-row">
								<td class="column-1">
									<div class="cart-img-product b-rad-4 o-f-hidden">
										<img src="images/item-05.jpg" alt="IMG-PRODUCT">
									</div>
								</td>
								<td class="column-2">Lazz Susu Kambing Kurma</td>
								<td class="column-3">RM 45.00</td>
								<td class="column-4">
									<div class="flex-w bo5 of-hidden w-size17">
										<button class="btn-num-product-down color1 flex-c-m size7 bg8 eff2">
											<i class="fs-12 fa fa-minus" aria-hidden="true"></i>
										</button>
	
										<input class="size8 m-text18 t-center num-product" type="number" name="num-product2" value="1">
	
										<button class="btn-num-product-up color1 flex-c-m size7 bg8 eff2">
											<i class="fs-12 fa fa-plus" aria-hidden="true"></i>
										</button>
									</div>
								</td>
								<td class="column-5">RM 45.00</td>
							</tr-->
						</table>
					</div>
				</div>
	
				<div class="flex-w flex-sb-m p-t-25 p-b-25 bo8 p-l-35 p-r-60 p-lr-15-sm">
					<div class="float-right size10 trans-0-4 m-t-10 m-b-10">
						<!-- Button -->
						<button class="flex-c-m sizefull bg1 bo-rad-23 hov1 s-text1 trans-0-4">
							Update Cart
						</button>
					</div>
				</div>
	
				<!-- Total -->
				<div class="bo9 w-size18 p-l-40 p-r-40 p-t-30 p-b-38 m-t-30 m-r-0 m-l-auto p-lr-15-sm">
					<h5 class="m-text20 p-b-24">
						Cart Totals
					</h5>
	
					<!--  -->
					<div class="flex-w flex-sb-m p-b-12">
						<span class="s-text18 w-size19 w-full-sm">
							Subtotal:
						</span>
	
						<span class="m-text21 w-size20 w-full-sm">
							RM ${subTotal}<input type="hidden" name="subTotal" value="${subTotal}"/>
						</span>
					</div>
	
					<!--  -->
					<div class="flex-w flex-sb bo10 p-t-15 p-b-20">
						<span class="s-text18 w-size19 w-full-sm">
							Shipping:
						</span>
	
						<div class="w-size20 w-full-sm">
							<p class="s-text8 p-b-23">
								There are no shipping methods available. Please double check your address, or contact us if you need any help.
							</p>
	
							<span class="s-text19">
								Calculate Shipping
							</span>
	
							<div class="rs2-select2 rs3-select2 rs4-select2 bo4 of-hidden w-size21 m-t-8 m-b-12">
								<form:select class="form-control select" data-live-search="true" path="paymentOptionSelected">
									<form:option value="NONE" label="Select a delivery option..."/>
                                    <form:options items="${paymentOptions}" itemLabel="${key}" itemValue="${value}"/>
								</form:select>
							</div>
	
							<!--div class="size13 bo4 m-b-12">
							<input class="sizefull s-text7 p-l-15 p-r-15" type="text" name="state" placeholder="State /  country">
							</div>
	
							<div class="size13 bo4 m-b-22">
								<input class="sizefull s-text7 p-l-15 p-r-15" type="text" name="postcode" placeholder="Postcode / Zip">
							</div-->
	
							<div class="size14 trans-0-4 m-b-10">
								<!-- Button -->
								<button class="flex-c-m sizefull bg1 bo-rad-23 hov1 s-text1 trans-0-4">
									Update Totals
								</button>
							</div>
						</div>
					</div>
	
					<!--  -->
					<div class="flex-w flex-sb-m p-t-26 p-b-30">
						<span class="m-text22 w-size19 w-full-sm">
							Total:
						</span>
	
						<span class="m-text21 w-size20 w-full-sm">
							RM ${total}<input type="hidden" name="total" value="${total}"/>
						</span>
					</div>
	
					<div class="size15 trans-0-4">
						<!-- Button -->
						<button class="flex-c-m sizefull bg1 bo-rad-23 hov1 s-text1 trans-0-4" onclick="checkout()">
							Proceed to Checkout
						</button>
					</div>
				</div>
			</div>
		</section>
	</form:form>


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
	<script type="text/javascript" src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/bootstrap/js/popper.js"></script>
	<script type="text/javascript" src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/select2/select2.min.js"></script>
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
	<script src="js/main.js"></script>

</body>

</html>