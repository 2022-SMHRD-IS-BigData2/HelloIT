<%@page import="java.security.SecureRandom"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>HelloIt_Login</title>
<meta name="google-signin-client_id" content="YOUR_CLIENT_ID.apps.googleusercontent.com">
<meta charset="UTF-8" />
<link rel="stylesheet" href="https://unpkg.com/98.css" />
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script type="text/javascript">
		function onSignIn(googleUser) {
			var profile = googleUser.getBasicProfile();
			console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
			console.log('Name: ' + profile.getName());
			console.log('Image URL: ' + profile.getImageUrl());
			console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
		}
	</script>
<style>
body {
	height: 100vh;
	background: url(./img/backck.webp) no-repeat center;
	background-size: cover;
}
</style>

</head>

<body>
<%
    String clientId = "zpztEFLfY06RGS88839H";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost:8083/FrontController/naverLoginSuccess.do", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code"
         + "&client_id=" + clientId
         + "&redirect_uri=" + redirectURI
         + "&state=" + state;
    session.setAttribute("state", state);
 %>
	<center>
		<div class="window" style="margin: 32px; width: 250px">
			<div class="title-bar">
				<div class="title-bar-text">Hello IT</div>
			</div>
			<img src="./img/hello.gif" alt="error" width="150">
			<div display="inline" class="window-body">
				<h4>Please Login</h4>
				<form action="login.do" method="post">
					<input name="u_email" type="email" placeholder="ID :" /><br>
					<input name="u_pw" type="password" placeholder="PW :" /><br>
					<br> <input type="submit" value="Login"> 

				</form>
					<button onclick='location.href="goJoin.do"'>Sign-in</button>

				<br> <br> 회원이 아니신가요? <br>
				<p>소셜 계정으로 로그인</p>
				<div class="g-signin2" data-onsuccess="onSignIn"><img src="./img/google.png" id="google" width="50"
					alt=""></div>
					<a href="<%=apiURL%>"> <img
					src="./img/naver.png" id="naver" width="50" alt=""></a> <a
					href=""> <img src="./img/kakao.png" id="kakao" width="50"
					alt=""></a>


			</div>

		</div>
	</center>
	
</body>
</html>
