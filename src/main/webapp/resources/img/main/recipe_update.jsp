<%@ page language="java" contentType="text/html; charset= UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file ="/WEB-INF/views/form/header.jsp" %>
<!-- 레시피 정보 --> 

	<div class="section_top">
		<div class="main_img_wrap">
			<img class="main_img" alt="title_img" src="${dto.recipe_main_photo }">
		</div>
	<div class="recipe_wrap_top">
			<div class="recipe_info">
				<h2>${dto.recipe_title }</h2>
				<p><b>작성자 : </b>${dto.member_id } </p>
				<p><b>종류 : <input type="text" value="${dto.recipe_kind }"/></p>
				<p><b>테마 : <input type="text" value="${dto.recipe_theme }"/></p>
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

<%@ include file ="/WEB-INF/views/form/footer.jsp" %>

</body>
</html>