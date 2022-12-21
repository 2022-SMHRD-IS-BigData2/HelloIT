<%@page import="com.smhrd.entity.CommentInfo"%>
<%@page import="com.smhrd.entity.UserInfo"%>
<%@page import="com.smhrd.entity.PostInfo"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Forty by HTML5 UP</title>
<meta charset="utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="assetsPostInfo/css/main.css" />
<link rel="stylesheet" href="assetsPostInfo/css/PostInfo.css" />
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
</head>
<body>
	<%
	// request 영역에서 게시글 정보 가져오기
	PostInfo PostInfo = (PostInfo) request.getAttribute("PostInfo");
	// 세션에서 사용자 정보 가져오기
	UserInfo info = (UserInfo)session.getAttribute("info");
	// request 영역에서 list 꺼내서 출력하기
	/* List<CommentInfo> list = (List<CommentInfo>) request.getAttribute("list"); */
	%>
	
	<div id="PostInfo">
		<form action="comment.do">
		<table id="list">
			<tr>
				<td>제목</td>
				<td><%=PostInfo.getPost_title()%></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><%=PostInfo.getU_email()%></td>
			</tr>
			<tr>
				<td colspan="2">내용</td>
			</tr>
			<tr>
				<td colspan="2"><img alt="이미지 없음"
					src="images/<%=PostInfo.getPost_file()%>"><br> <%=PostInfo.getPost_content()%>
				</td>
			</tr>
			<tr>
				<td colspan="2">댓글</td>
			</tr>
			<tr>
				<td><input readonly value=<%=info.getU_email()%> type="text" name="u_email"></td>
				<td><input type="text" name="cmt_content"><input type="submit" value="댓글 등록"></td>
			</tr>
			<tr>
			</tr>
			<tr>
				<td colspan="2"><a href="boardMain.jsp"><button>뒤로가기</button></a></td>
			</tr>
		</table>
		</form>
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