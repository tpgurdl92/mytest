<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/jquery-ui.css">
<script src="resources/jquery-3.2.1.min.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script>
	$(function(){
		$("#area").keyup(function(){
			var ta = $("#area").val().length;
			if(ta >300){
				alert("최대 글자수를 초과하였습니다");
				ta = ta-300+"글자를 초괴하였습니다 ";
			}
			//보여주기
			$("#strlength span").html(ta);
		});
	});
	
$(function (){
	$("#datep").datepicker();
});

</script>
</head>
<body>
<textarea id="area" rows="10" cols="60" maxlength="300"></textarea>
<div id=strlength>
<span></span>/300
</div>
<p>Date :<input type="text" id="datep"></p>

</body>
</html>