<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.dao.RecruitDAO"%>
<%@page import="com.smhrd.controller.RecruitCon"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.entity.Recruit"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%!// 변수 선언
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String uid = "cgi_7_1219_4";
	String pwd = "smhrd4";
	String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
	String sql = "SELECT * from S_CRAWLING"; 
	String sql2 = "SELECT * from J_CRAWLING";%>


<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<link rel="stylesheet" href="https://unpkg.com/98.css" />
	<link rel="stylesheet" href="./css/style.css">
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript" src="./js/mousePointer.js"></script>
	<style type="text/css">

		table {
			width: 750px;
			margin: auto;
			border-collapse: collapse;
			
		}

		#job-table {
			display: flex;
			flex-direction: column;
		}

		body {
			/* margin-top: 100px; */
			font-family: 'Trebuchet MS', serif;
			line-height: 1.6
		}

		.container {
			width: 650px;
			margin: 0 auto;
		}


		ul.tabs {
			margin: 0px;
			padding: 0px;
			list-style: none;
		}

		ul.tabs li {
			background: none;
			color: #222;
			display: inline-block;
			padding: 10px 15px;
			cursor: pointer;
		}

		ul.tabs li.current {
			background: #ededed;
			color: #222;
		}

		.tab-content {
			display: none;
			/* background: #ededed; */
			padding: 15px;
		}

		.tab-content.current {
			display: inherit;
		}
		table td{
			padding: 5px 10px;
			border-bottom:1px solid;
		}
		thead th{
			border:2px solid;	
		}
		tr:hover{
			background:lightgreen;
		}
		
		table a:hover{
			text-decoration: underline;
		}
		table a{
			text-decoration: none;
			color: black; 
		}
		tr>td:nth-child(1){
			font-weight: bolder;
		}
		tr>td:nth-child(4){
			font-weight: bolder;
			text-align: center;
		}
	</style>
</head>
	

<body>
	<%
		List<Recruit> list = (List<Recruit>) request.getAttribute("list");
		List<Recruit> cnt = (List<Recruit>) request.getAttribute("cnt");
	%>
<div class="container">
<div class="wrapper">
	<div class="window" style="width: 800px; position: sticky; top: 0;" align="center">
		<div class="title-bar" style="position:sticky; top:0">
			<div class="title-bar-text">채용 공고</div>
			<div class="title-bar-controls">
				<button aria-label="Close" onclick="location.href='goMain.do'"></button>
			</div>
		</div>
		<div class="window-body">
						<h5 align="center"> 채용 내용을 클릭하면 해당 공고로 이동합니다.</h5>
			<input type="text" placeholder="원하는 채용을 검색하세요" style="width:150px;height: 20px; font: size 10px;;">
			<button>검색</button>
			<br>

			<%-- 각 홈페이지당 페이지  갖고오기 --%>
			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1">사람인</li>
				<li class="tab-link" data-tab="tab-2">잡코리아</li>

			</ul>
			<%-- 사람인 --%>
			<div id="tab-1" style="margin-bottom:50px" class="tab-content current" >
				<div id="job-table">
				<%-- 페이지 불러오는 테이블 --%>
					<table style="height: 100px; overflow: auto;">
						<thead>
							<tr height="30px">
								<th>기업명</th>
								<th style="width:1000px">채용 내용</th>
								<th style="width:500px">경력/학력/지역</th>
								<th>마감일</th>
							</tr>
						</thead>
						<tbody id="s-recruit">
							<%for(int i =0;i<10;i++){ %>
							<tr>
								<td><%=list.get(i).getCompany_list() %></td>
								<td><%=list.get(i).getJob_list()%></td>
								<td><%=list.get(i).getAddr_list() %></td>
								<td><%=list.get(i).getDate_list()%></td>
							</tr>
							<%}%>
						</tbody>
					</table>
				</div>

				<br>
				<div class="pagination_section">
					<a href="#">＜＜ Previous</a>
					<%for(int i=0;i<cnt.size()/10;i++){ %>
						<a href="goRecruitTest.do?num=<%=i+1%>"><%=i+1%></a>
						<%} %>		
					<a href="#">Next ＞＞</a>
				</div>


			</div>
			
			
			
			<%-- 잡코리아 --%>
			<div id="tab-2" style="margin-bottom:50px" class="tab-content">
				<div id="job-table">		
					<table style="height: 100px; overflow: auto">
						<thead>
							<tr height="30px">
								<th>기업명</th>
								<th>채용 내용</th>
								<th>경력/학력/지역</th>
								<th>마감일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
							</tr>
						</tbody>
					</table>
				</div>

				<br>
				<div class="pagination_section">
					<a href="#">＜＜ Previous</a>
					<a href="#" title="">1</a>
					<a href="#" title="">2</a>
					<a href="#" title="">3</a>
					<a href="#" title="">4</a>
					<a href="#" title="">5</a>
					<a href="#" title="">6</a>
					<a href="#" title="">7</a>
					<a href="#" title="">8</a>
					<a href="#" title="">9</a>
					<a href="#" title="">10</a>
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
				<script>

			$(document).ready(function () {

				$('ul.tabs li').click(function () {
					var tab_id = $(this).attr('data-tab');

					$('ul.tabs li').removeClass('current');
					$('.tab-content').removeClass('current');

					$(this).addClass('current');
					$("#" + tab_id).addClass('current');
				})

			})

		</script>
		<script>
			function pagingTest(){
			}
		</script>
</body>

</html>