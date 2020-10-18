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
	margin-right: 400px;
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
	/* 	border: 1px solid #ddd; */
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

/*굿즈 목록 리스트 큰테두리* /
.goods_list {
	margin: 0 5%;
	border: 1px solid red;
	/*    margin: 0 10%; */
}

#warning { /* warning이미지 */
	width: 100px;
	height: 100px;
	text-align: center;
}

#message { /* warning 메시지 */
	display: inline-block;
	text-align: center;
	font-size: 25pt;
}
/* .tablewrapper{
display: inline-block;} */
.goods_card {
	display: inline-block;
	width: 250px;
	/* height: 300px; */
	/* border: 1px solid black; */
	border-radius: 25px;
	box-sizing: content-box;
	margin-top: 50px;
	display: inline-block;
	width: 250px;
	/* height: 300px; */
	border: 1px solid black;
    border-radius: 25px 25px 0 0;
	margin-top: 50px;
}

#checkbox { /*체크박스 */
	width: 17px;
	height: 17px;
	margin-top: 10px;
}

/* #goods_card_wrapper { /* 상품카드 감싸는 div  */
/*    float: left; */
/* } */
.goods_card_img { /* 이미지 감싸는 div */
	width: 250px;
	height: 230px;
	border-radius: 25px 25px 0 0;
}

.goods_img_tag { /* 이미지 태그 */
	border-radius: 25px 25px 0 0;
	width: 250px;
	height: 230px;
}

.goods_card_contents {
	text-align: center;
	width: 250px;
	height: 70px;
}

.nosection { /* 내용없을때 기본크기주기 */
	height: 400px;
}

.off-screen {
	display: none;
}

.paging {
	position: relative;
}

.list_card {
	display: inline-block;
}

#muldelform {
	/* border: 1px solid red; */
	/*
   width: 300px;
   height: 330px;*/
	
}
</style>

<%@ include file="../../form/header.jsp"%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function() {

		var bool = true;
		$("#allcheck").click(function() {
			if (bool) {
				allChk(bool);
				bool = false;
			} else {
				allChk(bool);
				bool = true;
			}
		});
	});

	function alldel() {
		var msg = "정말로 전체삭제를 하시겠습니까? 삭제버튼을 누르시면 삭제됩니다.";
		var flag = confirm(msg);
		if (flag == true) {
			allchk();
			/* location.href="/YORIZORI/goods.do?command=muldel&goods_no=${dto.goods_no}" */
		} else {
			alert("삭제가 취소되었습니다.")
		}

	}

	function allChk(bool) {
		var chks = document.getElementsByName("chk");
		console.log(chks);
		for (var i = 0; i < chks.length; i++) {
			chks[i].checked = bool;
		}

	}

	function confirmchk() {
		var chks = document.getElementsByName("chk");
		console.log(chks);
		if ($("#muldelform input:checked").length == 0) {
			alert("하나 이상 체크해주시기 바랍니다.");
		} else {
			$("#muldelform").submit();
		}
	};
</script>
<body>
	<section>
		<c:if test="${rdto.member_role eq '관리자' }">
			<div id="btns">
				<input class="btn" type="button" value="등록"
					onclick="location.href='<%request.getContextPath();%>/YORIZORI/goods.do?command=goodsinsertform'" />
				<!-- 체크 삭제버튼 -->
				<input class="btn" type="submit" value="삭제" onclick="confirmchk();" />
				<input type="hidden" name="goods_no" value="${dto.goods_no }" /> <input
					class="btn" type="button" value="전체선택" name="all" id="allcheck" />
			</div>
		</c:if>




		<form action="<%=request.getContextPath()%>/goods.do" method="post"
			id="muldelform">
			<div id="products" class="goods_list">
				<c:choose>
					<c:when test="${empty list }">
						<div class="nosection">
							<img id="warning" alt="warning" src="/YORIZORI/img/warning.jpg">
							<h1 id="message">
								등록된 상품이 존재하지 않습니다.<br /> <br />
							</h1>
							<div>
								<input id="btn" class="btn" type="button" value="상품등록하러가기"
									onclick="location.href='<%request.getContextPath();%>/YORIZORI/goods.do?command=goodsinsertform'" />
							</div>
						</div>
					</c:when>



					<c:otherwise>
						<c:forEach items="${list }" var="dto">
							<div class="list_card">

								<!--썸네일 / 제목 / 가격 / 장바구니담기버튼 -->
								<div class="goods_card eval-contents">
									<div>
										<c:if test="${rdto.member_role eq '관리자' }">

											<input type="hidden" name="command" value="goodsmuldel" />
											<input type="hidden" name="goods_no" value="${dto.goods_no}" />
											<input type="checkbox" id="checkbox" name="chk"
												value="${dto.goods_no}" />

										</c:if>
									</div>


									<div class="goods_card_img">

										<a	href="/YORIZORI/goods.do?command=goodsdetail&goods_no=${dto.goods_no }">
											<img src="${pageContext.request.contextPath }/ckstorage/images/${dto.goods_main_photo }"
											class="goods_img_tag" alt="굿즈메인사진" />
										</a>
										<p>${dto.goods_title }</p>
										<p>${dto.goods_price }원</p>
									</div>
								</div>
								<div>
									<input type="button" value="장바구니 담기"
										onclick="location.href='<%request.getContextPath();%>/YORIZORI/CartInsert.do?goods_main_photo=${dto.goods_main_photo }&amount=1&goods_title=${dto.goods_title }&memberId=${rdto.member_id }&goods_no=${dto.goods_no }&goods_price=${dto.goods_price }'">
								</div>
							</div>
						</c:forEach>
					</c:otherwise>

				</c:choose>
			</div>
		</form>

	</section>


	<form action="" id="setRows">
		<input type="hidden" name="rowPerPage" value="8">
	</form>
	<!-- 푸터 -->



</body>
<div id="paging"></div>
<%@ include file="../../form/footer.jsp"%>
<script>
	var $setRows = $('#setRows');

	$setRows
			.submit(function(e) {
				e.preventDefault();
				var rowPerPage = $('[name="rowPerPage"]').val() * 1;// 1 을  곱하여 문자열을 숫자형로 변환

				//            console.log(typeof rowPerPage);

				var zeroWarning = 'Sorry, but we cat\'t display "0" rows page. + \nPlease try again.'
				if (!rowPerPage) {
					alert(zeroWarning);
					return;
				}
				$('#nav').remove();
				var $products = $('#products');
				var $products2 = $("#paging");
				$products2.after('<div id="nav" class="paging">');

				var $tr = $($products).find('.eval-contents');
				var rowTotals = $tr.length;

				var pageTotal = Math.ceil(rowTotals / rowPerPage);
				var i = 0;

				for (; i < pageTotal; i++) {
					$('<a href="#"></a>').attr('rel', i).html(i + 1).appendTo(
							'#nav');
				}

				$tr.addClass('off-screen').slice(0, rowPerPage).removeClass(
						'off-screen');

				var $pagingLink = $('#nav a');
				$pagingLink.on('click', function(evt) {
					evt.preventDefault();
					var $this = $(this);
					if ($this.hasClass('active')) {
						return;
					}
					$pagingLink.removeClass('active');
					$this.addClass('active');

					// 0 => 0(0*4), 4(0*4+4)
					// 1 => 4(1*4), 8(1*4+4)
					// 2 => 8(2*4), 12(2*4+4)
					// 시작 행 = 페이지 번호 * 페이지당 행수
					// 끝 행 = 시작 행 + 페이지당 행수

					var currPage = $this.attr('rel');
					var startItem = currPage * rowPerPage;
					var endItem = startItem + rowPerPage;

					$tr.css('opacity', '0.0').addClass('off-screen').slice(
							startItem, endItem).removeClass('off-screen')
							.animate({
								opacity : 1
							}, 100);

				});

				$pagingLink.filter(':first').addClass('active');

			});

	$setRows.submit();
</script>
</html>