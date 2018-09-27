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
    <link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon.png">
    <title>관리자페이지</title>
    <link href="/resources/css/chartist/chartist.min.css" rel="stylesheet">
    <link href="/resources/css/style.min.css" rel="stylesheet">
    <link href="/resources/css/simple-line-icons.css" rel="stylesheet">
 
    
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
                    <div class="col-md-9">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">${lineGraphName}</h4>
                                 <span style="background-color:#137eff" class="font-16 font-medium label label-rounded">호텔</span>
                                 <span style="background-color:#ced4da" class="font-16 font-medium label label-rounded">렌트카</span>
                               	 <span style="background-color:#f4c63d" class="font-16 font-medium label label-rounded">박물관</span>
                               	 <span style="background-color:#d17905" class="font-16 font-medium label label-rounded">음식점</span> 
                                
                                <div class="sales ct-charts mt-3"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title m-b-5">${sparkLineName}</h5>
                                <h3 class="font-light" id="totalPayment"></h3>
                                <div class="m-t-20 text-center">
                                    <div id="earnings"></div>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title m-b-0">${dounutChartName}</h4>
                                <h2 class="font-light">${totalReservtionCount} 회<span class="font-16 text-success font-medium">+23%</span></h2>
                            	  <span style="background-color:#d70206" class="font-16 font-medium label label-rounded">호텔</span>
                                 <span style="background-color:#f05b4f" class="font-16 font-medium label label-rounded">렌트카</span>
                               	 <span style="background-color:#f4c63d" class="font-16 font-medium label label-rounded">박물관</span>
                               	 <span style="background-color:#d17905" class="font-16 font-medium label label-rounded">음식점</span> 
								
                                <div class="analyzeReservation ct-charts mt-3"></div>
                         
                            </div>
                        </div>
                    </div>
                </div>
     
                <div class="row">
                    <!-- column -->
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">예약 리스트  <a href="javascript:refreshList('reservation')"><span class="icon-refresh"></span></a></h4>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr id="reservation-columns">
                        
                                        </tr>
                                    </thead>
                                    <tbody id="reservation-list">
                               
                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <!-- column -->
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">최근 댓글 목록   <a href="javascript:refreshList('comment')"><span class="icon-refresh"></span></a>
                                
                                </h4>
                            </div>
                            <div id="comment-list" class="comment-widgets" style="height:430px;">
                       
                     
                              
                            </div>
                        </div>
                    </div>
                   
                </div>
     
            </div>
 
            <footer class="footer text-center">
                All Rights Reserved by Nice admin. Designed and Developed by
                <a href="https://wrappixel.com">WrapPixel</a>.
            </footer>
         </div>
  
    </div>


    <script src="/resources/js/jquery/jquery.min.js"></script>
    <script src="/resources/js/popper/umd/popper.min.js"></script>
    <script src="/resources/js/bootstrap/bootstrap.min.js"></script>
    <script src="/resources/js/sparkline.js"></script>
    <script src="/resources/js/userpage/waves.js"></script>
    <script src="/resources/js/userpage/sidebarmenu.js"></script>
    <script src="/resources/js/userpage/custom.min.js"></script>
    <script src="/resources/js/chartist/chartist.min.js"></script>
    <script src="/resources/js/chartist/chartist-plugin-tooltip.min.js"></script>
    <script src="/resources/js/userpage/pages/dashboards/dashboard1.js"></script>
    <script src="/resources/js/utility.js"></script>
    <script src="/resources/js/handlebars.min.js"></script>

  
    <script type="template" id="comment-template">
	  
	<div class="d-flex flex-row comment-row">

        <div class="p-2">
		<a href="#">  
            <img src="{{imageUrl}}" alt="#" width="50" class="rounded-circle">
		</a>
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
                  </span>
            </div>
        </div>
	  </div>

    </script>
    <script type="template" id="reservation-template" >
		<tr>
  		    <td class="txt-oflo"><a href="#">{{typeName}}</a></td>
		   <td class="txt-oflo"><a href="#">{{productName}}</a></td>
           <td><span class="label label-{{stateClass}} label-rounded">{{state}}</span> </td>
           <td class="txt-oflo">{{resDate}}</td>
           <td><span class="font-medium">{{totalPrice}} 원</span></td>
        </tr>
	</script>
	
	
    <script>
    $(document).ready(function(){
   	
    	var total = "${totalPayment}";
    	$("#totalPayment").text(dotSplit(total) + " 원");
    	
    	var type = "${userType}";
    
    	//< 차트를 설정한다.
    	var lineGraph = ${lineGraph};
    	setLineGraph(lineGraph);
    	
    	var dounutChart = ${dounutChart};
	   	setDounutChart(dounutChart);
	   	
	   	var monthsPaymentList = ${MonthsPaymentList};
    	setSparkline(monthsPaymentList);
    
    	
    	//< 유저 타입에 따라 예약 리스트 컬럼명 변경
    	setHTMLReservationColumns(type);
        
    	//< Ajax
    	requestReservationList(type,1)
    	requestCommentList(type,1);
    	
  });
    
    function requestReservationList(type,startPageNum){
    	var requestURL = "/api/reservationList/" + type + "/" + startPageNum +"/2";
    	Ajax("GET",requestURL,function(dataList){
			
			dataList.forEach(function(data){
				var tempData = {};
				tempData['typeName'] = data.typeName;
				tempData['productName'] = data.productName;
				tempData['state'] = data.state;
				if(  data.state == "성공" ){
					tempData['stateClass'] = "success";
				}else if(  data.state == "취소" ){
					tempData['stateClass'] = "danger";
				}else if(  data.state == "완료" ){
					tempData['stateClass'] = "info";
				}
				tempData['resDate'] = data.resDate;
				tempData['totalPrice'] = dotSplit(data.totalPrice);
						
				makeHTML("#reservation-template", "#reservation-list", tempData);
			});
		});
    }
	function requestCommentList(type,startPageNum){
		var requestURL = "/api/commentList/" + type + "/" + startPageNum +"/2";
		Ajax("GET",requestURL,function(dataList){
			
			dataList.forEach(function(data){
				
    				var tempData = {};
        			tempData['imageUrl'] = data.imageUrl;
        			tempData['title'] = data.title;
        			tempData['content'] = data.content;
        			tempData['regDate'] = data.regDate;
        			tempData['state'] = data.state;
        			
           	    	makeHTML("#comment-template", "#comment-list", tempData);
				});
    			
			}); 
    }
    
    function refreshList(type){
    	if("reservation" == type){
    		$("#reservation-list").empty();
    		requestReservationList("${userType}",1);
    	}else if( "comment" == type){
    		$("#comment-list").empty();
    		requestCommentList("${userType}",1);
    	}
    	
    }
    </script>

</body>

</html>