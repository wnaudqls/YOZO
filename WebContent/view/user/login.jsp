<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html charset=UTF-8");%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

   <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
   <script type="text/javascript">
   
   	//페이스북 로그인
   window.fbAsyncInit = function() {
	    FB.init({
	      appId      : '{341938956832335}',
	      cookie     : true,
	      xfbml      : true,
	      version    : '{7.0}'
	    });
	      
	    FB.AppEvents.logPageView();   
	      
	  };

	  (function(d, s, id){
	     var js, fjs = d.getElementsByTagName(s)[0];
	     if (d.getElementById(id)) {return;}
	     js = d.createElement(s); js.id = id;
	     js.src = "https://connect.facebook.net/en_US/sdk.js";
	     fjs.parentNode.insertBefore(js, fjs);
	   }(document, 'script', 'facebook-jssdk'));
   
   </script>
   <style type="text/css">
      
      .login{
          position: static;
          text-align: center;
          height: 600px;
      }
   
   </style>
</head>
<body>
<%@ include file="../../form/header.jsp" %>

   <div class="login">
   <br>
   <br>
   <br>
   <br>
      <h1>로그인</h1>	
      <form action="<%=request.getContextPath() %>/user.do" method="post">
		<input type="hidden" name="command" value="login">
		<input type="text" name="id" placeholder="아이디를 입력하세요" > <br>
		<input type="password" name="pw" placeholder="비밀번호를 입력하세요"> <br><br>
		
		<input type="checkbox" alt="로그인 상태 유지"> 로그인 상태 유지 <br><br>
		
		 아직도 회원이 아니신가요? <br>
		<a href="/YORIZORI/user.do?command=joinform">회원가입하기</a> <br>
		
		<input type="submit" value="로그인"> 
	</form>
   </div>
<%@ include file="../../form/footer.jsp" %>

</body>
</html>
