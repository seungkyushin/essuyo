<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" type="image/png" sizes="16x16" href="../resources/images/favicon.png">
<title>사업내용 수정</title>
<link href="../resources/css/style.min.css" rel="stylesheet">
<link href="../resources/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Sans+KR">
<link rel="stylesheet" href="../resources/css/simple-line-icons.css">
<link rel="stylesheet" href="../resources/css/themify-icons.css">
<link rel="stylesheet" href="../resources/css/set1.css">


</head>

<body>

	<div class="preloader">
		<div class="lds-ripple">
			<div class="lds-pos"></div>
			<div class="lds-pos"></div>
		</div>
	</div>

	<div id="main-wrapper" data-navbarbg="skin6" data-theme="light" data-layout="vertical" data-sidebartype="full" data-boxed-layout="full">

		<%@ include file="/pageframe/admin-navigation.jsp"%>

		<div class="page-wrapper">
			<div class="page-breadcrumb">
				<div class="row">
					<div class="col-5 align-self-center">
						<h4 class="page-title">사업내용 수정</h4>
					</div>
					<div class="col-7 align-self-center">
						<div class="d-flex align-items-center justify-content-end">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="#">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">Profile</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
			</div>

			<div class="container-fluid">

				<div class="row">

					<div class="col-lg-10 col-xlg-10 col-md-10">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">사업자 정보 수정</h4>
								<h5 class="card-subtitle">요구사항에 따라 빈 칸을 채워주세요</h5>
								<form class="form-horizontal m-t-30" id="registForm" name="registForm" method="post" enctype="multipart/form-data">

									<div class="form-group">
										<label>[회사명] </label> <input value="${cvo.name}" type="text" id="name" name="name" class="form-control" placeholder="회사명" required>
									</div>

									<div class="form-group">
										<label>[회사 업종]</label> <select class="custom-select col-12" id="type" name="type" required>
											<option selected="selected" value="">업종 선택</option>
											<option value="숙박">숙박</option>
											<option value="렌트카">렌트카</option>
											<option value="음식점">음식점</option>
											<option value="박물관">박물관</option>
										</select>
									</div>
									<div class="form-group">
										<label>[회사 소개문]<span class="help"> ※ 250자 이내로 입력해 주세요</span></label>
										<textarea name="discription" id="discription" class="form-control" rows="5" onkeyup="len_chk()"></textarea>
									</div>

									<div class="form-group">
										<label>[회사 주소] </label> <input value="${cvo.address }" type="text" id="address" name="address" class="form-control" placeholder="회사주소" required>
									</div>
									<div class="form-group">
										<label>[회사 소재 지역]</label> <select class="custom-select col-12" id="areaListId" name="areaListId" required>
											<option selected="selected" value="">지역 선택</option>
											<option value="1">서울</option>
											<option value="2">부산</option>
											<option value="3">광주</option>
											<option value="4">강원도</option>
										</select>
									</div>

									<div class="form-group">
										<label>[회사 전화번호] <span class="help"> 예) 010-1234-5793 혹은, 02-123-4567</span></label> <input value="${cvo.number }" type="text" id="number" name="number" class="form-control" placeholder="회사 전화번호" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="13" required>
									</div>

									<div class="form-group">
										<label>[회사 홈페이지] <span class="help"> 예) www.example.com 혹은, www.example.co.kr</span></label> <input value="${cvo.url }" type="text" id="url" name="url" class="form-control" placeholder="회사 홈페이지" required>
									</div>
									<div class="form-group">
										<label>[영업 상태]</label> <select class="custom-select col-12" id="state" name="state" required>
											<option selected="selected" value="">영업상태</option>
											<option value="OPEN">영업중</option>
											<option value="CLOSED">휴업중</option>
										</select>
									</div>

									<div class="form-group">
										<label>[영업 시간] </label><span class="help"> 예) 09:00 ~ 18:00 혹은, All Time, 상시 영업</span><input value="${cvo.time }" type="text" id="time" name="time" class="form-control" placeholder="영업시간" required>
									</div>

									<button type="submit">정보 수정</button>
								</form>

								<!-- Column -->
							</div>
						</div>

						<footer class="footer text-center">
							All Rights Reserved by Nice admin. Designed and Developed by <a href="https://wrappixel.com">WrapPixel</a>.
						</footer>
					</div>

				</div>
				<script src="../resources/js/jquery/jquery.min.js"></script>
				<script type="text/javascript" src="../resources/js/jquery/jquery-3.3.1.js"></script>
				<script type="text/javascript" src="../resources/js/jquery/jquery.validate.js"></script>
				<script type="text/javascript" src="../resources/js/jquery/additional-methods.js"></script>
				<script src="../resources/js/popper/umd/popper.min.js"></script>
				<script src="../resources/js/bootstrap/bootstrap.min.js"></script>
				<script src="../resources/js/sparkline.js"></script>
				<script src="../resources/js/userpage/waves.js"></script>
				<script src="../resources/js/userpage/sidebarmenu.js"></script>
				<script src="../resources/js/userpage/custom.min.js"></script>
				<script src="../resources/js/utility.js"></script>
				<script type="text/javascript" src="../resources/js/jquery/messages_ko.js"></script>

				<script>
					$(function() {
						$("#registForm").validate();

						var discription = document
								.getElementById('discription');

						discription.value = '${cvo.discription}';
					});

					function doReg() {

						if ($("#registForm").valid()) {
							var url = "/user/companyUpdate";
							$
									.post(
											url,
											$("#registForm").serialize(),
											function(data) {
												if (data == 1) {
													myAlert("정보 수정 성공",
															"성공적으로 정보가 수정됐습니다.");
													document.location.href = "/user/profile";
												} else {
													myAlert("정보 수정 실패",
															"정보 수정에 실패했습니다. 관리자에게 문의해 주세요.");
													document.location.href = "/user/companyUpdate";
												}
											});
						}
					}

					//글자수 제한 체크 
					function len_chk() {
						var frm = document.registForm.discription;

						if (frm.value.length > 250) {
							myAlert("글자수 제한", "250자 이내로 작성하셔야 합니다.");
							frm.value = frm.value.substring(0, 250);
							frm.focus();
						}

					}
				</script>
</body>

</html>