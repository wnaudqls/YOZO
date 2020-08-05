<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html charset=UTF-8");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 레시피</title>

<style type="text/css">
	div {
		text-align: center;
	}
	table {
		margin-left: auto;
		margin-right: auto;
	}
	td {
		width: 110px;
	}
	.recipe_img {
		width: 200px;
		height: 200px;
	}
	
	.top {
		width: 350px;
		height: 350px;
	}

</style>

</head>
<body>
<%@ include file="../../form/header.jsp" %>
<br>
<br>
<br>
<br>

<div class="">
	<b>통합 검색 : </b><input type="text" id="search" placeholder="레시피, 작성자, 재료"> 
	<input type="button" value="검색하기" onclick="location.href='#'"> 
	<input type="button" value="등록" onclick="location.href='#'">
	<br><br>
	<table>
		
		<tr>
			<td>대분류 : </td>
			<td> 한식 <input type="checkbox"></td>
			<td> 중식 <input type="checkbox"></td>
			<td> 일식 <input type="checkbox"></td>
			<td> 양식 <input type="checkbox"></td>
			<td> 퓨전 <input type="checkbox"></td>
			<td> 분식 <input type="checkbox"></td>
			<td> 간식 <input type="checkbox"></td>
		</tr>
		<tr>
			<td>소분류 : </td>
			<td> 자취생요리 <input type="checkbox"></td>
			<td> 야식 <input type="checkbox"></td>
			<td> 다이어트 <input type="checkbox"></td>
			<td> 술안주 <input type="checkbox"></td>
			<td> 간편식 <input type="checkbox"></td>
			<td> 디저트 <input type="checkbox"></td>
			<td> 가정식 <input type="checkbox"></td>
		</tr>
	</table>
	
</div>


<%@ include file="../../form/footer.jsp" %>

</body>
</html>