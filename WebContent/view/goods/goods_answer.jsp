<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.container {
	text-align: left;
}
#comment{
	resize: none;
	width:60%;
}
.btn_reply{
	height:34px;
}
.container_bottom{
	text-align: left;
}
.reply_wrap{
	height:34px;
}
</style>
</head>
<body>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

	<!-- 댓글창  -->
	<section>
		<div class="container_top">
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
								<td>
									<div class="replay_wrap">
									<label>${rdto.member_nick}</label> 
									<textarea rows="2"
											cols="30" name="goods_re_content" id="comment"
											placeholder="Q&A">
									</textarea>
										<input class="btn_reply" type="button" value="등록" onclick="answer();" />
									</div>
								</td>
							</tr>
						</table>
					</div>
					
				</div>
			</form>
		</div>
		<hr>
		<div class="container_bottom">
			<form id="answerlistform" name="answerlistform" method="post">
					<input type="hidden" name="member_nick" value="${rdto.member_nick }">
					<div id="answerlist">
					</div>
			</form>
		</div>


		<script type="text/javascript">
			/* 댓글 등록하기(ajax)  */

			/* var params = $("#answerform").serialize(); 이렇게 하면 안돼 */
			//일반댓글등록
			function answer() {
				$.ajax({
					type : 'post',
					url : "<c:url value='/goods.do?command=answerinsert'/>",
					data : $("#answerform").serialize(),
					success : function(data) {
						alert("통신성공")
						getAnswerList();	//리스트 가져오기 메소드
						document.getElementById("comment").value = " ";

					},
					error : function(request, status, error) {
						alert("통신실패")
					}
				});
			}

			/* 초기 페이지 로딩시 댓글 불러오기 */
			$(function() {
				getAnswerList();	

			});

			function getAnswerList() {

				
						$.ajax({
							type : 'POST',
							url : "<c:url value='/goods.do?command=answerlist&goods_no=${dto.goods_no}'/>",
							data : $("#answerform").serialize(),
							contentType : "JSON",
							contentType : "charset=UTF-8",
							success : function(data) {
								var result = JSON.parse(data)
								/* alert(result[0].goods_re_content+"뭐지이거"); */

								var ele = "";
								var cCnt = result.length;
								/* alert(cCnt); */

								if (cCnt > 0) {
									for (i = 0; i < cCnt; i++) {
										ele += "<div id='divdiv'>";
										ele += "<div class='rereplybox' value="+result[i].goods_re_no+">";
										ele += "<strong>";
											if(result[i].goods_re_titletab>0){
												for(var j=0;j<result[i].goods_re_titletab;j++){
													ele+="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
												}
													ele+="┗&nbsp;";
											}
												ele+= result[i].member_nick + " : </strong>";
										ele += result[i].goods_re_content
												+ "<input type='button' value='댓글' class='rebtn' onclick='rereply("
												+ i + ");'>";
										ele += "</div>";
										ele += "</div>";

									}

								} else {
									ele += "<div>"
									ele += "<div><table>" + "등록된 댓글이 없습니다.";
									ele += "</table></div>";
									ele += "</div>";

								}
								/* $("#cCnt").html(cCnt); */
								$("#answerlist").html(ele);
								/* console.log("ele : " + ele); */

								/* alert("html : " + html); */

							},
							error : function(request, status, error) {
								alert("goods_answer.jsp에서 댓글 불러오기 실패");

							}

						});
			}
			//대댓글, i는 몇번쨰 댓글인지
			function rereply(i) {
			alert("rereply(i):"+i)
				/* alert("rereply실행!") */
				/* 	 		var div1 = document.getElementsByClassName(".rereplybox");
				 alert(div);
				 var str = "<div>하</div>";
				
				 for(var div in div){
				 document.write(div + "번째 문단 : " + div1[div].firstChild.nodeValue + "<br>");
				 */

				/* 			var tag = document.createElement("div");
							var text = document.createTextNode("테스트중");

							tag.appendChild(text);

							var div = document.getElementById("rereplybox");
							
							div.insertBefore(tag, div.childNodes[1]);
				 */

				/* var str = "<textarea></textarea>"; */

				//디브 , 텍스트에어리어 생성
			
				var newDiv = document.createElement("div");
				newDiv.className = 'adminre';
				var txt = document.createTextNode("ㄴ관리자 ");
				var newTextarea = document.createElement("textarea");
				newTextarea.setAttribute("name", "goods_re_content");
				
				newDiv.appendChild(txt);
				newDiv.appendChild(newTextarea);

				/* console.log(newDiv); */

				//버튼 만들어주기 -> value값 까지 같이 주기
				var newButton = document.createElement('button');
				var text = document.createTextNode("등록");
				newButton.appendChild(text);

				newDiv.appendChild(newButton);

				var plz = document.getElementsByClassName("rereplybox")[i];
				/* alert(i); */
				alert(plz.childNodes[3]+"[3]??");//undefind[3]??
				$(".rereplybox")[i].insertBefore(newDiv, plz.childNodes[3]);//왜3이지??
				//이벤트 생성
				newButton
						.addEventListener(
								'click',
								function(event) {
									alert("관리자버튼얍얍");
									alert("i : " + i); // 0 , 1 잘 들어옴
									alert("evenet? :"+event);

									/* var greno = document.getElementsByClassName("rereplybox")[i].val; */
									/* var greno = $(".rereplybox")[i].val(); */
							/* 		var greno = $(this).parent(".rereplybox")
							
											.get(i).val(); */
									/* var greno = document.getElementsByClassName("rereplybox").value; */
									var greno = $(this).parent().parent().attr("value");	//부모댓글의 번호 
									/* console.log(greno);
									console.log("this : " + this);
 */
									alert("greno :" + greno); //부모 댓글 번호 
 											//여기 다시보기
 										alert("i:"+i);
										var content = document.getElementsByName("goods_re_content")[1].value; //1번지 textarea의 값을 content에 저장?
										alert(" 1번지 textarea의 값  content :" + content);
										console.log(content);
											$.ajax({
												type : 'post',
												url : "<c:url value='/goods.do'/>",
												data : {'goods_re_content' : content,
														'command' : 'goodsadminre',
														'greno' :greno},
												dataType : "json",
												success : function(data) {
													alert("관리자댓글 : 통신성공")
												},
												error : function(request,
														status, error) {
													alert("관리자댓글 : 통신실패");
													/* console.log("greno"); */
													
												}
											});

								});
			};
		</script>

	</section>


</body>
</html>


