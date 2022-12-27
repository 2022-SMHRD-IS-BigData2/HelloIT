<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://unpkg.com/98.css" />
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/bookmark.css">
<script type="text/javascript" src="./js/mousePointer.js"></script>
<style type="text/css">
.container {
	display: flex;
	justify-content: center;
	height: inherit;
}

.title-bar {
	position: sticky;
	top: 0;
	z-index: 300;
	width: -webkit-fill-available;
}

.window {
	justify-content: space-between;
	display: flex;
	align-items: center;
	flex-direction: column;
}

.window-body {
	width: -webkit-fill-available;
}

#form-commentInfo {
	display: flex;
	align-items: center;
	justify-content: space-around;
}

#comment-input {
	width: 74%;
	height: 3.8em;
}
</style>
<title>Hello IT</title>
</head>

<body>
	<div class="container">
		<div class="wrapper">
			<div class="window" style="width: 800px">
				<div class="title-bar">
					<div class="title-bar-text">아이디어 토론방</div>
					<div class="title-bar-controls">
						<button aria-label="Minimize"></button>
						<button aria-label="Maximize"></button>
						<button aria-label="Close" onclick="location.href='goMain.do'"></button>
					</div>
				</div>
				<div class="window-body">
					<div id="bookmark" style="font-family: auto;">
						<div class="board_list_wrap">
							<table class="board_list" border="1">
								<caption>북마크 목록</caption>
								<thead>
									<tr>
										<th>번호</th>
										<th style="width: 500px">제목</th>
										<th>작성자</th>
										<th>작성일</th>
										<th>조회수</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>5</td>
										<td class="tit"><a href="#">북마크5</a></td>
										<td>개발자</td>
										<td>20221226</td>
										<td>111</td>
									</tr>
									<tr>
										<td>4</td>
										<td class="tit"><a href="#">북마크4</a></td>
										<td>개발자</td>
										<td>20221226</td>
										<td>222</td>
									</tr>
									<tr>
										<td>3</td>
										<td class="tit"><a href="#">북마크3</a></td>
										<td>개발자</td>
										<td>20221226</td>
										<td>333</td>
									</tr>
									<tr>
										<td>2</td>
										<td class="tit"><a href="#">북마크2</a></td>
										<td>개발자</td>
										<td>20221226</td>
										<td>222</td>
									</tr>
									<tr>
										<td>1</td>
										<td class="tit"><a href="#">북마크1</a></td>
										<td>개발자</td>
										<td>20221226</td>
										<td>111</td>
									</tr>
									<tr>
										<td>1</td>
										<td class="tit"><a href="#">북마크1</a></td>
										<td>개발자</td>
										<td>20221226</td>
										<td>111</td>
									</tr>
									<tr>
										<td>1</td>
										<td class="tit"><a href="#">북마크1</a></td>
										<td>개발자</td>
										<td>20221226</td>
										<td>111</td>
									</tr>
									<tr>
										<td>1</td>
										<td class="tit"><a href="#">북마크1</a></td>
										<td>개발자</td>
										<td>20221226</td>
										<td>111</td>
									</tr>
									<tr>
										<td>1</td>
										<td class="tit"><a href="#">북마크1</a></td>
										<td>개발자</td>
										<td>20221226</td>
										<td>111</td>
									</tr>
									<tr>
										<td>1</td>
										<td class="tit"><a href="#">북마크1</a></td>
										<td>개발자</td>
										<td>20221226</td>
										<td>111</td>
									</tr>
								</tbody>
							</table>
							<br>
							<div class="pagination_section">
								<a href="#" class="bt"> << Previous</a> <a href="#"
									class="num on">1</a> <a href="#" class="num">2</a> <a href="#"
									class="num">3</a> <a href="#" class="num">4</a> <a href="#"
									class="num">5</a> <a href="#" class="num">6</a> <a href="#"
									class="num">7</a> <a href="#" class="bt">Next >></a>
							</div>
						</div>
					</div>
				</div>
				<!-- 				<div class="window" style="width: 700px">
					<div class="title-bar">
						<div class="title-bar-text">💡idea💡</div>
					</div>
					<div class="window-body">
						<div id="form-commentInfo">
							<div id="comment-count">
								comments count:<span id="count">0</span>
							</div>
							<input id="comment-input" placeholder="당신의 아이디어를 입력해 보세요.">
							<button id="submit">등록</button>
						</div>
						<div id=comments></div>
					</div>

				</div>

			</div>
		</div> -->
			</div>
		</div>
	</div>
	<footer class="main_footer">
		<div class="window" id="icons" style="width: 800px; display:block;" align="center">
			<a href=""><img src="./img/dfsfg.png" id="fire" width="50" alt=""></a> 
			<a href="goIdea.do"><img src="./img/123.png" id="idea" width="40" alt=""></a> 
			<a href="goMain.do"><img src="./img/dff.gif" id="goMain" width="50" alt="error"></a> 
			<a href="goRecruit.do"><img src="./img/xml-0.png" id="job" width="40" alt=""></a> 
			<a href="goMyPage.do"><img src="./img/icon_15.png" id="my_page" width="40" alt=""></a> 
			<a href=""><img src="./img/sfsdffd.png" id="message" alt="" width="30"></a>
		</div>
	</footer>
	<script src="./js/index.js"></script>
</body>
</html>