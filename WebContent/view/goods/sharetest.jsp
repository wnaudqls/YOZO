<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta property="og:url"
	content="https://localhost/YORIZORI/view/main/main.jsp" />
<meta property="og:type" content="website" />
<meta property="og:title" content="페이스북 공유테스트" />
<meta property="og:description" content="페북공유테스트입니다" />
<meta property="og:image"
	content="https://img.khan.co.kr/news/2020/07/07/l_2020070701000784500060231.jpg" />
</head>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	/* var SNS = {
	 facebook : function(link, title){
	 link = "encodeURIComponent(link)";
	 title = "encodeURIComponent(document.title)";
	
	 var url = 'http://www.facebook.com/sharer.php?u=' + link + '&t=' + title;
	 window.open(url, '', 'width=400, height=400, left=600');
	
	 }

	 var currentUrl = JQuery(location).attr('href');
	 function snsSubmit(type, title){
	 if(type == "twitter"){}
	 SNS.twitter(currentUrl, title);
	
	 }else if(type == "facebook"){
	 SNS.facebook(currentUrl, title);
	 }

	
	 }
	 */

	var url = 'https://localhost/YORIZORI/view/main/main.jsp';
	var title = '페이스북 공유테스트';
	var description = '페북공유테스트입니다';
	var ImgUrl = 'https://img.khan.co.kr/news/2020/07/07/l_2020070701000784500060231.jpg';
	/* <meta property="og:url" content="https://localhost/YORIZORI/view/main/main.jsp"/>
	<meta property="og:type" content="website"/>
	<meta property="og:title" content="페이스북 공유테스트"/>
	<meta property="og:description" content="페북공유테스트입니다"/>
	<meta property="og:image" content="https://img.khan.co.kr/news/2020/07/07/l_2020070701000784500060231.jpg"/> */
	/*  $('head').append(StringTool.format('<meta property="og:url" content="{0}"/>', url));
	 $('head').append(StringTool.format('<meta property="og:type" content="{0}"/>', 'article'));
	 $('head').append(StringTool.format('<meta property="og:title" content="{0}"/>', title));
	 $('head').append(StringTool.format('<meta property="og:description" content="{0}"/>', description));
	 $('head').append(StringTool.format('<meta property="og:image" content="{0}"/>', ImgUrl));
	 */

	if (!$('meta[property="og:url"').attr('content')) {
		$('head').append(
				StringTool.format('<meta property="og:url" content="{0}" />',
						url));
	}
	if (!$('meta[property="og:type"').attr('content')) {
		$('head').append(
				StringTool.format('<meta property="og:type" content="{0}" />',
						'article'));
	}
	if (!$('meta[property="og:title"').attr('content')) {
		$('head').append(
				StringTool.format('<meta property="og:title" content="{0}" />',
						title));
	}
	if (!$('meta[property="og:description"').attr('content')) {
		$('head').append(
				StringTool.format(
						'<meta property="og:description" content="{0}" />',
						description));
	}
	if (!$('meta[property="og:image"').attr('content')) {
		$('head').append(
				StringTool.format('<meta property="og:image" content="{0}" />',
						imgUrl));
	}

	var linkUrl = window.location.href;
	widdow.open('http//www.facebook.com/sharer.php?u='
			+ encodeURIComponent(linkUrl));
</script>
<body>
	<%@ includ`e file="/form/header.jsp"%>

	<!-- 	<li><a href="#" id="btn_share01"
		onclick="snsSubmit('facebook', '');">페이스북공유</a></li> -->


	<%@ include file="/form/footer.jsp"%>
</body>
</html>