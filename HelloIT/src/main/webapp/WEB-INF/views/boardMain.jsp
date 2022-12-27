<%@page import="com.smhrd.entity.UserInfo"%>
<%@page import="com.smhrd.entity.CommentInfo"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.entity.PostInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="./js/mousePointer.js"></script>
</head>
<body>
	test용 게시판 boardMain.jsp
	
	<%
	// request 영역에서 list 꺼내서 출력하기
	List<PostInfo> list = (List<PostInfo>) request.getAttribute("list");
	%>
		<div id="board">
		<table id="list" border="1">
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>시간</td>
			</tr>

			<%
			for (PostInfo postinfo : list) {
			%>
			<tr>
				<td><%=postinfo.getPost_seq()%></td>
				<td><a href="goView.do?post_seq=<%=postinfo.getPost_seq()%>"><%=postinfo.getPost_title()%></a></td>
				<td><%=postinfo.getU_email()%></td>
				<td><%=postinfo.getPost_dt()%></td>
			</tr>
			<%
			}
			%>

		</table>

		<a href="goMain.do"><button id="writer">홈으로가기</button></a>
		<a href="goWrite.do"><button id="writer">작성하러가기</button></a>
	</div>
	
	
</body>
</html>