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
<title>Q&A 관리</title>
<link href="/resources/css/chartist/chartist.min.css" rel="stylesheet">
<link href="/resources/css/style.min.css" rel="stylesheet">
<link href="/resources/css/simple-line-icons.css" rel="stylesheet">
</head>
<body>
	<form role="form" method="get">
		<input type="hidden" name='id' value="${qna.id }">
	</form>
	 
	<div class="box-body">
		<div class="form-group">
			<label for="exInputWriter"> WRITER </label> 
			<input type="text"	id="userId" name="writer" class="form-control" 
				value="${qna.userId }" readonly="readonly">
		</div>
		<div class="form-group">
			<label for="exInputTitle"> TITLE </label> <input type="text"
				name='title' class="form-control" value="${qna.title}"
				readonly="readonly">
		</div>
		<div class="form-group">
			<label for="exInputContent"> CONTENT </label>
			<textarea class="form-control" name="content" rows="10"
				readonly="readonly">${qna.content }</textarea>
		</div>

	</div>
			<div class="boxfooter">
			<button type="submit" class="btn goListBtn"
			style="float: left; text-align: center; text-color: white; background-color: gray; border-radius: 5px;">
			LIST</button>
		<button type="submit" class="btn removeBtn"
			style="float: right; text-align: center; text-color: white; background-color: gray; border-radius: 5px;">
			삭제</button>
	</div>

	<!-- jquery 추가 -->
	<script src="/resources/js/jquery/jquery-3.2.1.min.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			var formObj = $("form[role='form']");

			console.log(formObj);
			
			var referrer =  document.referrer;
			
				//	alert(referrer.substring(22));
			if(referrer.substring(21) == "/message/recevieMeg?")	{
				$(".goListBtn").on("click", function() {
					formObj.attr("method", "get");
					formObj.attr("action", "/message/recevieMeg");
					formObj.submit();
				});	
			}else if(referrer.substring(21) == "/message/sendMeg?"){
				$(".goListBtn").on("click", function() {
					formObj.attr("method", "get");
					formObj.attr("action", "/message/sendMeg");
					formObj.submit();
				});	
			}else{
			 	$(".goListBtn").on("click", function() {
					formObj.attr("method", "get");
					formObj.attr("action", "/qna/listPage");
					formObj.submit();
				}); 
			}
			$(".removeBtn").on("click", function() {
				formObj.attr("action", "/qna/remove");
				formObj.submit();
			});
			
			$(".replyBtn").on("click", function() {
				var userID = $("#userID").val();
				var receiverID = $("#receiverID").val();
			
				formObj.attr("action", "/message/replyPage?userID=" + userID + "&receiverID=" + receiverID);
			});
		});
		
		function onSuccess(json, status){
			 alert($.trim(json));
			}
		function onError(data, status){
			 alert("error");
		}

			
	</script>

</body>
</html>