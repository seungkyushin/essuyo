<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
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




</head>
<body>
   	<%@ include file="/pageframe/header.jsp" %>
   	
    <!--============================= RESERVE A SEAT =============================-->
    <section class="reserve-block">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h5>${product.name}</h5>
                    <p><span>￦￦￦</span>￦￦</p><br>
                    <p class="reserve-description">${product.discription}</p>
                </div>
                <div class="col-md-6">
                    <div class="reserve-seat-block">
                        <div class="reserve-rating">
                            <span>${product.status}</span>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--//END RESERVE A SEAT -->
    <!--============================= BOOKING DETAILS =============================-->
    <section class="light-bg booking-details_wrap">
        <div class="container"> 
            <div class="row">
      
     		 <div class="col-md-3 responsive-wrap">
           		 <img src="${image.path}" class="img-fluid" alt="${image.name}">              
        	</div>
               
               <div class="col-md-5 responsive-wrap">
            	   <div id="item" class="booking-checkbox_wrap">
            	   </div>
               </div>
                

                <div class="col-md-4 responsive-wrap">
                    <div class="contact-info">
            		   <div class="address">
                            <span class="icon-clock"></span>
                            <p>예약 날짜<br> <span id="reservation-date"></span><br>
                         	 <h6 id="use-count"></h6>
                            </p>
                        </div>
                     
                        <div class="address">
                            <span class="icon-screen-smartphone"></span>
                            <p>쿠폰 할인 : -0원</p>
                           
                        </div>
                        
                    </div>
                    <div class="follow">
                        <div class="follow-img">
                            <h6>결제 금액</h6>
                            <h3 style="color:red">100,000원</h3>
                        </div>
                        <hr>
                    </div>
                    <a href="#" class="btn btn-outline-danger btn-contact">결제하기</a>
 
                </div>
            </div> 
            <hr>
    
            <div class="row">
     
                <div class="col-md-8 responsive-wrap">
                
   				<div class="booking-checkbox_wrap"> 
                		<h5>할인</h5> 
         		</div>
            	<hr>
                
           
                       <div class="booking-checkbox_wrap">    
                             <h5>취소규정 및 약관동의</h5>      
                        			<ul>
                        			<li>연박의 취소수수료는 일할 계산합니다.</li>
                        			<li>취소수수료는 현금 결제액, 포인트 결제액 순으로 차감됩니다.</li>
                        			<li>취소수수료가 실 결제금액(현금+포인트)를 초과하는 경우, 초과금액을 부과하지 않습니다.</li><li>· 투숙일 이전 취소 시에는 쿠폰이 반환되며, 투숙일 이후에는 반환되지 않습니다.</li><li>. 예약 변경을 위한 취소시에도 취소수수료가 부과되오니 양해하여 주시기 바랍니다.</li>
                        			<li>노쇼(No-Show: 사전 연락없이 예약된 숙소를 이용하지 않음)의 경우 요금이 100% 정상 청구됩니다.</li>
                        			<li>실시간예약의 특성상 하나의 객실에 중복예약이 발생될 수 있으며, 이 경우 먼저 결제된 예약 건에 우선권이 있습니다.</li>
                        			<li>성수기 요금이 확정되지 않았거나 요금표가 잘못 등록된 경우 예약이 취소될 수 있습니다.</li>
                        			<li>펜션 예약은 24시간 이내 확정됩니다.</li>
                        			<li>모텔은 예약완료 후 15분 이내 고객센터를 통해 전액취소가 가능합니다.</li>
                        			<li>호텔은 예약완료 후 10분 이내 고객센터를 통해 전액취소가 가능합니다.</li>
                        			</ul>
                    </div>
                    
                </div>
            </div>
        </div>
    </section>
    <!--//END BOOKING DETAILS -->
 

    <!-- jQuery, Bootstrap JS. -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="resources/js/jquery/jquery-3.2.1.min.js"></script>
    <script src="resources/js/popper/popper.min.js"></script>
    <script src="resources/js/bootstrap/bootstrap.min.js"></script>
    <!-- Magnific popup JS -->
    <script src="resources/js/jquery/jquery.magnific-popup.js"></script>
    <!-- Swipper Slider JS -->
    <script src="resources/js/swiper.min.js"></script>
    
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="resources/js/datepicker-ko.js"></script>
	<script src="resources/js/handlebars.min.js"></script>

	<script>
	$(document).ready(function(){
		

		    $("#date1").datepicker({
		        onSelect:function(dateText, inst) {
		
					
					$("#reservation-date").text( dateText );
		        }
		    });
		    
		    $("#date2").datepicker({
		        onSelect:function(dateText, inst) {
		   
		        	$("#reservation-date").text( dateText );
		        	
		        	var startDate =  $("#date1").val() ;
					var endDate =  $("#date2").val() ;
					
					
					
					var startDateAry = startDate.split("-");
					var endDateAry =  endDate.split("-");
					
					var start = new Date(startDateAry[0],startDateAry[1],startDateAry[2]);
					var end = new Date(endDateAry[0],endDateAry[1],endDateAry[2]);
					
					var result = end - start;
					var day = 1000*60*60*24; 
					result /= day;
				
					$("#use-count").text( "사용 기간: " + result + "박");
					
		        }
		    });
		
	
		var data = {};
		var resultHTML = templateParserAfter("#template-item-hotel", data,"#item");
			

			 
 		$("#plus").on("click",function(){
			var count = parseInt($("#count").val()) + 1;
			$("#count").val(count);
		 });
		 $("#minus").on("click",function(){
			 var count = parseInt($("#count").val()) - 1;
			 $("#count").val(count);
		 });
	});
	
	function templateParserAfter(templateId, data, output){
		var parser = Handlebars.compile( $(templateId).text());
		var resultHTML = parser(data);

		$(output).append(function(){
			return resultHTML; 
		});

	}
	</script>
    <script>
        var swiper = new Swiper('.swiper-container', {
            slidesPerView: 3,
            slidesPerGroup: 3,
            loop: true,
            loopFillGroupWithBlank: true,
            pagination: {
                el: '.swiper-pagination',
                clickable: true,
            },
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
        });
    </script>
    <script>
        if ($('.image-link').length) {
            $('.image-link').magnificPopup({
                type: 'image',
                gallery: {
                    enabled: true
                }
            });
        }
        if ($('.image-link2').length) {
            $('.image-link2').magnificPopup({
                type: 'image',
                gallery: {
                    enabled: true
                }
            });
        }
    </script>
   <script type="template" id="template-item-hotel">
	<div class="row">
           <div class="col-md-12">
                <label class="custom-checkbox">
                <span class="ti-check-box"></span>
                <span class="custom-control-description">최대 인원수 표시 </span>
                </label> 
           </div> 
                      		
            <div class="col-md-12">
                  <span class="icon-clock"></span>
                  <span class="custom-control-description">이용 날짜 </span> <br>
                  <div class="btn-group" role="group" aria-label="Basic example">
					<input type="text" size="20" name="date" id="date1" placeholder="체크인" class="btn-group1" readOnly><br>
					<input type="text"size="20"  name="date" id="date2" placeholder="체크아웃" class="btn-group2" readOnly>
				  </div>
			</div>
       </div>
     </script>
    
    <%@ include file="/pageframe/footer.jsp"%>
</body>

</html>

