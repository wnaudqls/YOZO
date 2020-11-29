<%@page import="com.yori.zori.model.dto.MemberDto"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="./img/favicon/yozofavicon.ico"
   type="image/x-icon">
<title>요리조리</title>
<style type="text/css">
    body {
        margin: 0px;
        text-align: center;
        width: 100%;
        
        }

    header{
        margin:0px;
        
    }
    #header{
        text-align: center;
    }
    #icon{
        text-align: center;
        
    }
    .dropuserdown{
           z-index: 999;
         position: absolute;
         right: 20px;
         top: 20px;
    }
    .mainlogo{
        width: 300px;
        height: 100px;
    }
     .recipe{
        width: 70px;
        height: 70px;
    } 
    .recipe_link{
       width: 70px;
        height: 70px;
        margin-left: 20px;
        display: inline-block;
    }
    .stream{
        width: 70px;
        height: 70px;
        margin-left: 80px;
    }
    .goods{
        width: 70px;
        height: 70px;
        margin-left: 80px;
    }
    .map{
        width: 70px;
        height: 70px;
        margin-left: 80px;
    }
    .admin{
       width: 70px;
       height: 70px;
       margin-left : 80px;
    }
    .admin finger{
       float:left;
    }
    .usericon {
        background-color:white;
        color: white;
        padding: 0px;
        font-size: 16px;
        border: none;
        cursor: pointer;
        width : 70px;
        height: 70px;
    }
    .usericon:hover, .usericon:focus {
        background-color: white;
    }
    .dropuser_content {
        display: none;
        position: absolute;
        background-color : #F5A9A9;
        min-width: 140px;
        overflow:visible;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        right: 15px;
    }

    .dropuser_content a {
        color:white;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
        float:center;
    }

    .dropuser_content a:hover {background-color: black}

    .show {display:block;}

    .dropstreamdown {
        position: relative;
        display: inline-block;
    }
    .stream {
        background-color:white;
        color: white;
        padding: 0px;
        font-size: 16px;
        border: none;
        cursor: pointer;
    }
    .stream:hover, .stream:focus {
        background-color:white;
    }
    .dropstream_content {
    	z-index: 999;
        display: none;
        position: absolute;
        margin-right: 500px;
        background-color : pink;
        min-width: 100px;
        overflow: auto;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        left: 50px;
    }

    .dropstream_content a {
        color:white;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
        float:left;
    }

    #dropstream_content a:hover {
       background-color: black
    }

    .show {display:block;}
    
   .finger{
       cursor: pointer;
    } 
     #loginStatus {
        width: 300px;
       position: absolute;
       top: 25px;
       right: 100px;
    }
    .inform{
    	background-color: #F5A9A9;
    	color: white;
    	border: none;
    
    }
    .inform:hover{
    background-color: black;
    }
  
</style>

<script type="text/javascript"
   src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
   function dropstream() {
      document.getElementById("dropstream_content").classList.toggle("show");
   }
   window.onclick = function(event) {
      if (!event.target.matches('.stream')) {
         var dropdowns = document
               .getElementsByClassName("dropstream_content");
         var i;
         for (i = 0; i < dropdowns.length; i++) {
            var openDropdown = dropdowns[i];
            if (openDropdown.classList.contains('show')) {
               openDropdown.classList.remove('show');
            }
         }
      }
   }

   function dropuser() {
      document.getElementById("dropuser_content").classList.toggle("show");
   }
   window.onclick = function(event) {
      if (!event.target.matches('.usericon')) {
         var dropdowns = document.getElementsByClassName("dropuser_content");
         var i;
         for (i = 0; i < dropdowns.length; i++) {
            var openDropdown = dropdowns[i];
            if (openDropdown.classList.contains('show')) {
               openDropdown.classList.remove('show');
            }
         }
      }
   }
</script>
</head>
<body>
	<header id="header">
		<!-- 메인 아이콘, 유저아이콘 -->
		<img id="mainicon" class="mainlogo finger" alt="logo"
			src="resources/img/main_icon.png"
			onclick="location.href='user.do?command=main'"><br>
		<c:choose>
			<c:when test="${empty rdto }">
				<div class="dropuserdown">
					<span id="loginStatus">로그인을 해주세요</span> <img
						onclick="location.href='<%=request.getContextPath()%>/user.do?command=loginform'"
						class="usericon" alt="logo" src="resources/img/user_icon.png">
				</div>
			</c:when>
			<c:otherwise>
				<div class="dropuserdown">
					<span id="loginStatus"><b>${rdto.member_nick }</b> 님이
						로그인하였습니다.</span> <img onclick="dropuser()" class="usericon" alt="logo"
						src="resources/img/user_icon.png">
					<div id="dropuser_content" class="dropuser_content">
						<a
							href="<%request.getContextPath();%>/YORIZORI/user.do?command=updateform">개인정보수정</a>

						<a
							href="<%request.getContextPath();%>/YORIZORI/recipe.do?command=my_recipe_list&memberId=${rdto.member_id }">나의레시피</a>
						<a
							href="<%request.getContextPath();%>/YORIZORI/list.do?memberId=${rdto.member_id }">나의
							장바구니</a> <a
							href="<%request.getContextPath();%>/YORIZORI/user.do?command=logout">로그아웃</a>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</header>
	<!-- 네비게이션 아이콘  -->
	<nav id="icon">
		<img
			onclick="location.href='<%request.getContextPath();%>/YORIZORI/recipe.do?command=recipe_list'"
			class="recipe finger" alt="logo" src="resources/img/recipe_icon.png">
		<div class="dropstreamdown">
			<img onclick="dropstream()" class="stream finger" alt="logo"
				src="resources/img/broadcast_icon.png">
			<div id="dropstream_content" class="dropstream_content">

				<a href="resources/broadcast.do?command=stream" class="useId">방송하기</a>
				<a href="resources/broadcast.do?command=watch">시청하기</a> <a
					href="resources/broadcast.do?command=broadcast" class="useId">예약하기</a>
			</div>
		</div>
		<!--유정 goods onclick 건들임 -->
		<img class="goods finger" alt="logo"
			src="resources/img/goods_icon.png"
			onclick="location.href='<%request.getContextPath();%>/YORIZORI/goods.do?command=goodslist'">
		<img class="map finger" alt="logo" src="resources/img/map_icon.png"
			onclick="location.href = '<%request.getContextPath();%>/YORIZORI/view/map/map.jsp'">
		<c:if test="${rdto.member_role eq '관리자' }">
			<img class="admin finger" alt="logo"
				src="/YORIZORI/img/admin_icon.png"
				onclick="location.href='<%=request.getContextPath()%>/admin.do?command=list'">
		</c:if>
	</nav>

</body>
</html>