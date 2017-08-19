<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회의실 예약현황</title>
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

	article table {
		width :750px;
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
		border-top : 1px solid black;
		border-bottom: 1px solid black;
	}

	.roomtitle, .starttime, .endtime, .action {
		width : 200px;
		text-align:center;
	}

</style>	
<script>
	window.onload = function() {
		var message = '${message}';
		if (message == 'timeDuplicated') {
			alert('시간이 중복됩니다. 다른 회의실 또는 다른 시간을 선택하세요.');
		}
		var cancelM = '${cancelM}';
		if (message == 'nocancel') {
			alert('예약은 본인만 취소할 수 있습니다.');
		}
	}
</script>
</head>
<body>
<div id="wrapper">
	<%@ include file="menu.jsp" %>
	<section>
		<h1>회의실 예약 현황</h1>
		<article>
			<!-- 회의실 목록 표시 -->
			<!-- 회의실 목록이 출력될 수 있도록 JSTL과 EL로 코드를 완성하시오 -->
			
				<section>
				<c:forEach var="room" items="${roomList}" >
					<h2 class="title"><span >${room.name}</span>&nbsp;<a class="plus" href="reservation?num=${room.num}&name=${room.name}">+</a></h2>
					
					<article>
					
						<table border="1">
							<tr>
								<th class="roomtitle">제목</th>
								<th class="starttime">시작</th>
								<th class="endtime">끝</th>
								<th class="action">액션</th>
							</tr>
									
							<!-- 회의실 별 예약 현황 표시 되도록 JSTL과 EL로 코드를 완성하시오-->
							<c:forEach var="rsc" items="${roomStat}">
								<c:if test="${rsc.roomNum == room.num}">
									<tr>
										<td class="roomtitle">${rsc.title}</td>
										<td class="starttime">${rsc.startTime}</td>
										<td class="endtime">${rsc.endTime}</td>
										<td class="action">
											<!-- JSTL과 EL을  이용해서 코드를 완성하시오 -->
											<c:if test="${rsc != null}">
												<a href="cancel?num=${rsc.num}&memberId=${rsc.memberId}">취소</a>
											</c:if>
										</td>
									</tr>
								</c:if>
							</c:forEach>
							
						</table>
					</article>
					</c:forEach>
					
				</section>
		</article>
	</section>
</div>	
</body>
</html>