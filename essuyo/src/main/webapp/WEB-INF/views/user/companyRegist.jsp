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
<link href="../resources/css/chartist/chartist.min.css" rel="stylesheet">
<link href="../resources/css/style.min.css" rel="stylesheet">
<link href="../resources/css/simple-line-icons.css" rel="stylesheet">

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
							<h4 class="page-title">개인 사업장 관리</h4>
					</div>
				</div>
			</div>
			
 		<div class="container-fluid">
				<c:choose>
					<c:when test="${empty business}">
						<div class="page-breadcrumb">
							<div class="row">
							
								<div class="col-12 align-self-center">
									<a href="/user/businessStart"><img style="margin-left: auto; margin-right: auto; display: block; width: 300px;"
									src="../resources/images/business-icon.png"></a>
								</div>
							</div>
							<div class="row">
								<div class="col-12 align-self-center">
									<h3 style="color:#4F5467; text-align: center;">사업 시작 하기!</h3>
								</div>
							</div>
									
							
						</div>
					</c:when>
					<c:when test="${!empty business}">
						<div class="card card-body">
							<h4 class="card-title">사업장 등록</h4>
							<form class="form-horizontal m-t-30" id="registForm"
								name="registForm" method="post" enctype="multipart/form-data">
								<input type="hidden" name="isCheckedEmail" id="isCheckedEmail"
									value="N" />

								<div class="form-group">
									<label>[회사명] </label> <input type="text" id="companyName"
										name="companyName" class="form-control" placeholder="회사명"
										required>
								</div>

								<div class="form-group">
									<label>[회사 업종]</label> <select class="custom-select col-12"
										id="type" name="type" required>
										<option selected="selected" value="">업종 선택</option>
										<option value="숙박">숙박</option>
										<option value="렌트카">차량</option>
										<option value="음식점">식당</option>
										<option value="박물관">박물관</option>
									</select>
								</div>
								<div class="form-group">
									<label>[회사 소개문]<span class="help"> ※ 250자 이내로
											입력해 주세요</span></label>
									<textarea name="discription" id="discription"
										class="form-control" rows="5" onkeyup="len_chk()"></textarea>
								</div>

								<div class="form-group">
									<label>[회사 주소] </label> <input type="text" id="address"
										name="address" class="form-control" placeholder="회사주소"
										required>
								</div>

								<div class="form-group">
									<label>[회사 전화번호] <span class="help"> ※
											010-1234-5793 혹은, 02-123-4567</span></label> <input type="text" id="number"
										name="number" class="form-control" placeholder="회사 전화번호"
										pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="13"
										required>
								</div>

								<div class="form-group">
									<label>[회사 홈페이지] <span class="help"> ※
											www.example.com 혹은, www.example.co.kr</span></label> <input type="text"
										id="url" name="url" class="form-control" placeholder="회사 홈페이지"
										required>
								</div>
								<div class="form-group">
									<label>[영업 상태]</label> <select class="custom-select col-12"
										id="state" name="state" required>
										<option selected="selected" value="">영업상태</option>
										<option value="OPEN">영업중</option>
										<option value="CLOSED">휴업중</option>
									</select>
								</div>

								<div class="form-group">
									<label>[영업 시간] </label> <input type="text" id="time"
										name="time" class="form-control" placeholder="영업시간" required>
								</div>

								<a href="#" class="btn-reg" onclick="doReg();">회원가입</a>
							</form>
						</div>
					</c:when>
				</c:choose>




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


	<script>
		$(function() {
			$("#registForm").validate();
			// 버튼을 눌렀을 때 이메일의 유효성, 중복은 검사하는 기능. 지금은 
			$("#btnCheckId").click(function() {
				var email = $("#email").val();
				if (!email_check(email)) {
					myAlert("잘못된 이메일 형식", "형식에 맞는 이메일 주소를 입력해주세요.");
				} else {
					var url = "/api/checkId";
					$.post(url, {
						email : email
					}, function(json) {
						//이메일을 사용할 수 있으면 isCheckedEmail의 값을 Y로 해준다
						if (json.code === 99) {
							myAlert("이메일 중복체크", "사용가능한 이메일입니다.");
							$("#isCheckedEmail").val("Y");
						} else if (json.code === -1) {
							myAlert("이메일 중복체크", "이미 등록된 이메일입니다.");
						}
					});
				}

			});
		});

		// 	회원가입에 성공하면, 일단 대쉬보드로 가게 설정해 놓음
		//실패하면, 일단 다시 회원가입 페이지로 가게 함
		function doReg() {

			if ($("#isCheckedEmail").val() == "N") {
				myAlert("ERROR", "Email 중복 검사를 통과해야 합니다.");
			}

			if ($("#registForm").valid()) {
				var url = "/user/companyRegist";
				$.post(url, $("#registForm").serialize(), function(data) {
					if (data == 1) {
						myAlert("가입 성공", "회원가입에 성공했습니다.");
						document.location.href = "/login";
					} else {
						myAlert("가입 실패", "회원가입에 실패했습니다. 관리자에게 문의해 주세요.");
						document.location.href = "/user/companyRegist";
					}
				});
			}
		}
		//정규식으로 이메일을 체크하는 펑션.
		function email_check(email) {
			var regex = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			return (email != '' && email != 'undefined' && regex.test(email));

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