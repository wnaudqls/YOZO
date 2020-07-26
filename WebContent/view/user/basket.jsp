<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html charset=UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>


<style type="text/css">

body h1{
	text-align: center;

}

#schedule {
	height: 500px;
}

#schedule_table {
	position: relative;
	top: 60px;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
	width: 800px;
	border: 1px solid gray;
	border-collapse: collapse;
}

/* #schedule_table tr {
      height: 10px;   
   } */
#schedule_table th {
	background-color: gray;
	color: white;
}

#schedule_confirm {
	margin-left: auto;
	margin-right: auto;
	position: relative;
	bottom: 0px;
}
</style>

</head>
<%@ include file="../form/header.jsp" %>
<body>
	<h1>장바구니</h1>

	<div id="schedule">
		<table id=schedule_table border="1">

			<tr>
				<th><input type="checkbox" name="선택"  />선택</th>
				<th>상품이름</th>
				<th>수량</th>
				<th>가격</th>
			<tr>
			<tr>
				<td><input type="checkbox" name="선택"  /></td>
				<td></td>
				<td><select><option>1개<option>2개<option>3개</select></td>
				<td></td>
			<tr>
			<tr>
				<td><input type="checkbox" name="선택"  /></td>
				<td></td>
				<td><select><option>1개<option>2개<option>3개</select></td>
				<td></td>
			<tr>
			<tr>
				<td><input type="checkbox" name="선택"  /></td>
				<td></td>
				<td><select><option>1개<option>2개<option>3개</select></td>
				<td></td>
			<tr>
		</table>
		<br> <br> <br> <br> <br> <br> <br>
		<br>

		<table id="schedule_confirm">
			<tr>
				<td> <input type="submit" value="완료" /> </td>
				<td> <input type="button" value="삭제" /> </td>
			</tr>
		</table>

	</div>



	<!-- 푸터 -->
<%@ include file="../form/footer.jsp" %>



</body>
</html>