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
	}
	#box{
		margin-top: 150px;
		line-height: 50px;
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
	margin-top: 30px;
	background-color : #F5A9A9;
	color : #FAFAFA;
	border : 0;
	outline: 0;
	border-radius : 0.35em;
	font-weight: bold;
	cursor: pointer;
	}
	.inputbox{
		width : 250px;
		height : 23px;
	}

	

</style>
<body>
<%@ include file ="../../form/header.jsp" %>
<section>
<div id="box">
	<div>
	<img id="warning" alt="warning" src="./img/warning.jpg">
	<span><b id="message">새로운 비밀번호를 입력해주세요.</b></span><br/>
	</div>
	<span>변경할 비밀번호 : <input class="inputbox" type="text" placeholder="변경할 비밀번호를 입력해주세요."/></span><br/>
	<span>비밀번호 확인 : <input class="inputbox" type="text" placeholder="비밀번호를 한 번 더 확인하여 주십시오."/></span><br/>
	<input id="btn" type="button" value="변경완료"/>
</div>



</section>
<%@ include file ="../../form/footer.jsp" %>
</body>
</html>