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
	text-align : center;
}
.btn{
	width : 70px;
	height : 35px;
	margin-top: 50px;
	background-color : #F5A9A9;
	color : #FAFAFA;
	border : 0;
	outline: 0;
	border-radius : 0.35em;
	font-weight: bold;
	cursor: pointer;
}
.message{
	font-size: 25px;
}
#box{
	margin-top: 150px;
}




</style>
<body>
<%@ include file ="./form/header.jsp" %>
<section>
<div id="box">
	<span><b class="message">이메일이 발송되었습니다.</b></span><br/>
	<span><b class="message">이메일을 확인해주세요.</b></span><br/>
	<input class="btn" type="button" value="처음으로"/> 
</div>


</section>

<%@ include file ="./form/footer.jsp" %>

</body>
</html>