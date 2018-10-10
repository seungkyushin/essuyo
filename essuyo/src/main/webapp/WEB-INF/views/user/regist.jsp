<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Required meta tags -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Colorlib">
<meta name="description" content="자리있어요?">
<meta name="keywords" content="이써요">
<!-- Favicons -->
<link rel="shortcut icon" href="#">
<title>자리 있어요?</title>
<link rel="stylesheet" href="/resources/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/simple-line-icons.css">
<link rel="stylesheet" href="/resources/css/themify-icons.css">
<link rel="stylesheet" href="/resources/css/set1.css">
<link rel="stylesheet" href="/resources/css/swiper.min.css">
<link rel="stylesheet" href="/resources/css/magnific-popup.css">
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/css/login.css">

<title>회원가입</title>
</head>
<body>

	<%@ include file="/pageframe/header.jsp"%>

	<div class="wrapper fadeInDown">
		<div id="formContent">
			<!-- Tabs Titles -->

			<!-- Icon -->
			<div class="fadeIn first">
				<img src="/resources/images/backpack.png" id="icon" alt="User Icon" />
				<h1 style="color: #0d0d0d">회원 가입</h1>
			</div>

			<!-- Login Form -->

			<form id="registForm" method="post" enctype="multipart/form-data" action="/user/regist">
				<input type="hidden" name="isCheckedEmail" id="isCheckedEmail" value="N" />
				<input type="email" id="email" name="email" class="fadeIn second" placeholder="이메일" onchange="checkToN()" required>
				<input type="password" id="password" name="password" class="fadeIn second" minlength="4" data-msg-minlength="최소 {0} 자리 이상 입력해야 합니다." maxlength="12" placeholder="비밀번호" required>
				<input type="password" id="passwordCheck" class="fadeIn second" placeholder="비밀번호를 다시 입력해 주세요" equalTo="#password" required>
				<input type="text" id="name" name="name" class="fadeIn second" placeholder="이름" required="true">
				<input type="text" id="age" name="age" class="fadeIn second" placeholder="나이" required>
				<select class="fadeIn second form-control" id="gender" name="gender" required>
						<option selected="selected" value="">성별</option>
						<option value="남">남</option>
						<option value="여">여</option>
				</select>
							
				<input	type="submit" class="fadeIn fourth" onclick="doReg();" value="회원가입">
			</form>

			<!-- Remind Passowrd -->
			<div id="formFooter">
				<a class="underlineHover" href="/login">로그인</a>
			</div>

		</div>
	</div>


	<%@ include file="/pageframe/footer.jsp"%>

	<%-- <%@ include file="//pageframe/header.jsp"%>
	<section class="light-bg booking-details_wrap">
	<div class="container">
	<div class="row">
	<div class="col-2"></div>
		<div class="col-8">
			<div class="card card-body">
				<h4 class="card-title">회원가입</h4>
				<h5 class="card-subtitle">요구사항에 따라 빈 칸을 채워주세요</h5>
				<form class="form-horizontal m-t-30" id="registForm" method="post" enctype="multipart/form-data">
				<input type="hidden" name="isCheckedEmail" id="isCheckedEmail" value="N"/>
					<div class="form-group">
						<label for="email">[이메일] <span class="help"> 예) "example@gmail.com"</span></label>
						<input type="email" id="email" name="email" class="form-control" placeholder="이메일" required>
						<button type="button" id="btnCheckId" style="height: 35px;">이메일 중복확인</button>
					</div>
					<div class="form-group">
						<label>[비밀번호]</label>
						<input type="password" id="password" name="password" class="form-control" minlength="4" data-msg-minlength="최소 {0} 자리 이상 입력해야 합니다." maxlength="12" placeholder="비밀번호" required>
					</div>
					<div>
						<label>[비밀번호 확인]</label>
						<input type="password" id="passwordCheck" class="form-control" placeholder="비밀번호를 다시 입력해 주세요" equalTo="#password">
					</div>
					<div class="form-group">
						<label>[이 름] <span class="help"> 예) "홍길동"</span></label>
						<input type="text" id="name" name="name" class="form-control" placeholder="이름" required="true">
					</div>
					<div class="form-group">
						<label for="age">[나이] <span class="help"> ※ 숫자로만 입력해 주세요. 예) 28살 -> 28</span></label>
						<input type="text" id="age" name="age" class="form-control" placeholder="나이" required>
					</div>
					<div class="form-group">
						<label>[성별]</label> <select class="custom-select col-12" id="gender" name="gender" required>
							<option selected="selected" value="">성별</option>
							<option value="남자">남자</option>
							<option value="여자">여자</option>
						</select>
					</div>					
					<a href="#" class="btn-reg" onclick="doReg();">회원가입</a>
				</form>
			</div>
		</div>
		<div class="col-2"></div>
	</div>
</div>
</section>
	<%@ include file="//pageframe/footer.jsp"%> --%>
	<!-- 제이쿼리로 유효성 검사 -->
	<script type="text/javascript" src="/resources/js/jquery/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="/resources/js/jquery/jquery.validate.js"></script>
	<script type="text/javascript" src="/resources/js/jquery/additional-methods.js"></script>
	<script type="text/javascript" src="/resources/js/jquery/messages_ko.js"></script>
	<script type="text/javascript" src="/resources/js/utility.js"></script>


	<!-- 유효성 검증. 각 항목의 유효성이 검증되지 않으면 넘어가지 않는다 -->
	<script>
		$(function() {
			$("#registForm").validate();

			// 버튼을 눌렀을 때 이메일의 유효성, 중복은 검사하는 기능. 지금은 
			/* 	$("#btnCheckId").click(function() {
					
					checkEmail();
				}); */

			$('#email').focusout(function() {
				checkEmail();
			});
		});

		//이메일 칸을 변경했을 경우 다시 이메일 체크를 받게 만드는 기능
		function checkToN() {
			document.getElementById("isCheckedEmail").value = 'N';

		}

		function checkEmail() {
			var email = $("#email").val();

			if (!email_check(email)) {
				myAlert("잘못된 이메일 형식", "형식에 맞는 이메일 주소를 입력해주세요.");
			} else {
				var url = "/api/checkId";
				$.post(url, {
					email : email
				}, function(json) {
					myAlert("이메일 중복체크", json.msg);

					//이메일을 사용할 수 있으면 isCheckedEmail의 값을 Y로 해준다
					if (json.code == 99) {
						$("#isCheckedEmail").val("Y");
					}
				});
			}
		}
		
		//실패하면, 일단 다시 회원가입 페이지로 가게 함
		function doReg() {

			if ($("#isCheckedEmail").val() == "N") {
				myAlert("ERROR", "Email 중복 검사를 통과해야 합니다.");
			}
			if ($("#registForm").valid()) {
				document.getElementById('registForm').submit();
			}

		}
		//정규식으로 이메일을 체크하는 펑션.
		function email_check(email) {

			var regex = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			return (email != '' && email != 'undefined' && regex.test(email));

		}
	</script>

</body>
</html>