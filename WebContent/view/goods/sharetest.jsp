<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../../form/header.jsp"%>

	<div id="fb-root"></div>
	<script async defer crossorigin="anonymous"
		src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v7.0"
		nonce="it0RiJe8"></script>
	<script type="text/javascript">
		
	</script>

	<div class="fb-share-button"
		data-href="https://developers.facebook.com/docs/plugins/"
		data-layout="button" data-size="small">
		<a target="_blank"
			href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fdevelopers.facebook.com%2Fdocs%2Fplugins%2F&amp;src=sdkpreparse"
			class="fb-xfbml-parse-ignore">공유하기</a>
	</div>

	<%@ include file="../../form/footer.jsp"%>

</body>
</html>