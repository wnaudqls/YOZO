<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	onload = function(){
		var nick = opener.document.getElementsByName("nick")[0].value;
		document.getElementsByName("nick")[0].value = nick;
	}
	
	function confirmnick(bool){
		if (bool == "true") {
			opener.document.getElementsByName("nick")[0].title = 'y';
			opener.document.getElementsByName("name")[0].focus();
		} else {
			opener.document.getElementsByName("nick")[0].focus();
		}
		self.close();
	}	


</script>
</head>
<body>
<%
	String nicknotused = request.getParameter("nicknotused");
%>

	<table border="1">
		<tr>
			<td>
				<input type="text" name="nick"/>
			</td>
		</tr>
		<tr>
			<td><%=nicknotused.equals("true")?"닉네임 생성 가능" : "중복된 닉네임 존재" %></td>
		</tr>
		<tr>
			<td>
				<input type="button" value="확인" onclick="confirmnick('<%=nicknotused %>')" />
			</td>
		</tr>		
	</table>
	


</body>
</html>











