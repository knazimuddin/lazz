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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'/>">
    <link rel="stylesheet" type="text/css" id="theme" href="<c:url value='/static/css/util.css'/>" />
    <!-- DATATABLE -->
    <link rel="stylesheet" type="text/css" href="<c:url value='/static/DataTables/datatables.min.css'/>" />
    <!-- EOF CSS INCLUDE -->
</head>

<body>
    <!-- START PAGE CONTAINER -->
    <div class="page-container">

        <!-- START PAGE SIDEBAR -->
   		<jsp:include page="sidemenu.jsp"></jsp:include>
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
                    <a href="#" class="logout-prompt">
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
                    <span class="fa fa-arrow-circle-o-left"></span>Product List</h2>
            </div>
            <!-- END PAGE TITLE -->

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
                                                <th width="300" class="t-mid">Quantity (Cartons)</th>
                                                <th width="150">Price</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr id="trow_1">
                                                <td class="text-center">1</td>
                                                <td>
                                                    <a href="product-detail.html">
                                                        <img class="data-img" src="../images/banner-03.jpg">
                                                        <strong>Lazz Susu Kambing Asli</strong>
                                                    </a>
                                                </td>
                                                <td class="t-mid t-middle">
                                                    <div class="qty mt-5">
                                                        <span class="minus bg-dark">-</span>
                                                        <input type="number" class="count" name="qty" value="1">
                                                        <span class="plus bg-dark">+</span>
                                                    </div>
                                                </td>
                                                <td class="t-middle">
                                                    RM 360
                                                </td>
                                            </tr>

                                            <tr id="trow_2">
                                                <td class="text-center">1</td>
                                                <td>
                                                    <a href="product-detail.html">
                                                        <img class="data-img" src="../images/banner-03.jpg">
                                                        <strong>Lazz Susu Kambing Coklat</strong>
                                                    </a>
                                                </td>
                                                <td class="t-mid t-middle">
                                                    <div class="qty mt-5">
                                                        <span class="minus bg-dark">-</span>
                                                        <input type="number" class="count" name="qty" value="1">
                                                        <span class="plus bg-dark">+</span>
                                                    </div>
                                                </td>
                                                <td class="t-middle">
                                                    RM 360
                                                </td>
                                            </tr>

                                            <tr id="trow_3">
                                                <td class="text-center">1</td>
                                                <td>
                                                    <a href="product-detail.html">
                                                        <img class="data-img" src="../images/banner-03.jpg">
                                                        <strong>Lazz Susu Kambing Kurma</strong>
                                                    </a>
                                                </td>
                                                <td class="t-mid t-middle">
                                                    <div class="qty mt-5">
                                                        <span class="minus bg-dark">-</span>
                                                        <input type="number" class="count" name="qty" value="1">
                                                        <span class="plus bg-dark">+</span>
                                                    </div>
                                                </td>
                                                <td class="t-middle">
                                                    RM 360
                                                </td>
                                            </tr>

                                            <tr id="trow_4">
                                                <td class="text-center">1</td>
                                                <td>
                                                    <a href="product-detail.html">
                                                        <img class="data-img" src="../images/banner-03.jpg">
                                                        <strong>Lazzcafe</strong>
                                                    </a>
                                                </td>
                                                <td class="t-mid t-middle">
                                                    <div class="qty mt-5">
                                                        <span class="minus bg-dark">-</span>
                                                        <input type="number" class="count" name="qty" value="1">
                                                        <span class="plus bg-dark">+</span>
                                                    </div>
                                                </td>
                                                <td class="t-middle">
                                                    RM 360
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>

                            </div>
                        </div>
                        <div class="w-size1 m-l-auto">
                            <h3>Total</h3>
                            <h1>RM 1,350</h1>
                        </div>

                        <div class="panel-footer">
                            <a class="btn btn-primary pull-right restock-prompt">Order</a>
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

    <script type="text/javascript" src="../js/plugins/bootstrap/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="../js/plugins/bootstrap/bootstrap-timepicker.min.js"></script>
    <script type="text/javascript" src="../js/plugins/bootstrap/bootstrap-colorpicker.js"></script>
    <script type="text/javascript" src="../js/plugins/bootstrap/bootstrap-file-input.js"></script>
    <script type="text/javascript" src="../js/plugins/bootstrap/bootstrap-select.js"></script>
    <script type="text/javascript" src="../js/plugins/tagsinput/jquery.tagsinput.min.js"></script>

    <script type='text/javascript' src='../js/plugins/noty/jquery.noty.js'></script>
    <script type='text/javascript' src='../js/plugins/noty/layouts/topCenter.js'></script>
    <script type='text/javascript' src='../js/plugins/noty/layouts/topLeft.js'></script>
    <script type='text/javascript' src='../js/plugins/noty/layouts/topRight.js'></script>

    <script type='text/javascript' src='../js/plugins/noty/themes/default.js'></script>
    <!-- END PAGE PLUGINS -->


    <!-- START THIS PAGE PLUGINS-->
    <script type='text/javascript' src='../js/plugins/icheck/icheck.min.js'></script>
    <script type="text/javascript" src="../js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script>

    <script type="text/javascript" src="../js/plugins/blueimp/jquery.blueimp-gallery.min.js"></script>
    <script type="text/javascript" src="../js/plugins/dropzone/dropzone.min.js"></script>
    <script type="text/javascript" src="../js/plugins/icheck/icheck.min.js"></script>
    <!-- END THIS PAGE PLUGINS-->

    <!-- START TEMPLATE -->
    <!-- <script type="text/javascript" src="js/settings.js"></script> -->

    <script type="text/javascript" src="../js/plugins.js"></script>
    <script type="text/javascript" src="../js/actions.js"></script>
    <!-- END TEMPLATE -->

    <!-- DATATABLE -->
    <script type="text/javascript" src="../DataTables/datatables.min.js"></script>
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
    <script>
        $(document).ready(function () {
            $('.count').prop('disabled', true);
            $(document).on('click', '.plus', function () {
                $('.count').val(parseInt($('.count').val()) + 1);
            });
            $(document).on('click', '.minus', function () {
                $('.count').val(parseInt($('.count').val()) - 1);
                if ($('.count').val() == 0) {
                    $('.count').val(0);
                }
            });
        });
    </script>
    <!--===============================================================================================-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.28.4/sweetalert2.all.js"></script>
    <script type="text/javascript">
        $('.block2-btn-addcart').each(function () {
            var nameProduct = $(this).parent().parent().parent().find('.block2-name').html();
            $(this).on('click', function () {
                swal(nameProduct, "is added to cart !", "success");
            });
        });

        $('.block2-btn-addwishlist').each(function () {
            var nameProduct = $(this).parent().parent().parent().find('.block2-name').html();
            $(this).on('click', function () {
                swal(nameProduct, "is added to wishlist !", "success");
            });
        });

        $('.primary-prompt').each(function () {
            var nameProduct = $(this).find('.block2-name').html();
            $(this).on('click', function () {
                swal(nameProduct, "This is primary popover", "info");
            });
        });

        $('.info-prompt').each(function () {
            var nameProduct = $(this).find('.block2-name').html();
            $(this).on('click', function () {
                swal(nameProduct, "This is primary popover", "info");
            });
        });

        $('.primary-prompt').each(function () {
            var nameProduct = $(this).find('.block2-name').html();
            $(this).on('click', function () {
                swal(nameProduct, "This is primary popover", "info");
            });
        });

        $('.success-prompt').each(function () {
            var nameProduct = $(this).find('.block2-name').html();
            $(this).on('click', function () {
                swal(nameProduct, "This is primary popover", "success");
            });
        });

        $('.warning-prompt').each(function () {
            var nameProduct = $(this).find('.block2-name').html();
            $(this).on('click', function () {
                swal(nameProduct, "This is primary popover", "warning");
            });
        });

        $('.danger-prompt').each(function () {
            var nameProduct = $(this).find('.block2-name').html();
            $(this).on('click', function () {
                swal(nameProduct, "This is primary popover", "error");
            });
        });

        $('.delete-prompt').click(function () {
            swal({
                title: 'Are you sure?',
                text: "It will permanently deleted !",
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!',
                cancelButtonText: "Cancel",
                closeOnConfirm: true,
                closeOnCancel: true
            }).then(function (isConfirm) {
                if (isConfirm) {
                    swal("Deleted!", "Delete successfull!", "success");
                } else {
                    swal("Canceled", "Your imaginary file is safe :)", "error");
                }
            })
        })

        $('.logout-prompt').click(function () {
            swal({
                title: 'Are you sure?',
                text: "You will redirect to the homepage",
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, log out',
                cancelButtonText: "Stay sign in",
                closeOnConfirm: true,
                closeOnCancel: true
            }).then(function (isConfirm) {
                if (isConfirm) {
                    swal("Log out!", "You have successfully log out", "success");
                } else {
                    swal("Stay", "You stay sign in :)", "error");
                }
            })
        })

        $('.restock-prompt').click(function () {
            swal({
                title: 'Are you sure?',
                text: "You will redirect to the homepage",
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, proceed order',
                cancelButtonText: "Cancel",
                closeOnConfirm: true,
                closeOnCancel: true
            }).then(function (isConfirm) {
                if (isConfirm) {
                    swal("Order sent!", "You have successfully place your order", "success");
                } else {
                    swal("Canceled", "You canceled your order", "error");
                }
            })
        })

    </script>
    <!-- END SCRIPTS -->
</body>

</html>