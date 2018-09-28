<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<div class="box-body">
			<div class="form-group">
				<label for="exInputWriter"> WRITER </label>
				<!-- 발송자 아이디 받아오기 -->
				<input type="text" name='userID' class="form-control">
				 <%-- value="${message.userID }">> --%>

			</div>
			<div class="form-group">
				<label for="exInputWriter"> RECEIVER </label>
				<!-- 수신자 아이디 받아오기 -->
				<input type="text" name='receiverID' class="form-control">
				<%-- value="${message.receiverID }"> --%>

			</div>
			<div class="form-group">
				<label for="exInputTitle"> TITLE </label> <input type="text"
					name='title' class="form-control" placeholder="Enter Title">
			</div>
			<div class="form-group">
				<label for="exInputContent"> CONTENT </label>
				<textarea class="form-control" name="content" rows="10"
					placeholder="Enter Content"></textarea>
			</div>

		</div>

		<div class="box-footer">
			<button type="submit" class="btn btn-primary"
				style="float: right; text-align: center; text-color: white; background-color: gray; border-radius: 5px gray;">
				SNED</button>
			<button type="button" class="btn btn-cancel"
				Onclick="javascript:history.back(-1)"
				style="float: left; text-align: center; text-color: white; background-color: gray; border-radius: 5px gray;">
				CANCEL</button>
		</div>
	</form>

</body>
</html>