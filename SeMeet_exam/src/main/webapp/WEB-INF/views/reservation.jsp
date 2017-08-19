<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>회의실 예약 현황</title>
<link rel="stylesheet" href="./resources/css/jquery.datetimepicker.min.css">
<style>
	#wrapper {
		width : 800px;
		margin : 0 auto;
	}
	a, a:link, a:hover, a:visited, a:active {
		text-decoration:none;
	}
	#wrapper header {
		width : 800px;
		height : 65px;
		margin: 0 auto;
		text-align : center;
	}
	header ul{
		padding : 0px;
		width : 800px;
		
		display : inline-block;
		background: #dedeff;
		border: 1px dotted black;
		clear : both;
	}
	li {
		float : left;
		margin : 20px;
		list-style: none;
		
	}
	
	
	section {
		clear : both;
	}
	section h1 {
		text-align:center;
	}
	h2.title {
		font-size : 1.2em;
		color : blue;
	}
	a.plus {
		display : inline-block;
		padding : 3px;
		margin-left : 10px;
	}
	form {
		margin : 0 auto;
	}
	table {
		border-collapse: collapse;
		border : none;
		width : 750px;
		margin : 0 auto;
		
	}
	tr {
		border-top : 1px dotted black;
		border-bottom: 1px dotted black;
		
	}
	th {
		background : #aaaaff;
	}
	td {
		padding : 5px;
	}

	.roomtitle, .starttime, .endtime, .action {
		width : 200px;
		text-align:center;
	}
	input[type='text'], input[type='password'] {
		width: 250px;
	}
</style>

<script src="./resources/js/jquery-3.2.1.min.js"></script>
<script src="./resources/js/jquery.datetimepicker.full.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('input[name=startTime]').datetimepicker();
		$('input[name=endTime]').datetimepicker();
		$("#rsvBtn").on("click",check)
	});
	
	

function check(){
	var title = $("#title").val();
	var start = $("#startTime").val();
	var end = $("#endTime").val();
	var chid = $(".id").is(":checked");
	
	if(title==""||start==""||end==""){
		alert("모든 정보를 입력해주세요");
		return false;
	}
	
	if(chid == false){
		alert("참가 인원을 선택해주세요");
		return false;
	}
	
}
	
</script>
</head>
<body>
<div id="wrapper">
	<%@ include file="menu.jsp" %>
	<section>
		<h1>회의실 예약</h1>
		<article>
			<form action="make" method="post">
				<input type="hidden" name="roomNum" value="${roomNum}">
				<table>
					<tr>
						<th class="roomtitle">회의실 명</th>
						<td>${roomName}</td>
					</tr>
					<tr>
						<th class="roomtitle">제목</th>
						<td>
							<input id="title" type="text" name="title">
						</td>
					</tr>
					<tr>
						<th class="starttime">시작</th>
						<td>
							<input id="startTime" type="text" name="startTime">
						</td>
					</tr>
					<tr>
						<th  class="endtime">끝</th>
						<td>
							<input id="endTime" type="text" name="endTime">
						</td>
					</tr>
					<tr>
						<th >참가자</th>
						<td>
							<!-- 멤버 목록을 체크박스로 표시 -->
							<!-- JSTL 코드를 이용하여 멤버목록이 체크박스로 출력되도록 코드 완성하시오 -->
							<c:forEach var="m" items="${memberList}">
								<c:if test="${m.name != loginName}">
								<input type="checkbox" name="id" class="id" value="${m.name}">${m.name}
								</c:if>
							</c:forEach>
						</td>
					</tr>
					<tr>
						<td colspan="2"  style="text-align:center">
							<input id="rsvBtn" type="submit" value="예약">
						</td>
					</tr>
				</table>
			</form>
		</article>
	</section>
</div>	
</body>
</html>