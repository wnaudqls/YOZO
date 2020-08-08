<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보수정</title>
  
  

	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	
	<script type="text/javascript">
	var rnum=0;
	
	
	function nickCheck(){
		
		var doc = document.getElementsByName("nick")[0];
		if (doc.value.trim() == "" || doc.value == null) {
			alert("닉네임를 입력해 주세요!");
		} else {
			open("/YORIZORI/user.do?command=nickcheck&nick="+doc.value, "", "width=200, height=200");
		}
	}
		
	
	
	
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



	
	function goPopup(){
//	    var pop = window.open("../../popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	    var pop = window.open("view/user/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	 
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
	
<script type="text/javascript">
	/* 	function changepw(){
	 window.open("change_password.jsp", "비밀번호변경팝업창", "width = 500px, height = 500px, left=715, top = 250")
	
	 }  */

	$(function() {
		$("#popbutton").click(function() {
			$("#popup").fadeIn();
			$("#popmenu").fadeIn();
		});
	 	$("#popup").click(function() {
			$("#popup").fadeOut();
			$("#popmenu").fadeOut();
		}); 
	});
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
	
	
	</style>
  
  
<body>
	<%@ include file="/form/header.jsp"%>
	<section>
		
		<!--팝업 -->
		<!-- #popup은 그냥 뒷배경박스일 뿐  -->
		<div id="popup">
		</div>
			<div id="popmenu">
				<div>
					<img id="warning" alt="warning" src="/YORIZORI/img/warning.jpg"> <b
						id="message">비밀번호 변경</b>
				</div>
				<table id="changetable">
					<tr>
						<td>기존 비밀번호 :</td>
						<td><input type="text" placeholder="입력해주세요." /></td>
					</tr>
					<tr>
						<td>변경할 비밀번호 :</td>
						<td><input type="text" placeholder="입력해주세요." /></td>
					</tr>
				</table>
				<div>
					<input class="btn" type="button" value="변경" />
				</div>
			</div>
		
		<div id="wrapperinfo">
			<div>
				<img id="warning" alt="warning" src="/YORIZORI/img/warning.jpg"> <b
					id="message">개인정보수정</b>
			</div>
			<table id="editmyinfo">
				<tr>
=======

	
	
	
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
	<h1>개인정보수정</h1>
		<form action="<%=request.getContextPath() %>/user.do" name="form" id="form" method="post">
		<input type="hidden" name="command" value="update" >
		<table>
	
<tr>
				<td class="col">닉네임 : </td><td><input type="text" id="nick" name="nick" placeholder="닉네임을 입력해 주세요"></td><td><input type="button" value="중복확인" onclick="nickCheck()"></td>
</tr>
<tr>
				<td class="col">비밀번호 : </td><td><input type="password" id="pw" name="pw" placeholder="비밀번호를 입력해 주세요"></td>
</tr>
<tr>
				<td class="col">비밀번호<br> 확인 : </td><td> <input type="password" id="pwchk" placeholder="비밀번호를 다시 입력해 주세요"></td>
</tr>
<tr>
				<td class="col" class="asdf">주소 : </td> <td class="asdf"> 
				<input type="hidden" id="confmKey" name="confmKey" value=""  >
				<input type="text" id="zip_no" name="zip_no" placeholder="우편번호" readonly="readonly" value=""> </td> <td><input type="button" value="주소 검색" onclick="goPopup();"> </td>
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
				<td class="col">전화번호 : </td> <td colspan="2"> <input type="text" id="phone" name="phone"></td> 
</tr>
		</table>
		<input type="submit" id="updateBtn" value="가입하기"">
		
		</form>
	</div>
	<br>
	<br>
	<br>
	<br>

	<%@ include file="/form/footer.jsp"%>

</body>
</html>	