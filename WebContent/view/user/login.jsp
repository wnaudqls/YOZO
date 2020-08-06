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
<script type="text/javascript" 
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"></script>
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
                            /* console.log(JSON.stringify(res))
                            console.log(res.connected_at)
                            console.log(res.properties.nickname)
                            console.log(res.kakao_account.email) */
                            console.log(res.id)
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
		
		<div><a id="custom-login-btn" href="javascript:loginWithKakao()">
			<img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" height="40" />
		</a></div>

		<div id="naverIdLogin"></div>
		<!-- <div><a href="javascript:getAccount()"><button>버튼</button></a></div> -->
		
		<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	var N = document.getElementById('naverIdLogin');
	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "Ks9_WH5_tblK4R7HY9FB",
			callbackUrl: "http://127.0.0.1:8787/YORIZORI/view/main/main.jsp",
			isPopup: false, /* 팝업을 통한 연동처리 여부 */
			loginButton: {color: "green", type: 3, height: 40} /* 로그인 버튼의 타입을 지정 */
		}
	);
	
	/* 설정정보를 초기화하고 연동을 준비 */
	naverLogin.init();
	

			//function getAccount() {
	N.addEventListener('click', function() {
			naverLogin.getLoginStatus(function (status) {
				var Nemail = naverLogin.user.getEmail();
				var Nnickname = naverLogin.user.getNickName();
				var Nname = naverLogin.user.getName();
				var Nid = naverLogin.user.getId();
				console.log(Nemail);
				console.log(Nname);
				console.log(Nnickname);
				console.log(Nid);

				
				$.ajax({
                    url: "<c:url value='/user.do?command=sns_join'/>",
                    data: {"id" : Nid,
                            "nick" : Nid,
                            "name" : Nname,
                            "pw" : Nid,
                            "email" : Nemail},
                    type: "POST",
	    			
                    success : function(status){
                    	
                        $.ajax({
                            url: "<c:url value='/user.do?command=login'/>",
                            data: {"id" : Nid,
                                	"pw" : Nid},
                            type: "POST",
                            success : function() {
                            	location.href="<c:url value='/user.do?command=main'/>"
                            },
                        })
                    },
                    error : function(status){
                        	
                        $.ajax({
                            url: "<c:url value='/user.do?command=login'/>",
                            data: {"id" : Nid,
                                    "pw" : Nid},
                            type: "POST",
                            success : function() {
                                location.href="<c:url value='/user.do?command=main'/>"
                            },
                        })
                    }
				
			/* if (status) {
				console.log()
			} else {
				console.log("callback 처리에 실패하였습니다.");

			} */
		});
	});
			});
			//}
/* 	window.addEventListener('load', function () {
		naverLogin.getLoginStatus(function (status) {
			if (status) {
				//(5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 
				var email = naverLogin.user.getEmail();
				if( email == undefined || email == null) {
					alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
					// (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 
					naverLogin.reprompt();
					return;
				}

				//window.location.replace("http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port) + "/sample/main.html");
				window.location.replace("http://127.0.0.1:8787/YORIZORI/view/user/login.jsp");
			} else {
				console.log("callback 처리에 실패하였습니다.");
			}
		});
	});
  */
	
	/* naverLogin.getLoginStatus(function (status) {
		if (status) {
			var email = naverLogin.user.getEmail();
			//var name = naverLogin.user.getNickName();
			//var profileImage = naverLogin.user.getProfileImage();
			//var birthday = naverLogin.user.getBirthday();			
			//var uniqId = naverLogin.user.getId();
			//var age = naverLogin.user.getAge();
		} else {
			console.log("AccessToken이 올바르지 않습니다.");
		}
	}); */
</script>

	
	
	</div>

	<%@ include file="../../form/footer.jsp"%>




	<!-- 
	<div id="fb-root"></div>
	<script type="text/javascript" src="https://connect.facebook.net/ko_KR/sdk.js"></script>
	<script async defer crossorigin="anonymous" src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v8.0&appId=341938956832335&autoLogAppEvents=1" nonce="2XVQdaCc"></script>
	 -->
</body>
</html>