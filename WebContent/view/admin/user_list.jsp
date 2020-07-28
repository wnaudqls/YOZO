<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html charset=UTF-8");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

	#user_list {
		text-align: center;
		height: 500px;
	}

	#user_list_table {
	
		position: relative;
		top: 30px;
		margin-left: auto;
		margin-right: auto;
		text-align: center;
		width: 800px;
		border: 1px solid gray;
		border-collapse: collapse;
	}
	
	/* #user_list_table tr {
		height: 10px;	
	} */
	#user_list_table th {
		background-color: gray;
		color: white;	
	}
	
	#user_list_con {
		text-align: center;
		padding-bottom: 30px;
	}
	
	#user_list_confirm {
		margin-left: auto;
		margin-right: auto;
		
		
			
	}

</style>

</head>
<body>
<%@ include file="../../form/header.jsp" %>

<div id="user_list">

<h3>전체 회원 조회</h3>

<table id=user_list_table border="1">
	
	<tr>
		<th><input type="checkbox"></th>
		<th>아아디</th>
		<th>닉네임</th>
		<th>이름</th>
		<th>주소</th>
		<th>회원 등급</th>
	<tr>
	<tr>
		<td><input type="checkbox"></td>
		<td>trinity</td>
		<td>쩡쓰삔쓰현모쓰</td>
		<td>현모</td>
		<td>써울</td>
		<td><select>
			<option >관리자
			<option>일반 회원
		</select></td>
	<tr>

	
</table>
</div>
<div id="user_list_con">

<input type="text" placeholder="유저 통합검색" id="user_search"> 
<input type="button" value="검색하기" onclick="#">

<table id="user_list_confirm">
	<tr>
		<td><input type="button" value="삭제" onclick="#"></td>
		<td><input type="button" value="수정" onclick="#"></td>
		<td><input type="button" value="취소" onclick="#"></td>
	</tr>
</table>

</div>






<%@ include file="../../form/footer.jsp" %>
</body>
</html>





















