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
		<link rel="stylesheet" href="assetsBoard/css/main.css" />
		<link rel="stylesheet" href="assetsBoard/css/board.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
</head>
<body>

			테스트용 게시글 조회 페이지
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
			
			<br>
			<div id = "board">
				<form action = "comment.do">
				<input type="hidden" name="post_seq" value="<%=post_seq%>">
				<input type="hidden" name="u_email" value="<%=info.getU_email()%>">
				<table id="list" border="1">
					<tr>
						<td>제목</td>
						<td><%=PostInfo.getPost_title()%></td>
					</tr>
					<tr>
						<td>좋아요수</td>
						<td><%=postlikes%></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><%=PostInfo.getU_email()%></td>
					</tr>
					<tr>
						<td colspan="2">내용</td>
					</tr>
					<tr>
						<td colspan="2">
							<img alt="이미지 없음" src="images/<%=PostInfo.getPost_file()%>"><br>
							<%=PostInfo.getPost_content()%>
						</td>
					</tr>
					<tr>
						<td colspan="2">댓글</td>
					</tr>
					<tr>
						<td><input type="text" name="cmt_content"></td>
						<td><input type="submit" value="댓글 등록"></td>
					</tr>
					<%for(int i = 0; i < list.size(); i++){%>
					<tr>
						<td><%=list.get(i).getU_email()%></td>
						<td>좋아요 [<%=list.get(i).getCmt_likes()%>]</td>
					</tr>
					<tr>
						<td colspan="2"><%=list.get(i).getCmt_content()%></td>
					</tr>
					<%} %>
				</table>
				</form>
				<a href="goBoard.do"><button>뒤로가기</button></a>
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