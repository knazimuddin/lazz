<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- META SECTION -->
    <title>Lazz Susu Kambing Admin Panel</title>
   	<jsp:include page="gui-common-header-include.jsp"></jsp:include>
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
                <li class="active">All Invoices</li>
            </ul>
            <!-- END BREADCRUMB -->

            <div class="page-content-wrap">

                    <div class="row">
                        <div class="col-md-12">
    
                            <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">Invoices List</h3>
                                        <ul class="panel-controls">
                                            <li>
                                                <a href="#" class="panel-collapse">
                                                    <span class="fa fa-angle-down"></span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="panel-refresh">
                                                    <span class="fa fa-refresh"></span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="panel-remove">
                                                    <span class="fa fa-times"></span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="panel-body">
                                        <table class="table datatable">
                                            <thead>
                                                <tr>
                                                    <th>Sequence Number</th>
                                                    <th>Username</th>
                                                    <th>Email</th>
                                                    <th>Phone Number</th>
                                                    <th>Date</th>
                                                    <th>Shipping Address</th>
                                                    <th>Reciever Name</th>
                                                    <th>Product</th>
                                                    <th>Minimal Order</th>
                                                    <th>Stage</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>1</td>
                                                    <td>Mohamad Salah</td>
                                                    <td>user@gmail.com</td>
                                                    <td>017 993 1405</td>
                                                    <td>2018/04/25</td>
                                                    <td>Srinor Lot 44, Kampung Tanjung Batu, 28000 Temerloh Pahang</td>
                                                    <td>Siti Khadijah</td>
                                                    <td>LazzCafe (x3)
                                                        <br>LazzChoco (x2)</td>
                                                    <td>5</td>
                                                    <td>
                                                        <span class="label label-success label-form">Done</span>
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
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                        </div>
                    </div>
                    </div>
        </div>
        <!-- END PAGE CONTENT WRAPPER -->
    </div>
    <!-- END PAGE CONTENT -->
    
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
    <audio id="audio-alert" src="<c:out value='/lazz/static/audio/alert.mp3'/>" preload="auto"></audio>
    <audio id="audio-fail" src="<c:out value='/lazz/static/audio/fail.mp3'/>" preload="auto"></audio>
    <!-- END PRELOADS -->

    <!-- START SCRIPTS -->
    <!-- START PLUGINS -->
    <script type="text/javascript" src="<c:out value='/lazz/static/js/plugins/jquery/jquery.min.js'/>"></script>
    <script type="text/javascript" src="<c:out value='/lazz/static/js/plugins/jquery/jquery-ui.min.js'/>"></script>
    <script type="text/javascript" src="<c:out value='/lazz/static/js/plugins/bootstrap/bootstrap.min.js'/>"></script>
    <!-- END PLUGINS -->

    <!-- THIS PAGE PLUGINS -->
    <script type='text/javascript' src="<c:out value='/lazz/static/js/plugins/icheck/icheck.min.js'/>"></script>
    <script type="text/javascript" src="<c:out value='/lazz/static/js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js'/>"></script>

    <script type="text/javascript" src="<c:out value='/lazz/static/js/plugins/codemirror/codemirror.js'/>"></script>
    <script type='text/javascript' src="<c:out value='/lazz/static/js/plugins/codemirror/mode/htmlmixed/htmlmixed.js'/>"></script>
    <script type='text/javascript' src="<c:out value='/lazz/static/js/plugins/codemirror/mode/xml/xml.js'/>"></script>
    <script type='text/javascript' src="<c:out value='/lazz/static/js/plugins/codemirror/mode/javascript/javascript.js'/>"></script>
    <script type='text/javascript' src="<c:out value='/lazz/static/js/plugins/codemirror/mode/css/css.js'/>"></script>
    <script type='text/javascript' src="<c:out value='/lazz/static/js/plugins/codemirror/mode/clike/clike.js'/>"></script>
    <script type='text/javascript' src="<c:out value='/lazz/static/js/plugins/codemirror/mode/php/php.js'/>"></script>

    <script type="text/javascript" src="<c:out value='/lazz/static/js/plugins/summernote/summernote.js'/>"></script>

    <script type='text/javascript' src="<c:out value='/lazz/static/js/plugins/icheck/icheck.min.js'/>"></script>
    <script type="text/javascript" src="<c:out value='/lazz/static/js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js'/>"></script>

    <script type='text/javascript' src="<c:out value='/lazz/static/js/plugins/noty/jquery.noty.js'/>"></script>
    <script type='text/javascript' src="<c:out value='/lazz/static/js/plugins/noty/layouts/topCenter.js'/>"></script>
    <script type='text/javascript' src="<c:out value='/lazz/static/js/plugins/noty/layouts/topLeft.js'/>"></script>
    <script type='text/javascript' src="<c:out value='/lazz/static/js/plugins/noty/layouts/topRight.js'/>"></script>
    <script type="text/javascript" src="<c:out value='/lazz/static/js/plugins/datatables/jquery.dataTables.min.js'/>"></script>

    <script type='text/javascript' src="<c:out value='/lazz/static/js/plugins/noty/themes/default.js'/>"></script>
    <!-- END PAGE PLUGINS -->

    <!-- START TEMPLATE -->
    <!-- <script type="text/javascript" src="<c:out value='/lazz/static/js/settings.js"></script> -->

    <script type="text/javascript" src="<c:out value='/lazz/static/js/plugins.js'/>"></script>
    <script type="text/javascript" src="<c:out value='/lazz/static/js/actions.js'/>"></script>
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