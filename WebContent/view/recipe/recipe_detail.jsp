<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html charset=UTF-8");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

 function voice_service() {
	window.open("voice_service.jsp","레시피 읽어주기!","width=1300, height=1080, left=100, top=0") 
 }


</script> 

<style type="text/css">
/* div{
border : 1px solid black;
} */
	/*상단부*/
	.section_top{
		margin-top:5%;
		height:550px;
		margin: 0 5%;
	}
	.section_bottom{
		margin-top:5%;
		text-align: center;
	}
	.main_img_wrap{
		width:500px;
		height:500px;
		display: inline-block;
		margin-left:100px;
		float: left;
		margin-block-start: 0.83em;
	}
	.main_img{
		width:500px;
		height:500px;
		
	}
	.recipe_info{
		width:500px;
		height:150px;
		text-align: left;
		}
	.recipe_material{
		width:500px;
		height:280px;
		display: inline-block;
		text-align: left;
	}
	.recipe_wrap_top{
		display:inline-block;
		width:502 px;
		height:510px;
	}
	.material_list{
		height:200px;
		overflow: auto;
		border:1px solid black;
	}
	.recipe_image_wrap{
		border: 1px solid black;
		display:inline-block;
		height:300px;
		width:80%;
	}
	.speech_wrap{
		height:50px;
		position: relative;
		width:300px;
	}
	/*음성제어 버튼*/
	.speech_button{
		height:50px;
		position: relative;
		width:300px;
		border:1px solid black;
		background-color: #F5A9A9;
		color:#FAFAFA;
	}
	/*음성제어 스피커아이콘*/
	.speech_icon{
		width:40px;
		height:40px;
		position:relative;
		left:-7px;
		top:3px;
	}
	/*음성제어 텍스트*/
	.speech_text{
		/* display:inline-block */
		font: small-caps bold 24px/1 sans-serif;
		position: relative;
		top: -8px;
	}
	.recipe_content{
		text-align: center;
		font: small-caps  24px/1 sans-serif;
	}
	
	/* yj */
	.btn{
   width : 70px;
   height : 35px;
   background-color : #F5A9A9;
   color : #FAFAFA;
   border : 0;
   outline: 0;
   border-radius : 0.35em;
   font-weight: bold;
   cursor: pointer;

}
	
</style>
<script type="text/javascript" src="resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	// while 문으로 TextToSpeech가 SpeechToText를 감싼다 두 함수 모두 recipe_step이 끝날때까지 도는데 와일문안에 SpeechToText문의 value값을 if문으로 멈춰 || 정지 || 스탑 || , 재생||시작|| 등, 반복||다시||...,이전||전에꺼||전꺼||등..., 다음||다음꺼||담꺼||...,
	//if문이 끝나면 다시 while문이 돌면서 recipe_step부분을 끝낸다. 끝내고 난뒤에는 다시 재생할까요? 를 TextToSpeech를 통해서 출력하고 그에 대한 답이 아니야||됐어||꺼져||괜찮아||면 함수를 종료하고 응||그래||다시||한번더 면 while문을 다시돌린다.
	//하나하나 씩 speech값을 받아서 넘어간다
	function TextToSpeech(s){
/* 		let msg = document.getElementById("text-to-speech").innerHTML; */
		let msg = s;
		/*Web Speech API의 SpeechSynthesis는 음성 서비스의 컨트롤러 인터페이스로 이를 사용하여 장치에서 사용할 수 있는 합성 음성에 대한 정보를 가져오고, 음성 재생 등의 역할을 수행할 수 있게 해준다.*/
        let speech = new SpeechSynthesisUtterance();
        /*읽어줄 언어*/
        speech.lang = "ko-KR";
        /*id가 text-to-speech인 value값을 담아줌*/
        speech.text = msg;
        
        speech.volume = 100;
        /*재생속도 1 = 정상속도 */
        speech.rate = 1;
        /*읽어주는 음의 높낮이 1 ~ 100*/
        speech.pitch = 100;
        /*읽어준다*/
        window.speechSynthesis.speak(speech);
	}
	
	function SpeechToText() {
        //output의 참조값
        var output = document.getElementById("output");
        // action의 참조값
        var action = document.getElementById("action");
        // 새로운 음성 객체 생성
        var SpeechRecognition = SpeechRecognition || webkitSpeechRecognition;
        var recognition = new SpeechRecognition();
    
        recognition.continuous = true;
        // 음성인식이 실행 될 때 실행됨
        recognition.onstart = function() {
            action.innerHTML = "<small>듣고 있어요...</small>";
        };
        // 음성인식이 끝나고 실행됨
        recognition.onspeechend = function() {
            action.innerHTML = "<small>더 말하시려면 버튼을 눌러주세요...</small>";
            recognition.stop();
        }
        
      //계속대기 할 수 있는걸 찾아야되고
        // 음성인식 결과를 반환할 때 사용된다.
    	  var i=0;
        recognition.onresult = function(event) {
        	//음성을 text 로 변환된 값
            var transcript = event.results[i][0].transcript;
            TextToSpeech(transcript);
            //변환된 text의 정확도
        	var confidence = event.results[0][0].confidence;
            
            output.innerHTML = "<b>Text:</b> " + transcript + "<br/> <b>Confidence:</b> " + confidence*100+"%";
            output.classList.remove("hide");
            alert(transcript.length);
            alert(i)
            i++
        };
      
         // 음성인식 시작
         recognition.start();
    }
	
</script>

</head>
<body>
<%@ include file="../../form/header.jsp" %>
<!-- 레시피 정보 --> 

	<div class="section_top">
		<div class="main_img_wrap">
			<img class="main_img" alt="title_img" src="${dto.recipe_main_photo }">
		</div>
	<div class="recipe_wrap_top">
			<div class="recipe_info">
				<h2>${dto.recipe_title }</h2>
				<p><b>작성자 : </b>${dto.member_id } </p>
				<p><b>종류 : </b>${dto.recipe_kind }</p>
				<p><b>테마 : </b>${dto.recipe_theme }</p>
			</div>
			<div class="speech_wrap">
				<button type="button" onclick="voice_service()" class="speech_button">
				<img class="speech_icon" src="/YORIZORI/img/recipe/speaker4.png"/>
				<span class="speech_text">음성제어 시작하기</span>
				</button>
			</div>
			<div class="recipe_material">
				<h2>재료</h2>
				<ul class="material_list">
				<c:forEach items="${material }" var="m" varStatus="status"><li>${m }</li>  </c:forEach> 
				</ul>
			</div>
			<div>
				<c:if test="${rdto.member_role eq '관리자' }">
					<input class="btn" type="button" value="수정"/>
					<input class="btn" type="button" value="삭제"/>
				</c:if>
			</div>
		</div>

	</div>
	<div class="section_bottom">
	
	<h2>레시피</h2>
	<c:forEach items="${detail }" var="d" varStatus="status">
		<!-- 전체레시피 --> 
		<div class="recipe_wrap_bottom">
			<!-- 단계별 레시피 이미지 -->
			<div class="recipe_image_wrap">
				<img alt="레시피${staktus.index }" src="">
			</div>
			<!-- 단계별 래시피 글 -->
			<div class="recipe_content">
						${d}
			</div>
		</div>
			
	</c:forEach>
	</div>	

<!-- 레시피 순서  -->

	
	<!-- <div class="recipe_order">
		<h3>레시피</h3>
		<img alt="레시피1" src="./img/img04.png">
		<br>
		<span>1. 레시피 순서1</span> 	
	</div>
	<div class="recipe_order">
		<img alt="레시피2" src="./img/img04.png">
		<br>
		<span>1. 레시피 순서2</span>		
	</div>
	<br>
	
	<div class="add_comment">
		<input type="text" id="comment" placeholder="내용을 입력하세요">
		<input type="button" id="add_comment" value="덧글 작성"	>
	</div> -->
	



<%@ include file="../../form/footer.jsp" %>
</body>
</html>












