<%@page import="com.smhrd.entity.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- message에서 massanger로 이동 -->
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/98.css" />
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/message.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="./js/mousePointer.js"></script>
<title>Hello IT</title>
</head>	

<body>
	<% UserInfo info = (UserInfo)session.getAttribute("info");%>
	<div class="container">
		<div class="wrap">
			<div class="window" style="width: 800px; position: sticky; top: 0;"
				align="center">
				<div class="title-bar">
					<div class="title-bar-text">HEllo iT</div>
					<div class="title-bar-controls">
						<button aria-label="Minimize"></button>
						<button aria-label="Maximize"></button>
						<button aria-label="Close" onclick="location.href='goMain.do?u_email=<%=info.getU_email()%>'"></button>
					</div>
				</div>
			</div>
			<div class="window" style="width: 800px" align="center">
				<div class="window" style="position: sticky; top: 26.6px">
					<div class="title-bar">
						<div class="title-bar-text">Message</div>
					</div>
					<div class="window-body" style="display: flex">
						<div class="wrap wd">
							<div>
								<img src="./img/message.gif" width="60px" alt="">
							</div>
							<div class="chat ch1">
								<img src="./img/icon_3.png" width="50px" alt=""> 사용자이름
								<div class="textbox">안녕하세요. 반갑습니다.</div>
							</div>
							<div class="chat ch2">
								<img src="./img/icon_2.png" width="55px">
								<div class="textbox">안녕하세요. 그동안 잘 지내셨어요?</div>
							</div>
							<div class="chat ch1">
								<img src="./img/icon_3.png" width="50px" alt=""> 사용자이름
								<div class="textbox">아유~ 그럼요! 요즘 어떻게 지내세요?</div>
							</div>
							<div class="chat ch2">
								<img src="./img/icon_2.png" width="55px" alt="">
								<div class="textbox">뭐~ 늘 코딩하면서 똑같은 하루 하루를 보내는 중이에요. 너무
									힘드네요 살려주세요. js 어떻게해야하지</div>
							</div>
							<div class="chat ch1">
								<img src="./img/icon_3.png" width="50px" alt="">보내는사람이름
								<div class="textbox">보내는사람 메시지내용</div>
							</div>
							<div class="chat ch2">
								<img src="./img/icon_2.png" width="55px" alt="">
								<div class="textbox">받는사람 메시지 내용 (나)</div>
							</div>
							<div style="display:flex">
							<form action="" name="" method="post">
							<input type="text" name="" style="width: 300pt; height: 35pt;">
							<input type="hidden" name="u_email" style="width: 300pt; height: 35pt;">
							<!-- <textarea  id="text" cols="50" rows="2" ></textarea> -->
							<input type="submit" style="width: 60pt; height: 35pt;" value="전송">
							</form>
							</div>
						</div>
					</div>
				</div>
	<footer class="main_footer">
		<div class="window icons" style="width: 800px" align="center">
			<a href="goPopPostMain.do"><img src="./img/dfsfg.png" id="fire" width="50" alt=""></a> 
			<a href="goIdea.do"><img src="./img/123.png" id="idea" width="40" alt=""></a> 
			<a href="goMain.do?u_email=<%=info.getU_email()%>"><img src="./img/dff.gif" id="goMain" width="50" alt="error"></a> 
			<a href="goMainWrite.do"><img src="./img/dfsee.gif" id="goMain" width="41" alt="error"></a> 
			<a href="goRecruit.do"><img src="./img/xml-0.png" id="job" width="40" alt=""></a> 
			<a href="goMyPage.do?u_email=<%=info.getU_email()%>"><img src="./img/icon_15.png" id="my_page" width="40" alt=""></a> 
			<a href="goMessage.do"><img src="./img/sfsdffd.png" id="message" alt="" width="30"></a>
		</div>
	</footer>
			</div>
		</div>
	</div>
</body>
</html>