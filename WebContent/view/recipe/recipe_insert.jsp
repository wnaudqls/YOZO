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
	/* 	border: 1px solid red; */
	display: inline-block;
}

#on_add {
	border: 1px solid yellow;
	text-align: center;
	/* 	display: inline-block; */
	height: 300px;
	float: right;
	margin-right: 150px;
}
/* 오버플로우 오토 해야함  */
#add_material_wrapper {
	border: 1px solid blue;
	overflow: auto;
	height: 250px;
}

.section_top {
	border: 1px solid green;
	position: relative;
	text-align: center;
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
											$("<div><br/><input type='file' onchange='newrecipe_upload("+i+")' id='newrecipe_image"+i+"'><br/><br/>"
													+"<div><img class='recipe_photo' id='image_container"+i+"' value='"+i+"' /></div><br/>" + "<textarea rows='5' cols='70' name='recipe_detail'></textarea></div>"));
							i++;
						});

	});

	function delete_material(a) {
		$(a).parent().remove();
	}
	
	/* function filechange(event){
	 	//파일의 전체경로를 가져오기위한 javascript		
	 		alert("파일체인지!!")
			var filePath = document.getElementById("recipe_main_photo").value;
			alert("filePath:"+filePath);
			var reader=new FileReader();
			reader.onload= function(event)
				//FileReader.onload 이벤트의 핸들러. 이 이벤트는 읽기 동작이 성공적으로 완료 되었을 때마다 발생합니다.
			{
				var photo=document.getElementById("recipe_img_main");
				photo.setAttribute("src",event.target.result);
			}
			reader.readAsDataURL(event.target.files[0]);
			//document.getElementById("goods_main_photo").value=filePath;
		//파일 미리보기 만들기
				//FileReader객체는 웹 애플리케이션이 비동기적으로 데이터를 읽기 위하여 읽을 파일을 가리키는 File 혹은 Blob객체를 이용해 
				//파일의 내용을(혹은 raw data버퍼로)읽고 사용자의 컴퓨터에 저장하는 것을 가능하게 해준다 ./
		//서버에 이미지 저장	
			//var formdata=new FormData(document.getElementById("goods_form"));
		/* 	// FormData의 key 확인
			for (key of formdata.keys()) {
			  console.log(key);
			}
			// FormData의 value 확인
			for (value of formdata.values()) {
			  console.log(value);
			} */
		//var imgurl= document.getElementById("recipe_main_photo").value; 
			function recipe_thumbnail(event){
				var filePath = document.getElementById("recipe_main_photo").value;
				alert("filePath:"+filePath);
				
				var reader = new FileReader();
				reader.onload = function(event){
					var imgtag = document.getElementById("recipe_img_main_container");
					imgtag.setAttribute("src" ,event.target.result);
					alert("잉");

				}
				reader.readAsDataURL(event.target.files[0]);
			}
			
			function recipe_image_upload(event){
				var filePath = document.getElementById("recipe_image").value;
				alert("filePath:" + filePath);
				
				var reader = new FileReader();
				reader.onload = function(event){
					var imgtag1 = document.getElementById("image_container");
					imgtag1.setAttribute("src", event.target.result);
				
				}
				reader.readAsDataURL(event.target.files[0]);
			} 
			
			function newrecipe_upload(i, event){
				alert("i:" + i)
				var filePath = document.getElementById("newrecipe_image"+i).value;
				alert("filePath:" + filePath);
				
				var reader = new FileReader();
				reader.onload = function(i){
					var imgtag2 = document.getElementById("image_container"+i);
					imgtag2.setAttribute("src", event.target.result);
					
				}
				reader.readAsDataURL(event.target.files[0]);
			}
			
	 
	 function imgupload(){
		 $.ajax({
			type : 'post',
			url : "<c:url value='/recipe.do?command=imgupload'/>",
			data : formdata,
			success : function(msg){
				alert(msg);
				alert("레시피 이미지 업로드 성공");
				$("#recipeinsertform").submit();
			},
			error : function(request,status,error){
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
		<input type="hidden" name="command" value="recipe_insert" /> <input
			type="hidden" name="recipe_no" value="${dto.recipe_no }">



		<div class="section_top">
			<div id="mainphoto_wrapper">
				<div id="upload_title">
					<input type="file" id="recipe_main_photo"
						onchange="recipe_thumbnail(event);" name="recipe_main_photo" />
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
						name="recipe_title" />
					<div id="select_wrapper">
						<select id="large_category" name="cate_theme">
							<option>한식
							<option>일식
							<option>중식
							<option>양식
							<option>퓨전
							<option>분식
							<option>간식
						</select> <select id="small_category" name="cate_kind">
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
					<div>
						★ 대표재료 : <input type="text" placeholder="재료 이름"
							name="recipe_material_one">
						<!--  <input
						type="number" placeholder="수량" class="quantity" name="main_material_quantity">
						 <select class="unit" name="main_material_unit">
						<option>단위</option>
						<option>g</option>
						<option>컵</option>
						<option>아빠숟가락</option>
						<option>웅큼</option>
						<option>주먹</option>
					</select> -->
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
						id="recipe_image" name="recipe_photo" />
				</div>
				<div class="recipe_photo">
					<img class="recipe_photo" alt="이미지를 선택해주세요" id="image_container">
				</div>
				<br>
				<textarea rows="5" cols="70" name="recipe_detail"></textarea>
				<br>

			</div>
			<div>
				<input id="add_recipe" type="button" alt="add_order" value="+">
			</div>
			<div id="under_add_create">

				<div>
					<input class="btn" type="button" value="취소" onclick="" /> <input
						class="btn" type="submit" value="작성하기" onclick="imgupload();" />

				</div>
			</div>

		</div>
	</form>
	<%@ include file="../../form/footer.jsp"%>
</body>
</html>

























