<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" type="image/png" sizes="16x16"
	href="/resources/images/favicon.png">
<title>관리자페이지</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR">
<link href="../resources/css/chartist/chartist.min.css" rel="stylesheet">
<link href="../resources/css/style.min.css" rel="stylesheet">
<link href="../resources/css/simple-line-icons.css" rel="stylesheet">
<link href="../resources/css/style.css" rel="stylesheet" >

</head>

<body>
	<div class="preloader">
		<div class="lds-ripple">
			<div class="lds-pos"></div>
			<div class="lds-pos"></div>
		</div>
	</div>

	<div id="main-wrapper" data-navbarbg="skin6" data-theme="light"
		data-layout="vertical" data-sidebartype="full"
		data-boxed-layout="full">


		<%@ include file="/pageframe/admin-navigation.jsp"%>
		<div class="page-wrapper">

			<div class="page-breadcrumb">

				<div class="row">
					<div class="col-5 align-self-center">
						<h4 class="page-title">상품 관리</h4>
					</div>
				</div>
			</div>

			<div class="container-fluid">

				<div class="page-breadcrumb">
					<div class="row"></div>
				</div>

				<div class="row">

					<div class="col-lg-6 col-xlg-6 col-md-6">
						<div class="card card-body">
							<h4 class="card-title">판매 상품 리스트
							<a style= "float: right" href="/product/register"><i class="icon-plus"></i></a>
							</h4>
							
							<div class="table-responsive">

								<table style="overflow-y:auto;overflow-x:hidden;" id="product-list-table" class="table table-hover">
									<thead>
										<tr>
											<th scope="col">상품번호</th>
											<th scope="col">상품명</th>
											<th scope="col">판매 날짜</th>
											<th scope="col">가격</th>
										</tr>
									</thead>
									<tbody id="product-list">
									</tbody>
								</table>
								
								
							</div>
						</div>
					</div>
				<div class="col-lg-4">
					<div id="product-info" style="display:none">
					
					</div>
				</div>
				</div>

			</div>
		</div>
	</div>


	<script src="../resources/js/jquery/jquery.min.js"></script>
	<script src="../resources/js/popper/umd/popper.min.js"></script>
	<script src="../resources/js/bootstrap/bootstrap.min.js"></script>
	<script src="../resources/js/sparkline.js"></script>
	<script src="../resources/js/userpage/waves.js"></script>
	<script src="../resources/js/userpage/sidebarmenu.js"></script>
	<script src="../resources/js/userpage/custom.min.js"></script>
	<script src="../resources/js/chartist/chartist.min.js"></script>
	<script src="../resources/js/chartist/chartist-plugin-tooltip.min.js"></script>
	<script src="../resources/js/userpage/pages/dashboards/dashboard1.js"></script>
	<script src="../resources/js/utility.js"></script>
	<script src="../resources/js/handlebars.min.js"></script>

<script type="template" id="product-template">
<div class="featured-place-wrap">
<a href="/product/reservation?company={{companyId}}&product={{productId}}">
	<img src="{{url}}" class="img-fluid" alt="#"> 
	<div class="featured-title-box">
		<h6>{{name}}</h6>
		<i class="icon-direction"></i>
		<p>{{discription}}</p>
		<ul>
			<li><span class="icon-calendar"></span>
				<p>{{saleDate}}</p></li>
			<li><span class="icon-wallet"></span>
				<p>{{price}} 원</p></li>

		</ul>
		<div class="bottom-icons">
			<div class="open-now">{{state}}</div>
			<button style="float:left" class="btn btn-danger">삭제</button>
			<button style="float:right" class="btn btn-info">수정</button>
		</div>
				
	</div>
</a>
</div>
</script>

<script type="template" id="product-table-template">
<tr data-index={{number}}>
	<td>{{number}}</td>
	<td>{{name}}</td>
	<td>{{saleDate}}</td>
	<td>{{price}} 원</td>
</tr>
</script>

<script>
$(document).ready(function(){

	if("${companyId}" != ""){
	var requestURL = "/api/productList/" + ${companyId};
	Ajax("GET",requestURL,function(dataList){
		
		dataList.forEach(function(data){
			var tempData = {};
			
			tempData['number'] = data.id;
			tempData['score'] = data.score;
			tempData['name'] = data.name;
			tempData['saleDate'] = data.saleStartDate + " - " + data.saleEndDate;
			tempData['price'] = data.price;
										
			makeHTML("#product-table-template", "#product-list", tempData);
		});
	});
	}
	
	
	
	$("#product-list-table").on("click",function(event){
			
		$("#product-info").empty();
		$("#product-info").hide();
		
		var requestURL = "/api/product/" + event.target.parentElement.dataset.index;
		Ajax("GET",requestURL,function(data){
			

				var tempData = {};
				tempData['companyId'] = ${companyId};
				tempData['productId'] = data.id;
				tempData['url'] = data.url[0];
				tempData['number'] = data.id;
				tempData['name'] = data.name;
				tempData['score'] = data.score;
				tempData['discription'] = data.discription;
				tempData['saleDate'] = data.saleStartDate + " - " + data.saleEndDate;
				tempData['price'] = data.price;
											
				makeHTML("#product-template", "#product-info", tempData);
				
				$("#product-info").show();
			
		});
	});
	

});

function getProduct(productId){
	
	var requestURL = "/api/product/" + productId;
	Ajax("GET",requestURL,function(dataList){
		
		dataList.forEach(function(data){
			var tempData = {};
			tempData['url'] = data.url;
			tempData['score'] = data.score;
			tempData['name'] = data.name;
			tempData['discription'] = data.discription;
			tempData['saleDate'] = data.saleStartDate + " - " + data.saleEndDate;
			tempData['price'] = data.price;
			tempData['state'] = data.state;
										
			makeHTML("#product-template", "#product-info", tempData);
		});
	});
	
	
}

</script>

</body>

</html>