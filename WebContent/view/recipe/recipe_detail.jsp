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
div{
border : 1px solid black;
}
	/*상단부*/
	.section_top{
	height:500px;
	text-align: center;
	}
	.main_img_wrap{
		width:500px;
		height:500px;
		display: inline-block;
		float:left;
	}
	.main_img{
		width:500px;
		height:500px;
	}
	.recipe_info{
		width:500px;
		height:500px;
		display: inline-block;
	}
	
	
	
	/*하단부*/
/* 	.recipe_order, .add_comment {
		text-align: center;
	}
	span{
		text-align: left;
	} */
	.section_top{
	
	text-align: center;
	}

</style>


</head>
<body>
<%@ include file="../../form/header.jsp" %>
<!-- 레시피 정보 --> 
	<div class="section_top">
		<div class="main_img_wrap">
			<img class="main_img" alt="title_img" src="${dto.recipe_main_photo }">
		</div>
	
		<div class="recipe_info">
			<h3>${dto.recipe_title }</h3>
			<p><b>작성자 : </b>${dto.member_id } </p>
			<p><b>종류 : </b>${dto.recipe_kind }</p>
			<p><b>테마 : </b>${dto.recipe_theme }</p>
		</div>
			<input type="button" value="레시피 읽어주기" onclick="voice_service()">	
			<p><b>재료 : </b>${dto.recipe_material } </p>
	</div>
	<div class="section_bottom">
	
	</div>	
	
	


<!-- 레시피 순서  -->

	
	<!-- <div class="recipe_order">
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
	</div> -->
	



<%@ include file="../../form/footer.jsp" %>
</body>
</html>












