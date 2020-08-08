<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YoriZori</title>
<style type="text/css">
	 body {
        margin:0;
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
        /* background: url(polina.jpg) no-repeat; */
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
<!-- <script type="text/javascript" src="../resouces/js/jquery-3.5.1.min.js"></script> -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
function jsp_go(f){
	f.action = "recipe.do"
	f.submit
}
</script>
</head>
<body>
<%@ include file="/form/header.jsp" %>
<div class="search">
		<form  action="/YORIZORI/recipe.do" method="post">
			<input type="hidden" name="command" value="recipe_search">
			<input type="text" placeholder ="레시피 검색" id="recipe_search" name = "recipe_title">
			<input type="submit" value="검색" class="btn">
		</form>
</div>		
    <video oncontextmenu="return false;" id="myVideo" height = "600"width="100%" autoplay muted loop ">
        <source src="<%=request.getContextPath()%>/img/main/main_video.mp4" type="video/mp4">
    </video>
  <%@ include file="/form/footer.jsp" %>
</body>

</html>