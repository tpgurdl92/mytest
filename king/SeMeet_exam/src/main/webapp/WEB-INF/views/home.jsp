<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>

<html>
<head>
	<title>회의실 예약</title>
	<meta charset="UTF-8">
<style>
	#wrapper {
		width : 700px;
		margin : 0 auto;
		text-align : center;
	}
	a, a:link, a:hover, a:visited, a:active {
		text-decoration:none;
	}
	ul, #userlogin {
		width : 600px;
		height : 100px;
		list-style: none;
		background : #efefff;
		
	}
	label {
		display : inline-block;
		width: 100px;
		margin : 5px;
	}
	input[type='text'], input[type='password'] {
		width: 250px;
	
	}
</style>
</head>

<body>
<div id="wrapper">
	<h2>[ 회의실 예약 프로그램 ]</h2>
	<c:if test="${loginId == null }">
	<form action="login" method="post">
		<ul>
			<li>
				<label for="id">ID</label>
				<input type="text" id="id" name="id">
			</li>
			<li>
				<label for="password">Password</label>
				<input type="password" id="password" name="password">
			</li>
			<li>
				<input type="submit" value="Login">
			</li>
		</ul>
	</form>
	</c:if>
	<c:if test="${loginId != null }">
	<div id="userlogin">
		${loginName }님 로그인 중 &nbsp;<a href="logout">로그아웃</a>
	</div>
	</c:if>
</div>
</body>
</html>
