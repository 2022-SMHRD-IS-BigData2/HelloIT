<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hello IT</title>

<link rel="stylesheet" href="https://unpkg.com/98.css" />
<link rel="stylesheet" href="./css/style.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
.wrap{
	position:absolute;	
 	top: 50%;
 	left: 50%;
 	transform: translate(-50%, -50%);
}
.header{
	cursor: default;
	width: 292px;
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
<div class="container">
	<div class="wrapper">
			<div id="joinMain" class="window wrap" style="width: 300px">
				<div class="title-bar header">
					<div class="title-bar-text">회원가입</div>
					<div class="title-bar-controls">
						<button aria-label="Close" onclick="location.href = 'goLogin.do'"></button>
					</div>
				</div>
		<form action="join.do" method="post">
				<table style="margin:auto;">
					<tr>
						<td colspan="2" align="center"><img src="./img/com.gif" width="250" alt=""></td>
					</tr>
					<tr>
						<td align="right">아이디(이메일) :</td>
						<td><input type="email" name="u_email"></td>
					</tr>

					<tr>
						<td align="right">비밀번호 :</td>
						<td><input id="pw1" type="password" name="u_pw"></td>
					</tr>
					<tr>
						<td align="right">비밀번호확인 :</td>
						<td><input id="pw2" type="password"></td>
					</tr>
					<tr>
						<td align="right">이름 :</td>
						<td><input type="text" name="u_name"></td>
					</tr>
					<tr>
						<td align="right">닉네임 :</td>
						<td><input type="text" name="u_nick"></td>
					</tr>
					<!-- <tr>
            <td colspan="2" >
                <h3>개인정보 </h3>
            </td>
 -->
					<tr>
						<td align="right">성별 :</td>

						<td><input id="man" type="radio" name="u_gender" value="M">
							<label for="man">남자</label> <input id="woman" type="radio"
							name="u_gender" value="W"> <label for="woman">여자</label>

						</td>
					</tr>
					<!-- <tr>
                <td align="right">전화번호 : </td>
                <td> <input type="tel" id="mobile" name="u_tel" class="int" maxlength="16" placeholder="숫자만 입력해주세요"> </td>
            </tr> -->
			<!-- 		<span class="error_next_box"></span> -->



					<tr>
						<td align="right">직업:</td>
						<td><select name="u_job">
								<option value="학생">학생</option>
								<option value="취업준비생">취업준비생</option>
								<option value="개발자">개발자</option>
								<option value="채용담당자">채용담당자</option>
						</select></td>
					</tr>

					<tr>
						<td align="right">생일:</td>
						<td><input type="date" name="u_birthdate"></td>

						<!--  <tr>
                <td colspan="2">
                    <h5 align="center"> 선호도 </h5>
                </td>

            </tr>


            <tr>
                <td align="right"> 관심분야 : </td>

                <td>

                    <input id="back" type="checkbox" name="hobby">
                    <label for="back">백엔드</label>
                    <input id="front" type="checkbox" name="hobby">
                    <label for="front">프론트엔드</label>
                    <input id="front" type="checkbox" name="hobby">
                    <label for="front">데이터분야</label>
                    <input id="etc" type="checkbox" name="hobby">
                    <label for="etc">기타</label>
                    </div>

                </td>
            </tr>
 -->
					<tr>
						<td colspan="2" align="center">
							<!-- <button onclick="location.href=''">가입하기</button> --> <input
							type="submit" value="가입하기"> <input type="reset"
							value="초기화">
						</td>

					</tr>
				</table>
		</form>
			</div>
	</div>
	</div>
		<div class="status-bar task-bar">
    <div class="status-bar-field">
    	<button>시작</button>
    </div>
    <div class="status-bar-field"><button id="logWinShow" class="showHide">회원 가입</button></div>
    <div class="status-bar-field" style="width: 70px;position: absolute;bottom: 3px; right: 3px;">
    	<div id="hms" align="center"></div>
    </div>
	</div>
	<script src="./js/move.js"></script>
    <script src="./js/showHideJoin.js"></script>
    <script src="./js/time.js"></script>
   	<script>
		
	</script>
</body>

</html>