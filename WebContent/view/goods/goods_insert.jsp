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
test
<style type="text/css">
section {
	height : 600px;
	width:80%;
	margin: 0 10%;
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
#goods_name{
	float:left;
	text-align: left;
}
#goods_etc{
clear:both;
}
#main_photo{
	
	width:200px;
	height:200px;
	}




</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/ckeditor/ckeditor.js "></script>
<!--  <script src="//cdn.ckeditor.com/4.14.1/full/ckeditor.js"></script> -->
<script type="text/javascript">
	

	
	
		function filechange(){
		/* 	//파일의 전체경로를 가져오기위한 javascript		
				var filePath = document.getElementById("file").value;
				alert(filePath);
				document.getElementById("goods_main_photo").value=filePath;
			//파일 미리보기 만들기
			var reader=new FileReader();
				reader.onload= function(event){
				var photo=document.getElementById("main_photo");
				photo.setAttribute("src",event.target.result); */
				
			var formdata=new FormData(document.getElementById("goods_form"));
				// FormData의 key 확인
				for (key of formdata.keys()) {
				  console.log(key);
				}

				// FormData의 value 확인
				for (value of formdata.values()) {
				  console.log(value);
				}
			var imgurl= document.getElementById("goods_main_photo").value;
			alert("이미지경로 : "+imgurl);
		$.ajax({
				type:"POST",
				url:"<%=request.getContextPath()%>/goods.do?command=imgUpload",
				contentType:false, //header의 ContentType을 설정한다 
				processData:false,
				data : formdata,	//이미지 경로
				success:function(msg){
					alert(msg);
					alert("파일 업로드 성공");
				},
				error: function(){
					alert("통신 실패");
				}
			});
				

				}
</script>

</head>

<%@ include file="../../form/header.jsp"%>


<body>
<section>
<form action = "<%=request.getContextPath()%>/goods.do" enctype="multipart/form-data" method="post" id="goods_form">
<input type="hidden" name="command" value="goodsinsertres">
<input type="hidden" id="goods_main_photo" name="goods_main_photo">
		<div id="goods_name">
			<label>상품이름  :</label><input type="text" name="goods_title" required>	<br>
			<label>수량 :</label> <input type="number" value="1" name="goods_quantity" min=1 max=1000 required><br>
			<label>가격 :</label> <input type="number" name="goods_price" min=1 required><br>
			<label>이미지 : </label><input id="goods_main_photo" type="file" name="goods_main_photo" onchange="filechange()"/>			
		</div>
		<div class="goods_photo">
		<img src="" alt="대표이미지를 선택해주세요" id="img_main">
			
		</div>
		<div id="goods_etc">
<!-- 		<div class="goods_etc_input">
			<label>수량</label> <input type="number" placeholder="1" name="goods_quantity" min=1 max=1000 required>
			<label>가격</label> <input type="number" name="goods_price" min=1 required>
		</div> -->
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