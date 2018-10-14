<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
    <link rel="stylesheet" type="text/css" id="theme" href="<c:url value='/static/css/theme-default.css' />" />     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
                <li class="active">Dashboard</li>
            </ul>
            <!-- END BREADCRUMB -->

            <!-- PAGE CONTENT WRAPPER -->
            <div class="page-content-wrap">

                <!-- START WIDGETS -->
                <div class="row">
                    <div class="col-md-4">

                        <!-- START WIDGET MESSAGES -->
                        <div class="widget widget-default widget-item-icon">
                            <div class="widget-item-left">
                                <span class="fa fa-shopping-cart"></span>
                            </div>
                            <div class="widget-data">
                                <div class="widget-int num-count">9</div>
                                <div class="widget-title">Pending Order</div>
                                <div class="widget-subtitle">In your mailbox</div>
                            </div>
                            <div class="widget-controls">
                                <a href="#" class="widget-control-right widget-remove" data-toggle="tooltip" data-placement="top" title="Remove Widget">
                                    <span class="fa fa-times"></span>
                                </a>
                            </div>
                        </div>
                        <!-- END WIDGET MESSAGES -->

                    </div>
                    <div class="col-md-4">

                        <!-- START WIDGET REGISTRED -->
                        <div class="widget widget-default widget-item-icon">
                            <div class="widget-item-left">
                                <span class="fa fa-user"></span>
                            </div>
                            <div class="widget-data">
                                <div class="widget-int num-count">375</div>
                                <div class="widget-title">Registred users</div>
                                <div class="widget-subtitle">On your website</div>
                            </div>
                            <div class="widget-controls">
                                <a href="#" class="widget-control-right widget-remove" data-toggle="tooltip" data-placement="top" title="Remove Widget">
                                    <span class="fa fa-times"></span>
                                </a>
                            </div>
                        </div>
                        <!-- END WIDGET REGISTRED -->

                    </div>
                    <div class="col-md-4">

                        <!-- START WIDGET CLOCK -->
                        <div class="widget widget-info widget-padding-sm">
                            <div class="widget-big-int plugin-clock">00:00</div>
                            <div class="widget-subtitle plugin-date">Loading...</div>
                            <div class="widget-controls">
                                <a href="#" class="widget-control-right widget-remove" data-toggle="tooltip" data-placement="left" title="Remove Widget">
                                    <span class="fa fa-times"></span>
                                </a>
                            </div>
                            <div class="widget-buttons widget-c3">
                                <div class="col">
                                    <a href="#">
                                        <span class="fa fa-clock-o"></span>
                                    </a>
                                </div>
                                <div class="col">
                                    <a href="#">
                                        <span class="fa fa-bell"></span>
                                    </a>
                                </div>
                                <div class="col">
                                    <a href="#">
                                        <span class="fa fa-calendar"></span>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <!-- END WIDGET CLOCK -->

                    </div>
                </div>
                <!-- END WIDGETS -->
                <div class="row">
                    <div class="col-md-6">

                        <!-- START SALES BLOCK -->
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <div class="panel-title-box">
                                    <h3>Sales</h3>
                                    <span>Sales activity by period you selected</span>
                                </div>
                                <ul class="panel-controls panel-controls-title">
                                    <li>
                                        <div id="reportrange" class="dtrange">
                                            <span></span>
                                            <b class="caret"></b>
                                        </div>
                                    </li>
                                    <li>
                                        <a href="#" class="panel-fullscreen rounded">
                                            <span class="fa fa-expand"></span>
                                        </a>
                                    </li>
                                </ul>

                            </div>
                            <div class="panel-body">
                                <div class="row stacked">
                                    <div class="col-md-12">
                                        <div class="progress-list">
                                            <div class="pull-left">
                                                <strong>In Queue</strong>
                                            </div>
                                            <div class="pull-right">75%</div>
                                            <div class="progress progress-small progress-striped active">
                                                <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"
                                                    style="width: 75%;">75%</div>
                                            </div>
                                        </div>
                                        <div class="progress-list">
                                            <div class="pull-left">
                                                <strong>Shipped Products</strong>
                                            </div>
                                            <div class="pull-right">450/500</div>
                                            <div class="progress progress-small progress-striped active">
                                                <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"
                                                    style="width: 90%;">90%</div>
                                            </div>
                                        </div>
                                        <div class="progress-list">
                                            <div class="pull-left">
                                                <strong class="text-danger">Returned Products</strong>
                                            </div>
                                            <div class="pull-right">25/500</div>
                                            <div class="progress progress-small progress-striped active">
                                                <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"
                                                    style="width: 5%;">5%</div>
                                            </div>
                                        </div>
                                        <div class="progress-list">
                                            <div class="pull-left">
                                                <strong class="text-warning">Progress Today</strong>
                                            </div>
                                            <div class="pull-right">75/150</div>
                                            <div class="progress progress-small progress-striped active">
                                                <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"
                                                    style="width: 50%;">50%</div>
                                            </div>
                                        </div>
                                        <p>
                                            <span class="fa fa-warning"></span> Data update in end of each hour. You can update it manual by pressign
                                            update button</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- END SALES BLOCK -->

                    </div>
                    <div class="common-modal modal fade" id="common-Modal1" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-content">
                            <ul class="list-inline item-details">
                                <li>
                                    <a href="http://themifycloud.com/downloads/janux-premium-responsive-bootstrap-admin-dashboard-template/">Admin templates</a>
                                </li>
                                <li>
                                    <a href="http://themescloud.org">Bootstrap themes</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- START DASHBOARD CHART -->
                    <div class="chart-holder" id="dashboard-area-1" style="height: 200px;"></div>
                    <div class="block-full-width">

                    </div>
                    <!-- END DASHBOARD CHART -->

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

        <script type="text/javascript" src="<c:url value='/static/js/plugins.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/static/js/actions.js'/>"></script>

        <script type="text/javascript" src="<c:url value='/static/js/demo_dashboard.js'/>"></script>
        <!-- END TEMPLATE -->
        <!-- END SCRIPTS -->
</body>

</html>