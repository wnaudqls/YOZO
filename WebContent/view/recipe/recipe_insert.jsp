<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html charset=UTF-8");
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

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
   position: relative;
}
/*1*/
#mainphoto_wrapper {

    display: inline-block; 
     height:500px; 
   /* float:left; */
     position: relative;
     top:-150px;
}

#on_add {
   text-align: center;
       display: inline-block; 
    height:400px; 
    margin-left: 100px;
    position: relative;
    top:150px;

   /* float: left; */
   /* margin-right: 300px; */
}
/* 오버플로우 오토 해야함  */
#add_material_wrapper {

   overflow: auto;
   height: 250px;
   border: 2px solid gray;
   border-radius: 0.                      8em;
   margin-top: 15px;
}

.section_top {
/*    position: relative;
   text-align: center; */
}

.btn {
   width: 70px;
   height: 35px;
   background-color: #F5A9A9;
   margin-top: 20px;
   color: #FAFAFA;
   border: 0;
   outline: 0;
   border-radius: 0.35em;
   font-weight: bold;
   cursor: pointer;
   color: #FAFAFA;
}

.recipe_photo {
   width: 400px;
   height: 400px;
}
#inputtitle{
   height : 30px;
   width : 300px;
   margin-bottom: 15px;
}
.recipe_photo{
   border: 1px dotted gray;
   border-radius: 0.8em;
}
#under_add{
/* clear:left; */
}
</style>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		var i = 0;
		$("#addmaterial")
				.click(
						function() {
							$("#add_material_wrapper")
									.append(

	

											$("<div class='newmaterial'>재료 : <input type='text' placeholder='재료 이름' name='recipe_material'/>"

													+ "<input type='button' value='-' onclick='delete_material(this);'>"
													+ "</div>"));
						});

		$("#add_recipe")
				.click(
						function() {
							$("#add_recipe_wrapper")
									.append(
											$("<div><br/><input type='file' onchange='newrecipe_upload(event,"
													+ i
													+ ")' id='newrecipe_image"
													+ i

													+ "' name='recipe_photo"
													+ i
													+ "' value='recipe_photo"+i+"'><br/><br/>"

													+ "<br/><br/>"

													+ "<div><img class='recipe_photo' id='image_container"+i+"' value='"+i+"' /></div>"
													+ "<textarea rows='5' cols='70' name='recipe_detail'></textarea><br><input type='button' value='삭제' onclick='delete_textarea(this);'</div>"));
							i++;
						});

	});

	function delete_material(a) {
		$(a).parent().remove();
	}

	function delete_textarea(b){
		$(b).parent().remove();
	}


	//대표이미지
	function recipe_thumbnail(event) {
		var filePath = document.getElementById("recipe_main_photo").value;
		alert("filePath:" + filePath);

		var reader = new FileReader();
		reader.onload = function(event) {
			var imgtag = document.getElementById("recipe_img_main_container");
			imgtag.setAttribute("src", event.target.result);
			alert("속성부여완료");

		}
		reader.readAsDataURL(event.target.files[0]);

		var formdata=new FormData()
		formdata.append("recipe_main_photo" , $("#recipe_main_photo")[0].files[0]);
		$.ajax({
			type : 'post',
			data : formdata,
			url:"<%=request.getContextPath()%>/recipe.do?command=imgUpload",
			contentType : false, //header의 ContentType을 설정한다 	
			processData : false,
			 enctype: 'multipart/form-data',
			success : function(msg) {
				alert(msg);
				alert("레시피 이미지 업로드 성공");
			},
			error : function(request, status, error) {
				alert("레시피 이미지 업로드 실패")

			}

		});

	}
	//기본 레시피 이미지
	function recipe_image_upload(event) {
		var filePath = document.getElementById("recipe_image").value;
		alert("filePath:" + filePath);

		var reader = new FileReader();
		reader.onload = function(event) {
			var imgtag1 = document.getElementById("image_container");
			imgtag1.setAttribute("src", event.target.result);

		}
		reader.readAsDataURL(event.target.files[0]);

		var formdata=new FormData()
		formdata.append("recipe_image" , $("#recipe_image")[0].files[0]);
		$.ajax({
			type : 'post',
			data : formdata,
			url:"<%=request.getContextPath()%>/recipe.do?command=imgUpload",
			contentType : false, //header의 ContentType을 설정한다 	
			processData : false,
			 enctype: 'multipart/form-data',
			success : function(msg) {
				alert(msg);
				alert("레시피 이미지 업로드 성공");
				
			},
			error : function(request, status, error) {
				alert("레시피 이미지 업로드 실패")

			}

		});
		
	}

	//추가 레시피 이미지 미리보기
	function newrecipe_upload(event,i) {
		alert("i:" + i)
		var filePath = document.getElementById("newrecipe_image"+i).value;
		alert("filePath:" + filePath);

		var reader = new FileReader();
		reader.onload = function(event) {

			var imgtag2 = document.getElementById("image_container" + i);
			imgtag2.setAttribute("src", event.target.result);
		}
		reader.readAsDataURL(event.target.files[0]);
		
		var formdata=new FormData()
		formdata.append("newrecipe_image"+i , $("#newrecipe_image")[0].files[0]);
		$.ajax({
			type : 'post',
			data : formdata,
			url: "<%=request.getContextPath()%>/recipe.do?command=imgUpload",
			contentType : false, //header의 ContentType을 설정한다 	
			processData : false,
			enctype : 'multipart/form-data',
			success : function(msg) {
				alert(msg);
				alert("레시피 이미지 업로드 성공");

			},
			error : function(request, status, error) {
				alert("레시피 이미지 업로드 실패")

			}

		});

	}
</script>
</head>
<body>
	<%@ include file="../../form/header.jsp"%>
	<!--유정)섹션추가 -->
	<!-- 상단부 -->

	<form action="<%=request.getContextPath()%>/recipe.do" method="post"
		id="recipeinsertform">
		<input type="hidden" name="command" value="recipe_insert" />
		<div class="section_top">
			<div id="mainphoto_wrapper">
				<div id="upload_title">
					<input type="file" id="recipe_main_photo"
						onchange="recipe_thumbnail(event);" name="recipe_main_photo"
						value="recipe_main_photo" />
				</div>
				<div class="recipe_photo">
					<img class="recipe_photo" alt="대표이미지를 선택해주세요."
						id="recipe_img_main_container">
				</div>
			</div>
			<!--유정) 제목, 대표재료 , 재료 , +버튼 큰 디브로 묶음 -->
			<div id="on_add">
				<div id="category_wrapper">
					<input id="inputtitle" type="text" placeholder="제목을 입력해주세요."
						name="recipe_title"/>
					<div id="select_wrapper">
						<select id="large_category" name="cate_theme">
							<option value="한식">한식
							<option value="일식">일식
							<option value="중식">중식
							<option value="양식">양식
							<option value="퓨전">퓨전
							<option value="분식">분식
							<option value="간식">간식
						</select> <select id="small_category" name="cate_kind">
							<option value="자취생요리">자취생요리
							<option value="야식">야식
							<option value="다이어트">다이어트
							<option value="술안주">술안주
							<option value="간편식">간편식
							<option value="디저트">디저트
							<option value="가족">가족
						</select>
					</div>
				</div>

				<div id="add_material_wrapper">
					<div>
						★ 대표재료 : <input type="text" placeholder="재료 이름"
							name="recipe_material_one">

					</div>
				</div>
				<div>
					<input type="button" alt="add_material" value="+" id="addmaterial">

				</div>

			</div>
		</div>

		<!-- 하단부 -->
		<div id="under_add">
			<h3>레시피</h3>
			<div id="add_recipe_wrapper">
				<div id="upload_pic">
					<input type="file" onchange="recipe_image_upload(event);"
						id="recipe_image" name="recipe_photo" value="recipe_photo" />

				</div>
				<div class="recipe_photo">
					<img class="recipe_photo" alt="이미지를 선택해주세요" id="image_container">
				</div>
				<br>
				<textarea rows="5" cols="70" name="recipe_detail"></textarea>
				<br>

			</div>
			<div>
				<input id="add_recipe" type="button" alt="add_order" value="추가">
			</div>
			<div id="under_add_create">

				<div>

					<input class="btn" type="button" value="취소"
						onclick="location.href='<%request.getContextPath();%>/YORIZORI/recipe.do?command=recipe_list'" />
					<input class="btn" type="submit" value="작성하기" />


				</div>
			</div>

		</div>
	</form>
	<%@ include file="../../form/footer.jsp"%>
</body>
</html>

