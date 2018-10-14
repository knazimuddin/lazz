<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- META SECTION -->
    <title>Lazz Susu Kambing Admin Panel</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link rel="icon" href="../favicon.ico" type="image/x-icon" />
    <!-- END META SECTION -->

   <!-- CSS INCLUDE -->
    <link rel="stylesheet" type="text/css" id="theme" href="<c:url value='/static/css/theme-default.css' />" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" id="theme" href="<c:url value='/static/css/util.css'/>" />
    <!-- EOF CSS INCLUDE -->
    <script type="text/javascript">
    	function update(prdId){
    		var formObj = document.getElementById("productmodel");
    		formObj.action = "/lazz/admin/product/updateproductview/"+prdId;
    		formObj.method = "GET";
    		formObj.submit();
    	}
    	
    	function deletePrd(prdId){
	    	if( confirm("Are you sure ?")  ){
	    		var formObj = document.getElementById("productmodel");
	    		formObj.action = "/lazz/admin/product/deleteproduct/"+prdId;
	    		formObj.method = "POST";
	    		formObj.submit();
	    	}
    	}
    </script>
</head>

<body>
    <!-- START PAGE CONTAINER -->
    <div class="page-container">

        <jsp:include page="sidemenu.jsp"></jsp:include>
        <!-- PAGE CONTENT -->
        <div class="page-content">

            <!-- START X-NAVIGATION VERTICAL -->
            <ul class="x-navigation x-navigation-horizontal x-navigation-panel">
                <!-- TOGGLE NAVIGATION -->
                <li class="xn-icon-button">
                    <a href="#" class="x-navigation-minimize">
                        <span class="fa fa-dedent"></span>
                    </a>
                </li>
                <!-- END TOGGLE NAVIGATION -->
                <!-- SEARCH -->
                <li class="xn-search">
                	<input type="text" name="search" placeholder="Search..." />
                </li>
                <!-- END SEARCH -->
                <!-- SIGN OUT -->
                <li class="xn-icon-button pull-right">
                    <a href="#" class="mb-control" data-box="#mb-signout">
                        <span class="fa fa-sign-out"></span>
                    </a>
                </li>
                <!-- END SIGN OUT -->
            </ul>
            <!-- END X-NAVIGATION VERTICAL -->

            <!-- START BREADCRUMB -->
            <ul class="breadcrumb">
                <li>
                    <a href="#">Home</a>
                </li>
                <li>
                    <a href="#">Forms Stuff</a>
                </li>
                <li class="active">Add Product</li>
            </ul>
            <!-- END BREADCRUMB -->

            <!-- PAGE TITLE -->
            <div class="page-title">
                <h2>
                    <span class="fa fa-arrow-circle-o-left"></span>Add Product</h2>
            </div>
            <!-- END PAGE TITLE -->

            <!-- PAGE CONTENT WRAPPER -->
            <div class="page-content-wrap">
            	<form:form method="POST"
          			id="productmodel" action="/lazz/admin/product/createproduct" modelAttribute="productmodel" >
                <div class="row">
                    <div class="col-md-12">

                        <div class="block">
                            <h4>Product Information</h4>
                            <div class="panel-body">

                                <div class="form-group">
                                    <label class="col-12 control-label">Product Name</label>
                                    <div class="col-12">
                                        <input type="text" name="prdName" class="form-control" placeholder="Enter the product name...">
                                    </div>
                                </div>

                                <!-- div class="form-group">
                                    <label class="col-12 control-label">Product ID</label>
                                    <div class="col-12">
                                        <input type="text" name="prdId" class="form-control" placeholder="Product ID will auto generate" readonly>
                                    </div>
                                </div-->

                                <div class="form-group">
                                    <label class="col-12 control-label">SKU Number</label>
                                    <div class="col-12">
                                        <input type="text" name="prdSkuNum" class="form-control" placeholder="Enter the product's SKU number">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-12 control-label">Retail Points</label>
                                    <div class="col-12">
                                        <input type="number" name="prdRetailPoints" class="form-control" placeholder="Enter points for retail">
                                    </div>
                                </div>

                               <%--  <div class="form-group">
                                    <label class="col-12 control-label">Upload Product Photos</label>
                                    <div class="col-12">
                                        <form action="upload.php" class="dropzone dropzone-mini"></form>
                                        <input type = "file" name = "file" class="dropzone dropzone-mini" />
                                    </div>
                                </div>
 								--%>
                                <div class="form-group">
                                    <label class="col-12 control-label">Price Rules Points</label>
                                    <div class="col-12">
                                        <input type="number" name="prdRulesPoints" class="form-control" placeholder="Enter points for this price rules">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-12 control-label">Retail Price</label>
                                    <div class="input-group col-12">
                                        <span class="input-group-addon">
                                            <span class="fa fa-usd"></span>
                                        </span>
                                        <input type="number" name="prdRetailPrice" class="form-control" placeholder="Enter Product Price">
                                    </div>
                                </div>

                            </div>

                            <div class="panel-footer bo0 m-b-20">
                                <button class="btn btn-default">Clear Form</button>
                                <input type="submit" class="btn btn-default" value="Confirm" />
                            </div>

                            <h4 class="bo3 p-t-10">Available Products</h4>
                            <div class="panel-body">

                                <div class="table-responsive">
                                    <table class="table table-bordered table-striped table-actions">
                                        <thead>
                                            <tr>
                                                <th width="50">Product ID</th>
                                                <th>Product Name</th>
                                                <th>Product Image</th>
                                                <th width="100">SKU Number</th>
                                                <th width="150">Retail Points</th>
                                                <th width="100">Price Rules Points</th>
                                                <th width="100">Retail Price</th>
                                                <th width="100">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach items="${productsList}" var="products" varStatus="status">
	                                        	<tr id="trow_${status.index+1}">
	                                                <td>
	                                                    <!-- a href="product-detail.html">
	                                                        <img class="data-img" src="../images/banner-03.jpg">
	                                                        <strong>Lazz Susu Kambing Coklat</strong>
	                                                    </a-->
	                                                     <span class="text-center">${products.prdId}</span>
	                                                </td>
	                                                <td class="text-center">
	                                                    <span class="text-center">${products.prdName}</span>
	                                                </td>
	                                                <td class="text-center">
	                                                	 <a href="#">
	                                                        <img class="data-img" src="<c:out value='/lazz/admin/product/PRD_IMG/${products.prdId}'/>"/>
	                                                    </a>
	                                                </td>
	                                                <td class="text-danger text-center">
	                                                    <strong>${products.prdSkuNum}</strong>
	                                                </td>
	                                                 <td class="text-danger text-center">
	                                                    <strong>${products.prdRetailPoints}</strong>
	                                                </td>
	                                                <td class="text-danger text-center">
	                                                    <strong>${products.prdRulesPoints}</strong>
	                                                </td>
	                                                <td class="text-danger text-center">
	                                                    <strong>${products.prdRetailPrice}</strong>
	                                                </td>
	                                                <td class="text-center">
	                                                    <button class="btn btn-default btn-rounded btn-sm" onclick="update('${products.prdId}')" data-toggle="tooltip" title="Edit">
	                                                        <span class="fa fa-pencil"></span>
	                                                    </button>
	                                                    <!-- button class="btn btn-warning btn-rounded btn-sm" data-toggle="tooltip" title="Deactive">
	                                                        <span class="fa fa-ban"></span>
	                                                    </button-->
	                                                    <button class="btn btn-danger btn-rounded btn-sm" onClick="deletePrd('${products.prdId}');" data-toggle="tooltip" title="Delete">
	                                                        <span class="fa fa-times"></span>
	                                                    </button>
	                                                </td>
	                                            </tr>
	                                        </c:forEach>    
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- success -->
                <div class="message-box message-box-success animated fadeIn" id="message-box-success">
                    <div class="mb-container">
                        <div class="mb-middle">
                            <div class="mb-title">
                                <span class="fa fa-check"></span> Success</div>
                            <div class="mb-content">
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec at tellus sed mauris mollis
                                    pellentesque nec a ligula. Quisque ultricies eleifend lacinia. Nunc luctus quam pretium
                                    massa semper tincidunt. Praesent vel mollis eros. Fusce erat arcu, feugiat ac dignissim
                                    ac, aliquam sed urna. Maecenas scelerisque molestie justo, ut tempor nunc.</p>
                            </div>
                            <div class="mb-footer">
                                <button class="btn btn-default btn-lg pull-right mb-control-close">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end success -->

                <!-- fail message -->
                <!--div class="message-box message-box-danger animated fadeIn" id="message-box-fail">
                        <div class="mb-container">
                            <div class="mb-middle">
                                <div class="mb-title"><span class="fa fa-times"></span> Fail</div>
                                <div class="mb-content">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec at tellus sed mauris mollis pellentesque nec a ligula. Quisque ultricies eleifend lacinia. Nunc luctus quam pretium massa semper tincidunt. Praesent vel mollis eros. Fusce erat arcu, feugiat ac dignissim ac, aliquam sed urna. Maecenas scelerisque molestie justo, ut tempor nunc.</p>
                                </div>
                                <div class="mb-footer">
                                    <button class="btn btn-default btn-lg pull-right mb-control-close">Close</button>
                                </div>
                            </div>
                        </div>
                    </div-->
                <!-- end fail message -->
				</form:form>
            </div>
            <!-- END PAGE CONTENT WRAPPER -->

        </div>
        <!-- END PAGE CONTENT -->
    </div>
    <!-- END PAGE CONTAINER -->

    <!-- MESSAGE BOX-->
    <div class="message-box animated fadeIn" data-sound="alert" id="mb-signout">
        <div class="mb-container">
            <div class="mb-middle">
                <div class="mb-title">
                    <span class="fa fa-sign-out"></span> Log
                    <strong>Out</strong> ?</div>
                <div class="mb-content">
                    <p>Are you sure you want to log out?</p>
                    <p>Press No if youwant to continue work. Press Yes to logout current user.</p>
                </div>
                <div class="mb-footer">
                    <div class="pull-right">
                        <a href="pages-login.html" class="btn btn-success btn-lg">Yes</a>
                        <button class="btn btn-default btn-lg mb-control-close">No</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END MESSAGE BOX-->
    
    <jsp:include page="footer.jsp"></jsp:include>

    

    <!-- START TEMPLATE -->
    <!-- <script type="text/javascript" src="js/settings.js"></script> -->

    <script type="text/javascript" src="../js/plugins.js"></script>
    <script type="text/javascript" src="../js/actions.js"></script>
    <!-- END TEMPLATE -->
    <script>            
       /* document.getElementById('links').onclick = function (event) {
            event = event || window.event;
            var target = event.target || event.srcElement;
            var link = target.src ? target.parentNode : target;
            var options = {
                index: link, event: event, onclosed: function () {
                    setTimeout(function () {
                        $("body").css("overflow", "");
                    }, 200);
                }
            };
            var links = this.getElementsByTagName('a');
            blueimp.Gallery(links, options);
        };*/
    </script>

    <script>
        var editor = CodeMirror.fromTextArea(document.getElementById("codeEditor"), {
            lineNumbers: true,
            matchBrackets: true,
            mode: "application/x-httpd-php",
            indentUnit: 4,
            indentWithTabs: true,
            enterMode: "keep",
            tabMode: "shift"
        });
        editor.setSize('100%', '420px');
    </script>
    <!-- END SCRIPTS -->
</body>

</html>