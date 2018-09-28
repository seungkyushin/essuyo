<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
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
    <link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon.png">
    <title>쪽지 관리</title>
    <link href="/resources/css/chartist/chartist.min.css" rel="stylesheet">
    <link href="/resources/css/style.min.css" rel="stylesheet">
    <link href="/resources/css/simple-line-icons.css" rel="stylesheet">
 
</head>
<body>
	<table class="table table-bordered">
		<tr>
			<th style="width:10px"> N </th>
			<th> TITLE </th>
			<th> RECEIVER </th>
			<!-- <th> SENDER </th> -->
			<th> DATE </th>
			<th> READ </th>
		</tr>
	</table>
	<c:forEach items="${list }" var="MessageVO">
		<tr>	
			<td>${MessageVO.megNum }</td>
			<td>
				<a href="/message/read?megNum=${MessageVO.megNum }">
					${MessageVO.title }
				</a>
			</td>
			<td>${MessageVO.receiverID}</td>
			<td>
				<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${MessageVO.sendDate }"/>
			</td>
			<td>
				<span class="badge bg-red">${MessageVO.readCheck }</span>
			</td>
			
		</tr>
	
	</c:forEach>
	
	<script type="text/javascript">
		var result = '${msg}';
		
		if(result == 'SUCCESS'){
			alert("전송이 완료되었습니다.");
		}
	</script>
</body>
</html>