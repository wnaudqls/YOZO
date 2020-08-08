<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
}
</script>

<div class="slideshow-container">

					<!-- Modal content -->
					<div class="modal-content" style="text-align: center; width:1159px; height:100%; margin:0; padding:0; position: re">
		
						<div class="slideshow-container" style="text-align: center; width:1159px; height:430px; margin:0 auto; padding:0;">
							<c:forEach items="${detail }" var="content" varStatus="status">
								<div class="mySlides fade">
									<div class="numbertext">${status.index+1}/${fn:length(detail) }</div>
									<img src="/YORIZORI/img/recipe/speaker4.png" alt="ㄴㄴ" style="width: 1050px; height: 330px;">
									<div class="text" style="width: 100%; height: 80px;">${content}</div>
								</div>
							</c:forEach>

						
						</div>

					</div>

			<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
			<a class="next" onclick="plusSlides(1)">&#10095;</a>

</div>
<br>
<!-- 
<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
</div> -->



