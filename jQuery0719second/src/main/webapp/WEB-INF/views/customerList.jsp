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
	$("#chAll").on('click',function() {
		if($(this).is(":checked")){
			$("#memberTable tbody input:checkbox").prop("checked",true);	
		}else{
			$("#memberTable tbody input:checkbox").prop("checked",false);	
		}
	});
	
	$("#deletebtn").on('click',function(){ 
		var checkedItem = $("#memberTable tbody input:checkbox:checked");
		if(checkedItem.length < 1){
			alert("삭제할 회원을 선택하세요");
			return;
		}
		checkedItem.parent().parent().remove();
		$(this).off('click');
	});
	
});



</script>
</head>
<body>
<div id="wrapper">
<h2>▶ 고객 목록</h2>
<p>총 5명의 고객이 검색되었습니다.</p>
<select>
	<option>이름</option>
	<option>고객등급</option>
</select>
<input type="text" name="searchtext"/> 
<input type="button" value="검색" /><br>
</div>
<div id="action">
<input id="chAll" type="checkbox" />
<input id="deletebtn" type="button" value="삭제" />

<table id="memberTable" border="1">
	<tr>
		<th>선택</th>
		<th>이름(이메일)</th>
		<th>주소</th>
		<th>전화번호</th>
		<th>고객등급</th>
	</tr>
	<tbody>
	<tr>
		<td><input class="chbox" type="checkbox" /></td>
		<td>홍길동(hong@kkkk)</td>
		<td>서울시 강남구 삼성동 코엑스 4층 10강의실</td>
		<td>010-2222-2222</td>
		<td>최우수 고객</td>
		
	</tr>
	<tr>
		<td><input class="chbox" type="checkbox" /></td>
		<td>나학생(ddfs@dd)</td>
		<td>제주도 제주시</td>
		<td>010-2232-2322</td>
		<td>우수고객</td>
		
	</tr>
	<tr>
		<td><input class="chbox" type="checkbox" /></td>
		<td>박혁거세(tabago@dfd)</td>
		<td>경주시</td>
		<td>010-2345-2432</td>
		<td>일반고객</td>
		
	</tr>
	<tr>
		<td><input class="chbox" type="checkbox" /></td>
		<td>권율(tadf@idid)</td>
		<td>경상도 어디낙</td>
		<td>010-2994-9422</td>
		<td>일반고객</td>
	</tr>
	<tr>
		<td><input class="chbox" type="checkbox" /></td>
		<td>이순신(tutle@dd)</td>
		<td>경상도 통영시</td>
		<td>010-3994-3322</td>
		<td>우수고객</td>
	</tr>
	</tbody>
</table>
</div>
</body>
</html>