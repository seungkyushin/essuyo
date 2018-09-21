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
									34 Results For <span>Restaurant</span>
								</p>
							</div>
						</div>
						<div class="col-md-8 featured-responsive">
							<div class="detail-filter">
								<p>Filter by</p>
								<form class="filter-dropdown">
									<select class="custom-select mb-2 mr-sm-2 mb-sm-0"
										id="inlineFormCustomSelect">
										<option selected>Best Match</option>
										<option value="1">One</option>
										<option value="2">Two</option>
										<option value="3">Three</option>
									</select>
								</form>
								<form class="filter-dropdown">
									<select class="custom-select mb-2 mr-sm-2 mb-sm-0"
										id="inlineFormCustomSelect1">
										<option selected>Restaurants</option>
										<option value="1">One</option>
										<option value="2">Two</option>
										<option value="3">Three</option>
									</select>
								</form>
								<div class="map-responsive-wrap">
									<a class="map-icon" href="#"><span
										class="icon-location-pin"></span></a>
								</div>
							</div>
						</div>
					</div>
					<div class="row detail-checkbox-wrap">
						<div class="col-sm-12 col-md-6 col-lg-4 col-xl-3">

							<label class="custom-control custom-checkbox"> <input
								type="checkbox" class="custom-control-input"> <span
								class="custom-control-indicator"></span> <span
								class="custom-control-description">Bike Parking</span>
							</label>
						</div>
						<div class="col-sm-12 col-md-6 col-lg-4 col-xl-3">
							<label class="custom-control custom-checkbox"> <input
								type="checkbox" class="custom-control-input"> <span
								class="custom-control-indicator"></span> <span
								class="custom-control-description">Wireless Internet </span>
							</label>
						</div>

						<div class="col-sm-12 col-md-6 col-lg-4 col-xl-3">

							<label class="custom-control custom-checkbox"> <input
								type="checkbox" class="custom-control-input"> <span
								class="custom-control-indicator"></span> <span
								class="custom-control-description">Smoking Allowed </span>
							</label>
						</div>
						<div class="col-sm-12 col-md-6 col-lg-4 col-xl-3">
							<label class="custom-control custom-checkbox"> <input
								type="checkbox" class="custom-control-input"> <span
								class="custom-control-indicator"></span> <span
								class="custom-control-description">Street Parking</span>
							</label>
						</div>

						<div class="col-sm-12 col-md-6 col-lg-4 col-xl-3">

							<label class="custom-control custom-checkbox"> <input
								type="checkbox" class="custom-control-input"> <span
								class="custom-control-indicator"></span> <span
								class="custom-control-description">Special</span>
							</label>
						</div>
						<div class="col-sm-12 col-md-6 col-lg-4 col-xl-3">
							<label class="custom-control custom-checkbox"> <input
								type="checkbox" class="custom-control-input"> <span
								class="custom-control-indicator"></span> <span
								class="custom-control-description">Accepts Credit cards</span>
							</label>
						</div>

						<div class="col-sm-12 col-md-6 col-lg-4 col-xl-3">

							<label class="custom-control custom-checkbox"> <input
								type="checkbox" class="custom-control-input"> <span
								class="custom-control-indicator"></span> <span
								class="custom-control-description">Pets Friendly</span>
							</label>
						</div>
					</div>



					<div id class="row light-bg detail-options-wrap">
					
                     <ul id=sales></ul>

						<div class="col-sm-6 col-lg-12 col-xl-6 featured-responsive">
							<div class="featured-place-wrap">
								<a href="/detail"> <img src="resources/images/featured1.jpg"
									class="img-fluid" alt="#"> <span
									class="featured-rating-orange ">6.5</span>
									<div class="featured-title-box">
										<h6>Burger &amp; Lobster</h6>
										<p>Restaurant</p>
										<span>• </span>
										<p>3 Reviews</p>
										<span> • </span>
										<p>
											<span>$$$</span>$$
										</p>
										<ul>
											<li><span class="icon-location-pin"></span>
												<p>1301 Avenue, Brooklyn, NY 11230</p></li>
											<li><span class="icon-screen-smartphone"></span>
												<p>+44 20 7336 8898</p></li>
											<li><span class="icon-link"></span>
												<p>https://burgerandlobster.com</p></li>

										</ul>
										<div class="bottom-icons">
											<div class="closed-now">CLOSED NOW</div>
											<span class="ti-heart"></span> <span class="ti-bookmark"></span>
										</div>
									</div>
								</a>
							</div>
						</div>
<div class="row light-bg detail-options-wrap"> -->
<!-- 						<div class="col-sm-6 col-lg-12 col-xl-6 featured-responsive"> -->
<!-- 							<div class="featured-place-wrap"> -->
<!-- 								<a href="/detail"> <img src="resources/images/featured1.jpg" -->
<!-- 									class="img-fluid" alt="#"> <span -->
<!-- 									class="featured-rating-orange ">6.5</span> -->
<!-- 									<div class="featured-title-box"> -->
<!-- 										<h6>Burger &amp; Lobster</h6> -->
<!-- 										<p>Restaurant</p> -->
<!-- 										<span>• </span> -->
<!-- 										<p>3 Reviews</p> -->
<!-- 										<span> • </span> -->
<!-- 										<p> -->
<!-- 											<span>$$$</span>$$ -->
<!-- 										</p> -->
<!-- 										<ul> -->
<!-- 											<li><span class="icon-location-pin"></span> -->
<!-- 												<p>1301 Avenue, Brooklyn, NY 11230</p></li> -->
<!-- 											<li><span class="icon-screen-smartphone"></span> -->
<!-- 												<p>+44 20 7336 8898</p></li> -->
<!-- 											<li><span class="icon-link"></span> -->
<!-- 												<p>https://burgerandlobster.com</p></li> -->

<!-- 										</ul> -->
<!-- 										<div class="bottom-icons"> -->
<!-- 											<div class="closed-now">CLOSED NOW</div> -->
<!-- 											<span class="ti-heart"></span> <span class="ti-bookmark"></span> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</a> -->
<!-- 							</div> -->
<!-- 						</div> -->

<div class="row light-bg detail-options-wrap"> -->
<!-- 						<div class="col-sm-6 col-lg-12 col-xl-6 featured-responsive"> -->
<!-- 							<div class="featured-place-wrap"> -->
<!-- 								<a href="/detail"> <img src="resources/images/featured1.jpg" -->
<!-- 									class="img-fluid" alt="#"> <span -->
<!-- 									class="featured-rating-orange ">6.5</span> -->
<!-- 									<div class="featured-title-box"> -->
<!-- 										<h6>Burger &amp; Lobster</h6> -->
<!-- 										<p>Restaurant</p> -->
<!-- 										<span>• </span> -->
<!-- 										<p>3 Reviews</p> -->
<!-- 										<span> • </span> -->
<!-- 										<p> -->
<!-- 											<span>$$$</span>$$ -->
<!-- 										</p> -->
<!-- 										<ul> -->
<!-- 											<li><span class="icon-location-pin"></span> -->
<!-- 												<p>1301 Avenue, Brooklyn, NY 11230</p></li> -->
<!-- 											<li><span class="icon-screen-smartphone"></span> -->
<!-- 												<p>+44 20 7336 8898</p></li> -->
<!-- 											<li><span class="icon-link"></span> -->
<!-- 												<p>https://burgerandlobster.com</p></li> -->

<!-- 										</ul> -->
<!-- 										<div class="bottom-icons"> -->
<!-- 											<div class="closed-now">CLOSED NOW</div> -->
<!-- 											<span class="ti-heart"></span> <span class="ti-bookmark"></span> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</a> -->
<!-- 							</div> -->
<!-- 						</div> -->

<div class="row light-bg detail-options-wrap"> -->
<!-- 						<div class="col-sm-6 col-lg-12 col-xl-6 featured-responsive"> -->
<!-- 							<div class="featured-place-wrap"> -->
<!-- 								<a href="/detail"> <img src="resources/images/featured1.jpg" -->
<!-- 									class="img-fluid" alt="#"> <span -->
<!-- 									class="featured-rating-orange ">6.5</span> -->
<!-- 									<div class="featured-title-box"> -->
<!-- 										<h6>Burger &amp; Lobster</h6> -->
<!-- 										<p>Restaurant</p> -->
<!-- 										<span>• </span> -->
<!-- 										<p>3 Reviews</p> -->
<!-- 										<span> • </span> -->
<!-- 										<p> -->
<!-- 											<span>$$$</span>$$ -->
<!-- 										</p> -->
<!-- 										<ul> -->
<!-- 											<li><span class="icon-location-pin"></span> -->
<!-- 												<p>1301 Avenue, Brooklyn, NY 11230</p></li> -->
<!-- 											<li><span class="icon-screen-smartphone"></span> -->
<!-- 												<p>+44 20 7336 8898</p></li> -->
<!-- 											<li><span class="icon-link"></span> -->
<!-- 												<p>https://burgerandlobster.com</p></li> -->

<!-- 										</ul> -->
<!-- 										<div class="bottom-icons"> -->
<!-- 											<div class="closed-now">CLOSED NOW</div> -->
<!-- 											<span class="ti-heart"></span> <span class="ti-bookmark"></span> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</a> -->
<!-- 							</div> -->
<!-- 						</div> -->

<div class="row light-bg detail-options-wrap"> -->
<!-- 						<div class="col-sm-6 col-lg-12 col-xl-6 featured-responsive"> -->
<!-- 							<div class="featured-place-wrap"> -->
<!-- 								<a href="/detail"> <img src="resources/images/featured1.jpg" -->
<!-- 									class="img-fluid" alt="#"> <span -->
<!-- 									class="featured-rating-orange ">6.5</span> -->
<!-- 									<div class="featured-title-box"> -->
<!-- 										<h6>Burger &amp; Lobster</h6> -->
<!-- 										<p>Restaurant</p> -->
<!-- 										<span>• </span> -->
<!-- 										<p>3 Reviews</p> -->
<!-- 										<span> • </span> -->
<!-- 										<p> -->
<!-- 											<span>$$$</span>$$ -->
<!-- 										</p> -->
<!-- 										<ul> -->
<!-- 											<li><span class="icon-location-pin"></span> -->
<!-- 												<p>1301 Avenue, Brooklyn, NY 11230</p></li> -->
<!-- 											<li><span class="icon-screen-smartphone"></span> -->
<!-- 												<p>+44 20 7336 8898</p></li> -->
<!-- 											<li><span class="icon-link"></span> -->
<!-- 												<p>https://burgerandlobster.com</p></li> -->

<!-- 										</ul> -->
<!-- 										<div class="bottom-icons"> -->
<!-- 											<div class="closed-now">CLOSED NOW</div> -->
<!-- 											<span class="ti-heart"></span> <span class="ti-bookmark"></span> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</a> -->
<!-- 							</div> -->
<!-- 						</div> -->


<!-- 					<div class="row light-bg detail-options-wrap"> -->
<!-- 						<div class="col-sm-6 col-lg-12 col-xl-6 featured-responsive"> -->
<!-- 							<div class="featured-place-wrap"> -->
<!-- 								<a href="/detail"> <img src="resources/images/featured1.jpg" -->
<!-- 									class="img-fluid" alt="#"> <span -->
<!-- 									class="featured-rating-orange ">6.5</span> -->
<!-- 									<div class="featured-title-box"> -->
<!-- 										<h6>Burger &amp; Lobster</h6> -->
<!-- 										<p>Restaurant</p> -->
<!-- 										<span>• </span> -->
<!-- 										<p>3 Reviews</p> -->
<!-- 										<span> • </span> -->
<!-- 										<p> -->
<!-- 											<span>$$$</span>$$ -->
<!-- 										</p> -->
<!-- 										<ul> -->
<!-- 											<li><span class="icon-location-pin"></span> -->
<!-- 												<p>1301 Avenue, Brooklyn, NY 11230</p></li> -->
<!-- 											<li><span class="icon-screen-smartphone"></span> -->
<!-- 												<p>+44 20 7336 8898</p></li> -->
<!-- 											<li><span class="icon-link"></span> -->
<!-- 												<p>https://burgerandlobster.com</p></li> -->

<!-- 										</ul> -->
<!-- 										<div class="bottom-icons"> -->
<!-- 											<div class="closed-now">CLOSED NOW</div> -->
<!-- 											<span class="ti-heart"></span> <span class="ti-bookmark"></span> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</a> -->
<!-- 							</div> -->
<!-- 						</div> -->



					</div>
				</div>
				<div class="col-md-5 responsive-wrap map-wrap">
					<div class="map-fix">
						<!-- data-toggle="affix" -->
						<!-- Google map will appear here! Edit the Latitude, Longitude and Zoom Level below using data-attr-*  -->

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
 
	<!-- 지도 JQuery -->
	<script>
		$(".map-icon").click(function() {
			$(".map-fix").toggle();
		});
	</script>
	<script>
		$(document).ready(function{
			
			getAllList(0)
		});
		
		// Want to customize colors? go to snazzymaps.com
		function myMap() {
			var maplat = $('#map').data('lat');
			var maplon = $('#map').data('lon');
			var mapzoom = $('#map').data('zoom');
			// Styles a map in night mode.
			var map = new google.maps.Map(document.getElementById('map'), {
				setCenter : {
					lat : maplat,
					lng : maplon
				},
				zoom : mapzoom,
				scrollwheel : false
			});
			var marker = new google.maps.Marker({
				setPosition : {
					lat : maplat,
					lng : maplon
				},
				map : map,
				title : 'We are here!'
			});
			
			 function(json);
		}
	</script>

	<!-- 	판매리스트 JQuery -->
	<script>
	function getAllList(data) {//전체 목록에 대한 함수 처리
		$.getJSON("/api/list", function(data) {
		 	
			$(data).each(function() {
			str += "<li data-rno='"+this.rno+"' class='replyLi'>" + this.rno	+ ":" + this.replytext;
			});
			$("#sales").html(str);
		});
	}
	</script>

<!-- ajaxJQuery -->
	<script>
				$.ajax({
					type : 'get',
					url : '/api/list',
					headers : {	"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "get"
					},
					dataType : 'text',
					data : JSON.stringify({
						id : id,
						name : name,
						discription : discription,
						address : address,
						number : number,
						url : url,
						state : state,
						time : time,
						totalVisit : totalVisit,
						todayVisit : todayVisit,
						grade : grade,
						areaListId : areaListId,
						businessTypeId : businessTypeId}),
						
					
				});
		
	</script>

	<!-- Map JS (Please change the API key below. Read documentation for more info) -->

	<script
		src="https://maps.googleapis.com/maps/api/js?callback=myMap&key=AIzaSyCfXSrmNzLTyVzkWowN6L2a5jQ-TTXigqA"></script>
</body>

</html>

