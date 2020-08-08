<%@ page language="java" contentType="text/html; charset= UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
section{
	height : 600px;
	text-align: center;
	margin-top: 150px;
}
#warning{
	width: 50px;
	height :50px;
	vertical-align: middle;
}
#message{
	font-size: 25px;
	display: inline-block;
	vertical-align: middle;
}

#btn{
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
#box{
	width : 250px;
	height : 20px;
}
#find{
	line-height: 30px;
}

	 

</style>
<body>
<%@ include file ="/form/header.jsp" %>
	<section>
	<div id="find">
		<div>
			<img id="warning"alt="warning" src="/YORIZORI/img/warning.jpg">
			<span><b id="message">비밀번호 확인</b></span>
		</div>
		<div>
			<span>본인확인을 위해서 비밀번호를 입력해주세요.</span><br/>
			<input id="box"type="text" placeholder="비밀번호 입력"/><br/>
			<input id="btn"type="button" value="확인"/>
		</div>
	</div>
	
	</section>

<%@ include file="/form/footer.jsp" %>

</body>
</html>