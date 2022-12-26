<%@page import="com.smhrd.entity.UserInfo"%>
<%@page import="com.smhrd.utils.NaverApiUserInfo"%>
<%@page import="com.smhrd.utils.NaverApiUserInfo2"%>
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
<title>Hello IT</title>
</head>
<style>
/* 
#icon{
    align-items: center;
    left: 480px;
    top: 540px;
    margin-top: 8px;
}

#idea{
    left: 370px;
    top: 550px;
    
}
#my_page{
    left: 600px;
    top: 535px;

}
#job{
    left: 700px;
    top: 550px;

}
#fire{
    left: 350px;
    top: 540px;

} */

/* #icons{
    display: flex;
    justify-content: space-between;
} */
#btn {
	width: 20px;
	height: 10px;
	border-radius: 40px;
}
#search{
	top: 9.6%;
	left: 82.6%;
	position:sticky;
	display:flex;
}
</style>
<body>

<a href="recruit.do">테스트용</a>
<div class="container">
	<div class="wrapper">
		<div class="window" style="width: 800px; position: sticky; top: 0;" align="center">
			<div class="title-bar">
				<div class="title-bar-text">HEllo iT</div>
				<div class="title-bar-controls">
					<button aria-label="Minimize"></button>
					<button aria-label="Maximize"></button>
					<button aria-label="Close"></button>
				</div>
			</div>
		</div>
		<div class="window" style="width: 800px" align="center">
		<%-- 네이버 구글 유튜브 검색 창 -----------------------------------  --%>
		<div class="window"><!--style="--width: 400px"-->
			<div class="title-bar">
				<div class="title-bar-text">검색창</div>
			</div>
			<div class="window-body" style="display:flex">
				<img src="./img/comm.gif" width="50" alt="">
				<p></p>
				<ul style="list-style: none; display:flex">
					<li>
						<form action="https://search.naver.com/search.naver" method="GET" target="_blank">
							<input type="text" placeholder="Naver" name="query">
							<input id="btn" class="Button" type="submit" value="검색">
						</form>
					</li>
					<li>
						<form action="https://www.google.com/search" method="GET" target="_blank">
							<input type="search" placeholder="Google" name="q">
							<button id="btn" class="Button" type="submit">검색</button>
						</form>
					</li>
					<li>
						<form action="https://www.youtube.com/results" method="GET" target="_blank">
							<input type="search" placeholder="Youtube"name="q">
							<button id="btn" class="Button" type="submit">검색</button>
						</form>
					</li>
				</ul>
			</div>
		</div>
		<%-- ------------------------------------------------------------------- --%>
		<!-- 
						<div class="window-body" style="padding-bottom: 100px;"
							align="center">
		-->			
		<%-- 맞춤형 피드 노출 부분 및 검색어 입력 --%>
		<div class="window" style="padding-bottom:100px"><!-- style="width: 600px" -->
			<div class="title-bar" style="position:sticky; top:26.6px;">
				<div class="title-bar-text">맞춤형</div>
				<div>
					<input type="text" style="width: 150pt; height: 15pt;" placeholder="검색창" name="" id=""> 
					<input type="button" style="width: 30pt; height: 15pt;" value="🔍">
				</div>
				<div></div>
			</div>
			<div class="window-body">
				<img src="./img/test.png" width="600px" alt="">
				<p>제목</p>
				<p>내용 (보완중)</p>
				<p>#hello #front #java #bogoddobogo</p>
			</div>
			<div class="status-bar" style="justify-content: space-between;">
				<div style="display:flex">
				<div class="status-bar-field">
					<button id="btn"><img src="./img/공유.png" width="10" alt=""></button>
				</div>
				<div class="status-bar-field">
					<button id="btn"><img src="./img/북마크.png" width="15" alt=""></button>
				</div>
				<div class="status-bar-field"><button id="btn">💖</button>하트수제작중</div>
				<div class="status-bar-field" style="width:423px">
					<input style="width:382px" type="text" placeholder="댓글"> 
					<input type="button" value="등록">
				</div>
				</div>
				<div>
				<a class="status-bar-field" href="">댓글보기</a>
				</div>
			</div>
		</div>
		<%-- -------------------------------------------------------------------------------- --%>
		<br> 
		<a href="goWrite.do"><button id="btn">글쓰기</button></a> 
		<a href="goBoard.do"><button id="btn">게시판</button></a>
		</div>
		<footer class="main_footer">
		<div class="window" id="icons" style="width: 800px" align="center">
			<a href=""><img src="./img/dfsfg.png" id="fire" width="50" alt=""></a> 
			<a href="goIdea.do"><img src="./img/123.png" id="idea" width="40" alt=""></a> 
			<a href="goMain.do"><img src="./img/dff.gif" id="goMain" width="50" alt="error"></a> 
			<a href="goJobHunting.do"><img src="./img/xml-0.png" id="job" width="40" alt=""></a> 
			<a href="goMyPage.do"><img src="./img/icon_15.png" id="my_page" width="40" alt=""></a> 
			<a href=""><img src="./img/sfsdffd.png" id="message" alt="" width="30"></a>
		</div>
	</footer>
	</div>
</div>
	<script src="./js/move.js"></script>
</body>
</html>