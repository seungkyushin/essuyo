<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="/resources/images/favicon.png">
<title>Q&A 목록</title>
<link href="/resources/css/chartist/chartist.min.css" rel="stylesheet">
<link href="/resources/css/style.min.css" rel="stylesheet">
<link href="/resources/css/simple-line-icons.css" rel="stylesheet">

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
						<h4 class="page-title">Q&A</h4>
					</div>
				</div>

				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-4 col-xlg-3 col-md-5">
							<div class="card">
								<div class="card-body">
									<form role="form" method="get">
										<table class="table table-bordered">
											<tr>
												<th style="width: 10px">N</th>
												<th>TITLE</th>												
												<th>SENDER</th>
												<th>DATE</th>												
											</tr>
											
										</table>
										<div class="box-footer">
											<button type="submit" class="btn registerBtn"
												style="float: right; text-align: center; text-color: white; background-color: gray; border-radius: 5px;">
												WRITER</button>
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


	<script type="text/javascript">
		var result = '${msg}';

		if (result == 'SUCCESS') {
			alert("처리가 완료되었습니다.");
		}
	</script>

	<!-- jquery 추가 -->
	<script src="/resources/js/jquery/jquery-3.2.1.min.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			var formObj = $("form[role='form']");

			console.log(formObj);
			$(".registerBtn").on("click", function() {
				formObj.attr("action", "/qna/register");
				formObj.submit();
			});
		});
	</script>
</body>
</html>