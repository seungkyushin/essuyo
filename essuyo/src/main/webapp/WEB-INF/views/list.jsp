<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Colorlib">
<meta name="description" content="자리있어요?">
<meta name="keywords" content="이써요">
<!-- Page Title -->
<title>판매 리스트</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="/resources/css/bootstrap/bootstrap.min.css">
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,400i,500,700,900"
	rel="stylesheet">
<!-- Simple line Icon -->
<link rel="stylesheet" href="/resources/css/simple-line-icons.css">
<!-- Themify Icon -->
<link rel="stylesheet" href="/resources/css/themify-icons.css">
<!-- Hover Effects -->
<link rel="stylesheet" href="/resources/css/set1.css">
<!-- Main CSS -->
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="/resources/css/check-box.css">
</head>
<body>
	<!--============================= HEADER =============================-->
	<%@ include file="/pageframe/header.jsp"%>
	<!--============================= DETAIL =============================-->
	<section>
		<div class="container-fluid">
			<div class="row">
			
				<div class="col-md-7 responsive-wrap">
					<div class="row detail-filter-wrap">
						<div class="col-md-4 featured-responsive">
							<div class="detail-filter-text">
								<p>
									<span id="count1">0</span>  개의 검색된 <span id="type1"></span>
								</p>			
							</div>
						</div>
						<!-- 필터 나눔 기준 -->
						<div class="col-md-8 featured-responsive">
							<div class="detail-filter">
								<button class="btn btn-success" id="search">검색</button>
								<div class="map-responsive-wrap">
									<a class="map-icon" href="#"><span
										class="icon-location-pin"></span></a>
								</div>
							</div>
						</div>
					</div>

      
                   
                  
					<!-- 필터 세부사항 div -->
					<div class="row detail-checkbox-wrap">
						
						<div class="col-sm-12 col-md-6 col-lg-4 col-xl-3">
							<label class="custom-control availability-checkbox checkbox-day">
							<input type="checkbox" value="1" name="filter" class="custom-control-input">
								<span class="custom-control-indicator"></span>
								<span> 주차공간 여부 </span>
							</label>
						</div>
								
						<div class="col-sm-12 col-md-6 col-lg-4 col-xl-3">
							<label class="custom-control availability-checkbox checkbox-day">
							<input type="checkbox" value="1" name="filter" class="custom-control-input">
								<span class="custom-control-indicator"></span>
								<span> 인터넷 가능 여부 </span>
							</label>
						</div>
						
						<div class="col-sm-12 col-md-6 col-lg-4 col-xl-3">
							<label class="custom-control availability-checkbox checkbox-day">
							<input type="checkbox" value="1" name="filter" class="custom-control-input">
								<span class="custom-control-indicator"></span>
								<span> 흡연 가능 여부 </span>
							</label>
						</div>
						
						<div class="col-sm-12 col-md-6 col-lg-4 col-xl-3">
							<label class="custom-control availability-checkbox checkbox-day">
							<input type="checkbox" value="1" name="filter" class="custom-control-input">
								<span class="custom-control-indicator"></span>
								<span> 신용카드 가능 여부 </span>
							</label>
						</div>
					</div>	
					
							<!-- 판매리스트 div -->
					<div id="salesList" class="row light-bg detail-options-wrap">
						</div>
					</div>

					<!-- 맵 div -->
					<div class="col-md-5 responsive-wrap map-wrap">
						<div class="map-fix">				
							<div id="map" data-zoom="17"></div>
						</div>
					</div>
			
		</div>
		</div>
	</section>
	
	<!--//END DETAIL -->
	<!--============================= FOOTER =============================-->
	<%@ include file="/pageframe/footer.jsp"%>
	<!--//END FOOTER -->

	<!-- jQuery, Bootstrap JS. -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="/resources/js/jquery/jquery-3.2.1.min.js"></script>
	<script src="/resources/js/popper/popper.min.js"></script>
	<script src="/resources/js/bootstrap/bootstrap.min.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

	<script>
 		$(".map-icon").click(function() {
 			$(".map-fix").toggle();
 		});
	</script>
	
		
		
<!-- 맵 JQuery -->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=YkyfY8yLi0st2FbjVXIG&callback=initMap&submodules=geocoder"></script>

<script>
var map = new naver.maps.Map("map", {
    center: new naver.maps.LatLng(37.556777, 126.942118),
    zoom: 13,
    mapTypeControl: true
});

var infoWindow = new naver.maps.InfoWindow({
    anchorSkew: true
});

map.setCursor('pointer');


function searchAddressToCoordinate(address) {
    naver.maps.Service.geocode({
        address: address
    }, function(status, response) {
        if (status === naver.maps.Service.Status.ERROR) {
            return myAlert('ERROR !' ,"찾을 수 없는 주소 입니다!");
        }

        
        var item = response.result.items[0],
            addrType = item.isRoadAddress ? '[도로명 주소]' : '[지번 주소]',
            point = new naver.maps.Point(item.point.x, item.point.y);
             infoWindow.setContent([
            	  '<div>',
                  '<h3>${data.sales[i].name}</h3>',            
                  '</div>'
            ].join(''));

        map.setCenter(point);
        infoWindow.open(map, point);
    });
}

function initGeocoder() {

	$.ajax({
		type : 'GET',
		url : encodeURI('/api/list?start=' + start + "&value=" + value + "&type="+type + "&name="+ name),
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "GET"
		},
		success : function(data) {
			
	for(var i =0;i<data.length;i++){
    searchAddressToCoordinate('${data.sales[i].address}');	
	}	
}
});
}	


naver.maps.onJSContentLoaded = initGeocoder;
 </script>


	<!-- ajaxJQuery -->
	<script>	
		function test() {
			
			var values = document.getElementsByName("filter");
			var value = "";
			for(var i=0; i<values.length;i++){
				if(values[i].checked){
					value = value + values[i].value+",";
				}
			}
			
			value = value.slice(0, value.length -1);	
		
			
			$.ajax({
				type : 'GET',
				url : encodeURI('/api/list?start=' + start + "&value=" + value + "&type="+type + "&name="+ name),
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "GET"
				},

				success : function(data) {
					var salesCount = data.salesCount;
					$("#type1").text(type);
					$("#count1").text(salesCount);
					
					
					var source = $("#template").html();
					var template = Handlebars.compile(source);
					var resultHTML = "";
					data.sales.forEach(function(data2) {
						$("#salesList").append(template(data2));

						
						if (data2.score >= 4) {
							$(".score_info").attr('class', 'featured-rating-green');
						} else if (data2.score >= 2) {
							$(".score_info").attr('class', 'featured-rating-orange');
						} else {
							$(".score_info").attr('class', 'featured-rating');
						}

						if (data2.state == "영업중") {
							$(".state-info").attr('class', 'open-now');
						} else {
							$(".state-info").attr('class','closed-now');
						}

					})
				}
	
			});
		}
	</script>


	<script>
		var start = 0;
		var value="";
		var type=${type};
		var name=${name};
		
		
		$(document).ready(function() {
			test();		

	    $(window).scroll(function() {
		if ($(window).scrollTop() == $(document).height()- $(window).height()) {
		start++;	
	    test();			
	    }

	    });
	    
	    
		$("#search").click(function() {
			$("#salesList").html("");      
 		test();
 		});
					
		});
	</script>

	<!-- 판매리스트 소스 -->
	<script id=template type="text/x-handlerbars-template">
	 <div class="col-sm-6 col-lg-12 col-xl-6 featured-responsive">
								<div class="featured-place-wrap">
									<a href="/company/detail?id={{id}}"> <img	src="{{image}}" class="img-fluid" alt="#">
										<span class="score_info">{{score}}</span>
										<div class="featured-title-box">
											<h6>{{name}}</h6>
											<p>{{type}}</p>
											<span>• </span>
											<p>{{commentCount}}개의 댓글 수</p>
																						
											<ul>
												<li><span class="icon-location-pin"></span>
													<p>{{address}}</p></li>
												<li><span class="icon-screen-smartphone"></span>
													<p>{{number}}</p></li>
												<li><span class="icon-link"></span>
													<p>{{homepage}}</p></li>
 											</ul>
											<div class="bottom-icons">
												<div class="state-info">{{state}}</div>
											</div>
										</div>
									</a>
								</div>		
</div>			
</script>

</body>

</html>
