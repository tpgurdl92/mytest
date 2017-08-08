<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/jquery-3.2.1.min.js">
</script>

<script>

$(function(){
	var ary1 = [100, "Pear", true];
	var color = ["red","green","blue","cyan"];
	var num = $("p");
	//alert(typeof num+ num.length+ ", "+num.length);
	var info = [
		{name:'http://www.naver.com'},{name:'http://www.nate.com'},{name:'http://www.daum.net'}];
	
	var temp ='';
	
	$.each(info, function(index,item){
		//$(item) ==> html object 객체인 item이 jquery 객체로 변환됨
		temp += '<a href="'+ item.name +'">'+item.name+'</a><br>';
	});
	
	$("#special").html(temp);
	
	
	// ary1의 length만큼 function을 반복
	
	//0번 item은 Object이다 {name:'홍'}
	//item.name or item()["name"]
	//innerHTML == text() : 태그 사이의 값을 꺼내오거나 태그 사리에 값을 넣을 때/
	
	/* $("#result").html("무궁화 <b>꽃</b>이 피었습니다");
	alert($("#test").html());
	$.each(info, color, function(index, item) {
		var temp = item.name;
	}); */  
	
	
});
</script>

</head>
<body>
<p>하나</p>
<p>둘</p>
<p>셋</p>
<p>넷</p>
<p>다섯</p>
<p>여나</p>
<p>일곱</p>
<p>여덟</p>
<div id="result"></div>
<div id="text">동해물과 <i>백두산이</i></div>

<h3 id="ttt"></h3>
<h3 id="special"></h3>

'<a href="'+item.name+'">'+index+'</a>'













</body>
</html>