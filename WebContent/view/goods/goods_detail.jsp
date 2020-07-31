<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

section {
	height: 600px;
}
/* product_view .img 시작 지점 */
.product_view {
	display: inline-block;
}

/* product_view table 시작지점  */
.product_view table th, .product_view table td {
	padding: 14px 0;
	font-size: 15px;
	color: #444;
	text-align: left
}

.btns_product_updown>a {
	display: inline-block;
	width: 136px;
	height: 42px;
	border-radius: 2px;
	font-size: 16px;
	color: #FAFAFA;
	line-height: 42px;
	margin-top: 30px;
	margin-bottom: 30px;
}

#thumbnail {
	width: 300px;
	height: 300px;
	/* 	float: left; */
}

#product_preview {
	/* float: left; */
	
}

.product_image {
	display: inline-block;
}

.btns_product_updown {
	clear: both;
}

.product_wrap {
	text-align: center;
}
.btn{
   width : 70px;
   height : 35px;
   margin-top: 20px;
   background-color : #F5A9A9;
   color : #FAFAFA;
   border : 0;
   outline: 0;
   border-radius : 0.35em;
   font-weight: bold;
   cursor: pointer;

}

</style>
</head>


<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.4.js" type="text/javascript"></script>

<script type="text/javascript">


	function total_price() {
		var price = document.getElementById("goods_price").innerText;
		var cnt = document.getElementById("count").value;

		var total_price = parseInt(price) * parseInt(cnt);
		document.getElementById("total_price").innerText = total_price;

	}
	
	function pay(){

		var IMP = window.IMP; // 생략가능
		IMP.init('imp92407375');

		IMP.request_pay({
		    pg : 'html5_inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '주문명:결제테스트',
		    amount : 14000,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456',
		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		});

	};

 		
</script>
<body> 
	<%@include file=../../form/header.jsp"%>
	<section class="section">
		<!-- 쇼핑몰 상세보기 시작점  -->
		<div class="product_wrap">
			<div class="product_image">
				<!-- 썸네일   -->
				<img src="${dto.goods_main_photo }" id="thumbnail" />
			</div>
			<div class="product_view">
				<table id="product_preview">
					<caption>
						<details>
							<summary>상품정보</summary>
						</details>
					</caption>
					<tbody>
						<tr>
							<th>판매가</th>
							<td id="goods_price">
								<%-- ${dto.goods_price} --%>5000
							</td>
						</tr>
						<tr>
							<th>제조사/공급사</th>
							<td>California / YORIZORI</td>
						</tr>
						<tr>
							<th>구매 수량</th>
							<td><input type="number" min="1" value="1"
								onchange="total_price();" id="count"></td>
						</tr>
						<tr>
							<th>배송비</th>
							<td>무료배송</td>
						</tr>
						<tr>
							<th>결제금액</th>
							<td><span id="total_price"></span>원</td>
						</tr>
					</tbody>

				</table>
			</div>
			<div>
				<input class="btn" type="button" value="장바구니"/>
				<input class="btn" type="button" value="구매하기" onclick="pay();"/>
			</div>
		</div>
		<hr>
		<h1>상세설명</h1>
		<div class="goods_image">
			<p>${dto.goods_content }</p>
		</div>
	</section>

	<!-- 푸터 -->
	<%@ include file="../../form/footer.jsp"%>
</body>
</html>