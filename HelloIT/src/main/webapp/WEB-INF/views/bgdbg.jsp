<%@page import="com.smhrd.entity.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Hello IT</title>
<meta charset="UTF-8" />
<link rel="stylesheet" href="https://unpkg.com/98.css" />
<link rel="stylesheet" href="./css/style.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script	src="./js/mousePointer.js"></script>
<style type="text/css">
	.window.posted{
		margin:4px;
	}
</style>
<title>Hello IT</title>
</head>
<body>
<% UserInfo info = (UserInfo)session.getAttribute("info"); %>

<div class="container">
	<div class="wrapper">
		<div class="window" style="width: 800px; position: sticky; top: 0;" align="center">
			<div class="title-bar">
				<div class="title-bar-text">HEllo iT</div>
					<div class="title-bar-controls">
						<button aria-label="Minimize"></button>
						<button aria-label="Maximize"></button>
						<button aria-label="Close" onclick="location.href='goMyPage.do'"></button>
					</div>
				</div>
		</div>
		<div class="window" style="width: 800px" align="center">
				<p></p>
                        <div class="window-body">
                    
                            <img src="img/2.png" alt="" width="150px" onmouseover=" this.src= 'img/1.png'  " width="150px"
                            onmouseout=" this.src= 'img/2.png' " width="150px"
                            >
                
                            <h4
                            > <팀장> 유남욱  </h4> 
                            tel:010-9401-9458
                            <br>email:xeph123@naver.com
                            
                     <br><br><br><br>
                
                
                          <div class="window" style="width: 700px" >
                            <div class="title-bar">
                                <div class="title-bar-text">개발자 팀원 정보  </div>
                            </div>
                            <div class="window-body">
                                
                
                
                
                
                                <img style="
                                
                                border-radius: 70px;
                                -moz-border-radius: 70px;
                                -khtml-border-radius: 70px;
                                -webkit-border-radius: 70px;
                                "
                                src="./img/박해성_고양이.jpeg" width="130px" />
                
                
                
                                <!-- <div class="box" style="background: #BDBDBD;">
                                    <img src="./img/박해성_고양이.jpeg" width="100px" alt="">
                                </div> -->
                <br> 박해성
                <br> tel:010-2202-5508
                <br>email:5un9.hae@gmail.com
                <br><br><br>
                
                
                <img style="
                                
                                border-radius: 70px;
                                -moz-border-radius: 70px;
                                -khtml-border-radius: 70px;
                                -webkit-border-radius: 70px;
                                "
                                src="./img/김세희_돌고래.jpeg" width="128px" />
                
                
                <br>김세희
                <br>tel:010 5848 2336
                <br>email:sh58482336@gmail.com
                <br><br><br>
                
                
                <img style="
                                
                                border-radius: 70px;
                                -moz-border-radius: 70px;
                                -khtml-border-radius: 70px;
                                -webkit-border-radius: 70px;
                                "
                                src="./img/이예지_강아지.jpeg" width="130px" />
                
                
                <br>이예지
                <br>tel:010-6364-0945
                <br>email:dldpwl877757@gmail.com
                <br><br><br>
                
                
                
                                <img style="
                                
                                border-radius: 70px;
                                -moz-border-radius: 70px;
                                -khtml-border-radius: 70px;
                                -webkit-border-radius: 70px;
                                "
                                src="./img/김여울_호랑이.jpeg" width="130px" />
                
                <br>김여울
                <br>tel:010-7320-6036
                <br>email:hanbyeol0415@gmail.com
                <br> 
                </div>
			</div>
		</div>
		
		<!-- 
						<div class="window-body" style="padding-bottom: 100px;"
							align="center">
		-->			
		
		</div>
		</div>
	</div>
	<footer class="main_footer">
		<div class="window" id="icons" style="width: 800px" align="center">
			<a href="goPopPostMain.do"><img src="./img/dfsfg.png" id="fire" width="50" alt=""></a> 
			<a href="goIdea.do"><img src="./img/123.png" id="idea" width="40" alt=""></a> 
			<a href="goMain.do?u_email=<%=info.getU_email()%>"><img src="./img/dff.gif" id="goMain" width="50" alt="error"></a> 
			<a href="goMainWrite.do"><img src="./img/dfsee.gif" id="goMain" width="41" alt="error"></a> 
			<a href="goRecruit.do"><img src="./img/xml-0.png" id="job" width="40" alt=""></a> 
			<a href="goMyPage.do?u_email=<%=info.getU_email()%>"><img src="./img/icon_15.png" id="my_page" width="40" alt=""></a> 
			<a href="goMessage.do"><img src="./img/sfsdffd.png" id="message" alt="" width="30"></a>
		</div>
	</footer>
</body>
</html>