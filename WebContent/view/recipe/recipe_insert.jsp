<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
<title>Insert title here</title>

<style type="text/css">

/* #upload_title {
	position: relative;
	top: 200px;
	left: 700px;
	float: left;
}

#on_add {
 	position: relative;
	float: left;
	top: 150px;
	left: 950px;
	text-align: center;
	margin-right: 50px;
}

#on_add div {
	width: 450px;
}

#on_add>div>table {
	margin-left: auto;
	margin-right: auto;
}

#on_add>table tr td .unit {
	width: 100px;
}

#on_add>table tr td #large_category {
	width: 80px;
}

#on_add>table tr td #small_category {
	width: 130px;
}

#material_table {
	text-align: right;
}

.quantity {
	width: 40px;
}

/*하단*/
/* #under_add {
	text-align: center;
}

#under_add_create {
	margin-left: auto;
	margin-right: auto;
}

#under_add_create tr td input {
	width: 70px;
}  */

/* 유정  */
/* .wrapper {
	display: inline-block;
}
 */

/* #add_material_wrapper {
	width: 520px;
	height: 350px;
	overflow: auto;
	padding: 0 20px;
	border: 2px solid gray;
	border-radius: 20px;
} */

/* yj */
.recipe_photo, #recipe_img_main {
	display: inline-block;
	width: 300px;
	height: 300px;
}

#recipe_img_main {
	border: 1px solid black;
}

.recipe_photo {
	display: inline-block;
}
/*1*/
#mainphoto_wrapper {
	border: 1px solid red;
	display: inline-block;
}

#on_add {
	border: 1px solid yellow;
	top: 150px;
	left: 950px;
	text-align: center;
	display: inline-block;
}

#category_wrapper, #add_material_wrapper {
	border: 1px solid blue;
}

.section_top{
border: 1px solid green;
position: relative;
text-align: center;
height: 

}

#on_add{
	height : 100%;
	display : inline-block;
	margin: 0;
	padding: 0;
}


</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#addmaterial")
				.click(
						function() {
							$("#add_material_wrapper")
									.append(
											$("<div class='newmaterial'>재료 : <input type='text' placeholder='재료 이름'>"
													+ " "
													+ "<input type='number' placeholder='수량' class='quantity'>"
													+ " "
													+ "<select class='unit'>"
													+ "<option>단위</option><option>g</option><option>컵</option>"
													+ "<option>아빠숟가락</option><option>웅큼</option><option>주먹</option></select>"
													+ " "
													+ "<input type='button' value='-' onclick='delete_material(this);'>"
													+ "</div>"));
						});

		$("#add_recipe")
				.click(
						function() {
							$("#add_recipe_wrapper")
									.append(
											$("<div><br/><input type='button' value='사진업로드'><br/><br/>"
													+ "<textarea rows='5' cols='50'></textarea></div>"));
						});

	});

	function delete_material(a) {
		$(a).parent().remove();
	}
</script>
</head>
<body>
	<%@ include file="../../form/header.jsp"%>
	<!--유정)섹션추가 -->
	<!-- 상단부 -->
	<section>
		<div class="section_top">
			<div id="mainphoto_wrapper">
				<div id="upload_title">
					<input id="recipe_main_photo" type="file" name="recipe_main_photo"
						onchange="filechange(event)" />
				</div>
				<div class="recipe_photo">
					<img alt="" src="대표이미지를 선택해주세요." id="recipe_img_main">
				</div>
			</div>
			<!--유정) 제목, 대표재료 , 재료 , +버튼 큰 디브로 묶음 -->
			<div id="on_add">
				<div id="category_wrapper">
					<input id="inputtitle" type="text" placeholder="제목을 입력해주세요." />
					<div id="select_wrapper">
						<select id="large_category">
							<option>한식
							<option>일식
							<option>중식
							<option>양식
							<option>퓨전
							<option>분식
							<option>간식
						</select> <select id="small_category">
							<option>자취생요리
							<option>야식
							<option>다이어트
							<option>술안주
							<option>간편식
							<option>디저트
							<option>가족
						</select>
					</div>
				</div>

				<div id="add_material_wrapper">
					<div id="material_table">
						<div>
							★ 대표재료 : <input type="text" placeholder="재료 이름"> <input
								type="number" placeholder="수량" class="quantity"> <select
								class="unit">
								<option>단위</option>
								<option>g</option>
								<option>컵</option>
								<option>아빠숟가락</option>
								<option>웅큼</option>
								<option>주먹</option>
							</select>
						</div>
					</div>
				</div>
				<div>
					<input type="button" alt="add_material" value="+" id="addmaterial">
				</div>

			</div>
		</div>


		<!-- 하단부 -->
		<!-- 이따살려 !!
		<div id="under_add">
			<h3>레시피</h3>
			<div id="add_recipe_wrapper">
				<div id="upload_pic">
					<input type="button" value="사진업로드" onclick="#">
				</div>
				<br>
				<textarea rows="5" cols="50"></textarea>
				<br>

			</div>
			<div>
				<input id="add_recipe" type="button" alt="add_order" value="+">
			</div>
			<table id="under_add_create">

				<tr>
					<td><input type="button" value="작성하기" onclick="#"></td>
					<td><input type="button" value="취소" onclick="#"></td>
				</tr>
			</table>

		</div> -->

	</section>
	<%@ include file="../../form/footer.jsp"%>
</body>
</html>

























