<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ㅁㄴㅇㄹ</title>
</head>
<body>
<%@include file="form/header.jsp" %>
<hr>
<h1>상세보기</h1>
	<table border="1">
	<tr>
		<th>번호</th>
		<td>${dto.broadcast_no}</td>
	</tr>
	<tr>
		<th>아이디</th>
		<td><input type="text" name="id" disabled value="${dto.member_id}"></td>
	</tr>
	<tr>
		<th>제목</th>
		<td><input type="text" name="title" disabled value="${dto.broadcast_title}"></td>
	</tr>
	<tr>
		<th>작성된 시간</th>
		<td><input type="text" name="regdate" disabled value="${dto.broadcast_regdate}"></td>
	</tr>
	<tr>
		<th>내용물</th>
		<td><textarea rows="10" cols="60" name="content" disabled>${dto.broadcast_content}</textarea></td>
	</tr>
	</table>
	<input type="button" id="btn2"name="return" value="돌아가기" onclick="history.go(-1);"/>

<div id="footer">
<%@include file="form/footer.jsp" %>
</div>
</body>
<style type="text/css">
@import url("resources/css/selectone.css");
</style>
</html>