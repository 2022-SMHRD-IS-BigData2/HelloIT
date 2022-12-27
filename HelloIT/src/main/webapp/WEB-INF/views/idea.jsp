<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.dao.RecruitDAO"%>
<%@page import="com.smhrd.controller.GoRecruitCon"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.entity.Recruit"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<link rel="stylesheet" href="https://unpkg.com/98.css" />
	<link rel="stylesheet" href="./css/style.css">
	<link rel="stylesheet" href="./css/recruit.css">
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript" src="./js/mousePointer.js"></script>
</head>
<body>
<div class="container">
<div class="wrapper">
	<div class="window" style="width: 800px; position: sticky; top: 0;" align="center">
		<div class="title-bar" style="position:sticky; top:0">
			<div class="title-bar-text">아이디어 토론방</div>
			<div class="title-bar-controls">
				<button aria-label="Close" onclick="location.href='goMain.do'"></button>
			</div>
		</div>
		<div class="window-body">
			<input type="text" placeholder="여러 아이디어를 검색 하세요" style="width:150px;height: 20px; font: size 10px;;">
			<button>검색</button>
			<br>
			<br>
			<%-- 사람인 --%>
			<div id="tab-1" style="margin-bottom:50px" class="tab-content current" >
				<div id="job-table">
				<%-- 페이지 불러오는 테이블 --%>
					<table style="height: 100px; overflow: auto;">
						<thead>
							<tr height="30px">
								<th style="width:100px">번호</th>
								<th style="width:400px">주  제</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody id="s-recruit">
							<%for(int i =1;i<=10;i++){ %>
							<tr>
								<td><%=i %></td>
								<td>주제 <%=i %></td>
								<td>개발자</td>
								<td>2022/12/26</td>
								<td>0</td>
							</tr>
							<%}%>
						</tbody>
					</table>
				</div>

				<br>
				<div class="pagination_section">
					<a href="#">＜＜ Previous</a>
					<%-- <%for(int i=0;i<cnt.size()/10;i++){ %>
						<a href="goRecruitTest.do?num=<%=i+1%>"><%=i+1%></a>
						<%} %>	 --%>	
						<a href="#">1</a>
						<a href="#">2</a>
						<a href="#">3</a>
						<a href="#">4</a>
						<a href="#">5</a>
					<a href="#">Next ＞＞</a>
				</div>


			</div>
			
			

		</div>
		</div>
		<footer class="main_footer">
				<div class="window" id="icons" style="width: 800px" align="center">
					<a href=""><img src="./img/dfsfg.png" id="fire" width="50" alt=""></a> 
					<a href="goIdea.do"><img src="./img/123.png" id="idea" width="40" alt=""></a> 
					<a href="goMain.do"><img src="./img/dff.gif" id="goMain" width="50" alt="error"></a> 
					<a href="goRecruit.do"><img src="./img/xml-0.png" id="job" width="40" alt=""></a> 
					<a href="goMyPage.do"><img src="./img/icon_15.png" id="my_page" width="40" alt=""></a> 
					<a href=""><img src="./img/sfsdffd.png" id="message" alt="" width="30"></a>
				</div>
		</footer>
		</div>
		</div>
</body>

</html>