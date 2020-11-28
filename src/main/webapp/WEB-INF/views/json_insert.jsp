<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html charset=UTF-8");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

function jsonload(){
	alert("시작");
	$.getJSON("/YORIZORI/json/recipes100.json",function(data){
		$.ajax({
			url:"<%=request.getContextPath()%>/json.do",
			method:"post",
			data:{"rson":JSON.stringify(data),
				"command":"jsoninsert"},
				success:function(msg){
					alert("입력성공");
				},
				error:function(){
					alert("입력실패");
				}
			
		})
		
	})
	
}
	
</script>
</head>
<body>
			<button type="button" value="Json을 DB로~" onclick="jsonload()">Json을 DB로~</button>
</body>
</html>