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
/*	$("#btn1").click(function() {
		$("p").css("color","blue");
	});
});
$(function() {
	$("#btn2").click(function() {
		$("p").css("color","black");
	});*/
	
	$("p").mouseover(function() {
		$(this).css({backgroundColor:"black", "color":"white", "font-size":"2em"});
	});
	$("p").mouseout(function() {
		$(this).css("background","white");
	});

	$("tr:odd").css("background-color","#F9F9F9");
	$("tr").mouseover(function(){
		$(this).css("font-weight","bolder");
		$(this).css("position","absolute");
		$(this).css("left","1350px");
	});
	/*
	$("tr").mouseout(function(){
		$(this).css("font-weight","normal");
	});
	
	$('tr:even').css('background','#9F9F9F');
	$('tr:first').css({'background':'#000000', 'color':'#FFFFFF'});
	*/
	$("tr:eq(0)").css("background", "#000000").css("color","white");
	$("td:nth-child(3n+1)").css("background","#565656");
	$("td:nth-child(3n+2)").css("background","#A9A9A9");
	$("td:nth-child(3n+3)").css("background","#F9F9F9");
	
	$('select').change(function(){
		var select = $('select > option:selected').val();
		location.href=select;
	});
	
	$(".food").css({"position":"absolute","left":"350px","display":"none"});
	$(".one").mouseover(function(){
		 $("#"+$(this).val()).css("display","inline");
	});
	$(".one").mouseout(function(){
		 $(".food").css("display","none");
	});
	
});


</script>
</head>
<body>
<h2>[ jQuery연습 - 1 ]</h2>
<select id="site">
	<option value="http://www.naver.com">네이버</option>
	<option value="http://www.nate.com">네이트</option>
	<option value="http://www.google.com">구글</option>
</select>
<div id="btndiv">
<input class="one" type="button" value="1" />
<input class="one" type="button" value="2" />
<input class="one" type="button" value="3" />
</div>
<img id="1" class="food" src="resources/g.gif">
<img id="2" class="food" src="resources/sam.gif">
<img id="3" class="food" src="resources/p.gif">

<table border=1>
	<tr><th>이름</th><th>혈액형</th><th>지역</th></tr>
	<tr><td>강민수</td><td>AB형</td><td>서울특별시 송파구</td></tr>
	<tr><td>구지연</td><td>B형</td><td>미국 캘리포니아</td></tr>
	<tr><td>김미화</td><td>AB형</td><td>미국 메사추세츠</td></tr>
	<tr><td>김선화</td><td>O형</td><td>서울강서구</td></tr>
	<tr><td>남기주</td><td>A형</td><td>서울 노량진구</td></tr>
	<tr><td>윤하린</td><td>B형</td><td>서울 용산구</td></tr>
</table>
<hr>
	<p>I have a dream a song to sing</p>
	<p>to help me cope with anything</p>
	<p>if you see the wonder</p>
	<p>of a fairy tale</p>
	<p>you can take the future</p>
	<input id="btn1" type="button" value="change!" />
	<input id="btn2" type="button" value="original" />
</body>
</html>
