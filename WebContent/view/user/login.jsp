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

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript"
	src="http://developers.kakao.com/sdk/js/kakao.min.js"></script>

<script type="text/javascript">
  		
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
                            /* console.log(JSON.stringify(res))
                            console.log(res.id)
                            console.log(res.connected_at)
                            console.log(res.properties.nickname)
                            console.log(res.kakao_account.email) */
                            var id = res.id;
		  	    	    	var pw = res.id;
                            
                            $.ajax({
                                url: "<c:url value='/user.do?command=sns_join'/>",
                                data: {"id" : res.id,
                                        "nick" : res.id,
                                        "name" : res.properties.nickname,
                                        "pw" : res.id,
                                        "email" : res.kakao_account.email},
                                type: "POST",
		  	    			
                                success : function(userRes){
                                    alert("회원가입 성공")
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
                                    alert("회원가입 에러")		
                                    	
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
</style>
</head>
<body>
	<%@ include file="../../form/header.jsp"%>

	<div class="login">
		<br> <br> <br> <br>
		<h1>로그인</h1>
		<form action="<%=request.getContextPath()%>/user.do" method="post">
			<input type="hidden" name="command" value="login"> 
			<input type="text" name="id" placeholder="아이디를 입력하세요"> <br> 
			<input type="password" name="pw" placeholder="비밀번호를 입력하세요"> <br>
			<br> <input type="checkbox" alt="로그인 상태 유지"> 로그인 상태 유지 <br>
			<br> 아직 회원이 아니신가요? <br> <a
				href="/YORIZORI/user.do?command=joinform">회원가입하기</a> <br> 
				<input type="submit" value="로그인">
		</form>
		<br>
		
		<a id="custom-login-btn" href="javascript:loginWithKakao()">
			<img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="222"/>
		</a>
	</div>
	<%@ include file="../../form/footer.jsp"%>

</body>
</html>