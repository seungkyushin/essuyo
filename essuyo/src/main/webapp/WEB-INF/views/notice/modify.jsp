<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form role="form" method="post">
		<div class="box-body">
			<div class="form-group">
				<label for="exampleInputEmail1">번호</label>
				<input type="text" name="noticeNum" class="form-control" value="${noticeVO.noticeNum}" readonly="readonly"> 
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">제목</label>
				<input type="text" name="title" class="form-control" value="${noticeVO.title}"> 
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">내용</label>
				<textarea class="form-control" name="content" rows="3">${noticeVO.content}</textarea> 
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">작성자</label>
				<input type="text" name="userID" class="form-control" value="${noticeVO.userID}" readonly="readonly"> 
			</div>
		</div>
	</form>
	
	<div class="box-footer">
		<button type="submit" class="btn btn-primary">SAVE</button>
		<button type="submit" class="btn btn-warning">CANCEL</button>
	</div>
	
	<script src="/resources/js/jquery/jquery-3.2.1.min.js"></script>
	
	<script>
	$(document).ready(function() {
		var formObj = $("form[role='form']");
		console.log(formObj);
		
		$(".btn-warning").on("click", function(){
			self.location="/notice/listAll";
		});
		
		$(".btn-primary").on("click", function(){
			formObj.submit();
		});
	});
	</script>
</body>
</html>