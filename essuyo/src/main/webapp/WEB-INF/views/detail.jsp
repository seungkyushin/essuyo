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
<link rel="stylesheet" href="resources/css/simple-line-icons.css">
<link rel="stylesheet" href="resources/css/themify-icons.css">
<link rel="stylesheet" href="resources/css/set1.css">
<link rel="stylesheet" href="resources/css/swiper.min.css">
<link rel="stylesheet" href="resources/css/magnific-popup.css">
<link rel="stylesheet" href="resources/css/style.css">
</head>
<body>

	<%@ include file="/pageframe/header.jsp"%>

	<!--============================= BOOKING =============================-->
	<div>
		<!-- Swiper -->
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<c:forEach items="${company.image}" var="imageUrl">
					<div class="swiper-slide">
						<a href="${imageUrl}" class="grid image-link"> <img
							src="${imageUrl}" class="img-fluid" alt="#">
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
							<span>${score}</span>
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

	<!--============================= BOOKING DETAILS =============================-->
	<section class="light-bg booking-details_wrap">
		<div class="container">
			<div class="row">
				<div class="col-md-8 responsive-wrap">

					<div class="booking-checkbox_wrap">
						<div class="booking-checkbox">
							<p>${company.discription}</p>
							<hr>
						</div>

						<div class="row">
							<c:forEach var="item" items="${company.facility}">
								<div class="col-md-4">
									<label class="custom-checkbox"> <span
										class="ti-check-box"></span> <span
										class="custom-control-description">${item}</span>
									</label>
								</div>
							</c:forEach>

						</div>
					</div>


					<div id="comment-list" class="booking-checkbox_wrap mt-4">
						<h5>${company.review}Reviews</h5>
						<hr>


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
							<p>${company.time}<br>
								<c:choose>
									<c:when test="${company.state == '영업중'}">
										<span class="open-now">${company.state}</span>
									</c:when>
									<c:when test="${company.state == '영업종료'}">
										<span class="closed-now">${company.state}</span>
									</c:when>
								</c:choose>


							</p>
						</div>
						<a href="/message/register?receiverID=${user.id}"
							class="btn btn-outline-danger btn-contact">메시지 보내기</a>
					</div>
					<div class="follow">
						<div class="follow-img">
							<img style="max-width: 45%" src="${user.image}" class="img-fluid"
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
						<a href="api/good">좋아요!</a>
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
	<script src="resources/js/utility.js"></script>
	<script src="resources/js/handlebars.min.js"></script>
	<script type="template" id="comment-template">
	   <div class="customer-review_wrap">
       <div class="customer-img">
           <img src="{{image}}" class="img-fluid" alt="{{name}}">
           <p>{{name}}</p>
           <span>35 Reviews</span>
       </div>
       <div class="customer-content-wrap">
           <div class="customer-content">
               <div class="customer-review">
                   <h6>{{title}}</h6>
                   <p>등록 날짜 : {{regDate}}</p>
               </div>
               <div class="customer-rating">{{score}}</div>
           </div>
           <p class="customer-text">{{content}}</p>
          
           <ul>
				{{images}}
               <li><img src="images/review-img1.jpg" class="img-fluid" alt="#"></li>
               <li><img src="images/review-img2.jpg" class="img-fluid" alt="#"></li>
               <li><img src="images/review-img3.jpg" class="img-fluid" alt="#"></li>
           </ul>

           <span>{{helpful}}명이 이 댓글에 도움을 받았습니다.</span>
           <a href="#"><span class="icon-like"></span>Helpful</a>
       </div>
   </div>
   <hr>
	</script>
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

			var requestURL = "/api/commentList/company/" + 1 + "/" + ${company.id};
			
			Ajax("GET", requestURL, function(dataList) {

				dataList.forEach(function(data) {

					var tempData = {};
					tempData['image'] = data.imageUrl;
					tempData['name'] = data.name;
					tempData['title'] = data.title;
					tempData['regDate'] = data.regDate;
					tempData['score'] = data.score;
					tempData['content'] = data.content;
					tempData['helpful'] = data.helpful;
					tempData['state'] = data.state;

					makeHTML("#comment-template", "#comment-list", tempData);
				});

			});

		});
	</script>

	<%@ include file="/pageframe/footer.jsp"%>

</body>

</html>

