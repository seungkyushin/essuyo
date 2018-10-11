<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" type="image/png" sizes="16x16"
	href="../resources/images/favicon.png">
<title>※공지사항※</title>
<link href="../resources/css/style.min.css" rel="stylesheet">
<link href="../resources/css/style.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR">
<link rel="stylesheet" href="../resources/css/simple-line-icons.css">
<link rel="stylesheet" href="../resources/css/themify-icons.css">
<link rel="stylesheet" href="../resources/css/set1.css">

</head>
<style>
.pagination {
    display: inline-block;
}

.pagination a {
    color: black;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
}

.pagination a.active {
    background-color: #4CAF50;
    color: white;
    border-radius: 5px;
}

.pagination a:hover:not(.active) {
    background-color: #ddd;
    border-radius: 5px;
}
</style>
<body>
	<div class="text-center">
			<h3>※  공  지  사  항 ※</h3>
	</div>
	<script>
		var result = '${msg}';
		
		if (result == 'success'){
			alert("처리가 완료되었습니다.");
		}
	</script>
	
	<table class="table table-border">
		<tr>
			<th style="width: 60px">번호</th>
			<th> 제목</th>
			<th> 작성자</th>
			<th> 등록 날짜</th>
		</tr>
		
		<c:forEach items="${list}" var="noticeVO">
			<tr>
				<td>${noticeVO.noticeNum}</td>
				<td><a href='/notice/read?noticeNum=${noticeVO.noticeNum}'>${noticeVO.title}</a></td>
				<td>${noticeVO.userID}</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${noticeVO.regDate}"></fmt:formatDate></td>
			</tr>
		</c:forEach>
		
	</table>
</body>
</html>