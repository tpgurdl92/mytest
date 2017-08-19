<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	#wrapper {
		width : 800px;
		margin : 0 auto;
	}
	a, a:link, a:hover, a:visited, a:active {
		text-decoration:none;
	}
	header {
		width : 800px;
		height : 65px;
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
	table {
		border-collapse: collapse;
		border : none;
		
	}
	tr {
		border-top : 1px  black;
		border-bottom: 1px solid black;
	}
	th {
		background : #aaaaff;
	}

	.roomtitle {
		width : 300px;
	}
	.roomname, .starttime, .endtime, .action {
		width : 200px;
		text-align:center;
	}
	 .action {
		width : 100px;
		text-align:center;
	}

</style>
<title>내 회의 목록</title>
</head>
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script>
window.onload = function() {
	var message = '${message}';
	if (message == 'notList') {
		alert('목록이 없음');
	}
}

</script>
<body>
<div id="wrapper">
	<%@ include file="menu.jsp" %>
	<section>
		<!-- 내 회의 목록 표시 -->
		<h1>[ 내 회의 목록 ]</h1>
		<article>
			<!-- JSTL을 이용해서 회의 목록이 있을 경우 와 없을 경우를 나누어 코딩완료하시오 -->
			<c:if test="${myList !=null}">
					<c:forEach var="m" items="${myList}">
						<table>
							<tr>
								<th class="roomtitle">제목</th>
								<th class="roomname">회의실 명</th>
								<th class="starttime">시작</th>
								<th class="endtime">끝</th>
								<th class="action">액션</th>
							</tr>
							<!-- 밑줄로 된 부분을 JSTL 혹은 EL 로 완성하시오 -->
							<tr>
								<td class="roomtitle">${m.title}</td>
								<td class="roomname">${m.roomName }</td>
								<td class="starttime">${m.startTime}</td>
								<td class="endtime">${m.endTime}</td>
								<td class="action"><a href="absent?num=${m.num}">불참</a></td>
							</tr>

						</table>
					</c:forEach>
				</c:if>
		</article>
	</section>
</div>	
</body>
</html>