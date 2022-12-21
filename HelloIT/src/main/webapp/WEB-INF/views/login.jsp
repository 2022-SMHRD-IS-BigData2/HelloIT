<%@page import="java.security.SecureRandom"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>HelloIt_Login</title>
<meta charset="UTF-8" />
<link rel="stylesheet" href="https://unpkg.com/98.css" />

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
			<div class="window-body">
				<h4>Please Login</h4>
				<form action="login.do" method="post">
					<input name="u_email" type="email" placeholder="ID :" /><br>
					<input name="u_pw" type="password" placeholder="PW :" /><br>
					<br> <input type="submit" value="Login"> <a href="">
						<button>Sign-in</button>
					</a>

				</form>

				<br> <br> 회원이 아니신가요? <br>
				<p>소셜 계정으로 로그인</p>
				<a href=""><img src="./img/google.png" id="google" width="50"
					alt=""> </a> <a href="<%=apiURL%>"> <img
					src="./img/naver.png" id="naver" width="50" alt=""></a> <a
					href=""> <img src="./img/kakao.png" id="kakao" width="50"
					alt=""></a>


			</div>

		</div>
	</center>
</body>
</html>
