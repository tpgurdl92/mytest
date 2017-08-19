<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 메뉴. 로그인 시에만 메뉴 표시. : 수정하시오 -->
<c:if test="${loginId != null }">
	<header>
		<ul style="text-align:center;" >
			<li><a href="rooms">회의실 예약 현황</a></li>
			<li><a href="myMeetings">내 회의 목록</a></li>
			<li>${loginName } 님 로그인 중</li>
			<li><a href="logout">로그아웃</a></li>
		</ul>
	</header>
</c:if>