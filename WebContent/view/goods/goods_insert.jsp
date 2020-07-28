<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html charset=UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>굿즈 등록</title>

<style type="text/css">
section {
	height : 600px;
}


.btn{
   width : 70px;
   height : 35px;
   background-color : #F5A9A9;
   color : #FAFAFA;
   border : 0;
   outline: 0;
   border-radius : 0.35em;
   font-weight: bold;
   cursor: pointer;
   

}



</style>
<script type="text/javascript" src="${pageContext.request.contextPath }/ckeditor/ckeditor.js "></script>

</head>

<%@ include file="../../form/header.jsp"%>


<body>
<section>
<form action = "<%request.getContextPath(); %>/YORIZORI/goodscontroller_two.do" method="post">
<input type="hidden" name="command" value="goodsinsertres" >
	<div>
		<div id="goods_name">
			<label>상품이름</label>
			<input type="text" name="goods_title" >
		</div>
		<div id="goods_etc">
		<div>
			<label>수량</label> <input type="number" placeholer="1" name="goods_quantity">
			<label>가격</label> <input type="text" name="goods_price">
		</div>
		<hr>
		<div>
			<textarea name="goods_content" id="editor"></textarea>
			<script type="text/javascript">
				CKEDITOR.replace('editor'
						,{height : 300 
					});
			</script>
		</div>
		<div>
			<input class="btn" type="button" value="취소"/>
			<input class="btn" type="submit" value="등록"/>
		</div>
	</div>
</form>
</section>
	<%@ include file="../../form/footer.jsp"%>
</body>
</html>