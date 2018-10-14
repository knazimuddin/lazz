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
    <!-- EOF CSS INCLUDE -->
    <script type="text/javascript">
    	function update(usrGrpId){
    		document.forms[0].action = "/lazz/admin/user/updateusergroupview/"+usrGrpId;
    		document.forms[0].method = "GET";
    		document.forms[0].submit();
    	}
    	
    	function deleteGroup(usrGrpId){
	    	if( confirm("Are you sure ?")  ){
	    		document.forms[0].action = "/lazz/admin/user/deleteusergroup/"+usrGrpId;
	    		document.forms[0].method = "POST";
	    		document.forms[0].submit();
	    	}
    	}
    </script>
</head>

<body>
    <!-- START PAGE CONTAINER -->
    <div class="page-container">

        <jsp:include page="sidemenu.jsp"></jsp:include>

		<form:form method="POST"
          action="/lazz/admin/user/updateusergroup" modelAttribute="usergroupmodel">
		
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
                <li class="active">Users Group</li>
            </ul>
            <!-- END BREADCRUMB -->

            <!-- PAGE TITLE -->
            <div class="page-title">
                <h2>
                    <span class="fa fa-arrow-circle-o-left"></span>Users Group</h2>
            </div>
            <!-- END PAGE TITLE -->

            <!-- PAGE CONTENT WRAPPER -->
            <div class="page-content-wrap">

                <div class="row">
                    <div class="col-md-12">

                        <div class="block">
                            <h4>Users Grouping</h4>
                            <div class="panel-body m-b-20">

                                <div class="form-group">
                                    <label class="col-12 control-label">Group Name</label>
                                    <div class="col-12">
                                        <form:input path="usrGrpName" class="form-control" placeholder="Enter grouping name..."/>
                                        <form:hidden path="usrGrpId" />
                                    </div>
                                </div>

                            </div>
                            <div class="panel-footer">
                                <button class="btn btn-primary pull-right">Update Group</button>
                            </div>
                        </div>

                        <div class="block">

                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Groups List</h3>
                                    <ul class="panel-controls">
                                        <li>
                                            <a href="#" class="panel-refresh">
                                                <span class="fa fa-refresh"></span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="panel-body">
                                    <table class="table datatable table-bordered table-striped table-actions">
                                        <thead>
                                            <tr>
                                                <th width="200">Group Name</th>
                                                <th>Users List</th>
                                                <th width="100">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach items="${userGroupsList}" var="group">
	                                            <tr id="trow_1">
	                                                <td class="text-center"><c:out value="${group.usrGrpName}"></c:out></td>
	                                                <td>
	                                                	<c:forEach items="${group.userses}" var="user">
		                                                    <strong><c:out value="${user.usrName}"/>-<c:out value="${user.userDetails.usrdFullName}"/></strong>
		                                                    <br>
		                                                 </c:forEach>   
	                                                </td>
	                                                <td>
	                                                    <button class="btn btn-default btn-rounded btn-sm" onclick="update('${group.usrGrpId}')" data-toggle="tooltip" title="Edit">
	                                                        <span class="fa fa-pencil"></span>
	                                                    </button>
	                                                    <button class="btn btn-danger btn-rounded btn-sm" onClick="deleteGroup('${group.usrGrpId}');" data-toggle="tooltip" title="Delete">
	                                                        <span class="fa fa-times"></span>
	                                                    </button>
	                                                </td>
	                                            </tr>
	                                            <!-- <tr id="trow_1">
	                                                <td class="text-center">Group 2</td>
	                                                <td>
	                                                    <strong>Agent 1</strong>
	                                                    <br>
	                                                    <strong>Agent 2</strong>
	                                                    <br>
	                                                    <strong>Agent 3</strong>
	                                                    <br>
	                                                    <strong>Agent 4</strong>
	                                                    <br>
	                                                </td>
	                                                <td>
	                                                    <button class="btn btn-default btn-rounded btn-sm" data-toggle="tooltip" title="Edit">
	                                                        <span class="fa fa-pencil"></span>
	                                                    </button>
	                                                    <button class="btn btn-warning btn-rounded btn-sm" data-toggle="tooltip" title="Deactive">
	                                                        <span class="fa fa-ban"></span>
	                                                    </button>
	                                                    <button class="btn btn-danger btn-rounded btn-sm" onClick="delete_row('trow_1');" data-toggle="tooltip" title="Delete">
	                                                        <span class="fa fa-times"></span>
	                                                    </button>
	                                                </td>
	                                            </tr>
	                                            <tr id="trow_1">
	                                                <td class="text-center">Group 3</td>
	                                                <td>
	                                                    <strong>Agent 1</strong>
	                                                    <br>
	                                                    <strong>Agent 2</strong>
	                                                    <br>
	                                                    <strong>Agent 3</strong>
	                                                    <br>
	                                                    <strong>Agent 4</strong>
	                                                    <br>
	                                                </td>
	                                                <td>
	                                                    <button class="btn btn-default btn-rounded btn-sm" data-toggle="tooltip" title="Edit">
	                                                        <span class="fa fa-pencil"></span>
	                                                    </button>
	                                                    <button class="btn btn-warning btn-rounded btn-sm" data-toggle="tooltip" title="Deactive">
	                                                        <span class="fa fa-ban"></span>
	                                                    </button>
	                                                    <button class="btn btn-danger btn-rounded btn-sm" onClick="delete_row('trow_1');" data-toggle="tooltip" title="Delete">
	                                                        <span class="fa fa-times"></span>
	                                                    </button>
	                                                </td>
	                                            </tr> -->
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- END PAGE CONTENT WRAPPER -->
            </div>
            <!-- END PAGE CONTENT -->
        </div>
        <!-- END PAGE CONTAINER -->
        </form:form>

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

        <script type="text/javascript" src="<c:url value='/static/js/plugins.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/static/js/actions.js'/>"></script>
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