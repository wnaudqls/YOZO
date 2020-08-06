<%@page import="com.yozo.user.dto.MemberDto"%>
<%@page import="com.yozo.admin.dao.AdminDao" %>
<%@page import="java.util.List" %>
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

   #user_list {
      text-align: center;
      height: 500px;
   }

   #user_list_table {
   
      position: relative;
      top: 30px;
      margin-left: auto;
      margin-right: auto;
      text-align: center;
      width: 800px;
      border: 1px solid gray;
      border-collapse: collapse;
   }
   
   /* #user_list_table tr {
      height: 10px;   
   } */
   #user_list_table th {
      background-color: gray;
      color: white;   
   }
   
   #user_list_con {
      text-align: center;
      padding-bottom: 30px;
   }
   
   #user_list_confirm {
      margin-left: auto;
      margin-right: auto;
      
      
         
   }

</style>
</head>
<body>
<%@ include file="../../form/header.jsp" %>

<div id="user_list">

<h3>전체 회원 조회</h3>
<%
AdminDao dao = new AdminDao();
List<MemberDto> list = (List<MemberDto>)request.getAttribute("list");
  // List<AdminDto> list = dao.selectList();
%>
<table id="user_list_table" border="1">
   
   <tr>
   	  <th>번호</th>
      <th>아아디</th>
      <th>닉네임</th>
      <th>이름</th>
      <th>주소</th>
      <th>회원 등급</th>
      <th>등급수정</th>
   </tr>
   <tr>
   
   <% 
      for(MemberDto dto : list){  
   %>
   	  <td><%=dto.getMember_no() %></td>
      <td><%=dto.getMember_id()%></td>
      <td><%=dto.getMember_nick() %></td>
      <td><%=dto.getMember_name() %></td>
      <td><%=dto.getMember_addr() %></td>
	      <td>
	      	<select name ="member_role">
	         <option value ="관리자" <%if(dto.getMember_role().equals("관리자")){%>selected<%} %>>관리자
	         
	         <option value ="회원" <%if(dto.getMember_role().equals("회원")){%>selected<%} %>>일반 회원
	         </select>
	      </td>
      	<td><input type="button" value="수정" onclick="location.href='admin.do?command=update&member_id=<%=dto.getMember_id() %>&member_role=<%=dto.getMember_role()%>'"></td>
   </tr>
  
<%
      }
%>
   
</table>
</div>
<div id="user_list_con">
	<form action = "admin.do" method = "post">
		<input type="hidden" name="command" value="search"/>
		<input type="text" placeholder="UserID 검색" id="user_search" name = "member_id"> 
		<input type="submit" value="검색하기" id = "user_search_enter">
	</form>
<table id="user_list_confirm">
   <tr>
   	  <!--  <td><input type= "button" value ="방송권한페이지" onclick = "#"></td> -->
      <td><input type="button" value="메인페이지" onclick="location.href = '<%request.getContextPath();%>/YORIZORI/index.jsp'"></td>
   </tr>
</table>

</div>

<%@ include file="../../form/footer.jsp" %>
</body>
</html>
