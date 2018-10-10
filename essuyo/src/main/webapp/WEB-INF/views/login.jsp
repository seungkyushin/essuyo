<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Required meta tags -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Colorlib">
<meta name="description" content="자리있어요?">
<meta name="keywords" content="이써요">
<!-- Favicons -->
<link rel="shortcut icon" href="#">
<!-- Page Title -->
<title>자리 있어요?</title>
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
<!-- Swipper Slider -->
<link rel="stylesheet" href="/resources/css/swiper.min.css">
<!-- Magnific Popup CSS -->
<link rel="stylesheet" href="/resources/css/magnific-popup.css">
<!-- Main CSS -->
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/css/login.css">



<title>로그인</title>
</head>
<body>
	<%@ include file="/pageframe/header.jsp"%>

	<div class="wrapper fadeInDown">
		<div id="formContent">
			<!-- Tabs Titles -->

			<!-- Icon -->
			<div class="fadeIn first">
				<img src="/resources/images/backpack.png" id="icon" alt="User Icon" />
				<h1 style="color: #0d0d0d">로그인</h1>
			</div>

			<!-- Login Form -->
			<form id="loginForm" method="post" action="/login">
			
			
				<input type="email" title="올바르지 않은 이메일 형식입니다." pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" id="email" name="email" class="fadeIn second" placeholder="이메일" required >
				

					
				<input type="password" id="password" name="password" class="fadeIn second" minlength="4"
						data-msg-minlength="최소 {0} 자리 이상 입력해야 합니다." size="30"			maxlength="12" placeholder="비밀번호" required>
								
				<input	type="submit" class="fadeIn fourth" value="로그인">
			</form>

			<!-- Remind Passowrd -->
			<div id="formFooter">
				<a class="underlineHover" href="/user/regist">회원 가입</a>
			</div>

		</div>
	</div>


	<%@ include file="/pageframe/footer.jsp"%>

	<!-- 제이쿼리로 유효성 검사 -->
	<script type="text/javascript" src="/resources/js/jquery/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="/resources/js/jquery/jquery.validate.js"></script>
	<script type="text/javascript" src="/resources/js/jquery/additional-methods.js"></script>
	<script type="text/javascript" src="/resources/js/jquery/messages_ko.js"></script>
	<script type="text/javascript" src="/resources/js/utility.js"></script>


	<script>
		$(function() {
			$("#password").keyup(function(event) {
				if (event.keyCode == 13) {
					doLogin();
				}
			});

			msgCheck();
		});

		//로그인 기능
		function doLogin() {

			if ($("#loginForm").valid()) {
				loginForm.submit();
			}
		}

		//로그인 실패시 메시지 띄우는 기능.
		function msgCheck() {
			var msg = "${msg}";

			if (msg === null || msg === "" || msg === undefined) {
				
			} else {
				myAlert("로그인 실패", msg);
			}
		}
	</script>

</body>
</html>