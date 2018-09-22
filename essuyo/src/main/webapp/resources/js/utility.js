/**
 * 
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

