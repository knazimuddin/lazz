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
    <link rel="stylesheet" type="text/css" id="theme" href="<c:url value='/static/css/theme-default.css'/>" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- EOF CSS INCLUDE -->
    <script type="text/javascript">
    	function getProducts(){
    		var formObj = document.getElementById("prdpricerulesmodel");
    		var usrGrpId = document.getElementById("usrGrpSel").value;
    		formObj.action = "/lazz/admin/price/display-product-price-rules-for-usr-view/"+usrGrpId;
    		formObj.method = "POST";
	    	formObj.submit();
    	}
    	
    	function submitForm(){
    		var formObj = document.getElementById("prdpricerulesmodel");
    		formObj.submit();
    	}
    </script>
</head>

<body>
    <!-- START PAGE CONTAINER -->
    <div class="page-container">

        <jsp:include page="sidemenu.jsp"></jsp:include>
        
		<form:form 
          action="/lazz/admin/price/save-product-price-rules" id="prdpricerulesmodel" modelAttribute="prdpricerulesmodel" method="POST">
		
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
	                    <form role="form">
	                        <input type="text" name="search" placeholder="Search..." />
	                    </form>
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
	                    <a href="#">Users</a>
	                </li>
	                <li class="active">Agents</li>
	            </ul>
	            <!-- END BREADCRUMB -->
	
	            <!-- PAGE CONTENT WRAPPER -->
	            <div class="page-content-wrap">
	
	                <div class="row">
	                    <div class="col-md-12">
	                        <h4>Users Price</h4>
	                        <div class="form-group">
	                            <div class="col-12">
	                                <form:select class="form-control select" id="usrGrpSel" onchange="getProducts()" data-live-search="true" path="selectedUsrGrpId">
	                                    <form:option value="NONE" label="-- Select Group --"/>
	                                    <form:options items="${userGroupsList}" itemValue="usrGrpId" itemLabel="usrGrpName"/>
	                                </form:select>
	                            </div>
	                        </div>
	
	                        <div class="form-horizontal">
	
	                            <div class="panel panel-default">
	
	                                <div class="panel-body">
	                                	<c:forEach items="${selectedUserGroup.prodCfgs}" var="prdCfg" varStatus="status1">
		                                    <div class="block">
		                                        <div class="panel panel-default">
		                                            <div class="panel-heading">
		                                                <h3 class="panel-title">${prdCfg.products.prdName}</h3>
		                                                <input type="hidden" name="prdConfigurations[${status1.index}].prdName" value="${prdCfg.products.prdName}" />
		                                                <input type="hidden" name="prdConfigurations[${status1.index}].prdId" value="${prdCfg.products.prdId}" />
		                                                <input type="hidden" name="prdConfigurations[${status1.index}].prdCfgId" value="${prdCfg.prdCfgId}" />
		                                            </div>
		                                            <div class="panel-body">
		                                                <div class="table-responsive">
		                                                    <table class="table table-bordered table-striped table-actions">
		                                                        <thead>
		                                                            <tr>
		                                                                <th width="50">Cartons</th>
		                                                                <th width="">Price Per Item (West)</th>
		                                                                <th width="">Price Per Item (East)</th>
		                                                                <th width="150">Actions</th>
		                                                            </tr>
		                                                        </thead>
		                                                        <tbody>
		                                                        	<c:forEach items="${prdCfg.prdPriceRuleses}" var="priceRules" varStatus="status2">
		                                                            	<tr id="trow_1">
			                                                                <td class="text-center">
			                                                                    <strong>${priceRules.prdPrcRuleCarton}</strong>
			                                                                    <input type="hidden" name="prdConfigurations[${status1.index}].prdPriceRules[${status2.index}].prdPrcRuleCarton" value="${priceRules.prdPrcRuleCarton}" />
			                                                                    <input type="hidden" name="prdConfigurations[${status1.index}].prdPriceRules[${status2.index}].prdPrcRuleId" value="${priceRules.prdPrcRuleId}" />
			                                                                </td>
			                                                                <td><input type="text" name="prdConfigurations[${status1.index}].prdPriceRules[${status2.index}].prdPrcRulePriceWest" value="${priceRules.prdPrcRulePriceWest}" /></td>
			                                                                <td><input type="text" name="prdConfigurations[${status1.index}].prdPriceRules[${status2.index}].prdPrcRulePriceEast" value="${priceRules.prdPrcRulePriceEast}" /></td>
			                                                                <td>
			                                                                    <button href="user-add-price.html" class="btn btn-default btn-rounded btn-sm" data-toggle="tooltip" title="Edit">
			                                                                        <span class="fa fa-pencil"></span>
			                                                                    </button>
			                                                                    <!-- button class="btn btn-danger btn-rounded btn-sm" onClick="delete_row('trow_1');" data-toggle="tooltip" title="Delete">
			                                                                        <span class="fa fa-times"></span>
			                                                                    </button-->
			                                                                </td>
			                                                            </tr>
			                                                        </c:forEach> 
		                                                        </tbody>
		                                                    </table>
		                                                </div>
		                                            </div>
		
		                                        </div>
		                                    </div>
		                                 </c:forEach>   
	                                </div>
	                                <div class="panel-footer">
	                                    <button class="btn btn-primary pull-right" onclick="submitForm()">Save Changes
	                                        <span class="fa fa-floppy-o fa-right"></span>
	                                    </button>
	                                </div>
	                            </div>
	
	                        </div>
	
	                    </div>
	                </div>
	
	            </div>
	            <!-- END PAGE CONTENT WRAPPER -->
	
	        </div>
	        <!-- END PAGE CONTENT WRAPPER -->
	    </form:form>  
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

    <script type="text/javascript" src="<c:url value='/static/js/plugins.js' />"></script>
    <script type="text/javascript" src="<c:url value='/static/js/actions.js' />"></script>
    <!-- END TEMPLATE -->

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