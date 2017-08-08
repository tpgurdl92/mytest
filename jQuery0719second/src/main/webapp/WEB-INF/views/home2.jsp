<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/jquery-3.2.1.min.js"></script>
<script>
$(function() {
	
	var array = [{name:"hanbit", link:"http://www.hanbit.co.kr"},
		{name:"naver", link:"http://www.naver.com"},
		{name:"daum",link:"http://www.daum.net"}
	];
	var value= '';
	$.each(array, function(index,item) {
		var name = item.name;
		var link = item["link"]; //item.link
		alert(name);
		
		value += '<a href="'+link+'">'+name+ '</a><br />'
	});
	
	$("#target").text();
	alert(value);
	
	/*
	for(index in array){
		alert(array[index]["name"]);
	}*/
	
	
});


</script>
</head>
<body>
<h2>[ jQuery연습 - 1 ]</h2>
<div id="target">
	
</div>
</body>
</html>
