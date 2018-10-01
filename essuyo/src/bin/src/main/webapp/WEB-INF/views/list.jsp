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
<title>자리 있어요??</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="resources/css/bootstrap/bootstrap.min.css">
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,400i,500,700,900"
	rel="stylesheet">
<!-- Simple line Icon -->
<link rel="stylesheet" href="resources/css/simple-line-icons.css">
<!-- Themify Icon -->
<link rel="stylesheet" href="resources/css/themify-icons.css">
<!-- Hover Effects -->
<link rel="stylesheet" href="resources/css/set1.css">
<!-- Main CSS -->
<link rel="stylesheet" href="resources/css/style.css">
</head>
<body>
	<!--============================= HEADER =============================-->
	<%@ include file="/pageframe/header.jsp"%>
	<!--//END HEADER -->
	<!--============================= DETAIL =============================-->
	<section>
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-7 responsive-wrap">
					<div class="row detail-filter-wrap">
						<div class="col-md-4 featured-responsive">
							<div class="detail-filter-text">
								<p>
									34 개의 검색된 <span id="type1"></span>
								</p>
							</div>
						</div>
						<!-- 필터 나눔 기준 -->
						<div class="col-md-8 featured-responsive">
							<div class="detail-filter">
								<p>필터</p>
								<form class="filter-dropdown">
									<select class="custom-select mb-2 mr-sm-2 mb-sm-0"
										id="inlineFormCustomSelect">
										<option selected>기본순</option>
										<option value="1">인기순</option>
										<option value="2">댓글 많은순</option>
										<option value="3">평점 높은순</option>
									</select>
								</form>
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
							<label class="custom-control custom-checkbox"> <input
								type="checkbox"> <span class="custom-control-indicator"></span>
								<span class="custom-control-description">주차공간 여부</span>
							</label>
						</div>
						<div class="col-sm-12 col-md-6 col-lg-4 col-xl-3">
							<label class="custom-control custom-checkbox"> <input
								type="checkbox"> <span class="custom-control-indicator"></span>
								<span class="custom-control-description">와이파이 / 인터넷 </span>
							</label>
						</div>
						<div class="col-sm-12 col-md-6 col-lg-4 col-xl-3">
							<label class="custom-control custom-checkbox"> <input
								type="checkbox"> <span class="custom-control-indicator"></span>
								<span class="custom-control-description">흡연 / 금연 </span>
							</label>
						</div>
						<div class="col-sm-12 col-md-6 col-lg-4 col-xl-3">
							<label class="custom-control custom-checkbox"> <input
								type="checkbox"> <span class="custom-control-indicator"></span>
								<span class="custom-control-description">신용카드 가능 여부</span>
							</label>
						</div>
						<input id="search" type="button" value="검색">
					</div>



					<!-- 판매리스트 div -->
					<div id="salesList" class="row light-bg detail-options-wrap">

					</div>
				</div>


				<!-- 맵 div -->
				<div class="col-md-5 responsive-wrap map-wrap">
					<div class="map-fix" data-toggle="affix">
						<div id="map" data-lat="37.556537" data-lon="126.945200"
							data-zoom="14"></div>
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
	<script src="resources/js/jquery/jquery-3.2.1.min.js"></script>
	<script src="resources/js/popper/popper.min.js"></script>
	<script src="resources/js/bootstrap/bootstrap.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>


	<!-- 지도 JQuery -->
	<script>
				$(".map-icon").click(function() {
					$(".map-fix").toggle();
				});
	</script>


	<script>
        
        function myMap() {
            var maplat = $('#map').data('lat');
            var maplon = $('#map').data('lon');
            var mapzoom = $('#map').data('zoom');

            var map = new google.maps.Map(document.getElementById('map'), {
                setCenter: {
                    lat: maplat,
                    lng: maplon
                },
                zoom: mapzoom,
                scrollwheel: false
            });
            var marker = new google.maps.Marker({
                setPosition: {
                    lat: maplat,
                    lng: maplon
                },
                map: map,
                title: 'We are here!'
            });
        }
    </script>


	<!-- ajaxJQuery -->
	<script>
	function test(){
		$.ajax({
			type : 'GET',
			url : '/api/list?start=' + start,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "GET"
			},	
				
			success : function(data) {
				$("#type1").text(data.sales[0].type);
				
				var source = $("#template").html();
				var template = Handlebars.compile(source);
				var resultHTML = "";
				data.sales.forEach(function(data2){
					$("#salesList").append(template(data2));
					//resultHTML += template(data2);
				})
				//$("#salesList").html(resultHTML);
			}
		});
	}
		</script>



	<script>		
	var start = 0;
		 $(document).ready(function(){
		 test();
            
            $(window).scroll(function(){
                if($(window).scrollTop() == $(document).height() - $(window).height()){
                	start++;
                	test();
                }
                 
            });

		});
		
		
	</script>
	<!-- 판매리스트 소스 -->
	<script id=template type="text/x-handlerbars-template">
	 <div class="col-sm-6 col-lg-12 col-xl-6 featured-responsive">
								<div class="featured-place-wrap">
									<a href="/detail"> <img	src="{{image}}" class="img-fluid" alt="#">
										<span class="featured-rating-orange">{{score}}</span>
										<div class="featured-title-box">
											<h6>{{name}}</h6>
											<p>{{type}}</p>
											<span>• </span>
											<p>3 Reviews</p>
																						
											<ul>
												<li><span class="icon-location-pin"></span>
													<p>{{address}}</p></li>
												<li><span class="icon-screen-smartphone"></span>
													<p>{{number}}</p></li>
												<li><span class="icon-link"></span>
													<p>{{url}}</p></li>
 											</ul>
											<div class="bottom-icons">
												<div class="closed-now">{{state}}</div>
												<span class="ti-heart"></span> <span class="ti-bookmark"></span>
											</div>
										</div>
									</a>
								</div>		
</div>			
</script>



	<!-- Map JS (Please change the API key below. Read documentation for more info) -->
	<script	src="https://maps.googleapis.com/maps/api/js?callback=myMap&key=AIzaSyB_SsV7PnpCZxu2cphySVYNkiKehtF_ogY">
	</script>

</body>
</html>
