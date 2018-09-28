<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon.png">
    <title>오류 페이지</title>
    <link href="resources/css/style.min.css" rel="stylesheet">
</head>

<body>
    <div class="main-wrapper">
        <div class="preloader">
            <div class="lds-ripple">
                <div class="lds-pos"></div>
                <div class="lds-pos"></div>
            </div>
        </div>
         <div class="error-box">
            <div class="error-body text-center">
               <div class="error-body text-center">
                <h1 class="error-title text-danger">ERROR</h1>
                <h3 class="text-uppercase error-subtitle">요청하신 페이지를 찾을 수 없습니다.</h3>
                <p class="text-muted m-t-30 m-b-30">다시 확인하시길 바랍니다.</p>
                <a href="/" class="btn btn-danger btn-rounded waves-effect waves-light m-b-40">메인으로..</a> </div>
        </div>
    </div>
    
    <script src="resources/js/jquery/jquery.min.js"></script>
    <script src="resources/js/popper/umd/popper.min.js"></script>
    <script src="resources/js/bootstrap/bootstrap.min.js"></script>
  
  <script>
    $('[data-toggle="tooltip"]').tooltip();
    $(".preloader").fadeOut();
    </script>
</body>

</html>