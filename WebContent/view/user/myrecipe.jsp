<%@ page language="java" contentType="text/html; charset= UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
section {
	height: 1200px;
	margin: 0px 300px;
}

.recipeall{
	/* float : left; */
	display: inline-block;
	padding: 35px;
	/* 	clear: both;  이건아님*/
	/* 	text-align: center; 아님*/
	line-height: 30px;

} 

.recipepics {
	width: 250px;
	height: 250px;
	border-radius: 20px;
}


#title {
	font-size: 25px;
	text-align: center;
	margin-top: 15px;
	font-weight: bold;
}

.chk{
	text-align: center;
}
.chkbox{
	width : 17px;
	height : 17px;
}
.titleandlike{
	text-align: center;
}
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
#btns{
	text-align: right;
	margin-right: 50px;
}





/*
보지마세요 필요없습니다 
 .paper{
  width:400px;
  margin:0 auto;
  position:relative;
  background:#eee;
  padding:55px;
  font:400 45px;
  color:#333;
}
.paper:after{
	content:'';
  position:absolute;
  top:0;
  right:0;
  width:0px;
  display:block;
  height:0px;
  border-style:solid;
  border-width:0px 30px 30px 0px;
  border-color:#333 #fff;
}
 */



</style>
<body>
	<%@ include file="../../form/header.jsp"%>
	<section>
		<div id="title">작성자 님의 레시피</div>
		<div id="btns">
			<input class="btn" type="button" value="등록"/>
			<input class="btn" type="button" value="삭제"/>
		</div>
		<div class="recipeall">
			<div class="chk">
				<input class= "chkbox" type="checkbox" /><br />
			</div>
			<a><img class="recipepics" alt="recipe1" src="./img/recipe1.jpg"></a>
			<div class="titleandlike">
				<div><b>레시피명</b></div>
				<div>따봉따봉!</div>
			</div>
		</div>
		<div class="recipeall" >
			<div class="chk">
				<input  class= "chkbox" type="checkbox" /><br />
			</div>
			<a><img class="recipepics" alt="recipe2" src="./img/recipe1.jpg"></a>
			<div class="titleandlike">
				<div><b>레시피명</b></div>
				<div>따봉따봉!</div>
			</div>
		</div>
		<div class="recipeall">
			<div class="chk">
				<input class= "chkbox" type="checkbox" /><br />
			</div>
			<a><img class="recipepics" alt="recipe3" src="./img/recipe1.jpg"></a>
			<div class="titleandlike">
				<div><b>레시피명</b></div>
				<div>따봉따봉!</div>
			</div>
		</div>
	<div class="recipeall">
			<div class="chk">
				<input class= "chkbox" type="checkbox" /><br />
			</div>
			<a><img class="recipepics" alt="recipe4" src="./img/recipe1.jpg"></a>
			<div class="titleandlike">
				<div><b>레시피명</b></div>
				<div>따봉따봉!</div>
			</div>
		</div>
		<br/>
	<div class="recipeall">
			<div class="chk">
				<input class= "chkbox" type="checkbox" /><br />
			</div>
			<a><img class="recipepics" alt="recipe4" src="./img/recipe1.jpg"></a>
			<div class="titleandlike">
				<div><b>레시피명</b></div>
				<div>따봉따봉!</div>
			</div>
		</div>
		<div class="recipeall">
			<div class="chk">
				<input class= "chkbox" type="checkbox" /><br />
			</div>
			<a><img class="recipepics" alt="recipe4" src="./img/recipe1.jpg"></a>
			<div class="titleandlike">
				<div><b>레시피명</b></div>
				<div>따봉따봉!</div>
			</div>
		</div>
		<div class="recipeall">
			<div class="chk">
				<input class= "chkbox" type="checkbox" /><br />
			</div>
			<a><img class="recipepics" alt="recipe4" src="./img/recipe1.jpg"></a>
			<div class="titleandlike">
				<div><b>레시피명</b></div>
				<div>따봉따봉!</div>
			</div>
		</div>
		<div class="recipeall">
			<div class="chk">
				<input class= "chkbox" type="checkbox" /><br />
			</div>
			<a><img class="recipepics" alt="recipe4" src="./img/recipe1.jpg"></a>
			<div class="titleandlike">
				<div><b>레시피명</b></div>
				<div>따봉따봉!</div>
			</div>
		</div>

		
		
<!-- 		<div class="paper">
		보지마세요 이건 필요 없는 겁니다 
		</div> -->

	</section>
	<%@ include file="../../form/footer.jsp"%>

</body>
</html>