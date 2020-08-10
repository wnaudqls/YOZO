<%@page import="com.yozo.goods.dto.CartDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/form/header.jsp"%>
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
}

#cart_table th {
   background-color: #DAF7A6;
}

.btn {
   width: 70px;
   height: 35px;
   margin-top: 50px;
   margin-bottom: 20px;
   background-color: #F5A9A9;
   color: #FAFAFA;
   border: 0;
   outline: 0;
   border-radius: 0.35em;
   font-weight: bold;
   cursor: pointer;
   
}

#pay_price{
   background-color: #F5A9A9;
   color : #C8F372;
   font-size: 20px;
   font-style: inherit;
   font-weight: bolder;
}

#pay_price span{
   color : #FDFF77;
   font-size: 30px;
}



</style>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.4.js"
   type="text/javascript"></script>
<script>
   $(function() {
      $("input[name=chk]").click(function() {
         var $totalPrice = $("#totalPrice");
         if($(this).is(":checked")){
         var price = Number($(this).parent().next().next().next().next().next().next().next().html());
         var totalPrice = price + Number($totalPrice.html());
         
         $totalPrice.html(totalPrice);
         }else{
         var price = Number($(this).parent().next().next().next().next().next().next().next().html());
         var totalPrice = Number($totalPrice.html()) - price;
         
         $totalPrice.html(totalPrice);
            
         }
         
         
      });
      $("#btnList").click(function() {
         /* location.href = "${path}/shop/product/list.do"; */
         location.href = "/YORIZORI/goods.do?command=goodslist";
      });

      /*     아래쪽에서 btnlist를 호출해서 실행되는 function() 함수 구문.
          list로 가는 링크를 만든다. */

<%--       $("#btnDelete").click(function() {
         if (confirm("장바구니를 비우시겠습니까?")) {
            location.href = "<%request.getContextPath();%>/YORIZORI/goods.do?command=goodslist";
         }
      }); --%>

      var totalPrice = document.getElementById('totalPrice');
      for (var i = 0; i < price.length; i++) {
         var price = document.getElementsByClassName('price')[i];
         console.log(price.innerHTML);

         totalPrice.innerHTML += price.innerHTML;
         console.log(price);

      }
      
   });
   
   //전체선택 체크박스
   function allChk(bool){
      var chks = document.getElementsByName("chk");
      for(var i = 0; i < chks.length; i++){
         chks[i].checked = bool;
      }         
   }
   
   

         //구매하기

         /*  장바구니 결제하기 아직 안했음 아직 안했음 아직 안했음!!!코드 고쳐야함!!!아직!!안했다~!!! */
          function total_price() {
                    var cnt = document.getElementById("amount").value;
                    var price = document.getElementById("goods_price").innerText;
                    var money = parseInt(price) * parseInt(cnt);
                    document.getElementById("money").innerText = money;
                    
                 
                 } 
                 function pay(){
                    alert("결제시작");
                    var cnt = document.getElementsByName("chk");
                    var total= Number($("#totalPrice").html());
                    var IMP = window.IMP; // 생략가능
                    IMP.init('imp92407375');

                    IMP.request_pay({
                        pg : 'html5_inicis', // version 1.1.0부터 지원.
                        pay_method : 'card',
                        merchant_uid : 'merchant_' + new Date().getTime(),
                        name : '주문명:결제테스트',
                        amount : total,
                        buyer_email : 'iamport@siot.do',
                        buyer_name : '구매자이름',
                        buyer_tel : '010-1234-5678',
                        buyer_addr : '서울특별시 강남구 삼성동',
                        buyer_postcode : '123-456'
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
</head>
<%
   List<CartDTO> list = (List<CartDTO>) request.getAttribute("list");
%>
<body>

   <h2>장바구니</h2>
   <form action="<%request.getContextPath();%>/YORIZORI/CartDelete.do"
      method="POST" id="form">
      <input type="hidden" name="command" value="cartmuldel">
      <table id="cart_table" border="1">

         <tr>
            <th><input type="checkbox" name="all"
               onclick="allChk(this.checked);" /></th>
            <th>상품 번호</th>
            <th>사진</th>
            <th>상품이름</th>
            <th>구매자 아이디</th>
            <th>상품 단가</th>
            <th>수량</th>
            <th>총가격</th>
         </tr>
         <%
            if(list.size() == 0){
               
          %>

         <tr>
            <td colspan="8">장바구니가 비어있습니다.</td>
         </tr>

         <%
            }else{ 
               for (CartDTO c : list) {
            
         %>

         <tr>
            <td><input type="checkbox" name="chk"
               value="<%=c.getGoods_no()%>" /></td>
            <td><%=c.getGoods_no()%></td>
            <td><%=c.getGoods_main_photo()%></td>
            <td><%=c.getGoods_title()%></td>
            <td><%=c.getMember_id()%></td>
            <td><div class="price"><%=c.getGoods_price()%></div></td>
            <td><%=c.getAmount()%></td>
            <td><%=c.getMoney()%></td>
            <input type="hidden" name="memberId" value="${rdto.member_id }" />
            <input type="hidden" name="goods_no" value="<%=c.getGoods_no()%>" />
      
            <%
               }
         }
      %>
         </tr>
   <div id="pay_price">
      ' 총 가격 : <span id="totalPrice">0</span> WON '
   </div>
      </table>
      
      <div id="btns">
         <!--  <input class="btn" type="submit" id="btnDelete" value="삭제" onclick="location.href='<%request.getContextPath();%>/YORIZORI/CartDelete.do?command=cartmuldel&goods_no=${dto.goods_no}'"/>-->
         <input class="btn" type="submit" id="btnDelete" value="삭제" /> <input
            class="btn" type="button" id="btnList" value="상품목록" /> <input
            class="btn" type="button" value="결제하기" onclick="pay();" />
      </div>





      <!--    <button type="button" id="btnDelete">장바구니 비우기</button>
   <button type="button" id="btnList">상품목록</button> -->


   </form>
   <%@ include file="/form/footer.jsp"%>
</body>

</html>