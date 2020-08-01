<%@page import="com.yozo.admin.dto.AdminDto" %>
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
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
   <script type="text/javascript">
   
      function allChk(bool){
         var chks = document.getElementsByName("chk");
         for(var i = 0; i < chks.length; i++){
            chks[i].checked = bool;
         }
      }
      
      $(function (){
         $("#muldelform").submit(function(){
            if($("#muldelform input:checked").length == 0){
               alert("하나 이상 체크해주세요")
               //이벤트 전파 막기 서브밋 이벤트가 아무것도 체크하지않으면 발생하지 않는다
               return false;
            }
         })
      })
   
   </script>

</head>
<body>
<%@ include file="../../form/header.jsp" %>

<div id="user_list">

<h3>전체 회원 조회</h3>
<%
AdminDao dao = new AdminDao();
List<AdminDto> list = (List<AdminDto>)request.getAttribute("list");
  // List<AdminDto> list = dao.selectList();
%>

<table id="user_list_table" border="1">
   
   <tr>
      <th><input type="checkbox"></th>
      <th>아아디</th>
      <th>닉네임</th>
      <th>이름</th>
      <th>주소</th>
      <th>회원 등급</th>
   <tr>
   <% 
      for(AdminDto dto : list){
         
   %>
   <tr>
      <td><input type="checkbox" name = "chk" value="<%=dto.getMember_no()%>"></td>
      <td><%=dto.getMember_id()%></td>
      <td><%=dto.getMember_nick() %></td>
      <td><%=dto.getMember_name() %></td>
      <td><%=dto.getMember_addr() %></td>
      <td><select>
         <option >관리자
         <option>일반 회원
         </select>
      </td>
   <tr>
<%
      
      }
%>
   
</table>
</div>
<div id="user_list_con">

<input type="text" placeholder="유저 통합검색" id="user_search"> 
<input type="button" value="검색하기" onclick="#">

<table id="user_list_confirm">
   <tr>
      <td><input type="button" value="삭제" onclick="#"></td>
      <td><input type="button" value="수정" onclick="#"></td>
      <td><input type="button" value="취소" onclick="#"></td>
   </tr>
</table>

</div>

<%@ include file="../../form/footer.jsp" %>
</body>
</html>




















