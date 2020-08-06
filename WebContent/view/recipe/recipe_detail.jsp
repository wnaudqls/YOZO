<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html charset=UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function voice_service() {
		window.open("/YORIZORI/view/recipe/moda.jsp", "레시피 읽어주기!",
				"width=1500, height=1080, left=100, top=0")
	}
</script>

<style type="text/css">
/* div{
border : 1px solid black;
} */
/*상단부*/
.section_top {
	margin-top: 5%;
	height: 550px;
	margin: 0 5%;
}

.section_bottom {
	margin-top: 5%;
	text-align: center;
}

.main_img_wrap {
	width: 500px;
	height: 500px;
	display: inline-block;
	margin-left: 100px;
	float: left;
	margin-block-start: 0.83em;
}

.main_img {
	width: 400px;
	height: 400px;
}

.recipe_info {
	width: 500px;
	height: 150px;
	text-align: left;
}

.recipe_material {
	width: 500px;
	height: 280px;
	display: inline-block;
	text-align: left;
}

.recipe_wrap_top {
	display: inline-block;
	width: 502 px;
	height: 510px;
}

.material_list {
	height: 200px;
	overflow: auto;
	border: 1px solid black;
	line-height: 1.5em;
}

.recipe_image_wrap {
	border: 1px solid black;
	display: inline-block;
	height: 300px;
	width: 80%;
}

.speech_wrap {
	margin-top: 30px;
	height: 50px;
	position: relative;
	width: 300px;
}
/*음성제어 버튼*/
.speech_button {
	height: 50px;
	position: relative;
	width: 300px;
	border: 1px solid black;
	background-color: #F5A9A9;
	color: #FAFAFA;
}
/*음성제어 스피커아이콘*/
.speech_icon {
	width: 40px;
	height: 40px;
	position: relative;
	left: -7px;
	top: 0px;
}
/*음성제어버튼 텍스트*/
.speech_text {
	/* display:inline-block */
	font: small-caps bold 24px/1 sans-serif;
	position: relative;
	top: 5px;
}

.recipe_content {
	display: inline-block;
	width: 80%;
	height:80%;
	margin: 15px 0;
	text-align: center;
	font: small-caps 18px/1 sans-serif;
}

.recipe_content span {
	line-height: 1.5em;
}

   /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 30%; /* Could be more or less, depending on screen size */                          
        }
        
        
/*------------------------------------------------------------*/
		* {box-sizing: border-box}
body {font-family: Verdana, sans-serif; margin:0}
.mySlides {display: none}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  /* max-width: 1000px; */
  position: relative;
  margin: auto;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: black;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
}
.prev{
	left:0;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

/* Caption text */
.text {
  color: black;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
  vertical-align: bottom;
}

/* Number text (1/3 etc) */
.numbertext {
  color: black;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
}

/*------------------------------------------------------------*/

</style>
<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

	var i = 0;
	var j=0;
	// while 문으로 TextToSpeech가 SpeechToText를 감싼다 두 함수 모두 recipe_step이 끝날때까지 도는데 와일문안에 SpeechToText문의 value값을 if문으로 멈춰 || 정지 || 스탑 || , 재생||시작|| 등, 반복||다시||...,이전||전에꺼||전꺼||등..., 다음||다음꺼||담꺼||...,
	//if문이 끝나면 다시 while문이 돌면서 recipe_step부분을 끝낸다. 끝내고 난뒤에는 다시 재생할까요? 를 TextToSpeech를 통해서 출력하고 그에 대한 답이 아니야||됐어||꺼져||괜찮아||면 함수를 종료하고 응||그래||다시||한번더 면 while문을 다시돌린다.
	//하나하나 씩 speech값을 받아서 넘어간다
	function TextToSpeech(s) {
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
		speech.rate = 0.9;
		/*읽어주는 음의 높낮이 1 ~ 100*/
		speech.pitch =1;
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
//			alert("음성인식 실행됨?")
			action.innerHTML = "<small>듣고 있어요...</small>";
		};
		// 음성인식이 끝나고 실행됨
		recognition.onspeechend = function() {
//			alert("음성인식 끝남?");
			action.innerHTML = "<small>더 말하시려면 버튼을 눌러주세요...</small>";
			recognition.stop();
		}

		//계속대기 할 수 있는걸 찾아야되고
		// 음성인식 결과를 반환할 때 사용된다.
		
		alert("음성인식 시작합니다~");
		recognition.onresult = function(event) {
			//음성을 text 로 변환된 값
			var transcript = event.results[i][0].transcript;
			/* TextToSpeech(transcript); */
			i=i+1;
//			alert(i);
//			alert(transcript);
			/* if(transcript=="다음"){
				var txt=document.querySelectorAll('.text');
				j++;
				alert(txt[j].innerText);
				TextToSpeech(txt[j].innerText);
				plusSlides(+1);
				i++;
				
			}else if(transcript=="이전"){
				var txt=document.querySelectorAll('.text');
				j--;
				alert(txt[j].innerText);
				TextToSpeech(txt[j].innerText);
				plusSlides(-1)
				i++;
			}else if(transcript=="다시"){
				var txt=document.querySelectorAll('.text');
				alert(txt[j].innerText);
				TextToSpeech(txt[j].innerText);
				i++;
			}else if(transcript=="그만할래"){
				TextToSpeech('안녕히가세요~');
				return 0;
			}else{
				
				TextToSpeech('똑바로 다시 말해주세요...');
				i++;
			} */
			if(transcript.trim()=="다음"){
				var txt=document.querySelectorAll('.text');
				j++;
//				alert(txt[j].innerText);
				//recognition.pause();
				//recognition.resume();
				plusSlides(+1);
				recognition.stop();
				TextToSpeech(txt[j].innerText);
				//recognition.getVoices();
				//recognition.start();
				SpeechToText();
				
			}else if(transcript.trim()=="이전"){
				var txt=document.querySelectorAll('.text');
				j--;
//				alert(txt[j].innerText);
				//recognition.onpause();
				plusSlides(-1)
				recognition.stop();
				TextToSpeech(txt[j].innerText);
				//recognition.onresume();
				//recognition.start();
				SpeechToText();
			}else if(transcript.trim()=="다시"){
				var txt=document.querySelectorAll('.text');
//				alert(txt[j].innerText);
				//recognition.onpause();
				recognition.stop();
				TextToSpeech(txt[j].innerText);
				//recognition.start();
				//recognition.onresume();
				SpeechToText();
				
			}else if(transcript.trim()=="그만"){
				TextToSpeech('안녕히가세요~');
				recognition.stop();
				close_pop();
			}else{
				//recognition.pause();
	 			recognition.stop();
				TextToSpeech('똑바로 다시 말해주세요...');
				//recognition.start(); 
				//recognition.resume();
				SpeechToText();
//				alert("다시말해주세요")
			}
			/* //변환된 text의 정확도
			var confidence = event.results[0][0].confidence;

			output.innerHTML = "<b>Text:</b> " + transcript
					+ "<br/> <b>Confidence:</b> " + confidence * 100 + "%";
			output.classList.remove("hide");
			alert(transcript.length);
			alert(i)
			i++ */
		};

		// 음성인식 시작
		recognition.start();
		//alert("음성인식시작?")
	}
	
</script>

</head>
<body>

	<%@ include file="../../form/header.jsp"%>
	<!-- 레시피 정보 -->

	<div class="section_top">
		<div class="main_img_wrap">
			<img class="main_img" alt="title_img" src="${dto.recipe_main_photo }">
		</div>
		<div class="recipe_wrap_top">
			<div class="recipe_info">
				<h2>${dto.recipe_title }</h2>
				<p>
					<b>작성자 : </b>${dto.member_id }
				</p>
				<p>
					<b>종류 : </b>${dto.recipe_kind }</p>
				<p>
					<b>테마 : </b>${dto.recipe_theme }</p>
			</div>
			<div class="speech_wrap">
				<!-- 음성 인식 -->
				<!-- 				<button type="button" onclick="voice_service()"  class="speech_button" id="myModal" > -->
				<button type="button" class="speech_button" onclick="window_show()">
					<img class="speech_icon" src="/YORIZORI/img/recipe/speaker4.png" />
					<span class="speech_text">음성제어 시작하기</span>
				</button>
				
				
				 <!-- The Modal -->
			    <div id="myModal" class="modal" style="width:100%; height:100%; ">
			 
			      <!-- Modal content -->
			      <div class="modal-content" style="width:80%; height:80%; margin:10% 10%; position:relative;">
			      
			      
			       <!--          <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">공지</span></b></span></p>
			                <p style="text-align: center; line-height: 1.5;"><br />여기에 내용</p> -->
			                <%@ include file="/view/recipe/modal.jsp"%>
			                
			                
			                
			            <div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop();">
			                <span class="pop_bt" style="font-size: 13pt;" >닫기         </span>
			            </div>
			      </div>
			 
			    </div>
        <!--End Modal-->





					<script type="text/javascript">
						/*   jQuery(document).ready(function() {
						          $('#myModal').show();
						  }); */
						  //처음 음성인식 시작 버튼을 눌렀을 때 실행
						function window_show() {
							$('#myModal').show();
							//TextToSpeech("어서오세요 준비되시면 다음을 외쳐주세요");
							alert("어서오세요 준비되시면 다음을 외쳐주세요!!")
							//showSlides(1);
							SpeechToText();//STT실행
							
						}
						//팝업창에서 닫기 버튼을 눌렀을 때
						function close_pop(flag) {
							recognition.stop();
							$('#myModal').hide();
						};
					</script>


				</div>
				<div class="recipe_material">
					<h2>재료</h2>
					<ul class="material_list">
						<c:forEach items="${material }" var="m" varStatus="status">
							<li>${m }</li>
						</c:forEach>
					</ul>
				</div>
			</div>

		</div>
		<div class="section_bottom">

			<h2>레시피</h2>
			<c:forEach items="${detail }" var="content" varStatus="status">
				<!-- 전체레시피 -->
				<div class="recipe_wrap_bottom">
					<!-- 단계별 레시피 이미지 -->
					<div class="recipe_image_wrap">
						<img alt="레시피${status.index }" src="">
					</div>
					<!-- 단계별 래시피 글 -->
					<div class="recipe_content">
						<span>${content}</span>
					</div>
				</div>

			</c:forEach>
		</div>



		<%@ include file="../../form/footer.jsp"%>
</body>


</html>












