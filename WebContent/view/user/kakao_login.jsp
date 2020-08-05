<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html charset=UTF-8");%>
<!--  사용하지 않음 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
 </head>
 
 <body>
<a id="login-form-btn" href="javascript:loginFormWithKakao()">
  <img
    src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg"
    width="222"
  />
</a>
<p id="login-form-result"></p>
<script type="text/javascript">
  // 웹 플랫폼 도메인 등 초기화한 앱의 설정이 그대로 적용됩니다.
  // 초기화한 앱에 현재 도메인이 등록되지 않은 경우 에러가 발생합니다.
  Kakao.init('9da6685322dda6025e64aba829272d68')
  function loginFormWithKakao() {
    Kakao.Auth.loginForm({
      success: function(authObj) {
        showResult(JSON.stringify(authObj))
      },
      fail: function(err) {
        showResult(JSON.stringify(err))
      },
    })
  }
  function showResult(result) {
    document.getElementById('login-form-result').innerText = result
  }
</script>
 </body>
 
 
 <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

</head>
<body>
<a id="kakao-login-btn"></a>
<a href="http://developers.kakao.com/logout"></a>
<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('9da6685322dda6025e64aba829272d68');  //여기서 아까 발급받은 키 중 javascript키를 사용해준다.
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {
        alert(JSON.stringify(authObj));
      },
      fail: function(err) {
         alert(JSON.stringify(err));
      }
    });
  //]]>
</script>

</body>

</html>