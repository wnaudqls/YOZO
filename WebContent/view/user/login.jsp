<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html charset=UTF-8");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

   <style type="text/css">
      
      .login{
      	 position: static;
      	 text-align: center;
      	 height: 600px;
      }
   
   </style>
</head>
<body>
<%@ include file="./form/header.jsp" %>

   <div class="login">
   <br>
   <br>
   <br>
   <br>
      <h1>로그인</h1>
      
      <input type="text" alt="id" placeholder="아이디를 입력하세요" > <br>
      <input type="password" alt="pw" placeholder="비밀번호를 입력하세요"> <br><br>
      
      <input type="checkbox" alt="로그인 상태 유지"> 로그인 상태 유지 <br><br>
      
      아직도 회원이 아니신가요? <br>
      <a href="join.jsp">회원가입하기</a> <br>
   
   </div>
<%@ include file="./form/footer.jsp" %>

</body>
</html>