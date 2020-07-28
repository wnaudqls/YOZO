<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html charset=UTF-8");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

 function voice_service() {
	window.open("voice_service.jsp","레시피 읽어주기!","width=1700, height=1080, left=100, top=0") 
 }


</script> 

<style type="text/css">
	/*상단부*/
	#title_img {
		position: absolute;
		float: left;
		left: 25%;
	}
	
	#recipe_info {
		position: absolute;
		float: right;
		/* width: 512px; */
		right: 40%;
	}
	
	/*하단부*/
	.recipe_order, .add_comment {
		text-align: center;
	}
	span{
		text-align: left;
	}

</style>


</head>
<body>
<%@ include file="../form/header.jsp" %>
<!-- 레시피 정보 --> 
	<div id="title_img">
		<img alt="title_img" src="./img/img04.png">
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div id="recipe_info">
		<h3>제목</h3>
		<b>작성자 : </b> <br>
		<b>재료 : </b>
		<br>
		<br>
		<br>
		
		
		<input type="button" value="레시피 읽어주기" onclick="voice_service()">	
		
	</div>
	
	
	
	
	
	
	

	<br><br><br><br><br>
	<br><br><br><br><br>
	<br><br><br><br><br>
	<br><br><br><br><br>
	<br><br><br><br><br>
	
	
	
	
	
	
	
	
	
	
	
	


<!-- 레시피 순서  -->

	
	<div class="recipe_order">
		<h3>레시피</h3>
		<img alt="레시피1" src="./img/img04.png">
		<br>
		<span>1. 레시피 순서1</span> 	
	</div>
	<div class="recipe_order">
		<img alt="레시피2" src="./img/img04.png">
		<br>
		<span>1. 레시피 순서2</span>		
	</div>
	<br>
	
	<div class="add_comment">
		<input type="text" id="comment" placeholder="내용을 입력하세요">
		<input type="button" id="add_comment" value="덧글 작성"	>
	</div>
	
	<br><br><br><br><br>
	<br><br><br><br><br>
	



<%@ include file="../form/footer.jsp" %>
</body>
</html>












