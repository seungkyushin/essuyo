<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Colorlib">
<meta name="description" content="자리있어요?">
<meta name="keywords" content="이써요">
<link rel="shortcut icon" href="#">
<title>자리 있어요?</title>
<link rel="stylesheet" href="resources/css/bootstrap/bootstrap.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,400i,500,700,900"
	rel="stylesheet">
<link rel="stylesheet" href="resources/css/simple-line-icons.css">
<link rel="stylesheet" href="resources/css/themify-icons.css">
<link rel="stylesheet" href="resources/css/set1.css">
<link rel="stylesheet" href="resources/css/swiper.min.css">
<link rel="stylesheet" href="resources/css/magnific-popup.css">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/tab.css">
</head>
<body>

	<%@ include file="/pageframe/header.jsp"%>

	<!--============================= BOOKING =============================-->
	<div>
		<!-- Swiper -->
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<c:forEach items="${companyImage}" var="imageUrl">
					<div class="swiper-slide">
						<a href="${imageUrl}" class="grid image-link"> 
						<img src="${imageUrl}" class="img-fluid" alt="#">
						</a>
					</div>
				</c:forEach>

			</div>
			<div class="swiper-pagination swiper-pagination-white"></div>
			<div class="swiper-button-next swiper-button-white"></div>
			<div class="swiper-button-prev swiper-button-white"></div>
		</div>
	</div>
	<!--//END BOOKING -->
	<!--============================= RESERVE A SEAT =============================-->
	<section class="reserve-block">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h5>${company.name}</h5>
					<br>
					<p class="reserve-description">${company.discription}</p>
				</div>
				<div class="col-md-6">
					<div class="reserve-seat-block">
						<div class="reserve-rating">
							<span>${company.score}</span>
						</div>
						<div class="review-btn">
							<a href="#" class="btn btn-outline-danger">댓글</a> <span>34
								reviews</span>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>
	<!--//END RESERVE A SEAT -->
	<!--     탭기능 설정 -->
	<div class="container">
		<ul class="tabs">
			<li class="tab-link current" data-tab="tab-1">Information</li>
			<li class="tab-link" data-tab="tab-2">Review</li>
		</ul>
	</div>
	<!-- 탭기능 설정 종료-->
	<!--============================= BOOKING DETAILS =============================-->
	<section class="light-bg booking-details_wrap">
		<div class="container">
			<div class="row">
				<div class="col-md-8 responsive-wrap">
					<div id="tab-1" class="tab-content current">
						<div class="booking-checkbox_wrap">
							<div class="booking-checkbox">
								<p>${company.discription}</p>
								<hr>
							</div>
							<div class="row">
								<c:forEach var="facility" items="${facilityList}">
									<div class="col-md-4">
										<label class="custom-checkbox"> <span
											class="ti-check-box"></span> <span
											class="custom-control-description">${facility}</span>
										</label>
									</div>
								</c:forEach>

							</div>
						</div>
					</div>
					<div id="tab-2" class="tab-content">
						<div class="booking-checkbox_wrap mt-4">
							<h5>34 Reviews</h5>
							<hr>
							<div class="customer-review_wrap">
								<div class="customer-img">
									<img src="resources/images/customer-img1.jpg" class="img-fluid"
										alt="#">
									<p>Amanda G</p>
									<span>35 Reviews</span>
								</div>
								<div class="customer-content-wrap">
									<div class="customer-content">
										<div class="customer-review">
											<h6>Best noodles in the Newyork city</h6>
											<span></span> <span></span> <span></span> <span></span> <span
												class="round-icon-blank"></span>
											<p>Reviewed 2 days ago</p>
										</div>
										<div class="customer-rating">8.0</div>
									</div>

									<p class="customer-text">
									<ul>
										<li><img src="resources/images/review-img1.jpg"
											class="img-fluid" alt="#"></li>
										<li><img src="resources/images/review-img2.jpg"
											class="img-fluid" alt="#"></li>
										<li><img src="resources/images/review-img3.jpg"
											class="img-fluid" alt="#"></li>
									</ul>
									<span>28 people marked this review as helpful</span> <a
										href="#"><span class="icon-like"></span>Helpful</a>
								</div>
							</div>

						</div>
					</div>
				</div>
				<div class="col-md-4 responsive-wrap">
					<div class="contact-info">
						<img src="resources/images/map.jpg" class="img-fluid" alt="#">
						<div class="address">
							<span class="icon-location-pin"></span>
							<p>${company.address}</p>
						</div>
						<div class="address">
							<span class="icon-screen-smartphone"></span>
							<p>${company.number}</p>
						</div>
						<div class="address">
							<span class="icon-link"></span>
							<p>${company.url}</p>
						</div>
						<div class="address">
							<span class="icon-clock"></span>
							<p>${company.time}<br> <span class="close-now">${company.state}</span>
							</p>
						</div>
						<a href="#" class="btn btn-outline-danger btn-contact">메시지 보내기</a>
					</div>
					<div class="follow">
						<div class="follow-img">
							<img style="max-width: 50%" src="${user.image}" class="img-fluid"
								alt="${user.name}">
							<h6>${user.name}</h6>
							<span>${user.comment}</span>
						</div>
						<ul class="social-counts">
							<li></li>
							<li>
								<h6>${user.good}</h6> <span>좋아요</span>
							</li>
							<li></li>
						</ul>
						<a href="#">좋아요!</a>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script src="resources/js/jquery/jquery-3.2.1.min.js"></script>
	<script src="resources/js/popper/popper.min.js"></script>
	<script src="resources/js/bootstrap/bootstrap.min.js"></script>
	<script src="resources/js/jquery/jquery.magnific-popup.js"></script>
	<script src="resources/js/swiper.min.js"></script>
	<script>
		var swiper = new Swiper('.swiper-container', {
			slidesPerView : 3,
			slidesPerGroup : 3,
			loop : true,
			loopFillGroupWithBlank : true,
			pagination : {
				el : '.swiper-pagination',
				clickable : true,
			},
			navigation : {
				nextEl : '.swiper-button-next',
				prevEl : '.swiper-button-prev',
			},
		});
	</script>
	<script>
		if ($('.image-link').length) {
			$('.image-link').magnificPopup({
				type : 'image',
				gallery : {
					enabled : true
				}
			});
		}
		if ($('.image-link2').length) {
			$('.image-link2').magnificPopup({
				type : 'image',
				gallery : {
					enabled : true
				}
			});
		}
	</script>
	<script>
		$(document).ready(function() {

			$('ul.tabs li').click(function() {
				var tab_id = $(this).attr('data-tab');

				$('ul.tabs li').removeClass('current');
				$('.tab-content').removeClass('current');

				$(this).addClass('current');
				$("#" + tab_id).addClass('current');
			})
		})
	</script>

	<%@ include file="/pageframe/footer.jsp"%>

</body>

</html>

