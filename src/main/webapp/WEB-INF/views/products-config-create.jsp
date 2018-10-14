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

    <link rel="icon" href="<c:url value='/static/favicon.ico'/>" type="image/x-icon" />
    <!-- END META SECTION -->

    <!-- CSS INCLUDE -->
    <link rel="stylesheet" type="text/css" id="theme" href="<c:url value='/static/css/theme-default.css'/>" />     
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" id="theme" href="<c:url value='/static/css/util.css'/>" />
    <!-- DATATABLE -->
    <link rel="stylesheet" type="text/css" href="<c:url value='/static/DataTables/datatables.min.css'/>" />
    <!-- EOF CSS INCLUDE -->
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
                    <a href="#">Forms Stuff</a>
                </li>
                <li class="active">Product Lists</li>
            </ul>
            <!-- END BREADCRUMB -->

            <!-- PAGE TITLE -->
            <div class="page-title">
                <h2>
                    <span class="fa fa-arrow-circle-o-left"></span>Product Configuration List</h2>
            </div>
            <!-- END PAGE TITLE -->
            
             <form:form method="POST"
          							action="/lazz/admin/product/createproductconfig" modelAttribute="productcfgmodel" >

	            <!-- PAGE CONTENT WRAPPER -->
	            <div class="page-content-wrap">
	
	                <!-- START RESPONSIVE TABLES -->
	                <div class="row">
	                    <div class="col-md-12">
	                        <div class="panel panel-default">
	
	                            <div class="panel-heading">
	                                <h3 class="panel-title">Posts</h3>
	                            </div>
	                            
	                            <div class="panel-body panel-body-table">
	
	                                <div class="table-responsive">
	                                    <table class="table table-striped table-actions">
	                                        <thead>
	                                            <tr>
	                                                <th width="50">ID</th>
	                                                <th>Product Name</th>
	                                                <th width="300">Select Group</th>
	                                               <!--  <th width="150">Availability</th> -->
	                                            </tr>
	                                        </thead>
	                                        <tbody>
	                                        	<c:forEach items="${prodCfgModelList}" var="cfgObj" varStatus="status">
		                                            <tr id="trow_${status.index+1}">
		                                                <td class="text-center">
			                                                ${cfgObj.prdId}
			                                                <input type="hidden" name="prodCfgList[${status.index}].prdId" value="${cfgObj.prdId}"/>
		                                                </td>
		                                                <td>
		                                                 	${cfgObj.prdName}
			                                                <input type="hidden" name="prodCfgList[${status.index}].prdName" value="${cfgObj.prdName}"/>
		                                                    <!-- a href="product-detail.html">
		                                                        <img class="data-img" src="<c:url value='/static/images/banner-03.jpg'/>">
		                                                        <strong>Lazz Susu Kambing Asli</strong>
		                                                    </a-->
		                                                </td>
		                                                <td class="t-middle">
		                                                    <select multiple class="form-control select" name="prodCfgList[${status.index}].selectedUserGroups" data-live-search="true">
		                                                    	<c:forEach items="${cfgObj.userGroups}" var="usrGrp">
			                                                        <option <c:if test="${usrGrp.assignedToProduct == 'Y'}">selected</c:if> value="${usrGrp.usrGrpId}">${usrGrp.usrGrpName}</option>
			                                                    </c:forEach>
		                                                    </select>
		                                                </td>
		                                                <!-- td class="t-middle">
		                                                        <div class="o-o-switch">
		                                                            <span>Off</span>
		                                                            <label class="switch">
		                                                                <input type="checkbox" checked value="0" />
		                                                                <span class="t-middle m-l-r-5"></span>
		                                                            </label>
		                                                            <span>On</span>
		                                                        </div>
		                                                    </td-->
		                                            </tr>
												</c:forEach>
	                                        </tbody>
	                                    </table>
	                                </div>
	                            </div>
	                        </div>
	
	                    </div>
	                </div>
	                <!-- END RESPONSIVE TABLES -->
	                
                 	<div class="panel-footer bo-0">
						<input type="submit" class="btn btn-primary pull-right" name="" value="Confirm"/>
                    </div>
	
	            </div>
	            <!-- END PAGE CONTENT WRAPPER -->
			</form:form> 
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

    <!-- START PRELOADS -->
    <audio id="audio-alert" src="<c:url value='/static/audio/alert.mp3'/>" preload="auto"></audio>
    <audio id="audio-fail" src="<c:url value='/static/audio/fail.mp3'/>" preload="auto"></audio>
    <!-- END PRELOADS -->

    <!-- START SCRIPTS -->
    <!-- START PLUGINS -->
    <script type="text/javascript" src="<c:url value='/static/js/plugins/jquery/jquery.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/static/js/plugins/jquery/jquery-ui.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/static/js/plugins/bootstrap/bootstrap.min.js'/>"></script>
    <!-- END PLUGINS -->

    <!-- THIS PAGE PLUGINS -->
    <script type='text/javascript' src="<c:url value='/static/js/plugins/icheck/icheck.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/static/js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js'/>"></script>

    <script type="text/javascript" src="<c:url value='/static/js/plugins/codemirror/codemirror.js'/>"></script>
    <script type='text/javascript' src="<c:url value='/static/js/plugins/codemirror/mode/htmlmixed/htmlmixed.js'/>"></script>
    <script type='text/javascript' src="<c:url value='/static/js/plugins/codemirror/mode/xml/xml.js'/>"></script>
    <script type='text/javascript' src="<c:url value='/static/js/plugins/codemirror/mode/javascript/javascript.js'/>"></script>
    <script type='text/javascript' src="<c:url value='/static/js/plugins/codemirror/mode/css/css.js'/>"></script>
    <script type='text/javascript' src="<c:url value='/static/js/plugins/codemirror/mode/clike/clike.js'/>"></script>
    <script type='text/javascript' src="<c:url value='/static/js/plugins/codemirror/mode/php/php.js'/>"></script>

    <script type="text/javascript" src="<c:url value='/static/js/plugins/summernote/summernote.js'/>"></script>

    <script type="text/javascript" src="<c:url value='/static/js/plugins/bootstrap/bootstrap-datepicker.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/static/js/plugins/bootstrap/bootstrap-timepicker.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/static/js/plugins/bootstrap/bootstrap-colorpicker.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/static/js/plugins/bootstrap/bootstrap-file-input.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/static/js/plugins/bootstrap/bootstrap-select.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/static/js/plugins/tagsinput/jquery.tagsinput.min.js'/>"></script>

    <script type='text/javascript' src="<c:url value='/static/js/plugins/noty/jquery.noty.js'/>"></script>
    <script type='text/javascript' src="<c:url value='/static/js/plugins/noty/layouts/topCenter.js'/>'/>"></script>
    <script type='text/javascript' src="<c:url value='/static/js/plugins/noty/layouts/topLeft.js'/>"></script>
    <script type='text/javascript' src="<c:url value='/static/js/plugins/noty/layouts/topRight.js'/>"></script>

    <script type='text/javascript' src="<c:url value='/static/js/plugins/noty/themes/default.js'/>"></script>
    <!-- END PAGE PLUGINS -->


    <!-- START THIS PAGE PLUGINS-->
    <script type='text/javascript' src="<c:url value='/static/js/plugins/icheck/icheck.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/static/js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js'/>"></script>

    <script type="text/javascript" src="<c:url value='/static/js/plugins/blueimp/jquery.blueimp-gallery.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/static/js/plugins/dropzone/dropzone.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/static/js/plugins/icheck/icheck.min.js'/>"></script>
    <!-- END THIS PAGE PLUGINS-->

    <!-- START TEMPLATE -->
    <!-- <script type="text/javascript" src="js/settings.js"></script> -->

    <script type="text/javascript" src="<c:url value='/static/js/plugins.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/static/js/actions.js'/>"></script>
    <!-- END TEMPLATE -->

    <!-- DATATABLE -->
    <script type="text/javascript" src="<c:url value='/static/DataTables/datatables.min.js'/>"></script>
    <script>
        $(document).ready(function () {
            var table = $('#example').DataTable({
                rowReorder: true
            });
        });
    </script>
    <script>            
        document.getElementById('links').onclick = function (event) {
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
        };
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