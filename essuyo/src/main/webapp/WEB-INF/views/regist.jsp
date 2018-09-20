<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="author" content="Colorlib">
    <meta name="description" content="자리있어요?">
    <meta name="keywords" content="이써요">
    <!-- Favicons -->
    <link rel="shortcut icon" href="#">
    <!-- Page Title -->
    <title>자리 있어요?</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="resources/css/bootstrap/bootstrap.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,400i,500,700,900" rel="stylesheet">
    <!-- Simple line Icon -->
    <link rel="stylesheet" href="resources/css/simple-line-icons.css">
    <!-- Themify Icon -->
    <link rel="stylesheet" href="resources/css/themify-icons.css">
    <!-- Hover Effects -->
    <link rel="stylesheet" href="resources/css/set1.css">
    <!-- Swipper Slider -->
    <link rel="stylesheet" href="resources/css/swiper.min.css">
    <!-- Magnific Popup CSS -->
    <link rel="stylesheet" href="resources/css/magnific-popup.css">
    <!-- Main CSS -->
    <link rel="stylesheet" href="resources/css/style.css">
    
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<title>회원가입</title>
</head>
<body>
<%@ include file="/pageframe/header.jsp" %>
<div class="row">
                    <div class="col-12">
                        <div class="card card-body">
                            <h4 class="card-title">회원가입</h4>
                            <h5 class="card-subtitle">요구사항에 따라 빈 칸을 채워주세요 </h5>
                            <form class="form-horizontal m-t-30">                               
                                <div class="form-group">
                                    <label for="example-email">[이메일] <span class="help"> 예) "example@gmail.com"</span></label>
                                    <input type="email" id="example-email" name="example-email" class="form-control" placeholder="이메일">
                                </div>
                                <div class="form-group">
                                    <label>[비밀번호]</label>
                                    <input type="password" class="form-control" value="password">
                                </div>
                                <div class="form-group">
                                    <label>[비밀번호 확인]</label>
                                    <input type="password" class="form-control" value="password">
                                </div>
                                 <div class="form-group">
                                    <label>[이 름] <span class="help"> 예) "홍길동"</span></label>
                                    <input type="text" class="form-control" value="이름">
                                </div>
                                <div class="form-group">
                                    <label for="age">[나이] <span class="help">  ※ 숫자로만 입력해 주세요. 예) 28살 -> 28</span></label>
                                    <input type="text" id="age" name="age" class="form-control" placeholder="나이">
                                </div>
                                
                               
                                
                                
                                <div class="form-group">
                                    <label>[성별]</label>
                                    <select class="custom-select col-12" id="inlineFormCustomSelect">
                                        <option selected>성별</option>
                                        <option value="남자">남자</option>
                                        <option value="여자">여자</option>
                                        
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>[프로필 사진 업로드]</label>
                                    <input type="file" class="form-control">
                                </div>
                                <button type="submit">가입완료</button>
                                </form>
                        </div>
                    </div>
                </div>
                

<%@ include file="/pageframe/footer.jsp"%>
</body>
</html>