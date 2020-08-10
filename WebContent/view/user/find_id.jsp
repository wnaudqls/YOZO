<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">

	function emailCheck() {	//메일 보내기 기능 버튼! (랜덤 정수 반환받는 파라미터)
		//해당하는value 값 특히 이메일은 값이 여러개
		//selected 선택 된값 으로 잡아줘여한다.
		console.log(email.value)
			$.ajax({         //한번더 ajax 사용하요 
			   url:"<%=request.getContextPath() %>/user.do", //컨트롤러 활용하여
			   type:"post",         // post방식
			   datatype:"json",      //datatype
			   data:{"command":"idEmail","email":email.value},	//ajax 에서 컨트롤러=샌드이메일 로 이동 (리시버=이베일 & 랜덤=체크넘 가지고)
			   success() {
			      alert("전송성공! 메일을 확인해주세요. ");
			      location.href="<%=request.getContextPath() %>/view/user/login.jsp"; 

			   },
			   error() {
			      alert("해당 이메일 전송 실패.");
			   }
			    
			});
		    
		 
		}
/* 		function chkAuth1(){
			var num=document.getElementById("chkAuth").value;//메일로 오는 값  = > 메일로 올 때 새로 난수 생성되서 옴
			alert(num+rnum);
			
			if(num == rnum){		// 먼저 생선된 값 
				alert("인증성공");
				document.getElementById('joinBtn').style.display = "inline";

			}else{
				alert("인증실패");
				document.getElementById('joinBtn').style.display = "none";

			}
		}	 */
	</script>
	
	<style type="text/css">
	
		#find_id_form {
			position: static;
			text-align: center;
			height: 600px;
		}
	
		table {
			margin-left: auto;
			margin-right: auto;
		}
		.userBtn {
			border: none;
			background-color: #F5A9A9;
			color: white;
			border-radius: 3px;
			cursor: pointer;
		}
		
	</style>
<body>
<%@ include file ="../../form/header.jsp" %>
	<div id="find_id_form">
	<h1 >아이디 찾기</h1>
<br>
<br>
<br>
<br>
<br>
<table>
<tr>
				<td class="col">이메일 : </td> <td> <input type="text" id="email" name="email" placeholder="이메일을 입력해 주세요"></td><td><input type="button" class="userBtn" value="아이디 보내기" onclick="emailCheck();"></td>
</tr>

</table>
	</div>


<%@ include file ="../../form/footer.jsp" %>

</body>
</html>