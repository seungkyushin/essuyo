 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
  <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" sizes="16x16" href="../resources/images/favicon.png">
    <title>프로필</title>
    <link href="../resources/css/style.min.css" rel="stylesheet">
    <link href="../resources/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Sans+KR">
</head>
<body>
  <header class="topbar" data-navbarbg="skin6">
            <nav class="navbar top-navbar navbar-expand-md navbar-light">
                <div class="navbar-header" data-logobg="skin5">
                    <!-- This is for the sidebar toggle which is visible on mobile only -->
                    <a class="nav-toggler waves-effect waves-light d-block d-md-none" href="javascript:void(0)">
                        <i class="ti-menu ti-close"></i>
                    </a>
                    <!-- ============================================================== -->
                    <!-- Logo -->
                    <!-- ============================================================== -->
                    <div class="navbar-brand">
                        <a href="/" class="logo">
                            <!-- Logo icon -->
                            <b class="logo-icon">
                                <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
                                <!-- Dark Logo icon -->
                                <img src="/resources/images/logo-icon.png" alt="homepage" class="dark-logo" />
                                <!-- Light Logo icon -->
                                <img src="/resources/images/logo-light-icon.png" alt="homepage" class="light-logo" />
                            </b>
                            <!--End Logo icon -->
                            <!-- Logo text -->
                            <span class="logo-text">
                                <!-- dark Logo text -->
                                <img src="/resources/images/logo-text.png" alt="homepage" class="dark-logo" />
                                <!-- Light Logo text -->
                                <img src="/resources/images/logo-light-text.png" class="light-logo" alt="homepage" />
                            </span>
                        </a>
                    </div>
                    <a class="topbartoggler d-block d-md-none waves-effect waves-light" href="javascript:void(0)" data-toggle="collapse" data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="ti-more"></i>
                    </a>
                </div>
<!-- 
                <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin6">
    
                    <ul class="navbar-nav float-left mr-auto">
                       	<li class="nav-item search-box">
                        </li>
                    </ul>
          
                    <ul class="navbar-nav float-right">
 
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark pro-pic" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="/resources/images/users/1.jpg" alt="user" class="rounded-circle" width="31"></a>
                            <div class="dropdown-menu dropdown-menu-right user-dd animated">
                                <a class="dropdown-item" href="javascript:void(0)"><i class="ti-user m-r-5 m-l-5"></i> My Profile</a>
                                <a class="dropdown-item" href="javascript:void(0)"><i class="ti-wallet m-r-5 m-l-5"></i> My Balance</a>
                                <a class="dropdown-item" href="javascript:void(0)"><i class="ti-email m-r-5 m-l-5"></i> Inbox</a>
                            </div>
                        </li>
       
                    </ul>
                </div> -->
            </nav>
        </header>
        
    <aside class="left-sidebar" data-sidebarbg="skin5">
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar">
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav">
                    <ul id="sidebarnav">
                                           <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/user/dashboard" aria-expanded="false">
                                <i class="mdi mdi-av-timer"></i>
                                <span class="hide-menu">예약 종합화면</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/user/profile" aria-expanded="false">
                                <i class="mdi mdi-account-network"></i>
                                <span class="hide-menu">회원정보</span>
                            </a>
                        </li>
                           <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/user/companyRegist" aria-expanded="false">
                                <i class="mdi mdi-arrange-bring-forward"></i>
                                <span class="hide-menu">개인사업장 관리</span>
                            </a>
                        </li>
                        <c:if test="${ !empty sessionScope.companyLogin}">
                                       
                          <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/user/dashboardCompany" aria-expanded="false">
                                <i class="mdi mdi-arrange-bring-forward"></i>
                                <span class="hide-menu">개인사업장 종합화면</span>
                            </a>
                        </li>
                        </c:if>
                         <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/form" aria-expanded="false">
                                <i class="mdi mdi-arrange-bring-forward"></i>
                                <span class="hide-menu">Form Basic</span>
                            </a>
                        </li>
                      
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/table" aria-expanded="false">
                                <i class="mdi mdi-border-none"></i>
                                <span class="hide-menu">Table</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/icon" aria-expanded="false">
                                <i class="mdi mdi-face"></i>
                                <span class="hide-menu">Icon</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/starter" aria-expanded="false">
                                <i class="mdi mdi-file"></i>
                                <span class="hide-menu">Blank</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/error" aria-expanded="false">
                                <i class="mdi mdi-alert-outline"></i>
                                <span class="hide-menu">404</span>
                            </a>
                        </li>
                    </ul>
                </nav>
                <!-- End Sidebar navigation -->
            </div>
            <!-- End Sidebar scroll-->
        </aside>
        
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="../resources/js/utility.js"></script>
    
<div class="overlay"></div>
<div class="modal" id="myModal" >


  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 id= "modal-title" class="modal-title">${errorMessageTitle}</h4>
        <button type="button" class="close" data-dismiss="modal" onclick='ColseMyAlert()'>&times;</button>
      </div>


      <!-- Modal body -->
      <div id= "modal-body" class="modal-body">
       ${errorMessage}
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" onclick='ColseMyAlert()' data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>

<script>
if( "${errorMessageTitle}" != "" && "${errorMessage}" != "" ){
	myAlert();
}
</script>
</body>
</html>