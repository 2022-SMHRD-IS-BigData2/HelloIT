<%@page import="com.smhrd.entity.CommentInfo"%>
<%@page import="com.smhrd.dao.CommentInfoDAO"%>
<%@page import="com.smhrd.entity.PostInfo"%>
<%@page import="java.util.List"%>
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

	<%
	// session 에서 user_info 가져오기
	UserInfo info = (UserInfo) session.getAttribute("info");
	
	// request 영역에서 list 꺼내서 출력하기
	List<PostInfo> list = (List<PostInfo>) request.getAttribute("list");
	%>
	
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
		<div class="window" style="position:sticky; top:26.6px"><!--style="--width: 400px"-->
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
			<div class="title-bar" style="position:sticky; top:123.2px;">
				<div class="title-bar-text">맞춤형</div>
				<div>
					<input type="text" style="width: 150pt; height: 15pt;" placeholder="검색창" name="" id=""> 
					<input type="button" style="width: 30pt; height: 15pt;" value="🔍">
				</div>
				<div></div>
			</div>
			<%for(int i = 0; i < list.size(); i++){ %>
		<div class="window" style="width: 700px">
			<div class="title-bar">
				<div class="title-bar-text"><%=list.get(i).getPost_title()%></div>
			</div>

			<div class="window-body">
				<table id="list" border="1" bgcolor="white">
					<tr>
						<td>작성자</td>
						<td style="width: 650px"><%=list.get(i).getU_name()%></td>
					</tr>
					<tr>
						<td colspan="2">내용</td>
					</tr>
					<tr>
						<td colspan="2" align="center"><img alt="이미지 없음"
							src="img/<%=list.get(i).getPost_file()%>"><br><br> <b><%=list.get(i).getPost_content()%></b>
						</td>
					</tr>
					<tr>
						<td colspan="2">#해 #시 #태 #그</td>
					</tr>
				</table>
			</div>

			<div class="status-bar">
				<p class="status-bar-field">
					<a href="mainBookmark.do?post_seq=<%=list.get(i).getPost_seq()%>
					&u_email=<%=info.getU_email()%>">
					<button	id="btn">
						<%=list.get(i).getBookmarks()%>
						<img src="./img/북마크.png" width="15" alt="">
					</button>
					</a>
				</p>
				<p class="status-bar-field">
					<a href="mainLike.do?post_seq=<%=list.get(i).getPost_seq()%>
					&u_email=<%=info.getU_email()%>">
					<button	id="btn"><%=list.get(i).getLikes()%> 💖
					</button>
					</a>
				</p>
				<form action="mainCmt.do">
					<input type="hidden" name="post_seq" value="<%=list.get(i).getPost_seq()%>">
					<input type="hidden" name="u_email" value="<%=info.getU_email()%>">
					<p class="status-bar-field">
						<input type="text" name="cmt_content" placeholder="댓글"
						style="width:360px">
						<input type="submit" value="등록">
					</p>
				</form>
				<a href="">
					
					<p class="status-bar-field"><button id="btn">댓글<%=list.get(i).getCmts()%> </button></p>
				</a>
				<%
				// comment 출력
				CommentInfoDAO dao = new CommentInfoDAO();
				List<CommentInfo> cmtList = dao.commentInfoList(list.get(i).getPost_seq());
				%>
			</div>
			<%for (int j = 0; j < cmtList.size(); j++) {%>			
			<table border=1 width=700>
				<tr>
					<td colspan="5"><b><%=cmtList.get(j).getU_name()%></b></td>
					<td>좋아요 [<%=cmtList.get(j).getCmt_likes()%>]
					</td>
				</tr>
				<tr>
					<td colspan="6" height="50"><%=cmtList.get(j).getCmt_content()%></td>
				</tr>
			<%}%>	
			</table>
		</div>
		<%}%>
		</div>
		<%-- -------------------------------------------------------------------------------- --%>
		<br> 
		<a href="goBoard.do"><button id="btn">게시판</button></a>
		</div>
		<footer class="main_footer">
		<div class="window" id="icons" style="width: 800px" align="center">
			<a href=""><img src="./img/dfsfg.png" id="fire" width="50" alt=""></a> 
			<a href="goIdea.do"><img src="./img/123.png" id="idea" width="40" alt=""></a> 
			<a href="goMain.do"><img src="./img/dff.gif" id="goMain" width="50" alt="error"></a> 
			<a href="goMainWrite.do"><img src="./img/dff.gif" id="goMain" width="50" alt="error"></a> 
			<a href="goRecruit.do"><img src="./img/xml-0.png" id="job" width="40" alt=""></a> 
			<a href="goMyPage.do"><img src="./img/icon_15.png" id="my_page" width="40" alt=""></a> 
			<a href=""><img src="./img/sfsdffd.png" id="message" alt="" width="30"></a>
		</div>
	</footer>
	</div>
</div>
	<script src="./js/move.js"></script>
</body>
</html>