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
	
	#sche_con {
		text-align: center;
		padding-bottom: 30px;
	}
	
	#schedule_confirm {
		margin-left: auto;
		margin-right: auto;
		
		
			
	}

</style>

</head>
<body>
<%@ include file="../../form/header.jsp" %>

<div id="schedule">
<table id=schedule_table border="1">
	
	<tr>
		<th>닉네임</th>
		<th>이메일</th>
		<th>예약시간</th>
		<th>방송권한</th>
	<tr>
	<tr>
		<td>쩡쓰삔쓰현모쓰</td>
		<td>banana</td>
		<td>20-07-18 PM 6:00 ~ 7:00</td>
		<td><select>
			<option>대기
			<option>수락
		</select></td>
	<tr>

	
</table>
</div>
<div id="sche_con">
<table id="schedule_confirm">
	<tr>
		<td><input type="button" value="완료" onclick="#"></td>
		<td><input type="button" value="취소" onclick="#"></td>
	</tr>
</table>

</div>






<%@ include file="../../form/footer.jsp" %>
</body>
</html>





















