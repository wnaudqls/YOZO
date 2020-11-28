<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>개인정보 수정</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

  		

	<style type="text/css">
		.login {
			position: static;
			text-align: center;
			height: 600px;
		}
		.naverIdLogin {
			width: 50%;
		}
		
		.userBtn {
			border: none;
			background-color: #F5A9A9;
			color: white;
			border-radius: 3px;
			cursor: pointer;
		}
	</style>
</head>
<body>
	<%@ include file="form/header.jsp"%>

	<div class="login">
		<br> <br> <br> <br>
		<h1>개인정보 수정</h1>
		<form action="<%=request.getContextPath()%>/user.do" method="post">
			<input type="hidden" name="command" value="edit_account"> 
			<input type="text" name="id" placeholder="아이디를 입력하세요"> <br> 
			<input type="password" name="pw" placeholder="비밀번호를 입력하세요"> <br><br>
			<br>
				<input type="submit" class="userBtn" value="정보 수정 페이지로 이동">

		</form>
		
		
		<p>SNS가입 유저는 개인정보수정이 불가능합니다.</p>

	</div>
	
	<%@ include file="form/footer.jsp"%>



</body>
</html>