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
<link rel="stylesheet" href="./css/login.css">
<link rel="stylesheet" href="./css/mypage.css">
<style type="text/css">
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
}
::-webkit-scrollbar-button:start:increment, 
::-webkit-scrollbar-button:end:decrement {
					/*  스크롤의 화살표가 포함된 영역   */
  display:none !important;
}
</style>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript" src="./js/mousePointer.js"></script>
<title>Hello IT</title>
</head>
<body>
	<%
	// session 에서 user_info 가져오기
	UserInfo info = (UserInfo) session.getAttribute("info");
	
	// request 영역에서 list 꺼내서 출력하기
	List<PostInfo> ppList = (List<PostInfo>) request.getAttribute("ppList");
	%>
<%-- <a href="goMessage.do" style="position:fixed; top:0;">테스트</a>
<a href="goMain.do?u_email=<%=info.getU_email()%>" style="position:fixed; top: 30px">맞춤형게시물조회</a> --%>
	
<div class="container">
	<div class="wrapper">
		<div class="window" style="width: 800px;position: sticky; top: 0;" align="center">
		<div class="window" align="center">
			<div class="title-bar">
				<div class="title-bar-text">Hello IT</div>
					<div class="title-bar-controls">
						<button><a href ="logout.do">Logout</a></button>
						<button aria-label="Minimize"></button>
						<button aria-label="Maximize"></button>
						<button aria-label="Close"></button>
					</div>
				</div>
		</div>
		<%-- 네이버 구글 유튜브 검색 창 -----------------------------------  --%>
		<div class="window" ><!--style="--width: 400px"-->
			<div class="title-bar">
				<div class="title-bar-text">검색창</div>
			</div>
			<div class="window-body" style="display:flex">
				<img src="./img/comm.gif" width="50" alt="">
				<p></p>
				<ul style="list-style: none; display:flex; margin-block: auto;">
					<li style="padding:0 10px">
						<form action="https://search.naver.com/search.naver" method="GET" target="_blank">
							<input type="text" placeholder="Naver" name="query">
							<input id="btn" class="Button" type="submit" value="검색">
						</form>
					</li>
					<li style="padding:0 10px">
						<form action="https://www.google.com/search" method="GET" target="_blank">
							<input type="search" placeholder="Google" name="q">
							<button id="btn" class="Button" type="submit">검색</button>
						</form>
					</li>
					<li style="padding:0 10px">
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
			<div class="window" style="position:sticky; top:131.2px; margin:-3px">
				<div class="title-bar">
				<div class="title-bar-text">인기 게시물</div>
				<div>
					<form action="goCtpSearchMain.do" style="display:flex;">
						<input type="hidden" name="u_email" value="<%=info.getU_email()%>">
						<input type="text" style="width: 150pt; height: 15pt;" placeholder="찾고싶은 게시물을 검색하세요" name="search_word"> 
						<input type="submit" style="width: 30pt; height: 15pt;" value="🔍">
					</form>
				</div>
				<div></div>
				</div>
			</div>
		</div>
		<div class="window-body main-content">
			<%for(int i = 0; i < ppList.size(); i++){ %>
			<div id="checkPost" class="window posted" style="width: 700px">
				<div class="title-bar">
					<div class="title-bar-text"><%=ppList.get(i).getPost_title()%></div>
				</div>
			
				<div class="window-body">
					<table class="board_list" id="list" bgcolor="white">
						<tr>
							<td id="user">작성자</td>
							<td style="width: 650px text-align:'';"><a href="goUserPage.do?u_email=<%=ppList.get(i).getU_email()%>"><%=ppList.get(i).getU_name()%></a></td>
						</tr>
						<tr>
							<td colspan="2">내용</td>
						</tr>
						<tr>
							<td colspan="2" align="center"><img alt=""
								src="img/<%=ppList.get(i).getPost_file()%>"><br><br> <b><%=ppList.get(i).getPost_content()%></b>
							</td>
						</tr>
						<%
							PostInfoDAO daoTag = new PostInfoDAO();
							List<Tag> list2 = daoTag.postTagView(ppList.get(i).getPost_seq());
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
					<a href="mainBookmark.do?req_page=popPostMain&post_seq=<%=ppList.get(i).getPost_seq()%>
					&u_email=<%=info.getU_email()%>">
						<button	id="btn">
							<%=ppList.get(i).getBookmarks()%>
							<img src="./img/북마크.png" width="15" alt="">
						</button>
					</a>
					</p>
				<%-- 좋아요 기능 --%>
					<p class="status-bar-field">
						<a href="mainLike.do?req_page=popPostMain&post_seq=<%=ppList.get(i).getPost_seq()%>&u_email=<%=info.getU_email()%>">
						<button	id="btn"><%=ppList.get(i).getLikes()%> 💖
						</button></a>
				<%-- 좋아요 기능 끝 --%>
					</p>
					<form action="mainCmt.do">
						<input type="hidden" name="req_page" value="popPostMain">
						<input type="hidden" name="post_seq" value="<%=ppList.get(i).getPost_seq()%>">
						<input type="hidden" name="u_email" value="<%=info.getU_email()%>">
						<p class="status-bar-field">
						<input type="text" name="cmt_content" placeholder="댓글"
							style="width:360px">
						<input type="submit" value="등록">
					</p>
					</form>
				
					
					<p class="status-bar-field"><a href=""><button id="btn">댓글<%=ppList.get(i).getCmts()%> </button></a></p>
				
				<%
				// comment 출력
				CommentInfoDAO dao = new CommentInfoDAO();
				List<CommentInfo> cmtList = dao.commentInfoList(ppList.get(i).getPost_seq());
				%>
			</div>
			<%for (int j = 0; j < cmtList.size(); j++) {%>			
			<table class="board_list" width=700>
				<tr style="width: 0px; padding: 0px;">
					<%-- <td colspan="5"><b><%=cmtList.get(j).getU_name()%></b></td> --%>
					<td><a href="goUserPage.do?u_email=<%=cmtList.get(j).getU_email()%>"><b><%=cmtList.get(j).getU_name()%></b></a></td>
					<td style="text-align:left; padding:5px;" colspan="6"><%=cmtList.get(j).getCmt_content()%></td>
					<td>
					<a href="mainCmtLike.do?req_page=popPostMain&cmt_seq=<%=cmtList.get(j).getCmt_seq()%>&u_email=<%=info.getU_email()%>">
					<button	id="btn"><%=cmtList.get(j).getCmt_likes()%> 💖
					</button></a>
					</td>
				</tr>
				<tr>
				</tr>
			<%};%>	
			</table>
		</div>
		<%};%>
		</div>
		<%-- -------------------------------------------------------------------------------- --%>
		
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
	<script src="./js/move.js"></script>
</body>
</html>