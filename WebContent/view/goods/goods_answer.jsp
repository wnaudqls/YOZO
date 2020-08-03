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

<!-- 댓글창  -->
<section>
		<div class="container">
			<form method="post" id="answerform" name="answerform">
			<input type="hidden" name="goods_no" value="${dto.goods_no}"/>
				<div>
					<div>
						<span><strong>Comments</strong></span>
					</div>
					<div>
						<table>
							<tr>
								<td>
									<label>${rdto.member_nick}</label>
									<textarea rows="3" cols="30" name="goods_re_content" id="comment" placeholder="Q&A"></textarea>
									<br>
									<div>
										<input type="button" value="등록" onclick="answer();"/>
									</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
				
			</form>
		</div>
		<div class="container">
			<form id="answerlistform" name="answerlistform" method="post">
				<div id="answerlist">
				</div>
			</form>
		</div>
		
		
		<script type="text/javascript">
		/* 댓글 등록하기(ajax)  */
	
		function answer(){
			var params = $("#answerform").serialize();
			$.ajax({
				type : 'post',
/* 				url : "<c:url value='/goods.do?command=answerinsert'/>", */
				url : "<c:url value='/goods.do?command=answerinsert'/>",
				data : params,
				success : function(data{
						alert("통신성공")
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
				url : "<c:url value='/goods.do?command=answerlist>",
				dataType : "json",
				data : $("#answerform").serializ`e(),
				contentType : "charset=UTF-8",
				success : function(data){
					console.log(data);
					var html = "";
					var cCnt = data.length;
					
					if(data.length > 0){
						for(i = 0; i<data.lenght; i++){
							html += "<div>";
							html += "<div><table>"+data[i].writer;
							html += data[i].comment + "<tr><td></td></tr>";
							html += "</table><div>";
							html += "</div>";
						}
					}else {
						html += "<div>"
						html += "<div><table>" +"등록된 댓글이 없습니다.";
						html += "</table></div>";
						html += "</div>";
						
					}
					$("#cCnt").html(cCnt);
					$("#answerList").html(html);
				},
				error : function(request, status, error){
					alert("goods_answer.jsp에서 댓글 불러오기 실패")
					
				}
			});
		}
		
		</script>
		
</section>


</body>
</html>