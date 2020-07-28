<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<body>
<header id= header>
        <img class="mainlogo" alt="logo" src="/picture/mainicon.png">
        <div class = "dropuserdown">
            <img onclick = "dropuser()" class="usericon"alt="logo" src="../img/usericon.png">
            <div id="dropuser_content" class = "dropuser_content">
                <a href="">개인정보수정</a>
                <a href="">나의레시피</a>
                <a href="">장바구니</a>
                <a href="">우리집냉장고</a>
            </div>
        </div>
    </header>      
         <nav id="icon">
            <img class="recipe" alt="logo" src="/picture/recipebookicon.png">
            <div class = "dropstreamdown">
                <img onclick = "dropstream()" class="stream"alt="logo" src="/picture/broadcasticon.png">
                <div id="dropstream_content" class = "dropstream_content">
                    <a href="">방송하기</a>
                    <a href="">시청하기</a>
                    <a href="">예약하기</a>
                </div>
            </div>
            <img class="goods" alt="logo" src="/picture/goodsicon.png">
            <img class="map" alt="logo" src="/picture/mapicon.png">
        </nav>
</body>
</html>