<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<script src="./js/jquery-3.1.1.min.js"></script>
	<link rel="stylesheet" href="https://unpkg.com/98.css" />

	<style>
		body {
			height: 100vh;
			background: url(./img/KakaoTalk_20221221_111631302.webp) no-repeat center;
			background-size: cover;
		}

		table {
			width: 600px;
			margin-left: auto;
			margin-right: auto;
		}

		#job-table {
			display: flex;
			flex-direction: column;
		}

		body {
			margin-top: 100px;
			font-family: 'Trebuchet MS', serif;
			line-height: 1.6
		}

		.container {
			width: 650px;
			margin: 0 auto;
		}


		ul.tabs {
			margin: 0px;
			padding: 0px;
			list-style: none;
		}

		ul.tabs li {
			background: none;
			color: #222;
			display: inline-block;
			padding: 10px 15px;
			cursor: pointer;
		}

		ul.tabs li.current {
			background: #ededed;
			color: #222;
		}

		.tab-content {
			display: none;
			background: #ededed;
			padding: 15px;
		}

		.tab-content.current {
			display: inherit;
		}
	</style>
</head>
<script type="text/javascript">

var colour="random"; 
var sparkles=50;


var x=ox=400;
var y=oy=300;
var swide=800;
var shigh=600;
var sleft=sdown=0;
var tiny=new Array();
var star=new Array();
var starv=new Array();
var starx=new Array();
var stary=new Array();
var tinyx=new Array();
var tinyy=new Array();
var tinyv=new Array();

window.onload=function() { if (document.getElementById) {
  var i, rats, rlef, rdow;
  for (var i=0; i<sparkles; i++) {
    var rats=createDiv(3, 3);
    rats.style.visibility="hidden";
    rats.style.zIndex="999";
    document.body.appendChild(tiny[i]=rats);
    starv[i]=0;
    tinyv[i]=0;
    var rats=createDiv(5, 5);
    rats.style.backgroundColor="transparent";
    rats.style.visibility="hidden";
    rats.style.zIndex="999";
    var rlef=createDiv(1, 5);
    var rdow=createDiv(5, 1);
    rats.appendChild(rlef);
    rats.appendChild(rdow);
    rlef.style.top="2px";
    rlef.style.left="0px";
    rdow.style.top="0px";
    rdow.style.left="2px";
    document.body.appendChild(star[i]=rats);
  }
  set_width();
  sparkle();
}}

function sparkle() {
  var c;
  if (Math.abs(x-ox)>1 || Math.abs(y-oy)>1) {
    ox=x;
    oy=y;
    for (c=0; c<sparkles; c++) if (!starv[c]) {
      star[c].style.left=(starx[c]=x)+"px";
      star[c].style.top=(stary[c]=y+1)+"px";
      star[c].style.clip="rect(0px, 5px, 5px, 0px)";
      star[c].childNodes[0].style.backgroundColor=star[c].childNodes[1].style.backgroundColor=(colour=="random")?newColour():colour;
      star[c].style.visibility="visible";
      starv[c]=50;
      break;
    }
  }
  for (c=0; c<sparkles; c++) {
    if (starv[c]) update_star(c);
    if (tinyv[c]) update_tiny(c);
  }
  setTimeout("sparkle()", 40);
}

function update_star(i) {
  if (--starv[i]==25) star[i].style.clip="rect(1px, 4px, 4px, 1px)";
  if (starv[i]) {
    stary[i]+=1+Math.random()*3;
    starx[i]+=(i%5-2)/5;
    if (stary[i]<shigh+sdown) {
      star[i].style.top=stary[i]+"px";
      star[i].style.left=starx[i]+"px";
    }
    else {
      star[i].style.visibility="hidden";
      starv[i]=0;
      return;
    }
  }
  else {
    tinyv[i]=50;
    tiny[i].style.top=(tinyy[i]=stary[i])+"px";
    tiny[i].style.left=(tinyx[i]=starx[i])+"px";
    tiny[i].style.width="2px";
    tiny[i].style.height="2px";
    tiny[i].style.backgroundColor=star[i].childNodes[0].style.backgroundColor;
    star[i].style.visibility="hidden";
    tiny[i].style.visibility="visible"
  }
}

function update_tiny(i) {
  if (--tinyv[i]==25) {
    tiny[i].style.width="1px";
    tiny[i].style.height="1px";
  }
  if (tinyv[i]) {
    tinyy[i]+=1+Math.random()*3;
    tinyx[i]+=(i%5-2)/5;
    if (tinyy[i]<shigh+sdown) {
      tiny[i].style.top=tinyy[i]+"px";
      tiny[i].style.left=tinyx[i]+"px";
    }
    else {
      tiny[i].style.visibility="hidden";
      tinyv[i]=0;
      return;
    }
  }
  else tiny[i].style.visibility="hidden";
}

document.onmousemove=mouse;
function mouse(e) {
  if (e) {
    y=e.pageY;
    x=e.pageX;
  }
  else {
    set_scroll();
    y=event.y+sdown;
    x=event.x+sleft;
  }
}

window.onscroll=set_scroll;
function set_scroll() {
  if (typeof(self.pageYOffset)=='number') {
    sdown=self.pageYOffset;
    sleft=self.pageXOffset;
  }
  else if (document.body && (document.body.scrollTop || document.body.scrollLeft)) {
    sdown=document.body.scrollTop;
    sleft=document.body.scrollLeft;
  }
  else if (document.documentElement && (document.documentElement.scrollTop || document.documentElement.scrollLeft)) {
    sleft=document.documentElement.scrollLeft;
    sdown=document.documentElement.scrollTop;
  }
  else {
    sdown=0;
    sleft=0;
  }
}

window.onresize=set_width;
function set_width() {
  var sw_min=999999;
  var sh_min=999999;
  if (document.documentElement && document.documentElement.clientWidth) {
    if (document.documentElement.clientWidth>0) sw_min=document.documentElement.clientWidth;
    if (document.documentElement.clientHeight>0) sh_min=document.documentElement.clientHeight;
  }
  if (typeof(self.innerWidth)=='number' && self.innerWidth) {
    if (self.innerWidth>0 && self.innerWidth<sw_min) sw_min=self.innerWidth;
    if (self.innerHeight>0 && self.innerHeight<sh_min) sh_min=self.innerHeight;
  }
  if (document.body.clientWidth) {
    if (document.body.clientWidth>0 && document.body.clientWidth<sw_min) sw_min=document.body.clientWidth;
    if (document.body.clientHeight>0 && document.body.clientHeight<sh_min) sh_min=document.body.clientHeight;
  }
  if (sw_min==999999 || sh_min==999999) {
    sw_min=800;
    sh_min=600;
  }
  swide=sw_min;
  shigh=sh_min;
}

function createDiv(height, width) {
  var div=document.createElement("div");
  div.style.position="absolute";
  div.style.height=height+"px";
  div.style.width=width+"px";
  div.style.overflow="hidden";
  return (div);
}

function newColour() {
  var c=new Array();
  c[0]=255;
  c[1]=Math.floor(Math.random()*256);
  c[2]=Math.floor(Math.random()*(256-c[1]/2));
  c.sort(function(){return (0.5 - Math.random());});
  return ("rgb("+c[0]+", "+c[1]+", "+c[2]+")");
}

</script>


<body>
	<center>
	<div class="window" style="margin: 10px; width: 800px">
		<div class="title-bar">
			<div class="title-bar-text">
				채용 공고
			</div>
		</div>
		<div class="container">
			<table>
				<tr>
					<td colspan="2">
						<h5 align="center"> 채용 내용을 클릭하면 해당 공고로 이동합니다.</h5>
					</td>

				</tr>
			</table>
			<input type="text" placeholder="원하는 채용을 검색하세요" style="width:100px;height: 20px; font: size 10px;;">
			<button>검색</button>
			<BR></BR>


			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1">사람인</li>
				<li class="tab-link" data-tab="tab-2">잡코리아</li>

			</ul>

			<div id="tab-1" class="tab-content current">

				<div id="job-table">


					<table style="width: 600px; height: 100px; overflow: auto" border="1px">
						<tbody>
							<thead>
								<tr height="30px">
									<th>기업명</th>
									<th>채용 내용</th>
									<th>경력/학력/지역</th>
									<th>마감일</th>
								</tr>
							</thead>
							<tr>
								<td>사+크롤링(회사)</td>
								<td> <a href="#">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>

						</tbody>
					</table>
				</div>

				<br>
				<div class="pagination_section">
					<a href="#">
						<< Previous</a>
							<a href="#" title="">1</a>
							<a href="#" title="">2</a>
							<a href="#" title="">3</a>
							<a href="#" title="">4</a>
							<a href="#" title="">5</a>
							<a href="#" title="">6</a>
							<a href="#" title="">7</a>
							<a href="#" title="">8</a>
							<a href="#" title="">9</a>
							<a href="#" title="">10</a>
							<a href="#">Next >></a>
				</div>






			</div>
			<div id="tab-2" class="tab-content">
				<div id="job-table">


					<table style="width: 600px; height: 100px; overflow: auto" border="1px">
						<tbody>
							<thead>
								<tr height="30px">
									<th>기업명</th>
									<th>채용 내용</th>
									<th>경력/학력/지역</th>
									<th>마감일</th>
								</tr>
							</thead>
							<tr>
								<td>잡+크롤링(회사)</td>
								<td> <a href="#">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>

						</tbody>
					</table>
				</div>

				<br>
				<div class="pagination_section">
					<a href="#">
						<< Previous</a>
							<a href="#" title="">1</a>
							<a href="#" title="">2</a>
							<a href="#" title="">3</a>
							<a href="#" title="">4</a>
							<a href="#" title="">5</a>
							<a href="#" title="">6</a>
							<a href="#" title="">7</a>
							<a href="#" title="">8</a>
							<a href="#" title="">9</a>
							<a href="#" title="">10</a>
							<a href="#">Next >></a>
				</div>
				
			</div>


		</div>


		<script>

			$(document).ready(function () {

				$('ul.tabs li').click(function () {
					var tab_id = $(this).attr('data-tab');

					$('ul.tabs li').removeClass('current');
					$('.tab-content').removeClass('current');

					$(this).addClass('current');
					$("#" + tab_id).addClass('current');
				})

			})

		</script>

		<a href="http://www.naver.com/"><img src="icons/KakaoTalk_20221221_163912885_01.png" alt="인기게시글"
				width="30px"></a>
		<a href="#"> <img src="icons/KakaoTalk_20221221_163912885_04.png" alt="아이디어" width="30px"></a>
		<a href="#"> <img src="icons/KakaoTalk_20221221_163912885.png" alt="메인홈" width="30px"></a>
		<a href="#"><img src="icons/KakaoTalk_20221221_163912885_02.png" alt="채용공고" width="30px"></a>
		<a href="#"><img src="icons/KakaoTalk_20221221_163912885_03.png" alt="개인정보" width="30px"></a>
	</center>
</body>

</html>