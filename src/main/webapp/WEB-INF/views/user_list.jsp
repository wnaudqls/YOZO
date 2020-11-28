<%-- <%@page import="com.yozo.user.dto.MemberDto"%> --%>
<%@page import="com.yori.zori.model.dto.MemberDto"%>
<%@page import="com.yori.zori.model.dao.AdminDao" %>
<%@page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
   }

   #user_list_table {
   
      position: relative;
      margin-left: auto;
      margin-right: auto;
      text-align: center;
      width: 800px;
      border: 1px solid gray;
      border-collapse: collapse;
   }
   
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
	.off-screen{
		display:none;
   }
   #nav {
   		margin-bottom: 15px;
   }
	
</style>
</head>
<body>
<%@ include file="form/header.jsp" %>

<div id="user_list">

<h3>전체 회원 조회</h3>
<%
AdminDao dao = new AdminDao();
List<MemberDto> list = (List<MemberDto>)request.getAttribute("list");
%>


<table id="user_list_table" border="1">
   
   <tr class = "eval-contents">
   	  <th>번호</th>
      <th>아아디</th>
      <th>닉네임</th>
      <th>이름</th>
      <th>주소</th>
      <th>회원 등급</th>
      <th>등급수정</th>
   </tr>
   

<% 
      for(MemberDto memberDto : list){  
%>
	<tr>
   	  <td><%=memberDto.getMember_no() %></td>
      <td><%=memberDto.getMember_id()%></td>
      <td><%=memberDto.getMember_nick() %></td>
      <td><%=memberDto.getMember_name() %></td>
      <td><%=memberDto.getMember_addr() %></td>
	      <td>
	      <%
	      	if(memberDto.getMember_role().equals("관리자")) {
	      %>
	      	<select name ="member_role">
	         <option value ="관리자" selected>관 리 자</option>
	         
	         <option value ="회원" >회원</option>
	         </select>
	         <%
	      	} else if (memberDto.getMember_role().equals("회원")) {
	         %>
	         <select name ="member_role">
	         <option value ="관리자" >관리자</option>
	         <option value ="회원" selected>일반회원</option>
	         </select>
	         <%
	      	}
	         %>
	      </td>
      	<td><input type="button" value="수정" onclick="location.href='admin.do?command=update&member_id=<%=memberDto.getMember_id() %>&member_role=<%=memberDto.getMember_role()%>'"></td>
   </tr>
  
<%
      }
%>
   
</table>
</div>
<div id="user_list_con">
	<form action = "admin.do" method = "post" id ="search">
		<input type="hidden" name="command" value="search"/>
		<input type="text" placeholder="UserID 검색" id="user_search" name = "member_id"> 
		<input type="submit" value="검색하기" id = "user_search_enter">
	</form>
<form action="" id="setRows">
	<input type="hidden" name="rowPerPage" value="10">
</form>
<table id="user_list_confirm">
   <tr>
      <td><input type="button" value="메인페이지" onclick="location.href = '<%request.getContextPath();%>/YORIZORI/index.jsp'"></td>
   </tr>
</table>

</div>

<%@ include file="form/footer.jsp" %>
</body>
<script>
var $setRows = $('#setRows');

	$setRows
			.submit(function(e) {
				e.preventDefault();
				var rowPerPage = $('[name="rowPerPage"]').val() * 1;// 1 을  곱하여 문자열을 숫자형로 변환

				//				console.log(typeof rowPerPage);

				var zeroWarning = 'Sorry, but we cat\'t display "0" rows page. + \nPlease try again.'
				if (!rowPerPage) {
					alert(zeroWarning);
					return;
				}
				$('#nav').remove();
				var $products = $('#user_list_table');
				var $products2 = $('#user_list');
				//products2 바로 밑에 위치하게 하겠다는 명령문 after
				$products2.after('<div id="nav" class="paging">');

				var $tr = $($products).find('.eval-contents');
				var rowTotals = $tr.length;

				var pageTotal = Math.ceil(rowTotals / rowPerPage);
				var i = 0;

				for (; i < pageTotal; i++) {
					$('<a href="#"></a>').attr('rel', i).html(i + 1).appendTo(
							'#nav');
				}

				$tr.addClass('off-screen').slice(0, rowPerPage).removeClass(
						'off-screen');

				var $pagingLink = $('#nav a');
				$pagingLink.on('click', function(evt) {
					evt.preventDefault();
					var $this = $(this);
					if ($this.hasClass('active')) {
						return;
					}
					$pagingLink.removeClass('active');
					$this.addClass('active');

					// 0 => 0(0*4), 4(0*4+4)
					// 1 => 4(1*4), 8(1*4+4)
					// 2 => 8(2*4), 12(2*4+4)
					// 시작 행 = 페이지 번호 * 페이지당 행수
					// 끝 행 = 시작 행 + 페이지당 행수

					var currPage = $this.attr('rel');
					var startItem = currPage * rowPerPage;
					var endItem = startItem + rowPerPage;

					$tr.css('opacity', '0.0').addClass('off-screen').slice(
							startItem, endItem).removeClass('off-screen')
							.animate({
								opacity : 1
							}, 100);

				});

				$pagingLink.filter(':first').addClass('active');

			});

	$setRows.submit();
</script>
</html>
