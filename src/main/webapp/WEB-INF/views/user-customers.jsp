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
    <link rel="stylesheet" type="text/css" id="theme" href="../css/theme-default.css" />     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- EOF CSS INCLUDE -->
</head>

<body>
    <!-- START PAGE CONTAINER -->
    <div class="page-container">

        <!-- START PAGE SIDEBAR -->
        <div class="page-sidebar page-sidebar-fixed scroll mCustomScrollbar _mCS_1 mCS-autoHide">
            <!-- START X-NAVIGATION -->
            <ul class="x-navigation">
                <li class="xn-logo">
                    <a href="admin-panel.html">Admin Panel</a>
                    <a href="#" class="x-navigation-control"></a>
                </li>
                <li class="xn-profile">
                    <a href="#" class="profile-mini">
                        <img src="../assets/images/users/no-image.jpg" />
                    </a>
                    <div class="profile">
                        <div class="profile-image">
                            <img src="../assets/images/users/no-image.jpg" />
                        </div>
                        <div class="profile-data">
                            <div class="profile-data-name">ID Number</div>
                            <div class="profile-data-title">Marketing Officer</div>
                            <!--div class="profile-data-title">Lazz Consultant</div>
                                <div class="profile-data-title">HQ</div-->
                        </div>
                        <div class="profile-controls">
                            <a href="pages-profile.html" class="profile-control-left">
                                <span class="fa fa-info"></span>
                            </a>
                            <a href="pages-messages.html" class="profile-control-right">
                                <span class="fa fa-envelope"></span>
                            </a>
                        </div>
                    </div>
                </li>
                <li>
                    <a href="index.html">
                        <span class="fa fa-globe"></span>
                        <span class="xn-text">Go To Site</span>
                    </a>
                </li>
                <li>
                    <a href="admin-panel.html">
                        <span class="fa fa-desktop"></span>
                        <span class="xn-text">Dashboard</span>
                    </a>
                </li>

                <li class="xn-title">Product</li>
                <li>
                    <a href="products.html">
                        <span class="fa fa-cube"></span> Products</a>
                </li>
                <li>
                    <a href="product-config.html">
                        <span class="fa fa-cogs"></span> Product Configuration</a>
                </li>
                <li>
                    <a href="user-price.html">
                        <span class="fa fa-money"></span> User Price Setting</a>
                </li>
                <li class="xn-title">Sales</li>
                <li>
                    <a href="sales-orders.html">
                        <span class="fa fa-file-text-o"></span> Orders</a>
                </li>
                <li class="xn-title">Blog</li>
                <li>
                    <a href="blog-posts.html">
                        <span class="fa fa-file-text-o"></span> Blog Posts</a>
                </li>

                <li class="xn-title">Invoices</li>
                <li>
                    <a href="invoices.html">
                        <span class="fa fa-files-o"></span> Invoices</a>
                </li>

                <li class="xn-title">Users</li>
                <li>
                    <a href="create-user.html">
                        <span class="fa fa-plus-circle"></span> Create User</a>
                </li>
                <li>
                    <a href="user-group.html">
                        <span class="fa fa-user-plus"></span> Grouping Users</a>
                </li>
                <li class="active">
                    <a href="user-customers.html">
                        <span class="fa fa-users"></span> Customer</a>
                </li>

            </ul>
            <!-- END X-NAVIGATION -->
        </div>
        <!-- END PAGE SIDEBAR -->

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
                <li class="active">Customers</li>
            </ul>
            <!-- END BREADCRUMB -->

            <!-- START RESPONSIVE TABLES -->
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">

                        <div class="panel-heading">
                            <h3 class="panel-title">Customers</h3>
                        </div>

                        <div class="panel-body panel-body-table">

                            <div class="table-responsive">
                                <table class="table table-bordered table-striped table-actions">
                                    <thead>
                                        <tr>
                                            <th width="50">Customer ID</th>
                                            <th>Name</th>
                                            <th>Address</th>
                                            <th width="100">Email</th>
                                            <th width="100">Phone Number</th>
                                            <th width="100">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr id="trow_1">
                                            <td class="text-center">LC827193</td>
                                            <td>
                                                <strong>Mohamad Rais</strong>
                                            </td>
                                            <td>Srinor Lot 44, Kampung Tanjung Batu, 28000 Temerloh Pahang</td>
                                            <td>rais.sahri@gmail.com</td>
                                            <td>011-231 3321</td>
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
                                        <tr id="trow_2">
                                            <td class="text-center">LC123123</td>
                                            <td>
                                                <strong>Khaja Nazimuddin</strong>
                                            </td>
                                            <td>Srinor Lot 44, Kampung Tanjung Batu, 28000 Temerloh Pahang</td>
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
                                            <td>Srinor Lot 44, Kampung Tanjung Batu, 28000 Temerloh Pahang</td>
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
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
            <!-- END RESPONSIVE TABLES -->

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

    <!-- START PRELOADS -->
    <audio id="audio-alert" src="../audio/alert.mp3" preload="auto"></audio>
    <audio id="audio-fail" src="../audio/fail.mp3" preload="auto"></audio>
    <!-- END PRELOADS -->

    <!-- START SCRIPTS -->
    <!-- START PLUGINS -->
    <script type="text/javascript" src="../js/plugins/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="../js/plugins/jquery/jquery-ui.min.js"></script>
    <script type="text/javascript" src="../js/plugins/bootstrap/bootstrap.min.js"></script>
    <!-- END PLUGINS -->

    <!-- THIS PAGE PLUGINS -->
    <script type='text/javascript' src='../js/plugins/icheck/icheck.min.js'></script>
    <script type="text/javascript" src="../js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script>

    <script type="text/javascript" src="../js/plugins/codemirror/codemirror.js"></script>
    <script type='text/javascript' src="../js/plugins/codemirror/mode/htmlmixed/htmlmixed.js"></script>
    <script type='text/javascript' src="../js/plugins/codemirror/mode/xml/xml.js"></script>
    <script type='text/javascript' src="../js/plugins/codemirror/mode/javascript/javascript.js"></script>
    <script type='text/javascript' src="../js/plugins/codemirror/mode/css/css.js"></script>
    <script type='text/javascript' src="../js/plugins/codemirror/mode/clike/clike.js"></script>
    <script type='text/javascript' src="../js/plugins/codemirror/mode/php/php.js"></script>

    <script type="text/javascript" src="../js/plugins/summernote/summernote.js"></script>

    <script type='text/javascript' src='../js/plugins/icheck/icheck.min.js'></script>
    <script type="text/javascript" src="../js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script>

    <script type='text/javascript' src='../js/plugins/noty/jquery.noty.js'></script>
    <script type='text/javascript' src='../js/plugins/noty/layouts/topCenter.js'></script>
    <script type='text/javascript' src='../js/plugins/noty/layouts/topLeft.js'></script>
    <script type='text/javascript' src='../js/plugins/noty/layouts/topRight.js'></script>

    <script type='text/javascript' src='../js/plugins/noty/themes/default.js'></script>
    <!-- END PAGE PLUGINS -->

    <!-- START TEMPLATE -->
    <!-- <script type="text/javascript" src="js/settings.js"></script> -->

    <script type="text/javascript" src="../js/plugins.js"></script>
    <script type="text/javascript" src="../js/actions.js"></script>
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