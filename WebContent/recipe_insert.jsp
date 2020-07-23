<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html charset=UTF-8");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

/*상단*/
	#upload_title {
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
	}
	#on_add > table {
		margin-left: auto;
		margin-right: auto;
	}
	
	#on_add > table tr td .unit {
		width: 100px;
	}
	
	
	#on_add > table tr td #large_category{
		width: 80px;
	}
	#on_add > table tr td #small_category {
		width: 130px;
	}
	
	#material_table {
		text-align: right;
	}

	.quantity {
		width: 40px;
	}

/*하단*/
	#under_add {
		text-align: center;
	}

	#under_add_create {
		margin-left: auto;
		margin-right: auto;
	}
	
	#under_add_create tr td input{
		width: 70px;
	}
</style>

</head>
<body>
<%@ include file="./form/header.jsp" %>
<!-- 상단부 -->
	<div id="upload_title">
		<input type="button" value="사진업로드" onclick="#">
	</div>
	<div id="on_add">
		<input type="text" placeholder="제목을 입력해주세요"> 
		<br>
		<br>
		<table id="material_table">
			<tr>
				<td>
					★ 대표재료 1 : 
				</td>
				<td>
					<input type="text" placeholder="재료 이름"> 
				</td>
				<td>
					<input type="number" placeholder="수량" class="quantity">
				</td>
				<td>
					<select class="unit">
						<option>단위</option>
						<option>g</option>
						<option>컵</option>
						<option>아빠숟가락</option>
						<option>웅큼</option>
						<option>주먹</option>
					</select>
				</td> 
			</tr>
			
			<tr>
				<td>
					재료 2 : 
				</td>
				<td>
					<input type="text" placeholder="재료 이름"> 
				</td>
				<td>
					<input type="number" placeholder="수량" class="quantity">
				</td>
				<td>
					<select class="unit">
						<option>단위</option>
						<option>g</option>
						<option>컵</option>
						<option>아빠숟가락</option>
						<option>웅큼</option>
						<option>주먹</option>
					</select>
				</td>
			</tr>
		</table>
		
		<br>
		
		<input type="button" alt="add_material" value="+">
		<br>
		<br>
		
		
		<table>
			<tr>
				<td>
					<select id="large_category">
						<option>한식
						<option>일식
						<option>중식
						<option>양식
						<option>퓨전
						<option>분식 
						<option>간식
					</select> 
				</td>
				<td>
					<select id="small_category">
						<option>자취생요리
						<option>야식
						<option>다이어트
						<option>술안주
						<option>간편식
						<option>디저트
						<option>가족
					</select> 
				</td>
			</tr>
		</table>
				
	</div>	

<!-- 하단부 -->
<br><br><br><br><br>
	<br><br><br><br><br>
	<br><br><br><br><br>
	<br><br><br><br><br>
	<br><br><br><br><br>
	<div id="under_add">
		<h3>레시피</h3>
		
		<div id="upload_pic">
			<input type="button" value="사진업로드" onclick="#">
		</div>
		<br>
		<textarea rows="5" cols="50"></textarea> <br>
		<br>
		<input type="button" alt="add_order" value="+">
		<br>
		<br>	
		<table id="under_add_create" >
		
			<tr>
				<td><input type="button" value="작성하기" onclick="#"></td>
				<td><input type="button" value="취소" onclick="#"></td>
			</tr>
		</table>		
	
	</div>
		<br><br><br><br><br>



<%@ include file="./form/footer.jsp" %>
</body>
</html>

























