<%@page import="com.yozo.user.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="./img/favicon/yozofavicon.ico" type="image/x-icon">
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
	section{
		margin-top: 150px;
	}
    #header{
        text-align: center;
    }
    #icon{
        text-align: center;
    }
    .dropuserdown{
   	 	 z-index: 1;
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
    .usericon {
        background-color:white;
        color: white;
        padding: 0px;
        font-size: 16px;
        border: none;
        cursor: pointer;
    }
    .usericon:hover, .usericon:focus {
        background-color: white;
    }
    .dropuser_content {
        display: none;
        position: absolute;
        background-color : #F5A9A9;
        min-width: 160px;
        overflow: auto;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    }

    .dropuser_content a {
        color:white;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
        float:left;
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
    	opacity: 0.85;
  		z-index: 1;
        display: none;
        position: absolute;
        margin-right: 500px;
        background-color : #F5A9A9;
        min-width: 160px;
        overflow: auto;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    }

    .dropstream_content a {
        color:white;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
        float:left;
    }

    #dropstream_content a:hover {background-color: black}

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
  
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
function dropstream(){
    document.getElementById("dropstream_content").classList.toggle("show")
;}
window.onclick = function(event){
    if(!event.target.matches('.stream')){
        var dropdowns = document.getElementsByClassName("dropstream_content");
        var i;
        for (i = 0; i < dropdowns.length; i++){
            var openDropdown = dropdowns[i];
            if(openDropdown.classList.contains('show'))
            {
                openDropdown.classList.remove('show');
            }
        }
    }
}

function dropuser(){
    document.getElementById("dropuser_content").classList.toggle("show")
;}
window.onclick = function(event){
    if(!event.target.matches('.usericon')){
        var dropdowns = document.getElementsByClassName("dropuser_content");
        var i;
        for (i = 0; i < dropdowns.length; i++){
            var openDropdown = dropdowns[i];
            if(openDropdown.classList.contains('show'))
            {
                openDropdown.classList.remove('show');
            }
        }
    }
}

//메뉴 클릭 시 로그인이 필요한 경우 로그인으로 이동 기능 작성 중 *************************


//---------페이스북 로그인 확인 
/* FB.getLoginStatus(function(response) {
                    if(response.status === 'connected') {
                        document.querySelector('#authBtn').value = "Logout";
                    } else {
                        document.querySelector('#authBtn').value = "Login";
                    }
                })
 */

</script>
</head>
<body>

<%
	MemberDto dto = (MemberDto)session.getAttribute("rdto");
	String kakaonickname = request.getParameter("kakaonickname");
    session.setAttribute("kakaonickname", kakaonickname);

%>
<header id= header> <!-- 메인 아이콘, 유저아이콘 -->
        <img id="mainicon" class="mainlogo finger" alt="logo" src="/YORIZORI/img/mainicon.png" onclick="location.href='<%request.getContextPath();%>/YORIZORI/view/main/main.jsp'"><br>
  
	
		        


<%
	if (dto == null) {
%>
		<div class = "dropuserdown">
				<img onclick = "location.href='<%request.getContextPath();%>/YORIZORI/user.do?command=loginform'" class="usericon" alt="logo" src="/YORIZORI/img/usericon.png">
		</div>		
<%
	} else if (dto != null) {
%>
    	<div class = "dropuserdown">
		        	<span id="loginStatus">${rdto.member_nick } 님이 로그인하였습니다.</span>
		            <img onclick = "dropuser()" class="usericon"alt="logo" src="/YORIZORI/img/usericon.png">
		            <div id="dropuser_content" class = "dropuser_content">
		                <a href="">개인정보수정</a>
		                <a href="">나의레시피</a>
		                <a href="" class="useId">
			                <form action="<%request.getContextPath();%>/YORIZORI/list.do?">
							    <input type="hidden" name="memberId" id="memberId" value="${rdto.member_id }"/>
							    <input type="submit" value="나의 장바구니"/>
							</form>
						</a>
		                <a href="">우리집냉장고</a>
		                <a href="<%request.getContextPath();%>/YORIZORI/user.do?command=logout">로그아웃</a>
		            </div>
       </div>
 <%
	}
 %>

</header>    
<!-- 네비게이션 아이콘  -->  
         <nav id="icon">
            	<img onclick = "location.href='<%request.getContextPath();%>/YORIZORI/recipe.do?command=recipe_list'" class="recipe finger" alt="logo" src="/YORIZORI/img/recipebookicon.png">
            <div class = "dropstreamdown">
                <img onclick = "dropstream()" class="stream finger" alt="logo" src="/YORIZORI/img/broadcasticon.png">
                <div id="dropstream_content" class = "dropstream_content">

                    <a href="/YORIZORI/broadcast.do?command=stream" class="useId">방송하기</a>
                    <a href="/YORIZORI/broadcast.do?command=watch" >시청하기</a>
                    <a href="/YORIZORI/broadcast.do?command=broadcast" class="useId">예약하기</a>
                </div>
            </div>
            <!--유정 goods onclick 건들임 -->
            <img class="goods finger" alt="logo" src="/YORIZORI/img/goodsicon.png" onclick="location.href='<%request.getContextPath();%>/YORIZORI/goods.do?command=goodslist'">
            <img class="map finger" alt="logo" src="/YORIZORI/img/mapicon.png" onclick = "location.href = '<%request.getContextPath();%>/YORIZORI/view/map/map.jsp'">
        </nav>
        
        <!-- <input type="button" value="checking....." id="authBtn"> -->
</body>
</html>