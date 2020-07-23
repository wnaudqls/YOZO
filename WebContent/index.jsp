<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
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
        margin-left: 20px;
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
    footer {
           position: relative;
           width: 100%;
           margin-top: 0px;
           border-top: 1px solid black;
           background-color: white;
    } 
    #info {
        text-align: center;
    }
    video{
        right: 0; bottom: 0;
        min-width: 100%; min-height: 100%;
        width: auto; height: auto; z-index: -100;
        background: url(polina.jpg) no-repeat;
        background-size: cover;

    }
    .search {
        width: 36%;
        height: 40px;
        margin: 10px auto;
        min-width: 100%;
        position: absolute;
        margin-top: 17%;
        z-index: 1;
    }
    [name="search"]{
        width: 500px;
        height: 50px;
        font-size: 30px;
    }
    .btn{
        height: 50px;
        line-height: 56px;
        background-color : #F5A9A9;
        color : #FAFAFA;
        
    }
    
    .search img {
        width: 70px;
        height: 50px;
        border-right: 1px solid #c2c2c2;
        border-top: 1px solid #c2c2c2;
        border-bottom: 1px solid #c2c2c2;
        cursor: pointer;
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
</style>
<script type="text/javascript" src="../resouces/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
	    $("#playBtn").on("click", function() {
	       $("#myVideo").trigger("play");
	       });
    });
	$(document).ready(function() {		
		$("#fullBtn").on("click", function() {
	    var elem = document.getElementById("myVideo");
	        if(elem.requestFullscreen) {
	            elem.requestFullscreen();
	        } else if(elem.mozRequestFullScreen) {
	            elem.mozRequestFullScreen();
	        } else if (elem.webkitRequestFullscreen) {
		        elem.webkitRequestFullscreen();
	        } else if (elem.msRequestFullscreen) {
	            elem.msRequestFullscreen();
	        }
	    });
	});
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

</script>
</head>
<%@ include file="../../form/header.jsp" %>
<body>
<!--  지우는 거 자제해달라..싫어 --> 
<!-- 입벌려 빅맵들어갑니다 -->

	<!-- <header id= header>
        <img class="mainlogo" alt="logo" src="img/mainicon.png">
        <div class = "dropuserdown">
            <img onclick = "dropuser()" class="usericon"alt="logo" src="img/usericon.png">
            <div id="dropuser_content" class = "dropuser_content">
                <a href="">개인정보수정</a>
                <a href="">나의레시피</a>
                <a href="">장바구니</a>
                <a href="">우리집냉장고</a>
            </div>
           </div>
    </header>      
         <nav id="icon">
            <img class="recipe" alt="logo" src="img/recipebookicon.png">
            <div class = "dropstreamdown">
                <img onclick = "dropstream()" class="stream"alt="logo" src="img/broadcasticon.png">
                <div id="dropstream_content" class = "dropstream_content">
                    <a href="">방송하기</a>
                    <a href="">시청하기</a>
                    <a href="">예약하기</a>
                </div>
            </div>
            <img class="goods" alt="logo" src="img/goodsicon.png">
            <img class="map" alt="logo" src="img/mapicon.png">
        </nav> -->
   <body id = body>
    <div class="search">
        <input type="search" name="search" placeholder="레시피 검색">
        <button class="btn">검색</button>
        
    </div>
    <video oncontextmenu="return false;" id="myVideo" height = "600"width="100%" autoplay muted loop poster="img/캡파이리.jpg">
        <source src="img/main_video.mp4" type="video/mp4">
    </video>
     <body id = body>
       <section class ="maincontent1">
            <img class="mainlogo" alt="logo" src="/picture/mainicon.png">
       </section>
       <section>
      
       </section>
    </body>
    
     <!-- <footer>
       <div id="info">
          <b>CREATORS</b> <br>
          이현승 : https://github.com/LHSEUNGG   <br>
          최유정 : https://github.com/LIEBEALLES   <br>
          박진석 : https://github.com/parkjin1407   <br>
          주명빈 : https://github.com/wnaudqls   <br>
          이병욱 : https://github.com/rpget2020   <br>
          성현모 : https://github.com/shm1113   <br>
          <br>
          KH정보교육원 &copy; all rights reserved ...
          <br>
       </div>
    </footer> -->
  
</body>
<%@ include file="../../form/footer.jsp" %>
</html>