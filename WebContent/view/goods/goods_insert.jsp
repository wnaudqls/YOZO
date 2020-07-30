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
<meta charset="UTF-8">
<title>굿즈 등록</title>

<style type="text/css">
section {
	height : 600px;
	width:80%;
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
/*goods_price 버튼 지우기*/
input[name="goods_price"]::-webkit-outer-spin-button,
input[name="goods_price"]::-webkit-inner-spin-button{
	-webkit-appearance:none;
}




</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/ckeditor/ckeditor.js "></script>
<!--  <script src="//cdn.ckeditor.com/4.14.1/full/ckeditor.js"></script> -->


</head>

<%@ include file="../../form/header.jsp"%>


<body>
<section>
<form action = "<%request.getContextPath();%>/YORIZORI/goods.do" method="post">
<input type="hidden" name="command" value="goodsinsertres">
		<div id="goods_name">
			<label>상품이름</label>
			<input type="text" name="goods_title" required>
		</div>
		<div id="goods_etc">
		<div>
			<label>수량</label> <input type="number" placeholder="1" name="goods_quantity" min=1 max=1000 required>
			<label>가격</label> <input type="number" name="goods_price" min=1 required>
		</div>
		<hr>
		<div>
			<textarea name="goods_content" id="editor"></textarea>
<!-- 			<script type="text/javascript">
			$(function(){
			CKEDITOR.replace("editor"
	/* 			filebrowserUploadUrl: '${pageContext.request.contextPath}/fileupload.do' */
			);
			});
			</script> -->
			<script type="text/javascript">
            CKEDITOR.replace("editor",{
                height: 300
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