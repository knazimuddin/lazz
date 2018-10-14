<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Register</title>
	<jsp:include page="gui-common-header-include.jsp"></jsp:include>
</head>

<body class="animsition">

	<jsp:include page="gui-common-top-banner.jsp"></jsp:include>

	<!-- Title Page -->
	<section class="bg-title-page p-t-40 p-b-50 flex-col-c-m" style="background-image: url(<c:out value='/lazz/static/images/heading-pages-06.jpg'/>);">
		<h2 class="l-text2 t-center">
			Register
		</h2>
	</section>

	<form:form method="POST"
          			action="/lazz/login/register-create" modelAttribute="usersmodel" >
		<!-- content page -->
		<section class="bgwhite p-t-66 p-b-60">
			<div class="container">
				<div class="row">
	
					<div class="col-md-12 p-b-30">
						<form class="leave-comment">
							<h4 class="m-text26 p-b-36 p-t-15">
								Create an account with us!
							</h4>
	
							<span class="s-text19">
								Full Name
							</span>
							<div class="bo4 of-hidden size15 m-b-20">
								<input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="userDetails.usrdFullName" placeholder="Please enter your fullname">
							</div>
	
							<span class="s-text19">
								Phone Number
							</span>
							<div class="bo4 of-hidden size15 m-b-20">
								<input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="userDetails.usrdMob" placeholder="Enter your phone number">
							</div>
	
							<span class="s-text19">
								Email
							</span>
							<div class="bo4 of-hidden size15 m-b-20">
								<input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="userDetails.usrdEmail" placeholder="user@email.com">
							</div>
	
							<span class="s-text19">
								Address Line 1
							</span>
							<div class="bo4 of-hidden size15 m-b-20">
								<input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="userDetails.usrdShpAddr1" placeholder="Your address line 1">
							</div>
	
							<span class="s-text19">
								Address Line 2
							</span>
							<div class="bo4 of-hidden size15 m-b-20">
								<input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="userDetails.usrdShpAddr2" placeholder="Your address line 2">
							</div>
	
							<div class="row">
								<div class="col-md-12 col-lg-6">
									<span class="s-text19">
										Postcode
									</span>
									<div class="bo4 of-hidden size15 m-b-20">
										<input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="userDetails.usrdPostCode" placeholder="Enter your poscode">
									</div>
								</div>
								<div class="col-md-12 col-lg-6">
									<span class="s-text19">
										State
									</span>
									<div class="bo4 of-hidden size15 m-b-20">
										<form:select class="sizefull s-text7 p-l-22 p-r-22" type="text" placeholder="Select your state" path="userDetails.usrdState">
	                                       <form:option value="NONE" label="--- Select ---"/>
	                                       <form:options items="${states}" />
	                                    </form:select>
									</div>
								</div>
							</div>
	
							<div class="row">
								<div class="col-md-12 col-lg-6">
									<span class="s-text19">
										Password
									</span>
									<div class="bo4 of-hidden size15 m-b-20">
										<input class="sizefull s-text7 p-l-22 p-r-22" type="password" name="usrPassword" placeholder="Enter password">
									</div>
								</div>
								<div class="col-md-12 col-lg-6">
									<span class="s-text19">
										Confirm Password
									</span>
									<div class="bo4 of-hidden size15 m-b-20">
										<input class="sizefull s-text7 p-l-22 p-r-22" type="password" name="usrConfirmPassword" placeholder="Confirm your password">
									</div>
								</div>
							</div>
							<div class="ml-auto w-size25">
								<!-- Button -->
								<input type="submit" value="Register" class="flex-c-m size2 bg1 bo-rad-23 hov1 m-text3 trans-0-4" />
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>
	</form:form>	


	<jsp:include page="gui-common-footer.jsp"></jsp:include>


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
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAKFWBqlKAGCeS1rMVoaNlwyayu0e0YRes"></script>
	<script src="<c:out value='/lazz/static/js/map-custom.js'/>"></script>
	<!--===============================================================================================-->
	<script src="<c:out value='/lazz/static/js/main.js'/>"></script>

</body>

</html>