<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약목록들</title>
</head>
<body>
<%@include file="/form/header.jsp" %>
<h1>예약한 목록들</h1>
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>예약한 시간</th>
			<th>예약 확인여부</th>
		</tr>
		<c:if test="${empty list }">
			
			<tr>
				<td colspan=5>값이 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach items="${list }" var="dto">
		<tr>
			<td>${rdto.member_id }</td>
			<td>${dto.reservation_time }</td>
			<td>${dto.reservation_confirm }</td>
		</tr>
	</c:forEach>
	</table>
		<div id="down">
		<%@include file="/form/footer.jsp" %>
	</div>
</body>
<style type="text/css">
@import url("view/broadcast/css/normal.css");
</style>

</html>