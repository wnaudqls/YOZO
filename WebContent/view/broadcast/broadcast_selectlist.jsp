<%@page import="java.util.List"%>
<%@page import="com.yozo.broadcast.dto.BroadcastDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
table{
text-align: center;
width: 300px;
height: 50px;
}
</style>
<title>ㅁㄴㅇㄹ</title>
</head>
<body>
	<%@include file="../../form/header.jsp" %>
	<hr>
	<% 
	
		int year = Integer.parseInt(request.getParameter("year"));
		int month = Integer.parseInt(request.getParameter("month"));
		int date = Integer.parseInt(request.getParameter("date"));
		String time = request.getParameter("time");
	%>
	
		<div>
		</div>
			<h1><%=year%>년 <%=month%>월 <%=date%>일 <%=time.substring(8, 10)%>시 방송목록들</h1>
<input type="hidden" name="command" value="reserve">
	<table border="1" >
	<tr>
		<th>번호</th>
		<th>id</th>
		<th>제목</th>
		<th>예약</th>
	</tr>
	<c:if test="${empty list }">
	
	<tr>
		<td colspan="6">방송이 없어요.</td>
	</tr>
	</c:if>
	<c:forEach items="${list}" var="dto">
	
		<tr>
			<td>${dto.broadcast_no}</td>
			<td>${dto.member_id}"</td>
			<td><a href="<%=request.getContextPath()%>/broadcast.do?command=selectone&no=${dto.broadcast_no}">${dto.broadcast_title}</a></td>	
			<td><input type="button" class="btn1" name="check" value="하기" onclick="location.href='broadcast.do?command=reserve&no=${dto.broadcast_no}&id=${rdto.member_id }'"></td>
		</tr>
	</c:forEach>
	</table>
	<div id="down">
			<%@include file="../../form/footer.jsp" %>
	</div>

</body>
<style type="text/css">
@import url("view/broadcast/css/selectlist.css");
</style>
</html>