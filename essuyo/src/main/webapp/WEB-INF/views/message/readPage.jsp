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
<title>쪽지 관리</title>
<link href="/resources/css/chartist/chartist.min.css" rel="stylesheet">
<link href="/resources/css/style.min.css" rel="stylesheet">
<link href="/resources/css/simple-line-icons.css" rel="stylesheet">

</head>
<body>
	<form role="form" method="post">
		<input type="hidden" name='megNum' value="${messageVO.megNum }">
	</form>

	<div class="box-body">
		<div class="form-group">
			<label for="exInputWriter"> WRITER </label> <input type="text"
				name="writer" class="form-control" value="${messageVO.userID }"
				readonly="readonly">
		</div>
		<div class="form-group">
			<label for="exInputWriter"> RECEIVER </label> <input type="text"
				name="writer" class="form-control" value="${messageVO.receiverID }"
				readonly="readonly">
		</div>
		<div class="form-group">
			<label for="exInputTitle"> TITLE </label> <input type="text"
				name='title' class="form-control" value="${messageVO.title }"
				readonly="readonly">
		</div>
		<div class="form-group">
			<label for="exInputContent"> CONTENT </label>
			<textarea class="form-control" name="content" rows="10"
				readonly="readonly">${messageVO.content }</textarea>
		</div>

	</div>

	<div class="box-footer">
		<button type="submit" class="btn goListBtn"
			style="float: left; text-align: center; text-color: white; background-color: gray; border-radius: 5px;">
			LIST</button>
		<button type="submit" class="btn removeBtn"
			style="float: right; text-align: center; text-color: white; background-color: gray; border-radius: 5px;">
			DELETE</button>
	</div>

	<!-- jquery 추가 -->
	<script src="/resources/js/jquery/jquery-3.2.1.min.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			var formObj = $("form[role='form']");

			console.log(formObj);
			/* 	
				$(".btn-primary").on("click", function(){
					self.location = "/message/listAll";
				});
				
				$(".btn-danger").on("click", function(){
					formObj.attr("action", "/message/remove");
					formObj.submit();
				}); */

			$(".goListBtn").on("click", function() {
				formObj.attr("method", "get");
				formObj.attr("action", "/message/listPage");
				formObj.submit();
			});

			$(".removeBtn").on("click", function() {
				formObj.attr("action", "/message/removePage");
				formObj.submit();
			});
		});
	</script>

</body>
</html>