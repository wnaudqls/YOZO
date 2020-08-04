<%@page import="com.yozo.broadcast.dto.BroadcastDto"%>
<%@page import="java.util.List"%>
<%@page import="com.yozo.broadcast.dao.BroadcastDao"%>
<%@page
	import="com.sun.org.apache.xerces.internal.impl.xpath.regex.RegularExpression"%>
<%@page import="java.time.DayOfWeek"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
%>
<%
   response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방송예약</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
<%@include file="../../form/header.jsp" %>
<hr>
	<h1 id="title">방송 예약하기</h1>
	<%
      //캘린더가 추상클래스라서 new를 못씀
      //인스턴스하면 하나의 객체를 공유
      //캘린더 클래스에 년월일시 기본베이스로 있음
      Calendar cal = Calendar.getInstance();

   //변수선언
   int year = cal.get(Calendar.YEAR);
   int month = cal.get(Calendar.MONTH) + 1;
   //파라미터값 받아옴
   String paramYear = request.getParameter("year");
   String paramMonth = request.getParameter("month");
   String date = request.getParameter("date");
   //파라미터의 값이 비어있지 않으면 정수형으로 전환
   if (paramYear != null) {
      year = Integer.parseInt(paramYear);
   }
   if (paramMonth != null) {
      month = Integer.parseInt(paramMonth);
   }

   if (month > 12) {
      year++;
      month = 1;
   }
   if (month < 1) {
      year--;
      month = 12;
   }
   
   //달력
   
   //현재년도, 현재월 , 1일셋팅 
   //화살표 눌렀을 때 해당 월의 날짜를 출력해주기 위해 
   //만약 이거 주석처리하면 그 날의 날짜에 맞춰서 1부터 시작함 
   cal.set(year,month-1,1);
   
   //1일의 요일
   //cal의 daw를 가져오는데 cal에 셋팅된 날짜가 무슨 요일인 지 숫자로 알려줌
   int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
   
   //마지막일 : 해당 월의 마지막일 
   int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
   %>
	
	<input hidden="" id="idchecker" value="${rdto.member_id }"/>
	<div id="list">
		날짜를 선택해주세요.
		
	</div>

		<input type="button" value="예약하기" id="btn1" onclick="broadcastcheck(<%=year%>, <%=month%>);" disabled="disabled"/>
		<input type="button" value="예약조회" id="btn2" onclick="move();"/>
	
	
	
	<table id="calendar">
		<caption>
			<!--화살표 두개 : 년도가 바뀌는 거고 화살표 하나 : 월이 바뀌는거야 -->
			<a href="broadcast.do?command=broadcast&year=<%=year-1%>&month=<%=month%>">▼</a>
			 <a href="broadcast.do?command=broadcast&year=<%=year%>&month=<%=month - 1%>">↓</a> 
				<span class="y"><%=year%></span>년 
				<span class="m"><%=month%></span>월 
				<a href="broadcast.do?command=broadcast&year=<%=year%>&month=<%=month + 1%>">↑</a> 
				<a href="broadcast.do?command=broadcast&year=<%=year + 1%>&month=<%=month%>">▲</a>

		</caption>
		<tr>
			<th>일</th>
			<th>월</th>
			<th>화</th>
			<th>수</th>
			<th>목</th>
			<th>금</th>
			<th>토</th>
		</tr>
		<tr>
			<%
            //공간만들기
                     //dayOfWeek - 1 하는 이유
                     //만약 이걸 정해주지 않으면 만드는 시점부터 시작...
                     //dayOfWeek는 요일을 알려주는데 숫자로 알려줘
                     //일 : 1~ 토 : 7
            for (int i = 0; i < dayOfWeek-1; i++) {
               //웹화면에 출력 &nbsp; : 공백 
               //for문을 돌면서 td를 만들면서 숫자를 채워준다
               out.println("<td style='background-color: silver; opacity: 0.5;'>&nbsp;</td>");
            }   
                  //해당월의 마지막일만큼 반복문돌기
            for(int i = 1;i<=lastDay; i++){
               
            
         %>

			<td>
				<%--  <a class="countview" href="broadcast_list.jsp?year=<%=year%>&month=<%=month%>&date=<%=i%>" onclick="asdf();">
					 <%=i %>
				 </a> 	
				 --%> 
				  <a class="countview" href="javascript:void(0);" onclick="select(<%=year%>, <%=month%>, <%=i%>);">
					 <%=i%>
				 </a> 
				<a href="broadcast_list.jsp?year=<%=year%>&month=<%=month%>&date=<%=i%>"></a>
				<div class="clist">	
				</div>
			</td>

			<%
            /* 한바퀴 다 돌았으면*/
            if((dayOfWeek-1 + i) % 7 ==0){
               out.print("</tr><tr>");
               
               }
            }
            
            //뒤쪽공백
            //
            for(int i=0; i< (7-(dayOfWeek-1 + lastDay)%7)%7; i++){
               out.print("<td style='background-color: silver; opacity: 0.5;'>&nbsp;</td>");
            }
         %>
		</tr>
	</table>

	<div id="down">
		<%@include file="../../form/footer.jsp" %>
	</div>
	<%-- 
	<%@include file="./broadcast_selectlist.jsp" %>
	--%>
</body>
<style type="text/css">
@import url("view/broadcast/css/normal.css");
</style>

<script type="text/javascript" src="<%=request.getContextPath()%>/view/broadcast/js/broadcast_check.js">
</script>

</html>