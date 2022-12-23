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
		<link rel="stylesheet" href="./css/style.css">
</head>
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
			
			<div class="container">
			<div class="wrapper">
			<div class="window-body" align="center">
            
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
						<td><%=PostInfo.getU_name()%></td>
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
                <form action = "comment.do">
				<input type="hidden" name="post_seq" value="<%=post_seq%>">
				<input type="hidden" name="u_email" value="<%=info.getU_email()%>">
                <div class="status-bar">
                    <p class="status-bar-field"><button id="btn">  <img src="./img/공유.png" width="10" alt="">  </button></p>
                    <p class="status-bar-field"><button id="btn"> 0 <img src="./img/북마크.png" width="15" alt=""> </button></p>
                    <p class="status-bar-field"><button id="btn"><%=postlikes%>  💖</button></p> 
                    <p class="status-bar-field"><input type="text" name="cmt_content" placeholder= "댓글">
                    <input type="submit" value="등록"></p>
                    <p class="status-bar-field"><a href="">댓글 n개</a></p>
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
                </form>
            </div>
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