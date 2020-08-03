<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<style type="text/css">


.container{
	text-align: left;
}
#test{
	border: 1px solid red;
}
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

	<!-- 댓글창  -->
	<section>
		<div class="container">
			<form method="post" id="answerform" name="answerform">
				<input type="hidden" name="goods_no" value="${dto.goods_no}" />
				<input type="hidden" name="member_nick" value="${rdto.member_nick}" />
				<div>
					<div>
						<span><strong>Comments</strong></span>
					</div>
					<div>
						<table>
							<tr>
								<td><label>${rdto.member_nick}</label> <textarea rows="3"
										cols="30" name="goods_re_content" id="comment"
										placeholder="Q&A"></textarea> <br>
									<div>
										<input type="button" value="등록" onclick="answer();" />
									</div></td>
							</tr>
						</table>
					</div>
				</div>
			</form>
		</div>
		<hr>
		<div class="container">
			<form id="answerlistform" name="answerlistform" method="post">
				<div id="answerlist"></div>
				<div id="test">태그생성테스트
				<input type="button" value="test" onclick="test();"/>
				</div>
				
				
			</form>
		</div>


		<script type="text/javascript">
		/* 댓글 등록하기(ajax)  */
	
			/* var params = $("#answerform").serialize(); 이렇게 하면 안돼 */
		function answer(){
			$.ajax({
				type : 'post',
				url : "<c:url value='/goods.do?command=answerinsert'/>",
				data : $("#answerform").serialize(),
				success : function(data){
						alert("통신성공")
						getAnswerList();
						document.getElementById("comment").value=" ";
						
				},
				error : function(request,status,error){
						alert("통신실패")
				}
			});
		}
		
		/* 초기 페이지 로딩시 댓글 불러오기 */
	$(function(){
			getAnswerList();
			
		}); 
		
		function getAnswerList(){
			$.ajax({
				type:'POST',
				url : "<c:url value='/goods.do?command=answerlist&goods_no=${dto.goods_no}'/>",
				data :  $("#answerform").serialize(),
				contentType : "JSON",
				contentType : "charset=UTF-8",
				success : function(data){
					var result=JSON.parse(data)
					/* alert(result[0].goods_re_content+"뭐지이거"); */
					
					var ele ="";
					var cCnt = result.length;
					/* alert(cCnt); */
		
					
					if(cCnt > 0){
						for(i = 0; i<cCnt; i++){
							ele += "<div id='divdiv'>";
							ele += "<div id='rereplybox'>";
							ele +="<strong>"+result[i].member_nick+"</strong>";
							ele += result[i].goods_re_content + "<input type='button' value='댓글' class='rebtn' onclick='rereply();'>";
							ele += "</div>";
							ele += "</div>";
							
						}
						
					}else {
						ele += "<div>"
						ele += "<div><table>" +"등록된 댓글이 없습니다.";
						ele += "</table></div>";
						ele += "</div>";
						
					}
					/* $("#cCnt").html(cCnt); */
					$("#answerlist").html(ele);
					console.log("ele : " + ele);
				
					
					/* alert("html : " + html); */
					
					
				},
				error : function(request, status, error){
					alert("goods_answer.jsp에서 댓글 불러오기 실패");
				
					 
				}
				
		
			});
		}
		
	 	function rereply(){
	 
		
		}
		
		
		function test(){
			alert("test입니다");
			var str = "<div>하</div>";
			
			$("#test").css("background-color", "blue");
		}
		
		
		</script>

	</section>


</body>
</html>