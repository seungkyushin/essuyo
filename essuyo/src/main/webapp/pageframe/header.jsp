<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Colorlib">
<meta name="description" content="자리있어요?">
<meta name="keywords" content="이써요">

<link rel="shortcut icon" href="#">
<title>자리 있어요?</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR">
<link rel="stylesheet" href="/resources/css/simple-line-icons.css">
<link rel="stylesheet" href="/resources/css/themify-icons.css">
<link rel="stylesheet" href="/resources/css/set1.css">
<link rel="stylesheet" href="/resources/css/swiper.min.css">
<link rel="stylesheet" href="/resources/css/magnific-popup.css">
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/css/bootstrap-dialog.min.css">

</head>
<body>



    <div class="dark-bg sticky-top">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <nav class="navbar navbar-expand-lg navbar-light">
                        <a class="navbar-brand" href="/"><img src=""/></a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
              <span class="icon-menu"></span>
            </button>
                        <div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
                            <ul class="navbar-nav">
                              <!--   <li class="nav-item dropdown">
=======
	<div class="dark-bg sticky-top">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<nav class="navbar navbar-expand-lg navbar-light">
						<a class="navbar-brand" href="/"><img src="" /></a>
						<button class="navbar-toggler" type="button"
							data-toggle="collapse" data-target="#navbarNavDropdown"
							aria-controls="navbarNavDropdown" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="icon-menu"></span>
						</button>
						<div class="collapse navbar-collapse justify-content-end"
							id="navbarNavDropdown">
							<ul class="navbar-nav">
								<!--   <li class="nav-item dropdown">
>>>>>>> branch 'master' of https://github.com/seungkyushin/essuyo.git
                                    <a class="nav-link" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                   						카테고리
                   						<span class="icon-arrow-down"></span>
                 					</a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                        <a class="dropdown-item" href="#">호텔</a>
                                        <a class="dropdown-item" href="#">렌트카</a>
                                        <a class="dropdown-item" href="#">박물관</a>
                                        <a class="dropdown-item" href="#">음식점</a>                                    </div>
                                </li> -->

								<li class="nav-item"><a class="nav-link"
									href="/user/regist">호텔</a></li>
								<li class="nav-item"><a class="nav-link"
									href="/user/regist">렌트카</a></li>
								<li class="nav-item"><a class="nav-link"
									href="/user/regist">박물관</a></li>
								<li class="nav-item"><a class="nav-link"
									href="/user/regist">식당</a></li>

								<c:choose>
									<c:when test="${ empty sessionScope.login }">
										<li class="nav-item"><a class="nav-link"
											href="/user/regist">회원가입</a></li>
										<li><a href="/user/login"
											class="btn btn-outline-light top-btn">로그인</a></li>
									</c:when>

									<c:when test="${ !empty sessionScope.login }">
										<div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin6">

											<ul class="navbar-nav float-left mr-auto">
												<li class="nav-item search-box">
												</li>
											</ul>

											<ul class="navbar-nav float-right">

												<li class="nav-item dropdown">
												<a class="nav-link dropdown-toggle text-muted waves-effect waves-dark pro-pic"
													href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
													<img id="userImage" src="" alt="user" class="rounded-circle" width="31">
												</a>
													<div class="dropdown-menu dropdown-menu-right user-dd animated">
														<a class="dropdown-item" href="javascript:void(0)"><i
															class="ti-user m-r-5 m-l-5"></i> 프로필</a> <a
															class="dropdown-item" href="/user/logout"><i
															class="ti-wallet m-r-5 m-l-5"></i> 로그아웃</a> 
													</div></li>
											
											</ul>
										</div>

									</c:when>
								</c:choose>
							</ul>
						</div>
					</nav>
				</div>
			</div>
		</div>
	</div>



  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="../resources/js/utility.js"></script>
  	

<div class="overlay"></div>
<div class="modal" id="myModal" >


  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 id= "modal-title" class="modal-title">${errorMessageTitle}</h4>
        <button type="button" class="close" data-dismiss="modal" onclick='ColseMyAlert()'>&times;</button>
      </div>


      <!-- Modal body -->
      <div id= "modal-body" class="modal-body">
       ${errorMessage}
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" onclick='ColseMyAlert()' data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>

   	
	<script>
	
	if( "${errorMessageTitle}" != "" && "${errorMessage}" != "" ){
		myAlert();
	}
	 	 
	if( "${sessionScope.login}" != "" ){
		Ajax("GET","http://localhost:8080/api/loginImage",function(data){
		
			$("#userImage").attr("src",data);
		})
	}
	

	
	</script>
</body>
</html>
