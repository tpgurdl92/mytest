<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	img {
		width:300px;
	}	
	
	div#myImg {
		width:300px;
		position:absolute;
		left:-300px;
	}
	
	#title {
		font-size:2em;
		position:absolute;
		top:-30px;
	}
</style>

<script src="resources/jquery-3.2.1.min.js"></script>
<script>
$(function(){
	
	/*
	$("h2").mouseenter(function(){
		$(this).addClass("color");
	})
	.mouseleave(function(){
		$(this).removeClass("color");
	}); 
	
	$("img").css({"border":"2px", 
		"border-color":"red",
		"border-style" : "solid"	
	});
	var stl = $("img").css("border-color");
	alert(stl);
	
	
	var color = ['red', 'green','purple'];
	$('h1').css('color', function(index){
		return color[index];
	});
	
	$("input").click(function(){
		$("div").empty();
	});
	
	setInterval(function(){
		var left = parseInt($("#myImg").css("left"));
		
		if(left < 700){
		$('div').css('left',function(){
			return left+=10;
		});
		}
	},500);	*/

	var sel = $('#ppp');
	alert(sel.index("p"));
	
	
});	
</script>

</head>
<body>

<div id="title">
<p id="ppp">i have a dream a song to sing!</p>
</div>


<!--  <div id="myImg">
	<img src="resources/sam.gif" />
	<img src="resources/p.gif" />
	<img src="resources/g.gif" />
</div>-->


</body>
</html>