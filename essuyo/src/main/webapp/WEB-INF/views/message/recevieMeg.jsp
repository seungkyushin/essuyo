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
	<form role="form" method="get">
		<div class="text-center">
			<h3> 받은 쪽지함</h3>
			<div>
				<button type="submit" class="btn allBtn"
					style="float: left; text-align: center; text-color: white; background-color: #D8D8D8; border-radius: 1px;">
					All LIST BOX</button>
				<button type="submit" class="btn sentBtn"
					style="float: left; text-align: center; text-color: white; background-color: #D8D8D8; border-radius: 1px;">
					RECEIVED BOX</button>
				<button type="submit" class="btn receivedBtn"
					style="float: left; text-align: center; text-color: white; background-color: #D8D8D8; border-radius: 1px;">
					SENT BOX</button>
			</div>
			<table class="table table-bordered">
				<tr>
					<th style="width: 10px">N</th>
					<th>TITLE</th>
					<th>SENDER</th>
					<!-- <th> SENDER </th> -->
					<th>DATE</th>
					<th>READ</th>
				</tr>
				<c:forEach items="${recevieList }" var="MessageVO">
					<tr>
						<td>${MessageVO.megNum }</td>
						<td><a
							href='/message/readPage${pageMaker.makeQuery(pageMaker.cri.page)}&megNum=${MessageVO.megNum }'>
								${MessageVO.title } </a></td>
						<td>${MessageVO.userID }</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
								value="${MessageVO.sendDate }" /></td>
								
						<c:if test="${MessageVO.readCheck == 1 }">
							<td><strong><span class="badge bg-red">읽음</span></strong></td>
						</c:if>
						<c:if test="${MessageVO.readCheck == 0 }">
							<td><span class="badge bg-red">읽지 않음</span></td>
						</c:if>
						<%-- <td><span class="badge bg-red">${MessageVO.readCheck}</span></td> --%>
						
					</tr>
				</c:forEach>
			</table>
			<div class="box-footer">
				<button type="submit" class="btn registerBtn"
					style="float: right; text-align: center; text-color: white; background-color: gray; border-radius: 5px;">
					WRITER</button>
			</div>
			<div class="pageNum"  align="center">
				<ul class="pagination">
					<c:if test="${pageMaker.prev }">
						<li><a
							href="recevieMeg${pageMaker.makeQuery(pageMaker.startPage - 1) }">&laquo;</a>
						</li>
					</c:if>

					<c:forEach begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }" var="idx">
						<li
							<c:out value="${pageMaker.cri.page == idx?'class =active':'' }"/>>
							<a href="recevieMeg${pageMaker.makeQuery(idx)}">${idx }</a>
						</li>
					</c:forEach>

					<c:if test="${pageMaker.next && pageMaker.endPage > 0} ">
						<li><a
							href="recevieMeg${pageMaker.makeQuery(pageMaker.endPage +1) }">&raquo;</a>
						</li>
					</c:if>
				</ul>
			</div>
		</div>


	</form>
	<script type="text/javascript">
		var result = '${msg}';

		if (result == 'SUCCESS') {
			alert("삭제가 완료되었습니다.");
		}
	</script>

	<!-- jquery 추가 -->
	<script src="/resources/js/jquery/jquery-3.2.1.min.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			var formObj = $("form[role='form']");

			console.log(formObj);
			$(".registerBtn").on("click", function() {
				formObj.attr("action", "/message/register");
				formObj.submit();
			});
			console.log(formObj);
			$(".allBtn").on("click", function() {
				formObj.attr("action", "/message/listPage");
				formObj.submit();
			});
			console.log(formObj);
			$(".sentBtn").on("click", function() {
				formObj.attr("action", "/message/recevieMeg");
				formObj.submit();
			});
			console.log(formObj);
			$(".receivedBtn").on("click", function() {
				formObj.attr("action", "/message/sendMeg");
				formObj.submit();
			});
		});
	</script>
</body>
</html>