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
.board_list td {
    text-align: left;
}
body{
	display: flex;
    justify-content: center;
    align-items: center;
    position: fixed;
    width: 100%;
    height: 100%;
    font-size:large;
}
::-webkit-scrollbar-button:start:increment, 
::-webkit-scrollbar-button:end:decrement {
					/*  스크롤의 화살표가 포함된 영역   */
  display:none !important;
}
.window-body.main-content{
background: silver;
    margin: auto;
    padding-bottom:20px;
    display: flex;
    flex-direction: column; 
    align-items: center; 
    overflow-x: auto;
    height: 600px;
    font-size:large;
}
.bgdbg{
	width:200px;
	height:200px;
	font-size:small;
}
.window-body.member{
	display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
    height: 100%;
}
.member img{
	width: 130px;
	height: 130px;
}
</style>
<title>Hello IT</title>
</head>
<body>
<% UserInfo info = (UserInfo)session.getAttribute("info"); %>

<div class="container">
	<div class="wrapper">
		<div class="window" style="width: 800px; height:800px; position: sticky; top: 0;" align="center">
			<div class="title-bar">
				<div class="title-bar-text">Hello IT</div>
					<div class="title-bar-controls">
						<button aria-label="Minimize"></button>
						<button aria-label="Maximize"></button>
						<button aria-label="Close" onclick="location.href='goMyPage.do'"></button>
					</div>
				</div>
		<div class="window" align="center">
                        <div class="window-body main-content" style="height:760px">
                    	
                    	<div style="padding:15px">
                            <img src="img/2.png" alt="" width="180px" onmouseover=" this.src= 'img/1.png'  " width="180px"
                            onmouseout=" this.src= 'img/2.png' " width="180px"
                            >
                
                            <h4 style="margin:20px 0"
                            > <팀장> 유남욱  </h4> 
                            tel:010-9401-9458
                            <br>email:xeph123@naver.com
                            
                		</div>
                
                          <div class="window" style="width: 700px" >
                            <div class="title-bar">
                                <div class="title-bar-text">개발자 팀원 정보  </div>
                            </div>
               			<div class="window-body member">
                                
                
                
                		<div>
                			<div class="bgdbg">
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
				                <br> <b>박해성</b>
				                <br> tel:010-2202-5508
				                <br>email:5un9.hae@gmail.com
				                <br><br><br>
			                </div>
			                <div class="bgdbg">
			                	<img style="
                                
                                border-radius: 70px;
                                -moz-border-radius: 70px;
                                -khtml-border-radius: 70px;
                                -webkit-border-radius: 70px;
                                "
                                src="./img/김세희_돌고래.jpeg" width="128px" />
                
                
				                <br><b>김세희</b>
				                <br>tel:010 5848 2336
				                <br>email:sh58482336@gmail.com
				                <br><br><br>
			                </div>
						</div>
						<div>
			                <div class="bgdbg">
				                <img style="
                                
                                border-radius: 70px;
                                -moz-border-radius: 70px;
                                -khtml-border-radius: 70px;
                                -webkit-border-radius: 70px;
                                "
                                src="./img/이예지_강아지.jpeg" width="130px" />
                
                
				                <br><b>이예지</b>
				                <br>tel:010-6364-0945
				                <br>email:dldpwl877757@gmail.com
				                <br><br><br>
			                </div>
			                <div class="bgdbg">
                
                                <img style="
                                
                                border-radius: 70px;
                                -moz-border-radius: 70px;
                                -khtml-border-radius: 70px;
                                -webkit-border-radius: 70px;
                                "
                                src="./img/김여울_호랑이.jpeg" width="130px" />
                
				                <br><b>김여울</b>
				                <br>tel:010-7320-6036
				                <br>email:hanbyeol0415@gmail.com
				                <br> 
			                </div>
		                </div>
		                </div>
			</div>
		</div>
		
		<!-- 
						<div class="window-body" style="padding-bottom: 100px;"
							align="center">
		-->			
		
		</div>
		</div>
	<footer class="main_footer">
		<div class="window icons" style="width: 800px" align="center">
			<a href="goPopPostMain.do" title="인기게시물"><img src="./img/dfsfg.png" id="fire" width="50" alt=""></a> 
			<a href="goIdea.do" title="아이디어토론방"><img src="./img/123.png" id="idea" width="40" alt=""></a> 
			<a href="goMain.do?u_email=<%=info.getU_email()%>" title="맞춤게시물"><img src="./img/dff.gif" id="goMain" width="50" alt="error"></a> 
			<a href="goMainWrite.do" title="글쓰기"><img src="./img/dfsee.gif" id="goMain" width="41" alt="error"></a> 
			<a href="goRecruit.do" title="채용공고게시판"><img src="./img/xml-0.png" id="job" width="40" alt=""></a> 
			<a href="goMyPage.do?u_email=<%=info.getU_email()%>" title="마이페이지"><img src="./img/icon_15.png" id="my_page" width="40" alt=""></a> 
			<a href="goMessage.do" title="메시지"><img src="./img/sfsdffd.png" id="message" alt="" width="30"></a>
		</div>
	</footer>
		</div>
	</div>
</body>
</html>