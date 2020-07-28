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
<title>굿즈 상세</title>

<style type="text/css">
* {
	position: relative;
	margin: 0;
	padding: 0;
	text-decoration: none;
	font-family: "montserrat";
}
/* 전체바탕 배경색 */
body {
	
	padding: 50px;
}

/* product_view .img 시작 지점 */
.product_view {
	position: relative;
	padding: 0 0 0 395px;
	width: 962px;
	box-sizing: border-box;
}

.product_view .img {
	position: absolute;
	left: 0;
	top: 0;
}

.product_view .img > img {
	width: 368px; height: 370px;
	border: 1px solid #e8e8e8;
}

.product_view .img li : after {
	content: "";
	display: block;
	clear: both;
}

.product_view .img li {
	float: left;
	padding: 10px 10px 0 0;
	list-style: none;
}

.product_view .img li.on img {
	border-color: #0a56a9;
}

.product_view .img li img {
	width: 68px; height: 68px;
	border: 1px solid #e8e8e8;
}

.product_view h3 {
	padding: 0 0 20px;
	border-bottom: 1px solid #333;
	font-size: 24px;
	color: #232323;
	line-height: 26px;
}

/* product_view table 시작지점  */
.product_view table th, .product_view table td {
	padding: 14px 0;
	font-size: 15px;
	color: #444;
	text-align: left
}

.product_view table td.price {
	font-size: 22px;
}

.product_view table td.total {
	font-size: 19px;
	color: #0a56a9;
}

.product_view table td.total b {
	font-size: 22px;
}

.product_view table .length {
	position: relative; width:71px; height: 32px; border:1px solid #c6c6c6; 
	
}

.product_view table .length input {
	width: 44px;
	height: 30px;
	border: none; 
	border-right:1px solid #c6c6c6; text-align: center;
}

.product_view table .length a {
	overflow: hidden; position: absolute; right: 0; width: 26px;
	height: 16px; color: transparent;
	
}

.product_view table .length a:nth-of-type(1) {
	top:0; background: url("화살표 위")
	no-repeat center;
	
}

.product_view table .length a:nth-of-type(2) {
	bottom:0; background: url("화살표 위")
	no-repeat center;
	border-top: 1px solid #c6c6c6;
}

.product_view table select { 
	width:100%; 
	border:1px solid #c6c6c6;
	box-sizing : border-box;
	background: url("셀렉트 아이콘") no-repeat right 11px center;
	appearance:none;
	webkit-appearance:none; 
	-moz-appearance: none;	
}

.product_view table select::-ms-expand { display: none;}

/* 버튼 시작점  btns_product_updown */

.product_view .btns_product_updown {
	padding: 45px 0 0; text-align: center;
}
.product_view .btns_product_updown > a{
	display: inline-block; width: 136px; height: 42px; border-radius: 2px;
	font-size: 16px; color:#fff; line-height: 42px;
}
.product_view .btns_product_updown > a.btns_product_updown1{
	background:#666;
}
.product_view .btns_product_updown > a.btns_product_updown2{
	background:#0a56a9;
}

.card {
	width: 360px;
	background-color: #C6FF70;
	position: absolute;
	top: 60%;
	left: 50%;
	transform: translate(-50%, -50%);
}
/* 
.card2 {
	width: 360px;
	background-color: #C6FF70;
	position: absolute;
	top: 100%;
	left: 50%;
	transform: translate(-50%, -50%);
}

 */
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

h2 {
	text-align: center;
}
</style>

</head>

<%@ include file="../../form/header.jsp" %>

<body>
	<main>
	<br> <br>
		<section>
<!-- 쇼핑몰 상세보기 시작점 -->

			<div class="product_view">
				<h3>도마 명품 캘리포니아 ( 요리조리 쇼핑몰 단독!!!)</h3>
				<table>
					<caption>
						<details>
							<summary>상품정보</summary>
							판매가, 상품코드, 옵션 및 결제 금액 안내
						</details>
					</caption>
					<colgroup>
						<col style="width: 173px;">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th>판매가</th>
							<td>129,000</td>
						</tr>
						<tr>
							<th>상품코드</th>
							<td>C004843</td>
						</tr>
						<tr>
							<th>제조사/공급사</th>
							<td>California / YORIZORI</td>
						</tr>
						<tr>
							<th>구매 수량</th>
							<td>
								<div class="length">
									<input type="number" min="1" value="1"> <a href="#a">증가</a>
									<a href="#a">감소</a>
								</div>
							</td>
						</tr>
						<tr>
							<th>사용가능쿠폰</th>
							<td>0개</td>
						</tr>
						<tr>
							<th>옵션선택</th>
							<td><select>
									<option>기본(+0)</option>
							</select></td>
						</tr>
						<tr>
							<th>배송비</th>
							<td>무료배송</td>
						</tr>
						<tr>
							<th>결제금액</th>
							<td>129,000</td>
						</tr>

					</tbody>

				</table>
				<div class= "img">
					<img alt="" src="img/goods1.jpg">
					<ul>
						<li><a href="#a"><img alt="" src="img/goods2.png"></a></li>
						<li><a href="#a"><img alt="" src="img/goods3.png"></a></li>
					</ul>
				</div>
				<div class= "btns_product_updown">
					<a href="#a" class="btns_product_updown1">장바구니</a> 
					<a href="#a" class="btns_product_updown2">구매하기</a>
				</div>
			</div>

<!-- 클래스 card 시작 지점 -->
			<div class="card">

				<div class="top-section">
					<img id="image-container" alt="" src="img/goods1.jpg">
					<div class="nav">
						<!-- onclick 하면 change_img()함수가 실행된다. -->
						<img alt="" src="img/goods2.png" onclick="change_img(this)">
						<img alt="" src="img/goods3.png" onclick="change_img(this)">
						<img alt="" src="img/goods4.png" onclick="change_img(this)">
					</div>
					<div class="price">52,000 WON</div>
				</div>


				<div class="product-info">
					<div class="name">YORIZORI 도마</div>
					<div class="dis">'MUST HAVE' kitchen tools</div>
					<!-- 장바구니 담기 링크 -->
					<a class="btn_basket" href="#">장바구니에 담기</a>
				</div>

			</div>
			
<!-- javascript 시작점 -->
			<script type="text/javascript">
				/* 체크 */
				var container = document.getElementById("image-container");
				function change_img(image) {
					container.src = image.src;
				}
			</script>


			<br> <br>
			<h2>상세설명</h2>
			<br>
			<h2>-------------------------------------------------------------------------------------------------------</h2>			
			<br> <br> <br> <br> <br> <br> <br>
			<br> <br> <br> <br> <br> <br> <br>
			<br> <br> <br> <br> <br> <br> <br>
			<br> <br> <br> <br> <br> <br> <br>
			<br> <br> <br> <br> <br> <br> <br>
			<br> <br> <br> <br> <br>
			<br> <br> <br> <br> <br> <br> <br>
			<br> <br> <br> <br> <br> <br> <br>
			<br> <br> <br>
		</section>
	</main>
	<!-- 푸터 -->
<%@ include file="../../form/footer.jsp" %>



</body>
</html>