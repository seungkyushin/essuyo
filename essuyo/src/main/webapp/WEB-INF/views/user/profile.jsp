<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" sizes="16x16" href="../resources/images/favicon.png">
    <title>프로필</title>
    <link href="../resources/css/style.min.css" rel="stylesheet">
    <link href="../resources/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Sans+KR">
    <link rel="stylesheet" href="../resources/css/simple-line-icons.css">
	<link rel="stylesheet" href="../resources/css/themify-icons.css">
	<link rel="stylesheet" href="../resources/css/set1.css">


</head>

<body>
 
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
  
    <div id="main-wrapper" data-navbarbg="skin6" data-theme="light" data-layout="vertical" data-sidebartype="full" data-boxed-layout="full">
     
         <%@ include file="/pageframe/admin-navigation.jsp" %>
         
        <div class="page-wrapper">
              <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-5 align-self-center">
                        <h4 class="page-title">회원 정보</h4>
                    </div>
                    <div class="col-7 align-self-center">
                        <div class="d-flex align-items-center justify-content-end">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item">
                                        <a href="#">Home</a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">Profile</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container-fluid">

                <div class="row">
                 
                    <div class="col-lg-4 col-xlg-3 col-md-5">
                        <div class="card">
                            <div class="card-body">
                                <center class="m-t-30"> <img src="${user.url}" class="rounded-circle" width="150" />
                                    <h4 class="card-title m-t-10">${user.name}</h4>
                                    
                                    <c:choose>
                                    	<c:when test="${ user.business.id != 0 }">
                                    	<h6 class="card-subtitle">${ user.business.comment }</h6>
                                    		<div class="row text-center justify-content-md-center">
                                     			<div class="col-4">
                                     				<a href="javascript:void(0)" class="link">
                                     					<i class="icon-like"></i> 
                                     					<font class="font-medium">${user.business.good}</font>
                                     				</a>
                                     			</div>
                                    		</div>
                                    	</c:when>
                                    	
                                    </c:choose>
                                    
                                </center>
                            </div>
                            
                            <div>
                                <hr> 
                            </div>
                            
                            
                            <div class="card-body"> 
                            	<small class="text-muted">Email</small>
                                	<h6>${user.email}</h6> 
                                <small class="text-muted">마지막 로그인</small>
                                	<h6>${user.lastLogin}</h6> 
                                <small class="text-muted p-t-30 db">나이</small>
                                	<h6>${user.age} 세</h6> 
                                <small class="text-muted p-t-30 db">성별</small>
                                
                                 <c:choose>
                                    	<c:when test="${ user.gender == '남' }">
                                    		<h6><i style="color:blue" class="icon-symbol-female"></i></h6>
                                    	</c:when>
                                    	<c:when test="${ user.gender == '여' }">
                                    		<h6><i style="color:red" class="icon-symbol-male"></i></h6>
                                    	</c:when>
                                    </c:choose>
                                    
                             </div>	
                                <div>
                               	 <hr> 
                            	</div>
                                
                              <div class="card-body">
                                <small class="text-muted p-t-30 db">Social Profile</small>
                                <br/>
                                <button id="modify" class="btn btn-circle btn-secondary"><i class="icon-magic-wand"></i></button>
                                <!-- <button class="btn btn-circle btn-secondary"><i class="mdi mdi-twitter"></i></button>
                                <button class="btn btn-circle btn-secondary"><i class="mdi mdi-youtube-play"></i></button> -->
                           	</div>
                        </div>
                    </div>
                    
                    <div class="col-lg-4 col-xlg-3 col-md-5">
								<div class="featured-place-wrap">
									<a href="/detail"> <img	src="${company.image}" class="img-fluid" alt="#">
										<span class="featured-rating-green">${company.score}</span>
										<div class="featured-title-box">
											<h6>${company.name}</h6>
											<p>${company.type}</p>
											<span>• </span>
											<p>3 Reviews</p>
																						
											<ul>
												<li><span class="icon-location-pin"></span>
													<p>${company.address}</p></li>
												<li><span class="icon-screen-smartphone"></span>
													<p>${company.number}</p></li>
												<li><span class="icon-link"></span>
													<p>${company.url}</p></li>
 											</ul>
											<div class="bottom-icons">
										<c:choose>
											<c:when test="${ company.state == '영업중' }">
                                    		<div class="open-now">${company.state}</div>
											</c:when>
											<c:when test="${ user.gender == '영업종료' }">
												<div class="closed-now">${company.state}</div>
											</c:when>
										</c:choose>

									</div>
										</div>
									</a>
								</div>		
					</div>			

                                                           
                     <div id="toggle" style="display:none" class="col-lg-3 col-xlg-1 col-md-1">
                        <div class="card">
                            <div class="card-body">
                                <form id="formData" class="form-horizontal form-material" action="/user/profileUpdate" method="POST">
                                    <div class="form-group">
                                        <label class="col-md-12">이름</label>
                                        <div class="col-md-12">
                                            <input type="text" id="name"  name="name" placeholder="${user.name}" class="form-control form-control-line">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">비밀번호</label>
                                        <div class="col-md-12">
                                            <input type="password" id="password" name="password" placeholder="●●●●●●●●"  class="form-control form-control-line">
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="col-md-12">비밀번호 확인</label>
                                        <div class="col-md-12">
                                            <input type="password" id="comfrimPassword" placeholder="●●●●●●●●"   class="form-control form-control-line">
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="col-md-12">나이</label>
                                        <div class="col-md-12">
                                            <input type="text" id="age" name="age" placeholder="${user.age}" class="form-control form-control-line">
                                        </div>
                                    </div>
                            <!--         
                              
                                    <div class="form-group">
                                        <label class="col-md-12">Message</label>
                                        <div class="col-md-12">
                                            <textarea rows="5" class="form-control form-control-line"></textarea>
                                        </div>
                                    </div> -->
                                    <div class="form-group">
                                        <label class="col-sm-12">성별</label>
                                        <div class="col-sm-12">
                                            <select id="gender" name="gender" class="form-control form-control-line">
                                            
                                            <c:choose>
                                            	<c:when test="${user.gender == '남'}">
                                            		<option value='남'>남</option>
                                              		  <option value='여'>여</option>
                                            	</c:when>
                                            	<c:when test="${user.gender == '여'}">
                                            		<option value='여'>여</option>
                                              		  <option value='남'>남</option>
                                            	</c:when>
                                            </c:choose>
                                            
                                                
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <button id="userInfoUpdate" class="btn btn-success">업데이트</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- Column -->
                </div>
              </div>
           
            <footer class="footer text-center">
                All Rights Reserved by Nice admin. Designed and Developed by
                <a href="https://wrappixel.com">WrapPixel</a>.
            </footer>
        </div>

    </div>
    <script src="../resources/js/jquery/jquery.min.js"></script>
    <script src="../resources/js/popper/umd/popper.min.js"></script>
    <script src="../resources/js/bootstrap/bootstrap.min.js"></script>
    <script src="../resources/js/sparkline.js"></script>
    <script src="../resources/js/userpage/waves.js"></script>
    <script src="../resources/js/userpage/sidebarmenu.js"></script>
    <script src="../resources/js/userpage/custom.min.js"></script>
    <script src="../resources/js/utility.js"></script>
    
    <script>
    $(document).ready(function(){
    	
    	/* 
		$( document ).click(function() {
	    	  $( "#toggle" ).toggle( "slide" );
	    	});
	   		 */
	   		$("#modify").on("click",function(){
	   		  $( "#toggle" ).toggle( "slide" );
	   			
	   		});
	   		
	   		
	   		$("#userInfoUpdate").on("click",function(){
	   			
	   			$("#formData").submit();
	   			
	   		});
    	
    	
    });
   
   		
    </script>
</body>

</html>