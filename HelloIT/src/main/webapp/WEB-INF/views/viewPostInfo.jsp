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
<script type="text/javascript" src="./js/mousePointer.js"></script>
</head>
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

#btn {
	width: 20px;
	height: 10px;
	border-radius: 40px;
}
</style>
<body>

	테스트용 게시글 조회 페이지
	<br>
	<%
	// request 영역에서 게시글 정보 가져오기
	PostInfo PostInfo = (PostInfo) request.getAttribute("PostInfo");
	int postlikes = (int) request.getAttribute("postlikes");
	int bookmarks = (int) request.getAttribute("bookmarks");

	// request 영역에서 list 꺼내서 출력하기
	List<CommentInfo> list = (List<CommentInfo>) request.getAttribute("list");

	// session 에서 user_info 가져오기
	UserInfo info = (UserInfo) session.getAttribute("info");

	int post_seq = PostInfo.getPost_seq();
	%>

	<div class="window-body" align-self:center; align="center">

		<div class="window" style="width: 600px">
			<div class="title-bar">
				<div class="title-bar-text"><%=PostInfo.getPost_title()%></div>
				<a href="goBoard.do"><button>뒤로가기</button></a>
			</div>

			<div class="window-body">
				<input type="hidden" name="post_seq" value="<%=post_seq%>">
				<input type="hidden" name="u_email" value="<%=info.getU_email()%>">
				<table id="list" border="1" bgcolor="white">
					<tr>
						<td>작성자</td>
						<td style="width: 500px"><%=PostInfo.getU_name()%></td>
					</tr>
					<tr>
						<td colspan="2">내용</td>
					</tr>
					<tr>
						<td colspan="2"><img alt="이미지 없음"
							src="./img/<%=PostInfo.getPost_file()%>"><br> <%=PostInfo.getPost_content()%>
						</td>
					</tr>
					<tr>
						<td colspan="2">#해 #시 #태 #그</td>
					</tr>
				</table>
			</div>

			<div class="status-bar">
				<p class="status-bar-field">
					<a
						href="bookmark.do?post_seq=<%=post_seq%>&u_email=<%=info.getU_email()%>"><button
							id="btn">
							<%=bookmarks%>
							<img src="./img/북마크.png" width="15" alt="">
						</button></a>
				</p>
				<p class="status-bar-field">
					<a
						href="like.do?post_seq=<%=post_seq%>&u_email=<%=info.getU_email()%>"><button
							id="btn"><%=postlikes%>
							💖
						</button></a>
				</p>
				<form action="comment.do">
					<input type="hidden" name="post_seq" value="<%=post_seq%>">
					<input type="hidden" name="u_email" value="<%=info.getU_email()%>">
					<p class="status-bar-field">
						<input type="text" name="cmt_content" placeholder="댓글"> <input
							type="submit" value="등록">
					</p>
				</form>
				<a href="">
					<p class="status-bar-field">댓글<%=PostInfo.getCmts()%></p>
				</a>
				<%
				for (int i = 0; i < list.size(); i++) {
				%>
			</div>
			
			<table border=1 width=600>
				<tr>
					<td colspan="5"><b><%=list.get(i).getU_name() %></b></td>
					<td>좋아요 [<%=list.get(i).getCmt_likes()%>]
					</td>
				</tr>
				<tr>
					<td colspan="6" height="50"><%=list.get(i).getCmt_content()%></td>
				</tr>
				<%
				}
				%>
			</table>

		</div>
	</div>

	<br>
	<br>
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