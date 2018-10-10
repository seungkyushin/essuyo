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
	href="../resources/images/favicon.png">
<title>쪽지 관리</title>
<link href="../resources/css/style.min.css" rel="stylesheet">
<link href="../resources/css/style.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR">
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

	<div id="main-wrapper" data-navbarbg="skin6" data-theme="light"
		data-layout="vertical" data-sidebartype="full"
		data-boxed-layout="full">

		<%@ include file="/pageframe/admin-navigation.jsp"%>

		<div class="page-wrapper">

			<div class="page-breadcrumb">
				<div class="row">
					<div class="col-5 align-self-center">
						<h4 class="page-title">메시지 보내기</h4>
					</div>
				</div>

				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-4 col-xlg-3 col-md-5">
							<div class="card">
								<div class="card-body">
									<form role="form" method="POST" action="/message/registerSend"  onsubmit="return checkValue();">
										<div class="box-body">
											<div class="form-group">
												<label for="exInputWriter"> 보낸 사람 </label>
												<!-- 발송자 아이디 받아오기 -->
												<input type="text" name='userID' class="form-control"
													value="${messageVO.userID }" readonly="readonly">
											</div>
											<div class="form-group">
												<label for="exInputWriter"> 받는 사람 </label>
												<!-- 수신자 아이디 받아오기 -->
												<input type="text" name='receiverID' class="form-control"
													value="${messageVO.receiverID }">

											</div>
											<div class="form-group">
												<label for="exInputTitle"> 제목 </label> <input type="text"
													name='title' class="form-control" placeholder="Enter Title">
											</div>
											<div class="form-group">
												<label for="exInputContent"> 내용 </label>
												<textarea class="form-control" name="content" rows="10"
													placeholder="Enter Content"></textarea>
											</div>

										</div>

										<div class="box-footer">

											<button type="submit" class="btn btn-info"
												style="float: right;">보내기</button>
											<button type="button" class="btn btn-danger"
												Onclick="javascript:history.back(-1)" style="float: left;">취소</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
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
		<script src="../resources/js/utility.js"></script>

		<script>
			$(document).ready(function() {
				var formObj = $("form[role='form']");

				console.log(formObj);
				$(".btn-primary").on("click", function() {
					formObj.attr("action", "/message/registerSend");
					formObj.submit();
				});
			});
			
			
			function checkValue() {
				var title = document.getElementById("title").value;

				if (title == "" || title == null) {
					myAlert("ERROR","제목을 입력해주세요!");
					title.focus();
					return false;
				}
			}
			
			//onclick="javascript:checkValue()"
			//onsubmit="return checkValue();"
		</script>
</body>
</html>