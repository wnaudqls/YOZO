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

	#voice_order {
		text-align: center;
	}

	table {
		margin-left: auto;
		margin-right: auto;
	}
	
	.voice_btn {
		position: relative;
		bottom: -50px;	
	}

</style>

</head>
<body>

	<h1>레시피 읽어주기</h1>

	<div id="voice_order">
	
		<h3>레시피</h3>
		
		<img alt="레시피" src="./img/img04.png" >
		<br>
		<span>레시피 설명</span>
		<br>
		<br>
		<br>
		<br>
		
		
		<table>
			<tr>
				
				<td><input type="button" value="before" onclick="#"></td>
				<td><input type="button" value="next" onclick="#"></td>
			</tr>
		</table>

	
	
	

	<input type="button" value="돌아가기 " class="voice_btn" onclick="#">	
	
	</div>
</body>
</html>