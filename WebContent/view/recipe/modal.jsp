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


<div class="slideshow-container">

		<!-- Modal content -->
		<div class="modal-content" style="text-align: center; width:1159px; height:100%; margin:0; padding:0; position: relative;">
		
					<div class="slideshow-container" style="text-align: center; width:1159px; height:490px; margin:0 auto; padding:0; position: relative;">
								<div class="mySlides fade" style="position: relative; display: block;">
								<c:set target="${detail}" var="d" />

								<div class="numbertext" >
									1/${fn:length(d) }
								</div>
									<!-- <img src="/YORIZORI/img/recipe/speaker4.png" alt="recipe_img" style="width: 1050px; height: 330px;"> -->
									<div class="text" style="width: 30%;height: 124px;position: absolute;margin-top: 160px;left: 36%;top: 18px;">
											<b>----명령어----</b><br>
											<ul>
												<li><b>다음</b> : 다음 순서의 레시피를 읽어줍니다<br></li>
												<li><b>이전</b> : 이전 순서의 레시피를 읽어줍니다<br></li>
												<li><b>다시</b> : 현재 순서의 레시피를 읽어줍니다<br></li>
												<li><b>그만</b> : 음성 안내를 종료합니다<br></li>
												<span style="text-decoration: underline;"><b>※ 명령어를 천천히 말해주세요</b></span>
											</ul>
										<!-- 	<b>다음</b> : 다음 순서의 레시피를 읽어줍니다<br>
											<b>이전</b> : 이전 순서의 레시피를 읽어줍니다<br>
											<b>다시</b> : 현재 순서의 레시피를 읽어줍니다<br> 
										<b>그만</b> : 음성 안내를 종료합니다<br>
											<span style="text-decoration: underline;"><b>※ 명령어를 천천히 말해주세요</b></span> -->
									</div>
								</div>
					 	<c:forEach items="${detail }" var="content" varStatus="status">
								<div class="mySlides fade">
									<div class="numbertext">${status.index+2}/${fn:length(detail) }</div>
									<img src="/YORIZORI/img/recipe/speaker4.png" alt="recipe_img" style="width: 1050px; height: 330px;">
									<div class="text" style="width: 100%; height: 124px;">${content}</div>
								</div>
					</c:forEach> 

					</div>

			<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
			<a class="next" onclick="plusSlides(1)">&#10095;</a>

</div>    
</div>
<script>
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}
function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  alert(slides[0])
  //var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}  //slides가 존재하면 slideIndex는 1  
  if (n < 1) {slideIndex = slides.length}	//끝보다 높으면 1페이지
  for (i = 0; i < slides.length; i++) {	//1보다낮으면  끝페이지
      slides[i].style.display = "none";  
  }
  //for (i = 0; i < dots.length; i++) {
  //    dots[i].className = dots[i].className.replace(" active", "");
 // }
  alert("slideIndex-1:"+ (slideIndex-1));
  alert("slides:"+slides);
  alert(slides[0]);
  slides[slideIndex-1].style.display = "block";  
  //dots[slideIndex-1].className += " active";
}
</script>
<br>
<!-- 
<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
</div> -->



