<%@page import="com.smhrd.entity.UserInfo"%>
<%@page import="com.smhrd.entity.CommentInfo"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.entity.PostInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>Forty by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="https://unpkg.com/98.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
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

<style>

body {
    height: 100vh;
    background: url(./img/backck.webp) no-repeat center;
    background-size: cover;
}

.window {
    justify-content: space-between;
}  

td {
	width: 130px;
}

#btn{
    width: 20px;
        height: 10px;
       
        border-radius: 40px;
       }

</style>
<body>

			테스트용 게시글 조회 페이지<br>
			<%
			// request 영역에서 게시글 정보 가져오기
			PostInfo PostInfo = (PostInfo)request.getAttribute("PostInfo");
			int postlikes = (int)request.getAttribute("postlikes");
					
			// request 영역에서 list 꺼내서 출력하기
			List<CommentInfo> list = (List<CommentInfo>) request.getAttribute("list");
			
			// session 에서 user_info 가져오기
			UserInfo info = (UserInfo)session.getAttribute("info");
			
			int post_seq = PostInfo.getPost_seq();
			%>
			<a href="goBoard.do"><button>뒤로가기</button></a>
			<div class="window-body"  align-self:center; align="center">
            
            <div class="window" style="width: 600px" >
                <div class="title-bar">
                    <div class="title-bar-text">맞춤형</div>
                    <input type="text" style="width:150pt;height:15pt;"  placeholder= "검색창"  name="" id="">
                    <input type="button" style="width:30pt;height:15pt;" value="🔍">
                </div>
                
                <div class="window-body">
				<input type="hidden" name="post_seq" value="<%=post_seq%>">
				<input type="hidden" name="u_email" value="<%=info.getU_email()%>">
				<table id="list" border="1" bgcolor="white">
					<tr>
						<td>제목</td>
						<td colspan="3"><%=PostInfo.getPost_title()%></td>
						<td>작성자</td>
						<td><%=PostInfo.getU_email()%></td>
					</tr>
					<tr>
						<td colspan="6">내용</td>
					</tr>
					<tr>
						<td colspan="6">
							<img alt="이미지 없음" src="./img/<%=PostInfo.getPost_file()%>"><br>
							<%=PostInfo.getPost_content()%>
						</td>
					</tr>
					<tr>
						<td colspan="6"> #해 #시 #태 #그</td>
					</tr>
				</table>
                </div>
                
                <div class="status-bar">
                    <p class="status-bar-field"><button id="btn">  <img src="./img/공유.png" width="10" alt="">  </button></p>
                    <p class="status-bar-field"><button id="btn"> 0 <img src="./img/북마크.png" width="15" alt=""> </button></p>
                    <p class="status-bar-field"><a href="like.do?post_seq=<%=post_seq%>&u_email=<%=info.getU_email()%>"><button id="btn"><%=postlikes%>  💖</button></a></p>
                    <form action = "comment.do"> 
					<input type="hidden" name="post_seq" value="<%=post_seq%>">
					<input type="hidden" name="u_email" value="<%=info.getU_email()%>">
                    <p class="status-bar-field"><input type="text" name="cmt_content" placeholder= "댓글">
                    <input type="submit" value="등록"></p>
                    </form>
                    <a href=""> <p class="status-bar-field">댓글 n개</p></a>
                    <%for(int i = 0; i < list.size(); i++){%>
                </div>
                <table border=1 width=600>
					<tr>
						<td colspan="5"><%=list.get(i).getU_email()%></td>
						<td>좋아요 [<%=list.get(i).getCmt_likes()%>]</td>
					</tr>
					<tr>
						<td colspan="6" height="50"><%=list.get(i).getCmt_content()%></td>
					</tr>
					<%} %>
				</table>
                
            </div>
            </div>
            
            <br>
			<br>
			</div>
			<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="assets/js/main.js"></script>
</body>
</html>