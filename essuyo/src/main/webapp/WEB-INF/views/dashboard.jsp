<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon.png">
    <title>관리자페이지</title>
    <link href="resources/css/chartist/chartist.min.css" rel="stylesheet">
    <link href="resources/css/style.min.css" rel="stylesheet">
    
</head>

<body>
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>

    <div id="main-wrapper" data-navbarbg="skin6" data-theme="light" data-layout="vertical" data-sidebartype="full" data-boxed-layout="full">
        
        <%@ include file="/pageframe/admin-navigation.jsp" %>
        
        <div class="page-wrapper">

            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-5 align-self-center">
                        <h4 class="page-title">Dashboard</h4>
                    </div>
                    <div class="col-7 align-self-center">
                        <div class="d-flex align-items-center justify-content-end">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item">
                                        <a href="#">Home</a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">Dashboard</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">그래프</h4>
                                <div class="sales ct-charts mt-3"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title m-b-5">이번여행 총 경비</h5>
                                <h3 class="font-light">769,800원</h3>
                                <div class="m-t-20 text-center">
                                    <div id="earnings"></div>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title m-b-0">예약횟수</h4>
                                <h2 class="font-light">25회<span class="font-16 text-success font-medium">+23%</span></h2>
                                <div class="m-t-30">
                                    <div class="row text-center">
                                        <div class="col-6 border-right">
                                            <h4 class="m-b-0">58%</h4>
                                            <span class="font-14 text-muted">호텔</span>
                                        </div>
                                        <div class="col-6 border-bottom">
                                            <h4 class="m-b-0">42%</h4>
                                            <span class="font-14 text-muted">렌트카</span>
                                        </div>
                                        <div class="col-6 border-top">
                                            <h4 class="m-b-0">78%</h4>
                                            <span class="font-14 text-muted">박물관</span>
                                        </div>
                                        <div class="col-6 border-left">
                                            <h4 class="m-b-0">10%</h4>
                                            <span class="font-14 text-muted">음식점</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- Email campaign chart -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Ravenue - page-view-bounce rate -->
                <!-- ============================================================== -->
                <div class="row">
                    <!-- column -->
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Latest Sales</h4>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th class="border-top-0">NAME</th>
                                            <th class="border-top-0">STATUS</th>
                                            <th class="border-top-0">DATE</th>
                                            <th class="border-top-0">PRICE</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            
                                            <td class="txt-oflo">Elite admin</td>
                                            <td><span class="label label-success label-rounded">SALE</span> </td>
                                            <td class="txt-oflo">April 18, 2017</td>
                                            <td><span class="font-medium">$24</span></td>
                                        </tr>
                                        <tr>
                                            
                                            <td class="txt-oflo">Real Homes WP Theme</td>
                                            <td><span class="label label-info label-rounded">EXTENDED</span></td>
                                            <td class="txt-oflo">April 19, 2017</td>
                                            <td><span class="font-medium">$1250</span></td>
                                        </tr>
                                        <tr>
                                            
                                            <td class="txt-oflo">Ample Admin</td>
                                            <td><span class="label label-purple label-rounded">Tax</span></td>
                                            <td class="txt-oflo">April 19, 2017</td>
                                            <td><span class="font-medium">$1250</span></td>
                                        </tr>
                                        <tr>
                                            
                                            <td class="txt-oflo">Medical Pro WP Theme</td>
                                            <td><span class="label label-success label-rounded">Sale</span></td>
                                            <td class="txt-oflo">April 20, 2017</td>
                                            <td><span class="font-medium">-$24</span></td>
                                        </tr>
                                        <tr>
                                            
                                            <td class="txt-oflo">Hosting press html</td>
                                            <td><span class="label label-success label-rounded">SALE</span></td>
                                            <td class="txt-oflo">April 21, 2017</td>
                                            <td><span class="font-medium">$24</span></td>
                                        </tr>
                                        <tr>
                                            
                                            <td class="txt-oflo">Digital Agency PSD</td>
                                            <td><span class="label label-danger label-rounded">Tax</span> </td>
                                            <td class="txt-oflo">April 23, 2017</td>
                                            <td><span class="font-medium">-$14</span></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- Ravenue - page-view-bounce rate -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Recent comment and chats -->
                <!-- ============================================================== -->
                <div class="row">
                    <!-- column -->
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">최근 댓글 목록</h4>
                            </div>
                            <div id="comment-list" class="comment-widgets" style="height:430px;">
                       
                     
                              
                            </div>
                        </div>
                    </div>
                   
                </div>
                <!-- ============================================================== -->
                <!-- Recent comment and chats -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <footer class="footer text-center">
                All Rights Reserved by Nice admin. Designed and Developed by
                <a href="https://wrappixel.com">WrapPixel</a>.
            </footer>
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>

    <script src="resources/js/jquery/jquery.min.js"></script>
    <script src="resources/js/popper/umd/popper.min.js"></script>
    <script src="resources/js/bootstrap/bootstrap.min.js"></script>
    <script src="resources/js/sparkline.js"></script>
    <script src="resources/js/userpage/waves.js"></script>
    <script src="resources/js/userpage/sidebarmenu.js"></script>
    <script src="resources/js/userpage/custom.min.js"></script>
    <script src="resources/js/chartist/chartist.min.js"></script>
    <script src="resources/js/chartist/chartist-plugin-tooltip.min.js"></script>
    <script src="resources/js/userpage/pages/dashboards/dashboard1.js"></script>
    <script src="resources/js/handlebars.min.js"></script>
    
    <script type="template" id="comment-template">
    <div class="d-flex flex-row comment-row">
        <div class="p-2">
            <img src="{{imageUrl}}" alt="user" width="50" class="rounded-circle">
        </div>
        <div class="comment-text w-100">
            <h6 class="font-medium">{{title}}</h6>
            <span class="m-b-15 d-block">{{content}}</span>
            <div class="comment-footer">
                <span class="text-muted float-right">{{regDate}}</span>
                <span class="label label-rounded label-primary">{{state}}</span>
                <span class="action-icons">
                    <a href="javascript:void(0)">
                        <i class="ti-pencil-alt"></i>
                    </a>
                    <a href="javascript:void(0)">
                        <i class="ti-check"></i>
                    </a>
                    <a href="javascript:void(0)">
                        <i class="ti-heart"></i>
                    </a>
                </span>
            </div>
        </div>
    </div>
    </script>
    <script>
    $(document).ready(function(){
    	
    	$.ajax({
    		type : "GET",
    		url : "api/commentList/user/1",
    		success : function(data){
    			data.forEach(function(item){
    				
    				var tempData = {};
        			tempData['imageUrl'] = item.imageUrl;
        			tempData['title'] = item.title;
        			tempData['content'] = item.content;
        			tempData['regDate'] = item.regDate;
        			tempData['state'] = item.state;
        			
           	    	makeHTML("#comment-template", "#comment-list", tempData);
           	    	
    			});
    			
    	    	
    		},
    		error : function(error){
    			
    		}
    		
    		
    		
    	});
    	
    	
    });
    
  
    </script>
</body>

</html>