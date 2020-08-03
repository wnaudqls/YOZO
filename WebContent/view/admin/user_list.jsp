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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
      function getParameterValues(){
    	  var member_no = encodeURIComponent($("#member_no").val());
    	  var member_id = "member_id" + encodeURIComponent($("#member_id").val());
    	  var member_nick = "member_nick" + encodeURIComponent($("#member_nick").val());
    	  var member_name = "member_name" + encodeURIComponent($("#member_name").val());
    	  var member_addr = "member_addr" + encodeURIComponent($("#member_addr").val());
    	 
    	  return member_no, member_id, member_nick, member_name, member_addr;
    	  
      }
      $(function(){
    	  $("#user_search_enter").click(function(){
    		 alert("싸발")
    		  var txt=document.getElementById("user_search").value;
    		 alert(txt);
    		  $.ajax({
    			  url :"admin.do?command=search&txt="+txt,
    			  dataType :"json",
				  success : function(msg){
					  alert("통신보안 됩니다 박진석 상병님")
					  $("#user_list_table").html(decodeURIComponent(msg.member_no+""+msg.member_id+""+msg.member_nick+""+msg.member_name+""+msg.member_addr));
				  },
				  error : function(jqXHR, exception){
					  alert("통신불량 입니다. 박진석 상병님");
					    if (jqXHR.status === 0) {
				            alert('Not connect.\n Verify Network.');
				        } 
				        else if (jqXHR.status == 400) {
				            alert('Server understood the request, but request content was invalid. [400]');
				        } 
				        else if (jqXHR.status == 401) {
				            alert('Unauthorized access. [401]');
				        } 
				        else if (jqXHR.status == 403) {
				            alert('Forbidden resource can not be accessed. [403]');
				        } 
				        else if (jqXHR.status == 404) {
				            alert('Requested page not found. [404]');
				        } 
				        else if (jqXHR.status == 500) {
				            alert('Internal server error. [500]');
				        } 
				        else if (jqXHR.status == 503) {
				            alert('Service unavailable. [503]');
				        } 
				        else if (exception === 'parsererror') {
				            alert('Requested JSON parse failed. [Failed]');
				        } 
				        else if (exception === 'timeout') {
				            alert('Time out error. [Timeout]');
				        } 
				        else if (exception === 'abort') {
				            alert('Ajax request aborted. [Aborted]');
				        } 
				        else {
				            alert('Uncaught Error.n' + jqXHR.responseText);
				        }
					  
				  },
				  complete : function(data) {
					  alert("마무리")
				  }
    		  });
    	  });
      });
   
   </script>

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
      <th><input type="checkbox"></th>
      <th>아아디</th>
      <th>닉네임</th>
      <th>이름</th>
      <th>주소</th>
      <th>회원 등급</th>
   <tr>
   <% 
      for(MemberDto dto : list){  
   %>
   <tr>
      <td><input type="checkbox" name = "chk"></td>
      <td id = "member_id"><%=dto.getMember_id()%></td>
      <td id = "member_nick"><%=dto.getMember_nick() %></td>
      <td id = "member_name"><%=dto.getMember_name() %></td>
      <td id = "member_addr"><%=dto.getMember_addr() %></td>
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
<input type="button" value="검색하기" id = "user_search_enter">

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




















