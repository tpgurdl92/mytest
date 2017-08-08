<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#wrapper {
		text-align: center;
	}

	#insertTable {
		width: 900px;
	}
	#infoTable {
		width: 900px;
	}
	

</style>

<script src="resources/jquery-3.2.1.min.js"></script>
<script>
	$(function(){
		$("#insertbtn").click(function(){
			var name = $("input:text").val();
			var option = $("select > option:selected").val();
			var radio = $("input:radio:checked").val();
			var ch ="";
			$("input:checkbox:checked").each(function(){
				if(this.checked){
					ch += $(this).val()+", ";
				}
			});
			//뒤에 , 자르기
			if(ch != null){
			ch = ch.slice(0,-2);
			};
			//등록버튼을 누르면 테이블 생성
			var delbtn = "<input id='delbtn' type='button' value='삭제'>";
			$("#infoTable > tbody:last").append("<tr><td>"+name+"</td><td>"+option+"</td><td>"+radio
					+"</td><td>"+ch+"</td><td>"+delbtn+"</td></tr>");
			//초기화
			//$("#cancelbtn").click();
			$(this).next().trigger("click"); //등록(this)버튼의 next 취소버튼을 클릭하는 효과
		});
		//생성된 버튼에 이벤트 처리하기
		$(document).on("click","#delbtn",function(){
			var selectedT = $(this).parent().parent();
			selectedT.remove();
		}); 
	});

</script>
</head>
<body>
<h2>고객 정보 등록하기</h2>
<form>
<table id="insertTable" border="1">
	<tr>
		<th>이름</th>
		<th>사는 지역</th>
		<th>성별</th>
		<th>취미</th>
	</tr>	
	<tr>
		<td><input type="text"/></td>
		<td>
			<select>
			<option>서울</option>
			<option>대구</option>
			<option>부산</option>
			<option>경기도</option>
			</select>
		</td>
		<td>
			<input type="radio" name="rd" value="남자">남자
			<input type="radio" name="rd" value="여자">여자
		</td>
		<td>
			<input type="checkbox" value="등산">등산 
			<input type="checkbox" value="독서">독서
			<input type="checkbox" value="수영">수영
			<input type="checkbox" value="자전거타기">자전거타기
			<input type="checkbox" value="잠자기">잠자기
		</td>
	</tr>
	<tr>
		<td colspan="4">
		<input id="insertbtn" type="button" value="등록">
		<input id="cancelbtn" type="reset" value="취소">
		</td>
	</tr>
</table>
<hr>
<h1>등록된 고객 정보</h1>
<table id="infoTable" border="1">
	<tr>
		<th>이름</th>
		<th>사는 지역</th>
		<th>성별</th>
		<th>취미</th>
		<th>비고</th>
	</tr>
	<tbody>	
	</tbody>	
</table>
</form>
</body>
</html>