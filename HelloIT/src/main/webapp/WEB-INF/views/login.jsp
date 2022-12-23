<%@page import="com.smhrd.dao.UserInfoDAO"%>
<%@page import="com.smhrd.entity.UserInfo"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>HelloIt_Login</title>
<meta name="google-signin-client_id"
	content="YOUR_CLIENT_ID.apps.googleusercontent.com">
<meta charset="UTF-8" />
<link rel="stylesheet" href="https://unpkg.com/98.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
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
</style>

</head>

<body>
	<%
	String clientId = "zpztEFLfY06RGS88839H";//애플리케이션 클라이언트 아이디값";
	String redirectURI = URLEncoder.encode("http://localhost:8083/FrontController/naverLoginSuccess.do", "UTF-8");
	SecureRandom random = new SecureRandom();
	String state = new BigInteger(130, random).toString();
	String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code" + "&client_id=" + clientId
			+ "&redirect_uri=" + redirectURI + "&state=" + state;
	session.setAttribute("state", state);
	%>


	<div class="window"
		style="margin: 32px; width: 250px; align-self: center;" align="center">
		<div style="display: flex; flex-direction: column;">
			<div class="title-bar">
				<div class="title-bar-text">Hello IT</div>
			</div>
			<div>
				<img src="./img/hello.gif" alt="error" width="150">
			</div>
			<div class="window-body">
				<h4>Please Login</h4>
				<form action="login.do" method="post" style="display:grid; justify-content:center;">
					<input name="u_email" type="email" placeholder="Email :" /><br>
					<input name="u_pw" type="password" placeholder="Password :" /><br>
					<br> <input type="submit" value="Login">
				</form>
				<button style="margin-top: 10px;width: 119px;" click='location.href="goJoin.do"'>Sign-in</button>

				<br> <br> 회원이 아니신가요? <br>
				<p>소셜 계정으로 로그인</p>
				<div class="g-signin2" data-onsuccess="onSignIn">
					<img src="./img/google.png" id="google" width="50" alt="">
				</div>
				<a href="<%=apiURL%>"> <img src="./img/naver.png" id="naver"
					width="50" alt=""></a>

				<a href="javascript:kakaoLogin();">
					<img src="./img/kakao.png" id="kakao" width="50" alt="kakao">
				</a>
				<form action="kakaoJoin.do" method="post" name="login_frm">
					<input id="kakaoemail" type="hidden" name="u_email">
					<input id="kakaoname" type="hidden" name="u_name">
					<input type="hidden" name="u_birthdate" value="0000-00-00">				
					<input id="kakaogender" type="hidden" name="u_gender">
					<input type="hidden" name="u_nick" value="none">
					<input type="hidden" name="u_job" value="none">
					<input type="hidden" name="u_pw" value="kakaopw">
				</form>


			</div>
		</div>
	</div>
	
	
	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	    <script>
	        // JavaScript key
	        // 26395d3b640084a40dba5ca075912daf 
	        window.Kakao.init("26395d3b640084a40dba5ca075912daf");
	        function kakaoLogin(){
	    		window.Kakao.Auth.login({
	    			scope:'profile_nickname, account_email, gender, birthday',
	    			success: function(authObj){
	    				//console.log(authObj);
	    				window.Kakao.API.request({
	    					url: '/v2/user/me',
	    					success: res => {
	    						const email = res.kakao_account.email;
	    						const name = res.properties.nickname;
	    						const birth = res.kakao_account.birthday;
	    						var gender = res.kakao_account.gender;
	    						console.log(email);
	    						console.log(name);
	    						console.log(birth);
	    						console.log(gender)
	    						if(gender=="male"){
	    							gender = "M"  	
	    						}else{
	    							gender ="F"
	    						};
	    						
	    						
	    						$('#kakaoemail').val(email);
	    						$('#kakaoname').val(name);
	    						$('#kakaobirth').val(birth);
	    						$('#kakaogender').val(gender);
	    						document.login_frm.submit();
	    					}
	    				});
	    				
	    			}
	    		});
	    	}
	        
	       
	        </script>
	        
</body>
</html>
