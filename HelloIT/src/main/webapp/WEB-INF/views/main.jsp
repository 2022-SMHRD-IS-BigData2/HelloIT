<%@page import="com.smhrd.entity.UserInfo"%>
<%@page import="com.smhrd.utils.NaverApiUserInfo"%>
<%@page import="com.smhrd.utils.NaverApiUserInfo2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>HelloIT_Main</title>
<meta charset="UTF-8" />
<link rel="stylesheet" href="https://unpkg.com/98.css" />
<link rel="stylesheet" href="./css/style.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<title>Document</title>
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
</style>
<body>
	<div class="container">
		<div class="wrapper">
			<header class="main_header">
				<!-- <center> -->
				<div class="window" style="width: 800px; position: sticky; top: 0;"
					align="center">
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

					<br> <br>
					<div class="window" style="width: 400px">
						<div class="title-bar">
							<div class="title-bar-text">검색창</div>
						</div>
						<div class="window-body">
							<img src="./img/comm.gif" width="50" alt="">
							<p></p>
							<ul style="list-style: none;">
								<li>
									<form action="https://search.naver.com/search.naver"
										method="GET" target="_blank">
										<input type="search" placeholder="Naver">
										<button id="btn" class="Button" type="submit">검색</button>
									</form>
								</li>
								<li><form action="https://www.google.com/search"
										method="GET" target="_blank">
										<input type="search" placeholder="Google">
										<button id="btn" class="Button" type="submit">검색</button>
									</form></li>
								<li><form action="https://www.youtube.com/results"
										method="GET" target="_blank">
										<input type="search" placeholder="Youtube">
										<button id="btn" class="Button" type="submit">검색</button>
									</form></li>
							</ul>
						</div>

					</div>

					<div class="window-body" style="padding-bottom: 100px;"
						align="center">

						<div class="window" style="width: 600px">
							<div class="title-bar" style="position:sticky; top:26px;">
								<div class="title-bar-text">맞춤형</div>
								<input type="text" style="width: 150pt; height: 15pt;"
									placeholder="검색창" name="" id=""> <input type="button"
									style="width: 30pt; height: 15pt;" value="🔍">
							</div>
							<div class="window-body">
								<img src="./img/test.png" width="600px" alt="">
								<p>제목</p>

								<p>내용 (보완중)</p>
								<p>#hello #front #java #bogoddobogo</p>

							</div>
							<div class="status-bar">
								<p class="status-bar-field">
									<button id="btn">
										<img src="./img/공유.png" width="10" alt="">
									</button>
								</p>
								<p class="status-bar-field">
									<button id="btn">
										<img src="./img/북마크.png" width="15" alt="">
									</button>
								</p>
								<p class="status-bar-field">
									<button id="btn">💖</button>
									하트수제작중
								</p>
								<p class="status-bar-field">
									<input type="text" placeholder="댓글"> <input
										type="button" value="등록">
								</p>
								<a class="status-bar-field" href="">댓글보기</a>
							</div>
						</div>

						<br> <a href="goWrite.do"><button id="btn">글쓰기</button></a> <a
							href="goBoard.do"><button id="btn">게시판</button></a> <a
							href="goIdea.do"><button id="btn">아이디어토론방</button></a>

					</div>
				</div>
			</header>

			<footer class="main_footer">
				<!-- <center> -->
				<div class="window" id="icons" style="width: 800px" align="center">
					<a href=""><img src="./img/dfsfg.png" id="fire" width="50" alt=""></a> 
					<a href=""><img src="./img/123.png" id="idea" width="40" alt=""></a> 
					<a href=""><img src="./img/dff.gif" id="icon" width="50" alt="error"></a> 
					<a href=""><img src="./img/xml-0.png" id="job" width="40" alt=""></a> 
					<a href=""><img src="./img/icon_15.png" id="my_page" width="40" alt=""></a> 
					<a href=""><img src="./img/sfsdffd.png" alt="" width="30"></a>
				</div>
			</footer>
		</div>
	</div>
</body>
</html>