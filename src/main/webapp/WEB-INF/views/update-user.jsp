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
    <link rel="stylesheet" type="text/css" id="theme" href="<c:url value='/static/css/theme-default.css' />" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" id="theme" href="<c:url value='/static/css/util.css'/>" />
    <!-- EOF CSS INCLUDE -->
    <script type="text/javascript">
    	function update(usrId){
    		var formObj = document.getElementById("usermodel");
    		formObj.action = "/lazz/admin/user/updateuserview/"+usrId;
    		formObj.method = "GET";
    		formObj.submit();
    	}
    	
    	function deleteUser(usrId){
	    	if( confirm("Are you sure ?")  ){
	    		var formObj = document.getElementById("usermodel");
	    		formObj.action = "/lazz/admin/user/deleteuser/"+usrId;
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
                <li class="active">Update User</li>
            </ul>
            <!-- END BREADCRUMB -->

            <!-- PAGE TITLE -->
            <div class="page-title">
                <h2>
                    <span class="fa fa-arrow-circle-o-left"></span>Update User</h2>
            </div>
            <!-- END PAGE TITLE -->
            

            <!-- PAGE CONTENT WRAPPER -->
            <div class="page-content-wrap">
            	<form:form method="POST"
          			action="/lazz/admin/user/updateuser" modelAttribute="usermodel" >

                <div class="row">
                    <div class="col-md-12">

                        <div class="block">
                            <h4>Create User</h4>
                            <div class="panel-body m-b-20">

                                <div class="form-group">
                                    <label class="col-12 control-label">User Full Name</label>
                                    <div class="col-12">
                                    	<form:input class="form-control" placeholder="Enter the user fullname..." path="userDetails.usrdFullName"/>
                                    	<form:hidden path="usrId" />
                                    </div>
                                </div>

                                <!-- div class="form-group">
                                    <label class="col-12 control-label">User ID</label>
                                    <div class="col-12">
                                        <input type="text" class="form-control" placeholder="User ID will auto generate" readonly="true">
                                    </div>
                                </div-->

                                <div class="form-group">
                                    <label class="col-12 control-label">Shipping Address</label>
                                    <div class="col-12">
                                        <form:input class="form-control" placeholder="Address Line 1" path="userDetails.usrdShpAddr1"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-12">
                                    	<form:input class="form-control" placeholder="Address Line 2" path="userDetails.usrdShpAddr2"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-12 col-xs-12 col-sm-6 no-padding mr-1">
                                            <form:input type="number" class="form-control" placeholder="Postcode" path="userDetails.usrdPostCode"/>
                                        </div>
                                        <div class="col-12 col-xs-12 col-sm-6 no-padding ml-1">
                                            <form:select class="form-control select" data-live-search="true" path="userDetails.usrdState">
                                               <form:option value="NONE" label="--- Select ---"/>
                                               <form:options items="${states}" />
                                            </form:select>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-12 col-xs-12 col-sm-6 no-padding mr-1">
                                            <label class="col-12 control-label">Mobile Number</label>
                                            <form:input class="form-control" placeholder="Enter user mobile number" path="userDetails.usrdMob"/>
                                        </div>
                                        <div class="col-12 col-xs-12 col-sm-6 no-padding ml-1">
                                            <label class="col-12 control-label">Email</label>
                                            <form:input class="form-control" placeholder="Enter user email" path="userDetails.usrdEmail"/>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-12 control-label">Group User</label>
                                    <form:select  class="form-control select" path="userGroups.usrGrpId" data-live-search="true">
                                       <%--<c:forEach items="${userGroupsList}" var="usrGroup">
                                       		<option value="${usrGroup.usrGrpId}">${usrGroup.usrGrpName}</option>
                                       </c:forEach>
                                        --%>
                                       <form:options items="${userGroupsList}" itemLabel="usrGrpName"
            								itemValue="usrGrpId" />
                                    </form:select>
                                </div>
                                
                                <div class="form-group">
                                    <label class="col-12 control-label">User Type</label>
                                    <form:select class="form-control select" path="userTypes.utId" data-live-search="true">
                                       <%--<c:forEach items="${userTypeList}" var="usrType">
                                       		<option value="${usrType.utId}">${usrType.utName}</option>
                                       </c:forEach>--%>
                                       <form:options items="${userTypeList}" itemLabel="utName"
            								itemValue="utId" />
                                    </form:select>
                                </div>

                                <div class="panel-footer bo-0">
                                    <button class="btn btn-default">Clear Form</button>
                                    <input type="submit" value="Update" />
                                </div>

                            </div>

                            <h4>Users List</h4>

                            <div class="panel panel-default">

                                <div class="panel-body">
                                    <table class="table datatable table-bordered table-striped table-actions">
                                        <thead>
                                            <tr>
                                                <th width="50">Agent ID</th>
                                                <th>Name</th>
                                                <th>Group</th>
                                                <th width="100">Email</th>
                                                <th width="100">Phone Number</th>
                                                <th width="100">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach items="${usersList}" var="usr">
	                                            <tr id="trow_1">
	                                                <td class="text-center">${usr.usrName}</td>
	                                                <td>
	                                                    <strong>${usr.userDetails.usrdFullName}</strong>
	                                                </td>
	                                                <td>${usr.userGroups.usrGrpName}</td>
	                                                <td>${usr.userDetails.usrdEmail}</td>
	                                                <td>${usr.userDetails.usrdMob}</td>
	                                                <td>
	                                                    <button class="btn btn-default btn-rounded btn-sm" data-toggle="tooltip" onclick="update('${usr.usrId}')"  title="Edit">
	                                                        <span class="fa fa-pencil"></span>
	                                                    </button>
	                                                   
	                                                    <button class="btn btn-danger btn-rounded btn-sm" onclick="deleteUser('${usr.usrId}')" data-toggle="tooltip" title="Delete">
	                                                        <span class="fa fa-times"></span>
	                                                    </button>
	                                                </td>
	                                            </tr>
	                                         </c:forEach>
                                            <!-- tr id="trow_2">
                                                <td class="text-center">LC123123</td>
                                                <td>
                                                    <strong>Khaja Nazimuddin</strong>
                                                </td>
                                                <td>Group 1</td>
                                                <td>knazimuddin@gmail.com</td>
                                                <td>012-323 1213</td>
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
                                            <tr id="trow_3">
                                                <td class="text-center">LC123041</td>
                                                <td>
                                                    <strong>Mat Sabu</strong>
                                                </td>
                                                <td>Group 1</td>
                                                <td>mat.sabu@gmail.com</td>
                                                <td>013-132 3341</td>
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
                                            </tr-->
                                        </tbody>
                                    </table>
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

  		<jsp:include page="footer.jsp"></jsp:include>

        <!-- START TEMPLATE -->
        <!-- <script type="text/javascript" src="js/settings.js"></script> -->

        <script type="text/javascript" src="../js/plugins.js"></script>
        <script type="text/javascript" src="../js/actions.js"></script>
        <!-- END TEMPLATE -->
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