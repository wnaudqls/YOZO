<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--  
<script src="./js/RTCMultiConnection.min.js">
	//RTCMultiConnection api 불러옴
</script>
-->
<!--  
<script src="./js/socket.io.js">
//socket.io 불러옴
</script>
-->
<script src="/YORIZORI/view/broadcast/js/RTCMultiConnection.min.js">
	//RTCMultiConnection api 불러옴
</script>
<script src="/YORIZORI/view/broadcast/js/socket.io.js">
</script>




<!-- 
<script type="text/javascript" src="./js/broadcast.js">
</script>
-->

</head>
<body>
<%@include file="/form/header.jsp"%>
<input type="text" value="${rdto.member_nick}" id="nickname" hidden="">
	<input type="text" id="roomid" placeholder="방 이름을 입력하세요. ">
	<button id="btn-open-room">생성하기</button>
	<button id="share-room">링크공유</button>
	<div>
		<input type="number" id="maxClient" disabled="disabled" hidden="">
	</div>
	<hr>
	내 화면
	<div>
		<h2 id="clientnumber"></h2>
	</div>
	<div id="localvideo"></div>

	<hr>
	상대방 화면
	<div id="remotevideo"></div>

	<script type="text/javascript" src="/view/broadcast/js/broadcast.js">
	</script>
<div id="footer">
	<%@include file="/form/footer.jsp"%>
</div>

</body>
<!--  
<style type="text/css">
@import url("./css/broadcast.css");
</style>
-->

<style type="text/css">
@import url("view/broadcast/css/broadcast.css");
</style>

</html>