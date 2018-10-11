<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 내용</title>
</head>
<body>
	<form role="form" method="post">
		<input type="hidden" name='noticeNum' value="${noticeVO.noticeNum}">
	</form>
	
	<div class="box-body">
		<div class="form-group">
			<label for="exampleInputEmail1">제목</label>
			<input type="text" name="title" class="form-control" value="${noticeVO.title}" readonly="readonly">
		</div>
		<div class="form-group">
			<label for="exampleInputPassword">내용</label>
			<textarea class="form-control" name="content" row="3"  readonly="readonly">${noticeVO.content}</textarea>
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">작성자</label>
			<input type="text" name="writer" class="form-control" value="${notice.userID}" readonly="readonly">
		</div>
	</div>
	
	<div class="box-footer">
		<button type="submit" class="btn btn-warning">수정</button>
		<button type="submit" class="btn btn-danger">삭제</button>
		<button type="submit" class="btn btn-primary">목록</button>
	</div>
	
	<script src="/resources/js/jquery/jquery-3.2.1.min.js"></script>
	
	<script>
	$(document).ready(function() {
			var formObj = $("form[role='form']");
			console.log(formObj);
			
			$(".btn-warning").on("click", function(){
				formObj.attr("action","/notice/modify");
				formObj.attr("method","get");
				formObj.submit();
			});
			
			$(".btn-danger").on("click", function(){
				formObj.attr("action", "/notice/remove");
				formObj.submit();
			});
			$(".btn-primary").on("click", function(){
				self.location ="/notice/listAll";

			});
		});
		
	
	</script>

</body>
</html>