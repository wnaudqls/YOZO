<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
/* div{
border : 1px solid black;
} */
	/*상단부*/
	.section_top{
		margin-top:5%;
		height:550px;
		margin: 0 5%;
	}
	.section_bottom{
		margin-top:5%;
		text-align: center;
	}
	.main_img_wrap{
		width:500px;
		height:500px;
		display: inline-block;
		margin-left:100px;
		float: left;
		margin-block-start: 0.83em;
	}
	.main_img{
		width:500px;
		height:500px;
		
	}
	.recipe_info{
		width:500px;
		height:150px;
		text-align: left;
		}
	.recipe_material{
		width:500px;
		height:280px;
		display: inline-block;
		text-align: left;
	}
	.recipe_wrap_top{
		display:inline-block;
		width:502 px;
		height:510px;
	}
	.material_list{
		height:200px;
		overflow: auto;
		border:1px solid black;
	}
	.recipe_image_wrap{
		border: 1px solid black;
		display:inline-block;
		height:300px;
		width:80%;
	}
	.speech_wrap{
		height:50px;
		position: relative;
		width:300px;
	}
	/*음성제어 버튼*/
	.speech_button{
		height:50px;
		position: relative;
		width:300px;
		border:1px solid black;
		background-color: #F5A9A9;
		color:#FAFAFA;
	}
	/*음성제어 스피커아이콘*/
	.speech_icon{
		width:40px;
		height:40px;
		position:relative;
		left:-7px;
		top:3px;
	}
	/*음성제어 텍스트*/
	.speech_text{
		/* display:inline-block */
		font: small-caps bold 24px/1 sans-serif;
		position: relative;
		top: -8px;
	}
	.recipe_content{
		text-align: center;
		font: small-caps  24px/1 sans-serif;
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
	<div class="recipe_wrap_top">
			<div class="recipe_info">
				<h2>${dto.recipe_title }</h2>
				<p><b>작성자 : </b>${dto.member_id } </p>
				<p><b>종류 : </b>${dto.recipe_kind }</p>
				<p><b>테마 : </b>${dto.recipe_theme }</p>
			</div>
			<div class="speech_wrap">
				<button type="button" onclick="voice_service()" class="speech_button">
				<img class="speech_icon" src="/YORIZORI/img/recipe/speaker4.png"/>
				<span class="speech_text">음성제어 시작하기</span>
				</button>
			</div>
			<div class="recipe_material">
				<h2>재료</h2>
				<ul class="material_list">
				<c:forEach items="${material }" var="m" varStatus="status"><li>${m }</li>  </c:forEach> 
				</ul>
			</div>
		</div>
	</div>
	<div class="section_bottom">
	
	<h2>레시피</h2>
	<c:forEach items="${detail }" var="d" varStatus="status">
		<!-- 전체레시피 --> 
		<div class="recipe_wrap_bottom">
			<!-- 단계별 레시피 이미지 -->
			<div class="recipe_image_wrap">
				<img alt="레시피${staktus.index }" src="">
			</div>
			<!-- 단계별 래시피 글 -->
			<div class="recipe_content">
						${d}
			</div>
		</div>
			
	</c:forEach>
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












