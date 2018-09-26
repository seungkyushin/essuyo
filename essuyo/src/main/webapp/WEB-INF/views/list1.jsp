<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

	<div class="row light-bg detail-options-wrap">
		<div id="salesList"	class="col-sm-6 col-lg-12 col-xl-6 featured-responsive"></div>
	</div>

	<!-- ajaxJQuery -->
	<script>
	$(document).ready(function(){
			$.ajax({
					type : 'get',
					url : '/api/list',			
					dataType : 'JSON',
					success : function(data){				
						$(data).each(function() {
						var source = $("#template").html();
						var template = Handlerbars.compile(source);
						$(#"salesList").html(template(data));
						});
					}
				});
	});
	</script>

	<!-- 판매리스트 소스 -->
	<script id=template type="text/x-handlerbars-template">
	<div class="row light-bg detail-options-wrap">
							<div class="col-sm-6 col-lg-12 col-xl-6 featured-responsive">
								<div class="featured-place-wrap">
									<a href="/detail"> <img
										src="resources/images/featured1.jpg" class="img-fluid" alt="#">
										<span class="featured-rating-orange ">{{grade}}</span>
										<div class="featured-title-box">
											<h6>{{name}}</h6>
											<p>호텔</p>
											<span>• </span>
											<p>3 Reviews</p>
											<span> • </span>
											<p>
												<span>$$$</span>$$
											</p>
											<ul>
												<li><span class="icon-location-pin"></span>
													<p>{{address}}</p></li>
												<li><span class="icon-screen-smartphone"></span>
													<p>{{number}}</p></li>
												<li><span class="icon-link"></span>
													<p>{{url}}</p></li>

											</ul>
											<div class="bottom-icons">
												<div class="closed-now">{{state}}</div>
												<span class="ti-heart"></span> <span class="ti-bookmark"></span>
											</div>
										</div>
									</a>
								</div>
							</div>
</script>


<!-- 스크롤 페이징 처리  JQuery -->
<script type="text/javascript">
var page = 1;  //페이징과 같은 방식이라고 생각하면 된다. 
 
$(function(){  //페이지가 로드되면 데이터를 가져오고 page를 증가시킨다.
     getList(page);
     page++;
}); 
 
$(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
     if($(window).scrollTop() >= $(document).height() - $(window).height()){
          getList(page);
           page++;   
     } 
});
 
function getList(page){
    $.ajax({
        type : 'GET',  
        dataType : 'JSON', 
        data : {"page" : page},
        url : 'api/list',
        success : function(returnData) {
            var data = returnData.rows;
            var html = "";
            if (page == 1){ //페이지가 1일경우에만 id가 list인 html을 비운다.
                  $("#list").html(""); 
            }
            if (returnData.id<=returnData.length){
                if(data.length>0){
                // for문을 돌면서 행을 그린다.
                	var source = $("#template").html();
					var template = Handlerbars.compile(source);
					$(#"salesList").html(template(data));
             
                }else{
                //데이터가 없을경우
                }
            }
            html = html.replace(/%20/gi, " ");
            if (page != 1){  //페이지가 1이 아닐경우 데이터를 붙힌다.
                $("#salesList").html(html); 
            }else{
//                 $("#busStopList").append(html);
            }
            
       },error:function(e){
           if(e.status==300){
               alert("데이터를 가져오는데 실패하였습니다.");
           };
       }
    }); 
}

</script>

<script>
   
    var lastScrollTop = 0;
    var easeEffect = 'easeInQuint';
     
    // 1. 스크롤 이벤트 발생
    $(window).scroll(function(){ // ① 스크롤 이벤트 최초 발생
         
        var currentScrollTop = $(window).scrollTop();
         
        /* 
            =================   다운 스크롤인 상태  ================
        */
        if( currentScrollTop - lastScrollTop > 0 ){
            // down-scroll : 현재 게시글 다음의 글을 불러온다.
            console.log("down-scroll");
             
            // 2. 현재 스크롤의 top 좌표가  > (게시글을 불러온 화면 height - 윈도우창의 height) 되는 순간
            if ($(window).scrollTop() >= ($(document).height() - $(window).height()) ){ //② 현재스크롤의 위치가 화면의 보이는 위치보다 크다면
                 
                // 3. class가 scrolling인 것의 요소 중 마지막인 요소를 선택한 다음 그것의 data-bno속성 값을 받아온다.
                //      즉, 현재 뿌려진 게시글의 마지막 bno값을 읽어오는 것이다.( 이 다음의 게시글들을 가져오기 위해 필요한 데이터이다.)
                var lastbno = $(".scrolling:last").attr("data-bno");
                 
                // 4. ajax를 이용하여 현재 뿌려진 게시글의 마지막 bno를 서버로 보내어 그 다음 20개의 게시물 데이터를 받아온다.
                $.ajax({
                    type : 'GET',  // 요청 method 방식
                    url : 'api/list',// 요청할 서버의 url
                    headers : {
                        "Content-Type" : "application/json",
                        "X-HTTP-Method-Override" : "GET"
                    },
                    dataType : 'json', // 서버로부터 되돌려받는 데이터의 타입을 명시하는 것이다.
                    data : JSON.stringify({ // 서버로 보낼 데이터 명시
                        bno : lastbno
                    }),
                    success : function(data){// ajax 가 성공했을시에 수행될 function이다. 이 function의 파라미터는 서버로 부터 return받은 데이터이다.
                         
                        var str = "";            
                        // 5. 받아온 데이터가 ""이거나 null이 아닌 경우에 DOM handling을 해준다.
                        if(data != ""){
                            //6. 서버로부터 받아온 data가 list이므로 이 각각의 원소에 접근하려면 each문을 사용한다.
                            $(data).each(
                                // 7. 새로운 데이터를 갖고 html코드형태의 문자열을 만들어준다.
                                function(){
                                    console.log(this);     
                                	var source = $("#template").html();
            						var template = Handlerbars.compile(source);
            						$(#"salesList").html(template(data));
                                         
                            });
                            // 8. 이전까지 뿌려졌던 데이터를 비워주고, <th>헤더 바로 밑에 위에서 만든 str을  뿌려준다.
                            $(".listToChange").empty();// 셀렉터 태그 안의 모든 텍스트를 지운다.                       
                            $(".scrollLocation").after(str);
                                 
                        }// if : data!=null
                        else{
                            alert("더 불러올 데이터가 없습니다.");
                        }// else
         
                    }// success
                });// ajax
                 
                // 여기서 class가 listToChange인 것중 가장 처음인 것을 찾아서 그 위치로 이동하자.
                var position = $(".listToChange:first").offset();// 위치 값
                 
                // 이동  위로 부터 position.top px 위치로 스크롤 하는 것이다. 그걸 500ms 동안 애니메이션이 이루어짐.
                $('html,body').stop().animate({scrollTop : position.top }, 600, easeEffect);
     
            }//if : 현재 스크롤의 top 좌표가  > (게시글을 불러온 화면 height - 윈도우창의 height) 되는 순간
             
            // lastScrollTop을 현재 currentScrollTop으로 갱신해준다.
            lastScrollTop = currentScrollTop;
        }// 다운스크롤인 상태
         
        /* 
            =================   업 스크롤인 상태   ================
        */
        else{
            // up- scroll : 현재 게시글 이전의 글을 불러온다.
            console.log("up-scroll");          
 
            // 2. 현재 스크롤의 top 좌표가  <= 0 되는 순간
            if ($(window).scrollTop() <= 0 ){ //
                 
                // 3. class가 scrolling인 것의 요소 중 첫 번째 요소를 선택한 다음 그것의 data-bno속성 값을 받아온다.
                //      즉, 현재 뿌려진 게시글의 첫 번째 bno값을 읽어오는 것이다.( 이 전의 게시글들을 가져오기 위해 필요한 데이터이다.)
                var firstbno = $(".scrolling:first").attr("data-bno");
                 
                // 4. ajax를 이용하여 현재 뿌려진 게시글의 첫 번째 bno를 서버로 보내어 그 이전의 20개의 게시물 데이터를 받아온다.
                $.ajax({
                    type : 'GET',  // 요청 method 방식
                    url : 'api/list',// 요청할 서버의 url
                    headers : {
                        "Content-Type" : "application/json",
                        "X-HTTP-Method-Override" : "GET"
                    },
                    dataType : 'json', // 서버로부터 되돌려받는 데이터의 타입을 명시하는 것이다.
                    data : JSON.stringify({ // 서버로 보낼 데이터 명시
                        bno : firstbno
                    }),
                    success : function(data){// ajax 가 성공했을시에 수행될 function이다. 이 function의 파라미터는 서버로 부터 return받은 데이터이다.
                         
                        var str = "";
                         
                        // 5. 받아온 데이터가 ""이거나 null이 아닌 경우에 DOM handling을 해준다.
                        // 이때 서버에서 값이 없으면 null을 던질줄 알았는데 ""를 던진다. 따라서 (data != null) 이라는 체크를 해주면 안되고, (data != "") 만 해주어야한다.
                        // 이건아마 컨트롤러의 리턴타입이 @ResponseBody로 json형태로 던져지는데 이때 아마 아무것도 없는게 ""로 명시되어 날아오는것 같다.
                        if(data != ""){
                             
                            //6. 서버로부터 받아온 data가 list이므로 이 각각의 원소에 접근하려면 each문을 사용한다.
                            $(data).each(
                                // 7. 새로운 데이터를 갖고 html코드형태의 문자열을 만들어준다.
                                function(){
                                    console.log(this);    
                                    var source = $("#template").html();
            						var template = Handlerbars.compile(source);
            						$(#"salesList").html(template(data));
                                   
                                         
                            });// each
                            // 8. 이전까지 뿌려졌던 데이터를 비워주고, <th>헤더 바로 밑에 위에서 만든 str을  뿌려준다.
                            $(".listToChange").empty();// 셀렉터 태그 안의 모든 텍스트를 지운다.                       
                            $(".scrollLocation").after(str);
                                 
                        }//if : data != ""
                        else{ // 9. 만약 서버로 부터 받아온 데이터가 없으면 그냥 아무것도 하지말까..??
                             
                            alert("더 불러올 데이터가 없습니다.");
                        }// else
     
                    }// success
                });// ajax
                 
                // 스크롤 다운이벤트 때  ajax통신이 발생하지 않을때 까지의 좌표까지 스크롤을 내려가주기.
                var position =($(document).height() - $(window).height()) -10;
                 
                // 이동  위로 부터 position.top px 위치로 스크롤 하는 것이다. 그걸 500ms 동안 애니메이션이 이루어짐.
                $('html,body').stop().animate({scrollTop : position}, 600, easeEffect);
                 
            }//if : 현재 스크롤의 top 좌표가  <= 0 되는 순간
         
            // lastScrollTop을 현재 currentScrollTop으로 갱신해준다.
            lastScrollTop = currentScrollTop;
        }// else : 업 스크롤인 상태
         
});
</script>

<!-- 필터기능JQuery -->
<script>
$(#template).filter(function(data){
	
	
	  
}
</script>

</body>
</html>