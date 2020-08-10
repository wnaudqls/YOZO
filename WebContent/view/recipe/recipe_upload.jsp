
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%
   request.setCharacterEncoding("UTF-8");
%>
<%
   response.setContentType("text/html charset=UTF-8");
%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

    <%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file ="../../form/header.jsp" %>
<%
	//이미지 업로드 할 경로
	//getrealpath
	System.out.println("jsp왔나요...");
	String realpath = request.getSession().getServletContext().getRealPath("/");
	System.out.println("realpath:" + realpath);
	
	System.out.println("레시피 이미지 올라간다");
	
	
	//C:\workspaces\workspace_semi\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\YOZO\recipeimages
	int size = 1024*1024*10;//업로드 사이즈 10이하
	
	String fileName = ""; //파일명
	

	try{
        // 파일업로드 및 업로드 후 파일명 가져옴
		MultipartRequest multi = new MultipartRequest(request, realpath+"/recipeimages", size, new DefaultFileRenamePolicy());
		Enumeration<?> files = multi.getFileNames();
		String file = (String)files.nextElement(); 
		fileName = multi.getFilesystemName(file); 
	
		
	}catch(Exception e){
		e.printStackTrace();
	}



%>
<%@ include file ="../../form/footer.jsp" %>

</body>
</html>