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
<meta charset="UTF-8" />
<link rel="stylesheet" href="https://unpkg.com/98.css" />
<link rel="stylesheet" href="./css/style.css">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta name="google-signin-client_id" content="950051192851-pin8qfe1mmnd8tkimrfp7j2l32t4ssff.apps.googleusercontent.com">
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
<script src="https://apis.google.com/js/api:client.js"></script>
<script>
  var googleUser = {};
  var startApp = function() {
    gapi.load('auth2', function(){
      // Retrieve the singleton for the GoogleAuth library and set up the client.
      auth2 = gapi.auth2.init({
        client_id: '950051192851-pin8qfe1mmnd8tkimrfp7j2l32t4ssff.apps.googleusercontent.com',
        cookiepolicy: 'single_host_origin',
        // Request scopes in addition to 'profile' and 'email'
        //scope: 'additional_scope'
      });
      attachSignin(document.getElementById('customBtn'));
    });
  };

  function attachSignin(element) {
    console.log(element.id);
    auth2.attachClickHandler(element, {},
        function(googleUser) {
          document.getElementById('name').innerText = "Signed in: " +
              googleUser.getBasicProfile().getName();
        }, function(error) {
          /* alert(JSON.stringify(error, undefined, 2)); */
          alert('구글 로그인 구현중..')
        });
  }
</script>
<style type="text/css">
#customBtn {
  display: inline-block;
  color: #444;
  border-radius: 5px;
  white-space: nowrap;
  width: 35px;
  height: 35px;
  margin-right: 15px;
}
#customBtn:hover {
  cursor: pointer;
}
span.label {
  font-family: serif;
  font-weight: normal;
}
span.icon {
  background: url('/identity/sign-in/g-normal.png') transparent 5px 50% no-repeat;
  display: inline-block;
  vertical-align: middle;
  width: 42px;
  height: 42px;
}
span.buttonText {
  display: inline-block;
  vertical-align: middle;
  padding-left: 42px;
  padding-right: 42px;
  font-size: 14px;
  font-weight: bold;
  /* Use the Roboto font that is loaded in the <head> */
  font-family: 'Roboto', sans-serif;
}
.header{
	cursor: default;
	width: 242px;
}
.window-body{
    margin: 8px;
    display: flex;
    flex-direction: column;
    align-items: center;
}
.window.wrap{
	width:250px;
}
 </style>
</head>
<body>
	<%-- 네이버 로그인 관련 스크립틀릿 --%>
	<%
	String clientId = "zpztEFLfY06RGS88839H";//애플리케이션 클라이언트 아이디값";
	String redirectURI = URLEncoder.encode("http://localhost:8083/FrontController/naverLoginSuccess.do", "UTF-8");
	SecureRandom random = new SecureRandom();
	String state = new BigInteger(130, random).toString();
	String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code" + "&client_id=" + clientId
			+ "&redirect_uri=" + redirectURI + "&state=" + state;
	session.setAttribute("state", state);
	%>
	<%-- 네이버 로그인 관련 스크립틀릿 --%>
	<div class="container">
		<div class="wrapper">
			<div id="loginMain" class="window wrap">
			<div style="display: flex; flex-direction: column; align-items: center;">
				<div class="header title-bar">
					<div class="title-bar-text">Hello IT</div>
					<div class="title-bar-controls">
						<button id="hideWindow" aria-label="Minimize"></button>
						<button id="maximize" aria-label="Maximize"></button>
						<button id="restore" aria-label="Restore" style="display:none;"></button>
						<button aria-label="Close"></button>
					</div>
				</div>
				<div class="window-body">
					<img src="./img/hello.gif" alt="error" width="150">
					<h4>Please Login</h4>
					<div>
						<form action="login.do" method="post" style="display:grid; justify-content:center;">
							<input style="font-family:none;"name="u_email" type="email" placeholder="Email :" /><br>
							<input name="u_pw" type="password" placeholder="Password :" /><br>
							<br> <input type="submit" value="Login">
						</form>
						<button style="margin-top: 10px;width: 130px;" onclick='location.href="goJoin.do"'>Sign-in</button>
					</div>
					<br><br>회원이 아니신가요?<br>
					<p>소셜 계정으로 로그인</p>
					<%-- 구글 간편로그인 --%>
					<div style="display:flex; justify-content:center;">
						<div>
							<div id="customBtn" class="">
							<img src="./img/google.png" style="width:50px">
							</div>
						</div>
						<div id="name"></div>
						<script>startApp();</script>
					<%-- 네이버 간편로그인 --%>
					<a href="<%=apiURL%>"><img src="./img/naver.png" id="naver" width="50" alt=""></a>
					<%-- 카카오 간편로그인 --%>
					<a href="javascript:kakaoLogin();"><img src="./img/kakao.png" id="kakao" width="50" alt="kakao"></a>
					</div>
					<form action="kakaoJoin.do" method="post" name="login_frm">
						<input id="kakaoemail" type="hidden" name="u_email">
						<input id="kakaoname" type="hidden" name="u_name">
						<input type="hidden" name="u_birthdate" value="0000-00-00">				
						<input id="kakaogender" type="hidden" name="u_gender">
						<input type="hidden" name="u_nick" value="none">
						<input type="hidden" name="u_job" value="none">
						<input type="hidden" name="u_pw" value="kakaopw">
					</form>
					<%-- ------------- --%>
				</div>
			</div>
			</div>
		</div>
		<div class="status-bar task-bar">
		    <div class="status-bar-field"><button>시작</button></div>
		    <div class="status-bar-field"><button id="logWinShow" class="showHide">Hello IT Login</button></div>
		    <div class="status-bar-field" style="width: 70px;position: absolute;bottom: 3px; right: 3px;">
		    	<div id="hms" align="center"></div>
		    </div>
		</div>
	</div>
	<%-- 카카오 로그인 회원정보 보내기--%>
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
	<%-- 창 이동시키기 구현 --%>
	<script src="./js/move.js"></script>
	<%-- login 버튼 클릭시 창이 사라지고 사라졌을때 다시 클릭하면 창이 다시 생기는 메소드 구현 --%>
	<script src="./js/showHideLogin.js"></script>
	<script src="./js/showHideLogin2.js"></script>
	<%-- 시계 나타내기 구현 --%>
	<script src="./js/time.js"></script>
	<%-- 창크기 최대화 및 원래 상태 복원 구현 --%>
	<script>
		$('#maximize').on('click',function(){
			document.getElementById('maximize').style.display='none';
			document.getElementById('restore').style.display='block';
			$('#loginMain.window.wrap').removeAttr('style');
			$('#loginMain.window.wrap').css('width','99.7%').css('height','100%').css('position','inherit').css('transform','inherit');
			$('div.wrapper').css('display','block').css('height','96.8vh');
			$('div.container').css('display','block').css('height','95.4vh');
			$('div.header.title-bar').css('width','100%')
			$('div.window-body').css('margin','auto');
			})
		$('#restore').on('click',function(){        	  
			document.getElementById('maximize').style.display='block';
		 	document.getElementById('restore').style.display='none';    
			$('#loginMain.window.wrap').css('top','50%').css('left','50%').css('width','250px').css('height','').css('position','absolute').css('transform','translate(-50%, -50%)')
			$('div.wrapper').css('display','table-cell');
			$('div.container').css('display','table').css('height','100vh');
			$('div.header.title-bar').css('width','242px');
			$('div.window-body').css('margin','8px');
		})
	</script>
</body>
</html>
