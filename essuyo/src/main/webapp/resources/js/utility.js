/**
 * 일반 숫자표기를 원화 표기로 변환한다.
 * ex) 1000000 -> 1,000,000
 */
function dotSplit(number) {
			
			var tempNum = number;
			var priceAry = [];
			var count = 0;
			var result = "";
			
			if ( tempNum == 0 ) return "0";
			
			while(tempNum > 0)
			{
				priceAry.push(tempNum%10);
				tempNum /= 10;
				tempNum = parseInt(tempNum);
				count++;
				
				if( count%3 == 0 && tempNum > 0 )
				{
					priceAry.push(",");
				}
			}
			
			
			priceAry.reverse();
			priceAry.forEach(function(v,i){
				result += v;
			});	
			return result;
			
}

/**
 * Handelbars 라이브러리를 통해 template HTML을 생성한다.
 * 파라미터 
 * 1. templateName : script에 정의되어있는 HTML templte의 ID (ex) "#templateName"
 * 1. appendName   : 변환된 HTML을(결과물) 표시할 element ID (ex) "#appendName"
 * 1. data 		   : HTML 템플릿에 매핑할 data
 */

function makeHTML(templateName, appendName, data){
	var templateHTML = $(templateName).html();
	var compiler = Handlebars.compile(templateHTML);
	var resultHTML = compiler(data);
	
	
	$(appendName).append(resultHTML);
}


function Ajax(method,requestUrl,sendData,success){
	$.ajax({
		type : method,
		url : requestUrl,
		data : sendData,
		success : success,
		error : function(error){
			alert("Ajax error : " + error);
		}
	});
}

function Ajax(method,requestUrl,success){
	$.ajax({
		type : method,
		url : requestUrl,
		success : success,
		error : function(error){
			alert("Ajax error : " + error);
		}
	});
}

function myAlert( title, message){
	$(".overlay").show();
	$("#myModal").css("display", "block");
	
	$("#modal-title").text(title);
	$("#modal-body").text(message);
	
}

function ColseMyAlert(){
	$(".overlay").hide();
	$("#myModal").css("display", "none");
}


