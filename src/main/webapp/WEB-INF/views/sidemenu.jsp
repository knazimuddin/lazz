 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                 <img src="<c:url value='/static/assets/images/users/no-image.jpg' />" />
             </a>
             <div class="profile">
                 <div class="profile-image">
                     <img src="<c:url value='/static/assets/images/users/no-image.jpg'/>" />
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
         <li class="active">
             <a href="admin-panel.html">
                 <span class="fa fa-desktop"></span>
                 <span class="xn-text">Dashboard</span>
             </a>
         </li>
         <li class="xn-title">Product</li>
         <li>
             <a href="<c:url value='/admin/product/product-view'/>">
                 <span class="fa fa-cube"></span> Products</a>
         </li>
         <li>
             <a href="<c:url value='/admin/product/product-config-view'/>">
                 <span class="fa fa-cogs"></span> Product Configuration</a>
         </li>
         <li>
             <a href="<c:url value='/admin/price/product-price-rules-view'/>">
                 <span class="fa fa-money"></span> User Price Setting</a>
         </li>
         <li class="xn-title">Sales</li>
         <li>
             <a href="sales-orders.html">
                 <span class="fa fa-file-text-o"></span> Orders</a>
         </li>
         <li class="xn-title">
             <a href="<c:url value='/admin/invoice/place-invoice'/>">
                 <span class="fa fa-retweet"></span> Place Invoice</a>
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
             <a href="<c:url value='/admin/user/users'/>">
                 <span class="fa fa-plus-circle"></span> Create User</a>
         </li>
         <li>
             <a href="<c:url value='/admin/user/usergroup'/>">
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
