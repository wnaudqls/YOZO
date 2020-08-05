<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>굿즈 목록</title>
</head>

<style type="text/css">
section {
	margin: 50px 0;
	/* height: 600px; */
}
#title {
	font-size: 25px;
	text-align: center;
	margin-top: 15px;
	font-weight: bold;
}

.btn {
	width: 70px;
	height: 35px;
	background-color: #F5A9A9;
	color: #FAFAFA;
	border: 0;
	outline: 0;
	border-radius: 0.35em;
	font-weight: bold;
	cursor: pointer;
}

#btns {
	text-align: right;
	margin-right: 50px;
}

/* 리스트 상품들 */
* {
	position: relative;
	margin: 0;
	padding: 0;
	text-decoration: none;
	font-family: "montserrat";
}

.top-section {
	height: 310px;
	overflow: hidden;
	background: #fff;
	position: relative;
}

#image-container {
	width: 360px;
	height: 240px
}

.nav img {
	width: 80px;
	height: 50px;
	border: 1px solid #ddd;
	margin: 8px 2px;
	cursor: pointer;
	transition: 0.3s;
}

.nav img:hover {
	border-color: #52E252;
}

.price {
	position: absolute;
	top: 20px;
	right: 20px;
	color: #27058C;
	font-size: 24px;
}

.product-info {
	padding: 24px;
}

.name {
	text-transform: uppercase;
	font-size: 24px;
	color: #333;
}

.dis {
	font-size: 16px;
	opacity: 0.7;
}

.btn_basket {
	display: block;
	background-color: #CBB679;
	text-align: center;
	color: #fff;
	padding: 10px;
	transition: 0.3s;
}

.btn_basket:hover {
	background: #333;
}

/*굿즈 목록 리스트 큰테두리*/
.goods_list{
	border: 1px solid black;
	margin:0 10%;
	
}
#warning{	/* warning이미지 */
	width: 100px;
	height :100px;
	vertical-align: middle;
}
#message{	/* warning 메시지 */
	display : inline-block;
	vertical-align: middle;
}
/* .tablewrapper{
display: inline-block;} */
.goods_card{
	display:inline-block;
	width: 250px;
	height: 300px;
	border : 1px solid black;
	border-radius: 25px;
	box-sizing: border-box;
	margin: 50px;
}
.goods_card_img{	/* 이미지 감싸는 div */
	
	width: 250px;
	height: 230px;
	border-radius: 25px 25px 0 0;
}
.goods_img_tag{		/* 이미지 태그 */

	border-radius: 25px 25px 0 0;
	width: 250px;
	height: 230px;
}
.goods_card_contents{
	text-align:center;
	width:250px;
	height:70px;
}
.nosection{ /* 내용없을때 기본크기주기 */
height:400px;
}
</style>

<%@ include file="../../form/header.jsp" %>
<body>
	<section>
			<c:if test="${rdto.member_role eq '관리자' }">
			
			<div id="btns">
				<input class="btn" type="button" value="등록" onclick="location.href='<%request.getContextPath(); %>/YORIZORI/goods.do?command=goodsinsertform'"/> 
				<input class="btn" type="button" value="삭제" />
			</div>
			</c:if>
		
<div class="goods_list">
	<!--썸네일 / 제목 / 가격 / 장바구니담기버튼 -->
	

	<c:choose>
		<c:when test="${empty list }">
			<div class="nosection">
			<img id="warning" alt="warning" src="/YORIZORI/img/warning.jpg">
			<h1 id="message">등록된 상품이 존재하지 않습니다.</h1>
			</div>
		</c:when>
		
		<c:otherwise>
		<c:forEach items="${list }" var="dto">
			<div class="goods_card">
				<div class="goods_card_img">
					<%-- <a href="goods.do?command='goodsdetail'"><img src="/YORIZORI/ckstorage/images/${dto.goods_main_photo }" class="goods_img_tag" alt="굿즈메인사진"/></a> --%>	
					<%-- <a href="goods.do?command='goodsdetail'"><img src="${path }/${dto.goods_main_photo }" class="goods_img_tag" alt="굿즈메인사진"/></a> --%>	
					<a href="goods.do?command=goodsdetail&goods_no=${dto.goods_no }"><img src="imgtest/${dto.goods_main_photo }" class="goods_img_tag" alt="굿즈메인사진"/></a>	
				</div>
				<div class="goods_card_content">
					<p>${dto.goods_title }</p>
					<p>${dto.goods_price } 원</p>
					<input type="button" value="장바구니 담기">
				</div>
			</div>
	<%-- 	<table>
				<tr>
					<td><img src="/YORIZORI/ckstorage/images/${dto.goods_main_photo }"/></td>
				</tr>
				<tr>
					<td>${dto.goods_title }</td>
				</tr>
				
				<tr>
					<td>${dto.goods_price }</td>
				</tr>
				<tr>
					<td>
						<input type="button" value="장바구니 담기"/>
					</td>
				</tr>
	
		</table> --%>
			
			
		</c:forEach>
		</c:otherwise>
	</c:choose>
	
</div>
</section>
	<!-- 푸터 -->
	
	
	
<%@ include file="../../form/footer.jsp" %>
</body>
</html>