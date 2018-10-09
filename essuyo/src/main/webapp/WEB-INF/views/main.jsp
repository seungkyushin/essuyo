<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>자리 있어요??</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="icon" type="image/png" sizes="16x16" href="/resources/images/backpack.png">
	<link rel="stylesheet" href="resources/css/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" href="resources/css/simple-line-icons.css">
	<link rel="stylesheet" href="resources/css/themify-icons.css">
	<link rel="stylesheet" href="resources/css/set1.css">
	<link rel="stylesheet" href="resources/css/style.css">
	<link rel="stylesheet" href="resources/css/tab.css">
</head>

<body>

	<%@ include file="/pageframe/header.jsp"%>

	<section class="slider d-flex align-items-center">
		<div class="container">
			<div class="row d-flex justify-content-center">
				<div class="col-md-12">
					<div class="slider-title_box">
						<div class="row">
							<div class="col-md-12">
								<div class="slider-content_wrap">
									<h1>여행에 필요한 예약 있어요??</h1>
									<h5>여행에 필요한 예약은 이써요 에서!!</h5>
								</div>
							</div>
						</div>
						<div class="row d-flex justify-content-center">
							<div class="col-md-10">
								<form class="form-wrap mt-4">
									<div class="btn-group" role="group" aria-label="Basic example">
										<input list="list" placeholder="선택" name="list1"
											class="btn-group1" >
										<datalist id="list">
											<option value="숙박">
											<option value="차량">
											<option value="식사">
											<option value="박물관">
										</datalist>
													
										<input type="text" placeholder="ex) 서울" class="btn-group2">
										<button type="submit" class="btn-form">
											<span class="icon-magnifier search-icon"></span>검색<i
												class="pe-7s-angle-right"></i>
										</button>
									</div>
								</form>
						
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="main-block">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-5">
					<div class="styled-heading">
						<h3>분야별로 필요한것은 무엇?</h3>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<div class="find-place-img_wrap">
						<div class="grid">
							<figure class="effect-ruby">
								<a href="/list?type='렌트카'"> <img
									src="resources/images/menu-rentcar.jpg" class="img-fluid"
									alt="img13" />
									<figcaption>
										<h5>렌트</h5>
										<p>${countList}목록</p>
									</figcaption></a>
							</figure>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="row find-img-align">
						<div class="col-md-12">
							<div class="find-place-img_wrap">
								<div class="grid">
									<figure class="effect-ruby">
										<a href="/list?type='식당'"> <img
											src="resources/images/menu-restraunt.jpg" class="img-fluid"
											alt="img13" />
											<figcaption>
												<h5>식당</h5>
												<p>${countList['렌트카']}목록</p>
											</figcaption></a>
									</figure>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="find-place-img_wrap">
								<div class="grid">
									<figure class="effect-ruby">
										<a href="/list?type='박물관'"> <img
											src="resources/images/menu-museum.jpg" class="img-fluid"
											alt="img13" />
											<figcaption>
												<h5>문화시설</h5>
												<p>${countList['박물관']}목록</p>
											</figcaption></a>
									</figure>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="row find-img-align">
						<div class="col-md-12">
							<div class="find-place-img_wrap">
								<div class="grid">
									<figure class="effect-ruby">
										<a href="/list?type='호텔'"> <img
											src="resources/images/menu-hotel.jpg" class="img-fluid"
											alt="img13" />
											<figcaption>
												<h5>숙박</h5>
												<p>${countList['hotel']}목록</p>
												<p>${countList.hotel}목록</p>
												<p>${countList['펜션']}목록</p>
												<p>${countList['호텔']}목록</p>
												
											</figcaption></a>
									</figure>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="find-place-img_wrap">
								<div class="grid">
									<figure class="effect-ruby">
										<a href="/list"> <img src="resources/images/menu-QnA.jpg"
											class="img-fluid" alt="img13" />
											<figcaption>
												<h5>질문 이써Yo?</h5>
												<p>Do you have any Question?</p>
											</figcaption></a>
									</figure>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="main-block light-bg">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-5">
					<div class="styled-heading">
						<h3>랭킹</h3>
					</div>
				</div>
			</div>
			<div class="row" style="color: olivedrab">
						
			<c:if test="${ !empty rankCompanyList}" >
			<c:forEach items="${rankCompanyList}" var="company">
				<div class="col-md-3 featured-responsive">
					<h5 style="text-align: center">${company.rankTitle}</h5>
					
							<div class="featured-place-wrap">
								<a href="/company/detail?id=${company.id}"> 
									<img src="${company.image}" class="img-fluid" alt="#">
										<c:choose>
											<c:when test="${company.score < 3}">
												 <span class="featured-rating">${company.score}</span>
											</c:when>
											<c:when test="${company.score < 7}">
												 <span class="featured-rating-orange">${company.score}</span>
											</c:when>
											<c:otherwise>
												 <span class="featured-rating-green">${company.score}</span>
											</c:otherwise>
										</c:choose>
										
							<div class="featured-title-box">
								<h6>${company.name}</h6>
								<p>${company.type}</p>
								<span>• </span>
								<p>댓글 ${company.review}개</p>
								<ul>
									<li><span class="icon-location-pin"></span>
										<p>${company.address}</p></li>
									<li><span class="icon-screen-smartphone"></span>
										<p>${company.number}</p></li>
									<li><span class="icon-link"></span>
										<p>${company.homepage}</p></li>

								</ul>
								<div class="bottom-icons">
									<c:choose>
										<c:when test="${company.state == '영업중'}">
											<div class="open-now">${company.state}</div>
										</c:when>
										<c:when test="${company.state == '영업종료'}">
											<div class="closed-now">${company.state}</div>
										</c:when>
									</c:choose>
								</div>
							</div>
						</a>
					</div>
				</div>
				</c:forEach>
			</c:if>
		
			</div>
	
			<div class="row justify-content-center">
				<div class="col-md-4">
					<div class="featured-btn-wrap">
						<a href="/list" class="btn btn-danger">VIEW ALL</a>
					</div>
				</div>
			</div>
		</div>
	</section>


	<%@ include file="/pageframe/footer.jsp"%>
	<script src="resources/js/jquery/jquery-3.2.1.min.js"></script>
	<script src="resources/js/popper/popper.min.js"></script>
	<script src="resources/js/bootstrap/bootstrap.min.js"></script>
	
	
	<script>
		$(window).scroll(function() {
			// 100 = The point you would like to fade the nav in.
			if ($(window).scrollTop() > 100) {
				$('.fixed').addClass('is-sticky');
			} else {
				$('.fixed').removeClass('is-sticky');
			}
			;
		});
	</script>
</body>

</html>