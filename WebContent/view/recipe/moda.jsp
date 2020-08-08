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
<style type="text/css">
	
	
#modal-container {
  width: 200%;
  /* One Modal --> 100%, Two modals --> 200%*/
  overflow: hidden
}

.modal-dialog {
  float: left;
  width: 50%;
  margin: 10px auto;
}

.modal-content {
  width: 600px;
  margin: 0 auto;
}

</style>

	<script type="text/javascript">
	/* $(document).ready(function(){
	    $("#mybtn").click(function(){
	        $("#myModal").modal();
	    });
	});
 */

	
	$(".btn-next").click(function() {
		  $('#modal-container').animate({
		    'margin-left': '-=100%'
		  }, 500);
		});

		$(".btn-back").click(function() {
		  $('#modal-container').animate({
		    'margin-left': '+=100%'
		  }, 500);
		});
	</script>
</head>
<body>
<div class="container">
  <div class="row">
    <div class="col-md-6">
      <button type="button" id="mybtn" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
        Launch demo modal
      </button>
    </div>
  </div>
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div id="modal-container">
  <c:forEach items="${detail }" var="d" varStatus="status">
  
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
          <h4 class="modal-title" id="myModalLabel">Modal title</h4>
        </div>
        <div class="modal-body">
          This is Content 1
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button type="next" class="btn btn-primary btn-next">Move Next</button>
        </div>
      </div>
    </div>
        </c:forEach>
     </div>
	</div>
    
<%-- <div class="section_bottom">
	
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
						<span>${d}</span>
			</div>
		</div>
			
	</c:forEach>
	</div>	 --%>
<!--      <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
          <h4 class="modal-title" id="myModalLabel">Modal title 2</h4>
        </div>
        <div class="modal-body">
          This is Content 2
        </div>
        <div class="modal-footer">
          <button type="back" class="btn btn-primary btn-back">Move Back</button>
          <button type="next" class="btn btn-primary btn-next">Move Next</button>
        </div>
      </div>
    </div> --> 
 


</body>
</html>