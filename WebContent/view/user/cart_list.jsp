<%@page import="com.yozo.goods.dto.CartDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	List<CartDTO> list = (List<CartDTO>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../../form/header.jsp"%>
<style type="text/css">
#table1 {
	border: 1px;
	width: 400px;
}

#cart_table {
	padding: 30px;
	position: relative;
	top: 30px;
	bottom: 30px; 
	margin-right: auto;
	text-align: center;
	width: 800px;
	border: 1px solid gray;
	border-collapse: collapse;
	margin-left: auto;
	border-color: #0289A9;
}

#cart_table th{
background-color: #0289A9;

}

button {
	background-color: #A0F000;
	padding: 6px;
	color: #0289A9;
	top: 10px;
	margin-top: 50px;
	margin-bottom: 50px;
}
</style>
<script>
	$(function() {

		$("#btnList").click(function() {
			/* location.href = "${path}/shop/product/list.do"; */
			location.href = "/YORIZORI/goods.do?command=goodslist";
		});

		/* 	 아래쪽에서 btnlist를 호출해서 실행되는 function() 함수 구문.
			 list로 가는 링크를 만든다. */

		$("#btnDelete").click(function() {
			if (confirm("장바구니를 비우시겠습니까?")) {
				location.href = "/YORIZORI/view/goods/goods_list.jsp";
			}
		});

		var totalPrice = document.getElementById('totalPrice');
		for (var i = 0; i < price.length; i++) {
			var price = document.getElementsByClassName('price')[i];
			console.log(price.innerHTML);

			totalPrice.innerHTML += price.innerHTML;
			console.log(price);

		}
	});
</script>
</head>
<body>

	<h2>장바구니</h2>

	<table id="cart_table" border="1">

		<tr class=".eval-contents">
			<th>상품 번호</th>
			<th>사진</th>
			<th>상품이름</th>
			<th>구매자 이름</th>
			<th>상품 단가</th>
			<th>수량</th>
			<th>총가격</th>
			<th></th>
		</tr>
		<%
			for (CartDTO c : list) {
		%>
		<tr>
			<td><%=c.getGoods_no()%></td>
			<td><%=c.getGoods_main_photo()%></td>
			<td><%=c.getGoods_title()%></td>
			<td><%=c.getMember_id()%></td>
			<td><div class="price"><%=c.getGoods_price()%></div></td>
			<td><%=c.getAmount()%></td>
			<td><%=c.getMoney()%></td>
			<td>
				<form action="<%request.getContextPath();%>/YORIZORI/CartDelete.do?"
					method="POST">
					<input type="hidden" name="memberId" value="${rdto.member_id }" />
					<input type="hidden" name="goods_no" value="<%=c.getGoods_no()%>" />
					<input type="submit" value="삭제" />
				</form>
			</td>
		</tr>
		<%
			}
		%>
	</table>


	<button type="button" id="btnDelete">장바구니 비우기</button>

	<button type="button" id="btnList">상품목록</button>


	<%@ include file="../../form/footer.jsp"%>
</body>

</html>
