<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.entity.Tag"%>
<%@page import="com.smhrd.dao.PostInfoDAO"%>
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
<script type="text/javascript" src="./js/mousePointer.js"></script>
<style type="text/css">
	.window.posted{
		margin:4px;
	}
</style>
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

	<%
	// session 에서 user_info 가져오기
	UserInfo info = (UserInfo) session.getAttribute("info");
	
	// request 영역에서 list 꺼내서 출력하기
	List<PostInfo> list = (List<PostInfo>) request.getAttribute("ctpList");
	%>
	
<div class="container">
	<div class="wrapper">
		<div class="window" style="width: 800px; position: sticky; top: 0;" align="center">
			<div class="title-bar">
				<div class="title-bar-text">HEllo iT</div>
					<div class="title-bar-controls">
						<button><a href ="logout.do">Logout</a></button>
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
		<div class="window" style="padding-bottom:20px"><!-- style="width: 600px" -->
			<div class="window" style="position:sticky; top:118.2px; margin:-3px">
				<div class="title-bar">
				<div class="title-bar-text">맞춤형</div>
				<div>
					<input type="text" style="width: 150pt; height: 15pt;" placeholder="검색창" name="" id=""> 
					<input type="button" style="width: 30pt; height: 15pt;" value="🔍">
				</div>
				<div></div>
				</div>
			</div>
			<%for(int i = 0; i < list.size(); i++){ %>
		<div id="checkPost" class="window posted" style="width: 700px">
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
						<td colspan="2" align="center"><img alt=""
							src="img/<%=list.get(i).getPost_file()%>"><br><br> <b><%=list.get(i).getPost_content()%></b>
						</td>
					</tr>
					<%
						PostInfoDAO daoTag = new PostInfoDAO();
						List<Tag> list2 = daoTag.postTagView(list.get(i).getPost_seq());
					%>
					<tr style="height: 20px">
						<td colspan="2">
						<%for(int k = 0; k < list2.size(); k++){ %>
						<a href="goTagMain.do?tag_seq=<%=list2.get(k).getTag_seq()%>"><%='#'+list2.get(k).getTag_content()%></a>
						<%};%>
						</td>
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
				<%-- 좋아요 기능 --%>
				<p class="status-bar-field">
					<a href="mainLike.do?post_seq=<%=list.get(i).getPost_seq()%>&u_email=<%=info.getU_email()%>">
					<button	id="btn"><%=list.get(i).getLikes()%> 💖
					</button></a>
				<%-- 좋아요 기능 끝 --%>
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
				
					
					<p class="status-bar-field"><a href=""><button id="btn">댓글<%=list.get(i).getCmts()%> </button></a></p>
				
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
					<td>
					<a href="mainCmtLike.do?cmt_seq=<%=cmtList.get(j).getCmt_seq()%>&u_email=<%=info.getU_email()%>">
					<button	id="btn"><%=cmtList.get(j).getCmt_likes()%> 💖
					</button></a>
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
		</div>
		<footer class="main_footer">
		<div class="window" id="icons" style="width: 800px" align="center">
			<a href=""><img src="./img/dfsfg.png" id="fire" width="50" alt=""></a> 
			<a href="goIdea.do"><img src="./img/123.png" id="idea" width="40" alt=""></a> 
			<a href="goMain.do"><img src="./img/dff.gif" id="goMain" width="50" alt="error"></a> 
			<a href="goMainWrite.do"><img src="./img/dfsee.gif" id="goMain" width="41" alt="error"></a> 
			<a href="goRecruit.do"><img src="./img/xml-0.png" id="job" width="40" alt=""></a> 
			<a href="goMyPage.do"><img src="./img/icon_15.png" id="my_page" width="40" alt=""></a> 
			<a href=""><img src="./img/sfsdffd.png" id="message" alt="" width="30"></a>
		</div>
	</footer>
	</div>
</div>
	<script src="./js/move.js"></script>
	<script>
		var test = '<%=info.getU_email()%>'
		console.log(test);
	</script>
</body>
</html>