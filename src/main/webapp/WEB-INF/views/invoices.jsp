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
                <li class="active">
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
                <li>
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
                    <a href="#">Forms Stuff</a>
                </li>
                <li class="active">All Invoices</li>
            </ul>
            <!-- END BREADCRUMB -->

            <div class="page-content-wrap">

                    <div class="row">
                        <div class="col-md-12">
    
                            <form>
                            <div class="block">
                                <h4>Product Information</h4>
                                <div class="panel-body">
    
                                    <div class="form-group">
                                        <label class="col-12 control-label">Sequence Number</label>
                                        <div class="col-12">
                                            <input type="number" class="form-control" placeholder="Enter the sequence number">
                                        </div>
                                    </div>
    
                                    <div class="form-group">
                                        <label class="col-12 control-label">Username</label>
                                        <div class="col-12">
                                            <input type="text" class="form-control" placeholder="Enter the username">
                                        </div>
                                    </div>
    
                                    <div class="form-group">
                                        <label class="col-12 control-label">Accept By</label>
                                        <div class="col-12">
                                            <input type="text" class="form-control" placeholder="Enter the acceptence name">
                                        </div>
                                    </div>
    
                                    <div class="form-group">
                                        <label class="col-12 control-label">Date</label>
                                        <div class="col-12">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <span class="fa fa-calendar"></span>
                                                </span>
                                                <input type="text" class="form-control datepicker" value="2014-11-01">
                                            </div>
                                        </div>
                                    </div>
    
    
                                    <div class="form-group">
                                        <label class="col-12 control-label">Shipping Address</label>
                                        <div class="col-12">
                                            <input type="text" class="form-control" placeholder="Address Line 1">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-12">
                                            <input type="text" class="form-control" placeholder="Address Line 2">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-12 col-xs-12 col-sm-6 no-padding mr-1">
                                                <input type="number" class="form-control" placeholder="Posscode">
                                            </div>
                                            <div class="col-12 col-xs-12 col-sm-6 no-padding ml-1">
                                                <select class="form-control select">
                                                    <option>-- State --</option>
                                                    <option>Pahang</option>
                                                    <option>Selangor</option>
                                                    <option>Kuala Lumpur</option>
                                                    <option>Putrajaya</option>
                                                    <option>Perak</option>
                                                    <option>Johor</option>
                                                    <option>Terengganu</option>
                                                    <option>Kelantan</option>
                                                    <option>Perlis</option>
                                                    <option>Kedah</option>
                                                    <option>Sabah</option>
                                                    <option>Sarawak</option>
                                                    <option>Negeri Sembilan</option>
                                                    <option>Labuan</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
    
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-12 col-xs-12 col-sm-6 no-padding mr-1">
                                                <label class="col-12 control-label">Mobile Number</label>
                                                <input type="number" class="form-control" placeholder="Enter receptient mobile number">
                                            </div>
                                            <div class="col-12 col-xs-12 col-sm-6 no-padding ml-1">
                                                <label class="col-12 control-label">Email</label>
                                                <input type="text" class="form-control" placeholder="Enter receptient email">
                                            </div>
                                        </div>
                                    </div>
                                </div>
    
                                <div class="panel-footer">
                                    <button class="btn btn-default">Clear Form</button>
                                    <button class="btn btn-primary pull-right">Confirm</button>
                                </div>
                            </div>
                            </form>
    
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
    <script type="text/javascript" src="../js/plugins/datatables/jquery.dataTables.min.js"></script>

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