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
<script type="text/javascript">
	var colour = "random";
	var sparkles = 50;

	var x = ox = 400;
	var y = oy = 300;
	var swide = 800;
	var shigh = 600;
	var sleft = sdown = 0;
	var tiny = new Array();
	var star = new Array();
	var starv = new Array();
	var starx = new Array();
	var stary = new Array();
	var tinyx = new Array();
	var tinyy = new Array();
	var tinyv = new Array();

	window.onload = function() {
		if (document.getElementById) {
			var i, rats, rlef, rdow;
			for (var i = 0; i < sparkles; i++) {
				var rats = createDiv(3, 3);
				rats.style.visibility = "hidden";
				rats.style.zIndex = "999";
				document.body.appendChild(tiny[i] = rats);
				starv[i] = 0;
				tinyv[i] = 0;
				var rats = createDiv(5, 5);
				rats.style.backgroundColor = "transparent";
				rats.style.visibility = "hidden";
				rats.style.zIndex = "999";
				var rlef = createDiv(1, 5);
				var rdow = createDiv(5, 1);
				rats.appendChild(rlef);
				rats.appendChild(rdow);
				rlef.style.top = "2px";
				rlef.style.left = "0px";
				rdow.style.top = "0px";
				rdow.style.left = "2px";
				document.body.appendChild(star[i] = rats);
			}
			set_width();
			sparkle();
		}
	}

	function sparkle() {
		var c;
		if (Math.abs(x - ox) > 1 || Math.abs(y - oy) > 1) {
			ox = x;
			oy = y;
			for (c = 0; c < sparkles; c++)
				if (!starv[c]) {
					star[c].style.left = (starx[c] = x) + "px";
					star[c].style.top = (stary[c] = y + 1) + "px";
					star[c].style.clip = "rect(0px, 5px, 5px, 0px)";
					star[c].childNodes[0].style.backgroundColor = star[c].childNodes[1].style.backgroundColor = (colour == "random") ? newColour()
							: colour;
					star[c].style.visibility = "visible";
					starv[c] = 50;
					break;
				}
		}
		for (c = 0; c < sparkles; c++) {
			if (starv[c])
				update_star(c);
			if (tinyv[c])
				update_tiny(c);
		}
		setTimeout("sparkle()", 40);
	}

	function update_star(i) {
		if (--starv[i] == 25)
			star[i].style.clip = "rect(1px, 4px, 4px, 1px)";
		if (starv[i]) {
			stary[i] += 1 + Math.random() * 3;
			starx[i] += (i % 5 - 2) / 5;
			if (stary[i] < shigh + sdown) {
				star[i].style.top = stary[i] + "px";
				star[i].style.left = starx[i] + "px";
			} else {
				star[i].style.visibility = "hidden";
				starv[i] = 0;
				return;
			}
		} else {
			tinyv[i] = 50;
			tiny[i].style.top = (tinyy[i] = stary[i]) + "px";
			tiny[i].style.left = (tinyx[i] = starx[i]) + "px";
			tiny[i].style.width = "2px";
			tiny[i].style.height = "2px";
			tiny[i].style.backgroundColor = star[i].childNodes[0].style.backgroundColor;
			star[i].style.visibility = "hidden";
			tiny[i].style.visibility = "visible"
		}
	}

	function update_tiny(i) {
		if (--tinyv[i] == 25) {
			tiny[i].style.width = "1px";
			tiny[i].style.height = "1px";
		}
		if (tinyv[i]) {
			tinyy[i] += 1 + Math.random() * 3;
			tinyx[i] += (i % 5 - 2) / 5;
			if (tinyy[i] < shigh + sdown) {
				tiny[i].style.top = tinyy[i] + "px";
				tiny[i].style.left = tinyx[i] + "px";
			} else {
				tiny[i].style.visibility = "hidden";
				tinyv[i] = 0;
				return;
			}
		} else
			tiny[i].style.visibility = "hidden";
	}

	document.onmousemove = mouse;
	function mouse(e) {
		if (e) {
			y = e.pageY;
			x = e.pageX;
		} else {
			set_scroll();
			y = event.y + sdown;
			x = event.x + sleft;
		}
	}

	window.onscroll = set_scroll;
	function set_scroll() {
		if (typeof (self.pageYOffset) == 'number') {
			sdown = self.pageYOffset;
			sleft = self.pageXOffset;
		} else if (document.body
				&& (document.body.scrollTop || document.body.scrollLeft)) {
			sdown = document.body.scrollTop;
			sleft = document.body.scrollLeft;
		} else if (document.documentElement
				&& (document.documentElement.scrollTop || document.documentElement.scrollLeft)) {
			sleft = document.documentElement.scrollLeft;
			sdown = document.documentElement.scrollTop;
		} else {
			sdown = 0;
			sleft = 0;
		}
	}

	window.onresize = set_width;
	function set_width() {
		var sw_min = 999999;
		var sh_min = 999999;
		if (document.documentElement && document.documentElement.clientWidth) {
			if (document.documentElement.clientWidth > 0)
				sw_min = document.documentElement.clientWidth;
			if (document.documentElement.clientHeight > 0)
				sh_min = document.documentElement.clientHeight;
		}
		if (typeof (self.innerWidth) == 'number' && self.innerWidth) {
			if (self.innerWidth > 0 && self.innerWidth < sw_min)
				sw_min = self.innerWidth;
			if (self.innerHeight > 0 && self.innerHeight < sh_min)
				sh_min = self.innerHeight;
		}
		if (document.body.clientWidth) {
			if (document.body.clientWidth > 0
					&& document.body.clientWidth < sw_min)
				sw_min = document.body.clientWidth;
			if (document.body.clientHeight > 0
					&& document.body.clientHeight < sh_min)
				sh_min = document.body.clientHeight;
		}
		if (sw_min == 999999 || sh_min == 999999) {
			sw_min = 800;
			sh_min = 600;
		}
		swide = sw_min;
		shigh = sh_min;
	}

	function createDiv(height, width) {
		var div = document.createElement("div");
		div.style.position = "absolute";
		div.style.height = height + "px";
		div.style.width = width + "px";
		div.style.overflow = "hidden";
		return (div);
	}

	function newColour() {
		var c = new Array();
		c[0] = 255;
		c[1] = Math.floor(Math.random() * 256);
		c[2] = Math.floor(Math.random() * (256 - c[1] / 2));
		c.sort(function() {
			return (0.5 - Math.random());
		});
		return ("rgb(" + c[0] + ", " + c[1] + ", " + c[2] + ")");
	}
</script>





<body>
	<div class="container">
		<div class="wrapper">
			<div class="window" style="width: 800px">
				<div class="title-bar">
					<div class="title-bar-text">아이디어 토론방</div>
					<div class="title-bar-controls">
						<button aria-label="Minimize"></button>
						<button aria-label="Maximize"></button>
						<button aria-label="Close"></button>
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
										<th style="width: 1200px">제목</th>
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
	<footer class="main_footer"">
		<div class="window" id="icons" style="width: 800px; display: block;"
			align="center">
			<a href=""><img src="./img/dfsfg.png" id="fire" width="50" alt=""></a>
			<a href="goIdea.do"><img src="./img/123.png" id="idea" width="40"
				alt=""></a> <a href="goMain.do"><img src="./img/dff.gif"
				id="goMain" width="50" alt="error"></a> <a href="goRecruit.do"><img
				src="./img/xml-0.png" id="job" width="40" alt=""></a> <a
				href="goMyPage.do"><img src="./img/icon_15.png" id="my_page"
				width="40" alt=""></a> <a href=""><img src="./img/sfsdffd.png"
				id="message" alt="" width="30"></a>
		</div>
	</footer>
	<script src="./js/index.js"></script>
</body>
</html>