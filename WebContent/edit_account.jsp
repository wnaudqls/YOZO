<%@ page language="java" contentType="text/html; charset= UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">

section {
	height: 700px;
}

#editmyinfo {
	margin: auto;
	text-align: left;
}

#wrapperinfo {
	padding: 100px;
}

#message {
	font-size: 25px;
	vertical-align: middle;
}

#warning {
	vertical-align: middle;
	width: 50px;
	height: 50px;
}

.btn {
	width: 70px;
	height: 35px;
	background-color: #F5A9A9;
	color: #FAFAFA;
	border: 0;
	outline: 0;
	border-radius: 0.35em;
	font-weight: bold;
	cursor: pointer;
}
#changetable{
	margin-left: 35px;
}
/* 배경에 불과  */
#popup {
	display: none;
	position: fixed;
	width: 100%;
	height: 100%;
	background: black;
	opacity: 80%;
}

/* 비밀번호 변경 팝업창  */
#popmenu {
	display : none;
	position: absolute;
	left: 50%;
	top: 50%;
	margin-top: 50px;
	transform: translate(-50%, -50%);
	width: 400px;
	height: 300px;
	text-align: center;
 	background: #fff; /*흰색 */
	line-height: 40px;
	
	
}
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	/* 	function changepw(){
	 window.open("change_password.jsp", "비밀번호변경팝업창", "width = 500px, height = 500px, left=715, top = 250")
	
	 }  */

	$(function() {
		$("#popbutton").click(function() {
			$("#popup").fadeIn();
			$("#popmenu").fadeIn();
		});
	 	$("#popup").click(function() {
			$("#popup").fadeOut();
			$("#popmenu").fadeOut();
		}); 
	});
</script>
<body>
	<%@ include file="./form/header.jsp"%>
	<section>
		
		<!--팝업 -->
		<!-- #popup은 그냥 뒷배경박스일 뿐  -->
		<div id="popup">
		</div>
			<div id="popmenu">
				<div>
					<img id="warning" alt="warning" src="./img/warning.jpg"> <b
						id="message">비밀번호 변경</b>
				</div>
				<table id="changetable">
					<tr>
						<td>기존 비밀번호 :</td>
						<td><input type="text" placeholder="입력해주세요." /></td>
					</tr>
					<tr>
						<td>변경할 비밀번호 :</td>
						<td><input type="text" placeholder="입력해주세요." /></td>
					</tr>
				</table>
				<div>
					<input class="btn" type="button" value="변경" />
				</div>
			</div>
		
		<div id="wrapperinfo">
			<div>
				<img id="warning" alt="warning" src="./img/warning.jpg"> <b
					id="message">개인정보수정</b>
			</div>
			<table id="editmyinfo">
				<tr>

					<td>아이디 :</td>
					<td>tofu6fighting</td>
				</tr>
				<tr>
					<td>비밀번호 :</td>
					<td><input id="popbutton" class="btn" type="button" value="변경"></td>
				</tr>
				<tr>
					<td>이메일 :</td>
					<td>tofu6fighting@naver.com</td>
				</tr>
				<tr>
					<!-- api쓸거라 그냥 대충 냅둠  -->
					<td>주소 :</td>
					<td><input type="text" placeholder="도봉" />-</td>
					<td><input type="text" placeholder="창1동" /></td>
					<td><input type="button" value="우편번호찾기" /></td>

				</tr>
				<tr colspan="3">
					<td></td>
					<td><input type="text" placeholder="kh정보교육원" /></td>
				</tr>
				<tr>
					<td>번호 :</td>
					<td><input type="text" placeholder="010">-</td>
					<td><input type="text" placeholder="7277">-</td>
					<td><input type="text" placeholder="0000"></td>
				</tr>
				<tr>
					<td>닉네임 :</td>
					<td><input type="text" placeholder="두부한모"></td>
				</tr>
				<!-- <tr>
			<td colspan="5">
				<input class="btn" type="button" value="수정완료"/>
			</td>
				
			</tr>
			 -->
			</table>
			<div>
				<input class="btn" type="button" value="수정완료" />
			</div>
		</div>
	</section>
	<%@ include file="./form/footer.jsp"%>

</body>
</html>