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
<meta charset="EUC-KR">
<title>굿즈 등록</title>

<style type="text/css">
* {
	position: relative;
	margin: 0;
	padding: 0;
	text-decoration: none;
}

#btn {
	width: 70px;
	height: 35px;
	margin-top: 20px;
	background-color: #F5A9A9;
	color: #FAFAFA;
	border: 0;
	outline: 0;
	border-radius: 0.35em;
	font-weight: bold;
	cursor: pointer;
	right: 50%;
	left: 50%;
}

#insert {
	position: absolute;
	top: 100px;
	right: 200px;
}

#ckeditor {
	left: 300px;
	right: 300px;
}
</style>


</head>

<%@ include file="../form/header.jsp" %>

<body>
<main>
	<section>
		<div id="insert">
			<p>
				<input type="button" value="사진 업로드" />
			</p>
			<p>
				분식: <select name="sel02">
					<optgroup label="분식">
						<option value="ddeokbokki">떡볶이</option>
						<option value="sundae">순대</option>
						<option value="dumpling">만두</option>
						<option value="tuikim">튀김</option>
						<option value="jjolmyeon">쫄면</option>
					</optgroup>
					<optgroup label="과자">
						<option value="pokachip">포카칩</option>
						<option value="butterring">버터링</option>
						<option value="mom's pie">엄마손파이</option>
						<option value="chalddeokpie">찰떡파이</option>
						<option value="kkobukchip">꼬북칩</option>
						<option value="homerunball">홈런볼</option>
					</optgroup>
				</select>

				<b>옵션선택</b> <select name="goods_option">
					<option value="html">HTML</option>
					<option value="css">CSS</option>
					<option value="js">JAVASCRIPT</option>
					<option value="jq">JQUERY</option>
				</select>
			</p>
		</div>



		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br>
		<div id="ckeditor">
			<label for="ckeditor"><a>------------------------------------------------------------------------------CK
					EDITOR
					자리--------------------------------------------------------------------------------------------</a></label>
			<br>
			<textarea rows="3" cols="30" id="ckeditor" name="ckeditor"></textarea>
		</div>
		<br> <br> <br> <br>
		<div id="btn">
			<span> <input type="button" value="작성하기" />
			</span>
		</div>

		<div id="btn">
			<span> <input type="button" value="취소" />
			</span>
		</div>

		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br>


	</section>
	
<%@ include file="../form/footer.jsp" %>
	
</main>
</body>
</html>