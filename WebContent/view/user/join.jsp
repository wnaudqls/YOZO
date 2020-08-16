<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html charset=UTF-8");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

   <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
   
   <script type="text/javascript">
   var rnum=0;
   function idCheck(){
      
      var doc = document.getElementsByName("id")[0];
      if (doc.value.trim() == "" || doc.value == null) {
         alert("아이디를 입력해 주세요!");
      } else {
         open("/YORIZORI/user.do?command=idcheck&id="+doc.value,
               "",
               "width=200, height=200");
      }
   }
   
   function nickCheck(){
      
      var doc = document.getElementsByName("nick")[0];
      if (doc.value.trim() == "" || doc.value == null) {
         alert("닉네임를 입력해 주세요!");
      } else {
         open("/YORIZORI/user.do?command=nickcheck&nick="+doc.value,
               "",
               "width=200, height=200");
      }
   }
      
   $(function() {
      $('#닉네임 중복 확인').click(function() {
              $.ajax({
              type:"POST",
              url:"user.do?command=nickcheck",
              data:{
                     "nick":$('#nick').val()
              },
              
              success:function(data){   //data : checkSignup에서 넘겨준 결과값
                     if($.trim(data)=="YES"){
                        if($('#nick').val()!=''){ 
                           alert("사용가능한 닉네임입니다.");
                        }
                       }else{
                        if($('#nick').val()!=''){
                           alert("중복된 닉네임입니다.");
                           $('#nick').val('');
                           $('#nick').focus();
                        }
                     }
                  }
             }) 
           })

      });
   
   
   $(function() {
      $('#pwchk').blur(function(){
            if($('#pw').val() != $('#pwchk').val()){
                if($('#pwchk').val()!=''){
                alert("비밀번호가 일치하지 않습니다.");
                    $('#pwchk').val('');
                   $('#pwchk').focus();
                }
             }
         })  

   });
   $(function() {
      $('#pwchk').blur(function(){
            if($('#pw').val() != $('#pwchk').val()){
                if($('#pwchk').val()!=''){
                alert("비밀번호가 일치하지 않습니다.");
                    $('#pwchk').val('');
                   $('#pwchk').focus();
                }
             }
         })  

   });


   function emailCheck(checkNum) {   //메일 보내기 기능 버튼! (랜덤 정수 반환받는 파라미터)
      //해당하는value 값 특히 이메일은 값이 여러개
      //selected 선택 된값 으로 잡아줘여한다.
         var email = document.getElementById("email").value;
         rnum=checkNum;
         //value 값 저장 
         
         
         $.ajax({         //한번더 ajax 사용하요 
            url:"<%=request.getContextPath() %>/user.do", //컨트롤러 활용하여
            type:"post",         // post방식
            datatype:"json",      //datatype
            data:{"command":"sendEmail","email":email, "random":checkNum},   //ajax 에서 컨트롤러=샌드이메일 로 이동 (리시버=이베일 & 랜덤=체크넘 가지고)
            success(data) {
               alert("전송성공! \n인증번호를 확인해주세요. ");
            },
            error(err) {
               alert("해당 이메일 전송 실패");
            }
             
         });
          
       
      }
      function chkAuth1(){
         var num=document.getElementById("chkAuth").value;//메일로 오는 값  = > 메일로 올 때 새로 난수 생성되서 옴

         
         if(num == rnum){      // 먼저 생선된 값 
            alert("인증성공");
            document.getElementById('joinBtn').style.display = "inline";


         }else{
            alert("인증실패");
            document.getElementById('joinBtn').style.display = "none";


         }
      }   
   
   
   function goPopup(){
//       var pop = window.open("../../popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
       var pop = window.open("/YORIZORI/view/user/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
    
   }
   function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
                     , detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
      // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
      document.form.road_addr_part1.value = roadAddrPart1;
      document.form.road_addr_part2.value = roadAddrPart2;
      document.form.addr_detail.value = addrDetail;
      document.form.zip_no.value = zipNo;
      
      console.log(roadAddrPart1);

      
      
   }

   
   </script>
   
   <style type="text/css">
      
      body {
         text-align: center;
      }
      
      #phone {
         width: 60px;
      }
      table {
         margin-left: auto;
         margin-right: auto;
      }
      #id, #nick, #name, #pw, #pwchk, #email, #chkAuth, #road_addr_part1,#road_addr_part2, #addr_detail, #phone {
         width: 200px;
      } 
      td {
         text-align: left;
         padding-bottom: 10px;
      } 
      .asdf {
         padding: 0px;
      }
   
      .userBtn {
         border: none;
         background-color: #F5A9A9;
         color: white;
         border-radius: 3px;
         cursor: pointer;
      }
   
   </style>
   
   
   
</head>
<body>
<%@ include file="../../form/header.jsp" %>
<br>
<br>
<br>

<%!

   int random = 0;

   public int getRandom(){
   
   random = (int)Math.floor((Math.random()*(99999-10000+1)))+10000;
   return random;
   }
%>

   <div>
   <h1 >회원 가입</h1>
      <form action="<%=request.getContextPath() %>/user.do" name="form" id="form" method="post">
      <input type="hidden" name="command" value="join" >
      <table>
   
<tr>
            <td class="col"><span style="color: #F5A9A9;">&bullet;</span>아이디 : </td><td><input type="text" id="id" name="id" placeholder="아이디를 입력해 주세요"></td><td><input type="button" class="userBtn" value="중복확인" onclick="idCheck()"></td>
</tr>
<tr>
            <td class="col"><span style="color: #F5A9A9;">&bullet;</span>닉네임 : </td><td><input type="text" id="nick" name="nick" placeholder="닉네임을 입력해 주세요"></td><td><input type="button" value="중복확인" class="userBtn" onclick="nickCheck()"></td>
</tr>
<tr>
            <td class="col"><span style="color: #F5A9A9;">&bullet;</span>이름 : </td><td><input type="text" id="name" name="name" placeholder="이름을 입력해 주세요"></td>
</tr>
<tr>
            <td class="col"><span style="color: #F5A9A9;">&bullet;</span>비밀번호 : </td><td><input type="password" id="pw" name="pw" placeholder="비밀번호를 입력해 주세요"></td>
</tr>
<tr>
            <td class="col"><span style="color: #F5A9A9;">&bullet;</span>비밀번호 확인 : </td><td> <input type="password" id="pwchk" placeholder="비밀번호를 다시 입력해 주세요"></td>
</tr>
<tr>
            <td class="col"><span style="color: #F5A9A9;">&bullet;</span>이메일 : </td> <td> <input type="text" id="email" name="email" placeholder="이메일을 입력해 주세요"></td><td><input type="button" value="본인인증" class="userBtn" onclick="emailCheck('<%=getRandom()%>');"></td>
</tr>
<tr>
            <td class="col"><span style="color: #F5A9A9;">&nbsp;</span>인증번호 확인 : </td> <td> <input type="text" id="chkAuth" placeholder="인증번호를 입력해 주세요"></td><td><input type="button" value="인증확인" class="userBtn" onclick="chkAuth1()"></td>
</tr>
<tr>
            <td class="col" class="asdf"><span style="color: #F5A9A9;">&nbsp;</span>주소 : </td> <td class="asdf"> 
            <input type="hidden" id="confmKey" name="confmKey" value=""  >
            <input type="text" id="zip_no" name="zip_no" placeholder="우편번호" readonly="readonly" value=""> </td> <td><input type="button" value="주소 검색" class="userBtn" onclick="goPopup();"> </td>
</tr>
<tr>
            <td></td><td colspan="2"><input type="text" id="road_addr_part1" name="road_addr_part1" placeholder="도로명 주소" readonly="readonly" value=""></td>   
</tr>
<tr>
            <td></td><td colspan="2"><input type="text" id="road_addr_part2" name="road_addr_part2" placeholder="상세주소 1" readonly="readonly" value=""></td>
</tr>
<tr>
            <td></td><td colspan="2"><input type="text" id="addr_detail" name="addr_detail" placeholder="상세주소 2" readonly="readonly" value=""></td>
</tr>
<tr>
            <td class="col"><span style="color: #F5A9A9;">&nbsp;</span>전화번호 : </td> <td colspan="2"> <input type="text" id="phone" name="phone"></td> 
</tr>
      </table>
         <p style="color: green;" style="text-align: center;">이메일 인증을 하면 가입버튼이 나타납니다.</p>
      <input type="submit" id="joinBtn" class="userBtn" value="가입하기" style="display: none;">
      
      </form>
   </div>
   <br>
   <br>
   <br>
   <br>

   <%@ include file="../../form/footer.jsp" %>

</body>
</html>   