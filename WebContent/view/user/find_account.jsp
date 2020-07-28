 <%@ page language="java" contentType="text/html; charset= UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
section {
	height : 600px;
	text-align : center;
	margin-top: 100px;

}
.find{
	line-height : 30px;
}
.message{
	font-size: 25px;
	display : inline-block;
	vertical-align: middle;
}
.warning{
	vertical-align: middle;
	width : 50px;
	hegiht :50px;
	
}
.btn{
	width : 70px;
	height : 35px;
	margin-top: 20px;
	background-color : #F5A9A9;
	color : #FAFAFA;
	border : 0;
	outline: 0;
	border-radius : 0.35em;
	font-weight: bold;
	cursor: pointer;
	
}
.box{
	width : 250px;
	height : 20px;
}

	
</style>
<body>
<%@ include file ="../../form/header.jsp" %>
<section>
	<div class="find">
		<div class="findmessage">
			<img class="warning" alt="warning" src="./img/warning.jpg" >
			<span><b class="message">아이디 찾기</b></span>
		</div>
		<div>
			<span>가입하실 때 입력하셨던 이메일을 입력해주세요.</span><br/>
	
			<input class ="box" type="text" placeholder="e-mail을 입력해주세요."/><br/>
			<input class="btn" type="button" value="확인"/>
		</div>
	</div>
		<br/>
	<div class="find">
	<div class="findmessage">
		<img class="warning" alt="warning" src="./img/warning.jpg">
		<span><b class="message">비밀번호 찾기</b></span>
	</div>
		<div>
			<span>아이디를 입력해주세요.</span><br/>
	
			<input class = "box" type="text" placeholder="ID를 입력해주세요."/><br/>
			<input class="btn" type="button" value="확인"/>
		</div>
		
	</div>
</section>
<%@ include file="../../form/footer.jsp" %>
</body>
</html>