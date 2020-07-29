<%@page import="java.io.PrintWriter"%>

<%@page import="com.yozo.user.util.SHA256"%>

<%@page import="com.yozo.user.dao.UserDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%

	request.setCharacterEncoding("UTF-8");

	String code = request.getParameter("code");

	UserDao userDao = new UserDao();

	String member_id = null;

	if(session.getAttribute("member_id") != null) {

		member_id = (String) session.getAttribute("member_id");

	}

	elsif(member_id == null) {

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('로그인을 해주세요.');");

		script.println("location.href = 'login.jsp'");

		script.println("</script>");

		script.close();

		return;

	}

	String userEmail = userDao.getUserEmail(member_id);

	boolean rightCode = (new SHA256().getSHA256(userEmail).equals(code)) ? true : false;

	if(rightCode == true) {

		userDao.setUserEmailChecked(member_id);

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('인증에 성공했습니다.');");

		script.println("location.href = 'index.jsp'");

		script.println("</script>");

		script.close();		

		return;

	} else {

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('유효하지 않은 코드입니다.');");

		script.println("location.href = 'index.jsp'");

		script.println("</script>");

		script.close();		

		return;

	}

%>



