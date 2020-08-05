<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html charset=UTF-8");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 레시피</title>

<style type="text/css">
*{
	border:0;
}
a{
	text-decoration: none;
	color: black;
}
	div {
		text-align: center;
	}
	table {
		margin-left: auto;
		margin-right: auto;
	}
	td {
		width: 110px;
	}
	.recipe_img {
		width: 200px;
		height: 200px;
	}
	
	.top {
		width: 350px;
		height: 350px;
	}
/*굿즈 목록 리스트 큰테두리*/
.recipe_list{
	border: 1px solid black;
	margin:0 5%;
	
}
#warning{	/* warning이미지 */
	width: 100px;
	height :100px;
	vertical-align: middle;
}
#message{	/* warning 메시지 */
	display : inline-block;
	vertical-align: middle;
}
.nosection{ /* 내용없을때 기본크기주기 */
height:400px;
}
.list_card{
	display:inline-block;
	width: 300px;
	height: 370px;
	/* border : 1px solid black; */
	border-radius: 25px;
	box-sizing: border-box;
	margin: 50px;
}
/* 카드이미지 테두리 */
.list_card_img{	/* 이미지 감싸는 div */
	
	width: 300px;
	height: 250px;
	border-radius: 25px 25px 0 0;
}
/* 카드이미지태그 */
.list_img_tag{		/* 이미지 태그 */

	border-radius: 25px 25px 0 0;
	width: 300px;
	height: 250px;
}
/* 카드 내용 */
.list_card_contents{
	text-align:center;
	width:300px;
	height:120px;
}
.like_icon{
	width:50px;
	height:50px;
}
.like_text{
	position:absolute;
	top:14px;	
	font: small-caps  24px/1 sans-serif;
	width:30px;
	height:50px;
/* 	display: inline-block;
 */}
 /*좋아요 테두리*/
.list_card_like{
position:relative;
	height: 50px;
}
/*제목들어가는칸*/
.list_card_title{
	height:70px;
	width:300px;
	font: small-caps bold 24px/1 sans-serif;
}
.list_card_title_a{
	margin-top:10px;
}

</style>

</head>
<body>
<%@ include file="../../form/header.jsp" %>

	<section>
			<c:if test="${rdto.member_role eq '관리자' }">
			
			<div id="btns">
				<input class="btn" type="button" value="등록" onclick="location.href='<%request.getContextPath(); %>/YORIZORI/
.do?command=goodsinsertform'"/> 
				<input class="btn" type="button" value="삭제" />
			</div>
			</c:if>
		
<div class="recipe_list">

	<c:choose>
		<c:when test="${empty list }">
			<div class="nosection">
			<img id="warning" alt="warning" src="/YORIZORI/img/warning.jpg">
			<h1 id="message">등록된 상품이 존재하지 않습니다.</h1>
			</div>
		</c:when>
		
		<c:otherwise>
		<c:forEach items="${list }" var="dto">
			<div class="list_card">
				<div class="list_card_img">
					<a href="recipe.do?command=recipe_detail&recipe_no=${dto.recipe_no }"><img src="${dto.recipe_main_photo }" class="list_img_tag" alt="레시피메인사진"/></a>	
				</div>
				<div class="list_card_content">
					<div class="list_card_title">
						<br>
						『<a class="list_card_title_a" href="recipe.do?command=recipe_detail&recipe_no=${dto.recipe_no }">${dto.recipe_title }</a> 』
					</div>
					<div class="list_card_like">
						<img onclick = "location.href='recipe.do?command=recipe_detail&recipe_no=${dto.recipe_no }'" class="like_icon"  src="/YORIZORI/img/recipe/like_icon.png"/>
						<span class="like_text">${dto.recipe_likecount}</span>
					</div>
				</div>
			</div>
	
			
			
		</c:forEach>
		</c:otherwise>
	</c:choose>
	
</div>
</section>

<%@ include file="../../form/footer.jsp" %>

</body>
</html>