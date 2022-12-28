<%@page import="com.smhrd.entity.OnclickDTO"%>
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
	<title>Hello IT</title>
	<link rel="stylesheet" href="https://unpkg.com/98.css" />
	<link rel="stylesheet" href="./css/style.css">
	<link rel="stylesheet" href="./css/recruit.css">
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript" src="./js/mousePointer.js"></script>
</head>
<body>
	<%
		List<Recruit> list = (List<Recruit>) request.getAttribute("list");
		List<Recruit> cnt = (List<Recruit>) request.getAttribute("cnt");
		
		List<Recruit> list_j = (List<Recruit>) request.getAttribute("list_j");
		List<Recruit> cnt_j = (List<Recruit>) request.getAttribute("cnt_j");
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
								<th style="width:100px">기업명</th>
								<th style="width:400px">채용 내용</th>
								<th>경력/학력/지역</th>
								<th>마감일</th>
							</tr>
						</thead>
						<tbody id="s-recruit">
							<%for(int i =0;i<10;i++){ %>
							<tr>
								<td><%=list.get(i).getCompany_list() %></td>
								<td><a href="<%=list.get(i).getLink_list()%>"><%=list.get(i).getJob_list()%></a></td>
								<td><%=list.get(i).getAddr_list() %></td>
								<td><%=list.get(i).getDate_list()%></td>
							</tr>
							<%}%>
						</tbody>
					</table>
				</div>

				<br>
				<div class="pagination_section">
					<a href="goRecruit.do" class="bt">＜＜ Previous</a>
					<%for(int i=0;i<cnt.size()/10;i++){ %>
					<a id="num<%=i+1 %>" class="num" href="goRecruit.do?&num=<%=i+1%>"><%=i+1%></a>
					<%} %>	
					<a href="goRecruit.do?num=<%=cnt.size()/10 %>" class="bt">Next ＞＞</a>
				</div>
			</div>
			
			
			
			<%-- 잡코리아 --%>
			<div id="tab-2" style="margin-bottom:50px" class="tab-content" >
				<div id="job-table">
				<%-- 페이지 불러오는 테이블 --%>
					<table style="height: 100px; overflow: auto;">
						<thead>
							<tr height="30px">
								<th style="width:100px">기업명</th>
								<th style="width:400px">채용 내용</th>
								<th>경력/학력/지역</th>
								<th>마감일</th>
							</tr>
						</thead>
						<tbody id="j-recruit">
							<%for(int i =0;i<10;i++){ %>
							<tr>
								<td><%=list_j.get(i).getCompany_list() %></td>
								<td><a href="<%=list_j.get(i).getLink_list()%>"><%=list_j.get(i).getJob_list()%></a></td>
								<td><%=list_j.get(i).getAddr_list() %></td>
								<td><%=list_j.get(i).getDate_list()%></td>
							</tr>
							<%}%>
						</tbody>
					</table>
				</div>

				<br>
				<div class="pagination_section">
					<a href="goRecruit.do" class="bt">＜＜ Previous</a>
					<%for(int i=0;i<cnt_j.size()/10;i++){ %>
					<a id="num<%=i+1 %>" class="num" href="goRecruit.do?&num=<%=i+1%>"><%=i+1%></a>
					<%} %>	
					<a href="goRecruit.do?num=<%=cnt_j.size()/10 %>" class="bt">Next ＞＞</a>
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
					<a href="goMessage.do"><img src="./img/sfsdffd.png" id="message" alt="" width="30"></a>
				</div>
		</footer>
		</div>
		</div>
		<%String on = (String)request.getAttribute("on");
			int num = (int)request.getAttribute("num");
		%>
		<%out.print(on); 
			out.print(num);
		%>
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
		console.log($('#num<%=num%>').attr('class'))
		  for( i=1;i<=<%=cnt.size()/10%>;i++){
			if($('#num<%=num%>').attr("id")=='num'+i){
				$('#num<%=num%>').attr("class","num on")
			}
		}
		</script>
</body>

</html>