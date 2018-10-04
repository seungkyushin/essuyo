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
<!-- Page Title -->
<title>자리 있어요?</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="/resources/css/bootstrap/bootstrap.min.css">
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,400i,500,700,900" rel="stylesheet">
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

<!-- 제이쿼리로 유효성 검사 -->



<!-- 유효성 검증. 각 항목의 유효성이 검증되지 않으면 넘어가지 않는다 -->


<title>사업자 회원가입</title>
</head>
<body>
	<%@ include file="//pageframe/header.jsp"%>
	<section class="light-bg booking-details_wrap">
	<div class="container">
		<div class="row">
			<div class="col-2"></div>
			<div class="col-8">
				<div class="card card-body">
					<h4 class="card-title">사업자 회원가입</h4>
					<h5 class="card-subtitle">요구사항에 따라 빈 칸을 채워주세요</h5>
					<form class="form-horizontal m-t-30" id="registForm" name="registForm" method="post" enctype="multipart/form-data">
						<input type="hidden" name="isCheckedEmail" id="isCheckedEmail" value="N" />
						<div class="form-group">
							<label for="email">[이메일] <span class="help"> 예) "example@gmail.com"</span></label> <input type="email" id="email" name="email" class="form-control" placeholder="이메일" required>
							<button type="button" id="btnCheckId" style="height: 35px;">이메일 중복확인</button>
						</div>
						<div class="form-group">
							<label>[비밀번호]</label> <input type="password" id="password" name="password" class="form-control" minlength="4" data-msg-minlength="최소 {0} 자리 이상 입력해야 합니다." maxlength="12" placeholder="비밀번호" required>
						</div>
						<div>
							<label>[비밀번호 확인]</label> <input type="password" id="passwordCheck" class="form-control" placeholder="비밀번호를 다시 입력해 주세요" equalTo="#password">
						</div>
						<div class="form-group">
							<label>[이 름] <span class="help"> 예) "홍길동"</span></label>
							<input type="text" id="userName" name="userName" class="form-control" placeholder="이름" required>
						</div>
						<div class="form-group">
							<label for="age">[나이] <span class="help"> ※ 숫자로만 입력해 주세요. 예) 28살 -> 28</span></label> <input type="text" id="age" name="age" class="form-control" placeholder="나이" required>
						</div>
						<div class="form-group">
							<label>[성별]</label> <select class="custom-select col-12" id="gender" name="gender" required>
								<option selected="selected" value="">성별</option>
								<option value="남자">남자</option>
								<option value="여자">여자</option>
							</select>
						</div>

						<div class="form-group">
							<label>[회사명] </label> <input type="text" id="companyName" name="companyName" class="form-control" placeholder="회사명" required>
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
							<label>[회사 주소] </label> <input type="text" id="address" name="address" class="form-control" placeholder="회사주소" required>
						</div>

						<div class="form-group">
							<label>[회사 전화번호] <span class="help"> ※ 010-1234-5793 혹은, 02-123-4567</span></label> <input type="text" id="number" name="number" class="form-control" placeholder="회사 전화번호" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="13" required>
						</div>

						<div class="form-group">
							<label>[회사 홈페이지] <span class="help"> ※ www.example.com 혹은, www.example.co.kr</span></label> <input type="text" id="url" name="url" class="form-control" placeholder="회사 홈페이지" required>
						</div>
						<div class="form-group">
							<label>[영업 상태]</label> <select class="custom-select col-12" id="state" name="state" required>
								<option selected="selected" value="">영업상태</option>
								<option value="OPEN">영업중</option>
								<option value="CLOSED">휴업중</option>
							</select>
						</div>

						<div class="form-group">
							<label>[영업 시간] </label> <input type="text" id="time" name="time" class="form-control" placeholder="영업시간" required>
						</div>

						<a href="#" class="btn-reg" onclick="doReg();">회원가입</a>
					</form>
				</div>
			</div>
			<div class="col-2"></div>
		</div>
	</div>
	</section>
	<%@ include file="//pageframe/footer.jsp"%>

	<script type="text/javascript" src="/resources/js/jquery/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="/resources/js/jquery/jquery.validate.js"></script>
	<script type="text/javascript" src="/resources/js/jquery/additional-methods.js"></script>
	<script type="text/javascript" src="/resources/js/jquery/messages_ko.js"></script>
	<script type="text/javascript" src="/resources/js/utility.js"></script>
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
						} else if(json.code === -1){
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