<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>로그인</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"></script>
 <script type="text/javascript">
  		
	
	//카카오 
		Kakao.init( "9da6685322dda6025e64aba829272d68" );
	//토근 가져오기
		function loginWithKakao() {//1
		    Kakao.Auth.login({//2
		        success: function(authObj) {
		        //alert(JSON.stringify(authObj))
		        //토큰정보 출력
	    		    Kakao.API.request({
                 url: '/v2/user/me',
                 success: function(res) {
                     console.log(JSON.stringify(res))
                     console.log(res.connected_at)
                     console.log(res.properties.nickname)
                     console.log(res.kakao_account.email)
                     console.log(res.id)
                     var id = res.id;
	  	    	     var pw = res.id;
                     
                     $.ajax({
                         url: "<c:url value='/user.do?command=kakao_join'/>",
                         data: {"id" : res.id,
                                 "nick" : res.id,
                                 "name" : res.properties.nickname,
                                 "pw" : res.id,
                                 "email" : res.kakao_account.email},
                         type: "POST",
	  	    			
                         success : function(userRes){
                             $.ajax({
                                 url: "<c:url value='/user.do?command=login'/>",
                                 data: {"id" : id,
                                     "pw" : pw},
                                 type: "POST",
                                 success : function() {
                                 	location.href="<c:url value='/user.do?command=main'/>"
                                 },
                             })
                         },
                         error : function(userRes){
                             $.ajax({
                                 url: "<c:url value='/user.do?command=login'/>",
                                 data: {"id" : id,
                                         "pw" : pw},
                                 type: "POST",
                                 success : function() {
                                     location.href="<c:url value='/user.do?command=main'/>"
                                 },
                             })
                         }
                     })
	    	  	},

                 fail: function(error) {
                     alert(
                         'login success, but failed to request user information: ' +
                         JSON.stringify(error)
                     )
               
                 },
             })   
             
         },
         fail: function(err) {
             alert(JSON.stringify(err))
         },
             
     })//2
		}//1
  		

   </script> 
	<style type="text/css">
		.login {
			position: static;
			text-align: center;
			height: 600px;
		}
		.naverIdLogin {
			width: 50%;
		}
		
		#findId, #resetPw {
			display: inline;
		}
	</style>
</head>
<body>
	<%@ include file="/form/header.jsp"%>

	<div class="login">
		<br> <br> <br> <br>
		<h1>로그인</h1>
		<form action="<%=request.getContextPath()%>/user.do" method="post">
			<input type="hidden" name="command" value="login"> 
			<input type="text" name="id" placeholder="아이디를 입력하세요"> <br> 
			<input type="password" name="pw" placeholder="비밀번호를 입력하세요"> <br><br>
				<input type="submit" value="로그인">
			<br>
			<br> 아직 회원이 아니신가요? <br> 
			
			<a href="/YORIZORI/user.do?command=joinform">회원가입하기</a> <br> 
		</form>
		<input type="button" onclick="location.href='<%=request.getContextPath()%>/user.do?command=findId'" class="findId" value="아이디 찾기" >
		
		<input type="button" onclick="location.href='<%=request.getContextPath()%>/user.do?command=resetPw'" class="resetPw" value="비밀번호 재설정" >
		<br><br>
		
		<div><a id="custom-login-btn" href="javascript:loginWithKakao()">
			<img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" height="40" />
		</a></div>

		<div id="naverIdLogin"><img alt="NAVERIMAGE" src="<%=request.getContextPath()%>/img/naverLoginIcon (2).PNG" id="naverIdLogin_loginButton" height="40"></div>
		</div>
		
		
		<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">




	var N = document.getElementById("naverIdLogin");
	
	var naverLogin = new naver.LoginWithNaverId({
			clientId: "Ks9_WH5_tblK4R7HY9FB",
			callbackUrl: "https://127.0.0.1/YORIZORI/view/main/main.jsp",
			isPopup: false, /* 팝업을 통한 연동처리 여부 */
	});
	
	/* 설정정보를 초기화하고 연동을 준비 */
	

	N.addEventListener("click", function() {
		naverLogin.init();
		console.log("네아로 실행 되니??")
		naverLogin.getLoginStatus(function (status) {
			var email = naverLogin.user.getEmail();
			var nickname = naverLogin.user.getNickName();
			var name = naverLogin.user.getName();
			var id = naverLogin.user.getId();
			console.log(email);
			console.log(name);
			console.log(nickname);
			console.log(id);

			
			$.ajax({
                   url: "<c:url value='/user.do?command=naver_join'/>",
                   data: {"id" : id,
                           "nick" : id,
                           "name" : name,
                           "pw" : id,
                           "email" : email},
                   type: "POST",
                   success : function(status){
    				console.log("가입")
                       $.ajax({
                           url: "<c:url value='/user.do?command=login'/>",
                           data: {"id" : id,
                               "pw" : id},
                           type: "POST",
                           success : function() {
                           		location.href="<c:url value='/user.do?command=main'/>"
                           },
                       })
                   },
                   error : function(status){
                       $.ajax({
                           url: "<c:url value='/user.do?command=login'/>",
                           data: {"id" : id,
                                   "pw" : id},
                           type: "POST",
                           success : function() {
                               location.href="<c:url value='/user.do?command=main'/>"
                           },
                       })
                   }, 
			});
		});
	});
	
	


</script>

	
	
	

	<%@ include file="../../form/footer.jsp"%>




	<!-- 
	<div id="fb-root"></div>
	<script type="text/javascript" src="https://connect.facebook.net/ko_KR/sdk.js"></script>
	<script async defer crossorigin="anonymous" src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v8.0&appId=341938956832335&autoLogAppEvents=1" nonce="2XVQdaCc"></script>
	 -->
</body>
</html>