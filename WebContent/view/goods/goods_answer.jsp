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

.delete_font {
	color: gray;
}

#comment {
	resize: none;
	width: 1406px;
	vertical-align: bottom;
}

#recomment {
	resize: none;
	width: 50%;
	vertical-align: bottom;
}

.btn_reply {
	width: 100px;
	height: 30px;
}

.container_bottom {
	text-align: left;
}

.reply_wrap {
	height: 34px;
	width: 100%;
}

.table_answer {
	width: 100%;
}

.table_answer {
	width: 100%;
}

.user_nick {
	font: small-caps bold 18px/1 sans-serif;
	line-height: 0;
}

.answer_insert {
	margin-top: 20px;
	text-align: left;
}

.answer_box_none {
	text-align: center;
}

.answer_box {
	height: 30px;
}

.tag_a {
	font-size: 9px;
}
</style>
</head>x
<body>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<!-- 댓글창  -->
	<section>
		<c:choose>
			<c:when test="${rdto ne null }">
				<div class="container_top">
					<form method="post" id="answerform" name="answerform">
						<input type="hidden" name="goods_no" value="${dto.goods_no}" /> <input
							type="hidden" name="member_nick" value="${rdto.member_nick}" />
						<br>

						<div>
							<div>
								<h2>
									<span><strong>--------------- Comments ( <span
											id="cCnt"></span> ) ---------------
									</strong></span>
								</h2>
							</div>
							<!-- 댓글입력창 -->
							<div class="answer_insert">
								<table class="table_answer">
									<tr>
										<td align="left">
											<!-- <div class="replay_wrap"> --> <label class="user_nick">${rdto.member_nick}
												: </label> <textarea rows="2" cols="30" name="goods_re_content"
												id="comment" placeholder="댓글을 입력하세요."></textarea>
										</td>
									</tr>
									<tr>
										<td align="right"><input class="btn_reply" type="button"
											value="등록" onclick="answer();" /></td>
									</tr>
								</table>
							</div>
						</div>
					</form>
				</div>
				<hr>
				<!-- 댓글 리스트 가져오는 전체 테두리  -->
				<div class="container_bottom">
					<form id="answerlistform" name="answerlistform" method="post">
						<input type="hidden" name="member_nick"
							value="${rdto.member_nick }">

						<!--댓글들 집어넣을곳  -->
						<div id="answerlist"></div>
					</form>
				</div>
			</c:when>
			<c:otherwise>
				<h2>----------댓글은 회원만 작성가능합니다----------</h2>
			</c:otherwise>
		</c:choose>
	</section>
	<script type="text/javascript">
      /* 댓글 등록하기(ajax)  */

      //일반댓글등록
      function answer() {
         $.ajax({
            type : 'post',
            url : "<c:url value='/goods.do?command=answerinsert'/>",
            //직렬화한 form 데이터를 담아서 요청을 보낸다 
            data : $("#answerform").serialize(),
            success : function(data) {
			
               alert("댓글을 성공적으로 등록하였습니다.")
               document.getElementById("comment").value = " ";
               getAnswerList();

            },
            error : function(request, status, error) {
               alert("댓글을 등록하는데 실패하였습니다. 다시 시도하여주십시오.")
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
                     if (cCnt > 0 ) {
                        for (i = 0; i < cCnt; i++) {
                        	
                     var str=result[i].member_nick;
                     var state=result[i].goods_re_state;
                     
                     if(state=="N"){
                           ele += "<div class='rereplybox' value="+result[i].goods_re_no+"><table class='table'>";
                           ele +="<tr><td>";
                           for(var j=0; j< result[i].goods_re_titletab;j++){
                        	ele +="&emsp;&emsp;"            	  
                        	};
                           ele += "┗ <strong>"+ result[i].member_nick + " : </strong>";
                           ele += result[i].goods_re_content+"  <a href='' onclick='rereply("+ i +"); return false;' class='tag_a'>댓글</a>"
                            if("${rdto.member_nick}"==str){
									ele+=" <a href='' onclick='replydelete("+ result[i].goods_re_no +"); return false;' class='tag_a'>삭제</a>"
                            }  
                           ele += "</td></tr></table></div>";
                        }
                     else{
                         ele += "<div class='rereplybox' value="+result[i].goods_re_no+"><table class='table'>";
                         ele +="<tr><td>";
                         for(var j=0; j<result[i].goods_re_titletab;j++){
                      	ele +="&emsp;&emsp;"            	  
                      	};
                         ele += "┗ <strong>"+ result[i].member_nick + " : </strong>";
                         ele +="<span class='delete_font'>삭제된 댓글입니다.</span>"
                         ele += "</td></tr></table></div>"; 
                     }
                        }
                     }
                     else {
                        ele += "<div class='answer_box_none'>" + "등록된 댓글이 없습니다.";
                        ele += "</div>";
                     }
                     $("#cCnt").html(cCnt); 
                     $("#answerlist").html(ele);
                  },
                  error : function(request, status, error) {
                     alert("goods_answer.jsp에서 댓글 불러오기 실패");
                  }
               });
      }
      function replydelete(i){
    	   $.ajax({
               type : 'post',
               url : "<c:url value='/goods.do?command=answerdelete'/>",
               data : {'goods_re_no': i},
               success : function(data) {
   			
                  alert("댓글을 성공적으로 삭제하였습니다.")
                  getAnswerList();
               },
               error : function(request, status, error) {
                  alert("댓글을 등록하는데 실패하였습니다. 다시 시도하여주십시오.")
               }
            });
      }
      
      //대댓글, i는 몇번쨰 댓글인지
      function rereply(i) {
         var newDiv=0;
         //디브 , 텍스트에어리어 생성
         if($(".adminre").length==0){		//newdiv가 없을경우 
         newDiv = document.createElement("div");
         //class 속성값을 가져오거나 설정할 수 있다.
         newDiv.className = 'adminre';
         //textnode를 생성한다
         var txt = document.createTextNode("");
         //textarea을 생성한다
         var newTextarea = document.createElement("textarea");
         //textarea의 name 속성을 goods_re_content로 설정헤준다
         newTextarea.setAttribute("name", "goods_re_content");
         newTextarea.setAttribute("rows", "2");
         newTextarea.setAttribute("cols", "30");
         newTextarea.setAttribute("id", "recomment");
         newTextarea.setAttribute("placeholder", "댓글을 입력하세요.");

         //div에 textnode와 textarea태그를 추가한다
         newDiv.appendChild(txt);
         newDiv.appendChild(newTextarea);
		 
         //버튼 만들어주기 -> value값 까지 같이 주기
         var newButton = document.createElement('button');
         newButton.setAttribute("id","rereply_btn");
         newButton.setAttribute("type","button");
         var text = document.createTextNode("등록");
         newButton.appendChild(text);
         newDiv.appendChild(newButton);
         }else{
        	newDiv=document.querySelector(".adminre");
         }
		 //댓글을 달아줄 div를 가져온다 
         var plz = document.getElementsByClassName("rereplybox")[i];
		 	
		 //삽입하려는인자 : newDiv 삽입 기준이 되는 노드 : plz.childNodes[3] 새 노드는 이 앞에 온다
		 //insertBefore는 삽입할 노드의 부모 객체가 될 노드에서 실행된다
		 //두번째 인자는 이 부모 노드의 자식 노드여야 한다 
		 //두번째 인자가 null이면 insertBefore()는 appendChild()처럼 작동하여 자식 노드의 끝에 삽입된다
		 //rereplybox[i]의 자식으로  newDiv가  삽입되는데 이미 newDiv가 존재하면 위치만 변경된다 
         $(".rereplybox")[i].insertBefore(newDiv, plz.childNodes[1]);
        
       //이벤트 생성
         $("#rereply_btn")[0].addEventListener('click',
       		 function(event){
					   //부모 댓글 번호
                       var greno = $(this).parent().parent().attr("value");
                       //대댓글 내용
                       var content = document.getElementById("recomment").value; 
                       
                       $.ajax({
                          type : 'post',
                          url : "<c:url value='/goods.do'/>",
                          data : {
                             'goods_re_content' : content,
                             'command' : 'goodsadminre',
                             'greno' : greno
                          },
                          success : function(data) {
                             alert("대댓글 작성 완료")
                             getAnswerList();
                          },
                          error : function(request, status, error) {
                             alert("관리자댓글 : 통신실패");

                          }
                       });
                });
      };
   </script>
</body>
</html>

