<%@page import="com.smhrd.entity.Tag"%>
<%@page import="com.smhrd.dao.PostInfoDAO"%>
<%@page import="com.smhrd.dao.CommentInfoDAO"%>
<%@page import="com.smhrd.entity.CommentInfo"%>
<%@page import="com.smhrd.entity.PostInfo"%>
<%@page import="com.smhrd.entity.UserInfo"%>
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
<link rel="stylesheet" href="./css/modal.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="./js/mousePointer.js"></script>
</head>
<body>
	<%
	// session 에서 user_info 가져오기
	UserInfo info = (UserInfo) session.getAttribute("info");

	// request 영역에서 list 꺼내서 출력하기
	List<PostInfo> list = (List<PostInfo>) request.getAttribute("list");
	List<PostInfo> cnt = (List<PostInfo>) request.getAttribute("cnt");
	String on = (String)request.getAttribute("on");
	int num = (int)request.getAttribute("num");
	PostInfoDAO daoTag = new PostInfoDAO();
	CommentInfoDAO dao = new CommentInfoDAO();
	
%>
	<div class="container">
		<div class="wrapper">
			<div class="window" style="width: 800px; position: sticky; top: 0;"
				align="center">
				<div class="title-bar" style="position: sticky; top: 0">
					<div class="title-bar-text">아이디어 토론방</div>
					<div class="title-bar-controls">
						<button aria-label="Close" onclick="location.href='goMain.do'"></button>
					</div>
				</div>
				<div class="window-body">
					<div>
						<input type="text" placeholder="여러 아이디어를 검색 하세요"
							style="width: 150px; height: 20px; font: size 10px;">
						<button>검색</button>
					</div>
					<div style="display: flex; flex-direction: row-reverse;">
						<button onclick="location.href='goWriteIdea.do'">글쓰기</button>
					</div>
					<%-- 사람인 --%>
					<div id="tab-1" style="margin-bottom: 50px"
						class="tab-content current">
						<div id="job-table">
							<%-- 페이지 불러오는 테이블 --%>
							<table style="height: 100px; overflow: auto;">
								<thead>
									<tr height="30px">
										<th style="width: 100px">번호</th>
										<th style="width: 400px">주 제</th>
										<th>작성자</th>
										<th>작성일</th>
										<th>조회수</th>
									</tr>
								</thead>
								<tbody>
									<%
									for (int i = 0; i <list.size(); i++) {
									%>
									<tr>
										<td><%=list.get(i).getRow_num()%></td>
										<td id="openBtn<%=i+1%>"><%=list.get(i).getPost_title()%></td>
										<td><%=list.get(i).getU_name()%></td>
										<td><%=list.get(i).getPost_dt()%></td>
										<td><%=list.get(i).getCnt()%></td>
									</tr>
									<%} %>
								
								</tbody>
							</table>

						</div>
<%for(int i=0;i<list.size();i++){ %>
<div id="cmtnum<%=i+1%>" class="modal" style="display:none;">
  <div class="bg"></div>
  <div class="modalBox">
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	<!-- data -->
  	<!-- 아이디어 주제 -->
  	<%=list.get(i).getPost_title()%>
  	<!-- 아이디어 주제 제시자 (클릭시 유저 페이지 이동)-->
  	<a href="goUserPage.do?u_email=<%=list.get(i).getU_email()%>"><%=list.get(i).getU_name()%></a>
  	<!-- 이미지 -->
  	<img alt="이미지 없음" src="./img/<%=list.get(i).getPost_file()%>">
  	<!-- 게시물 텍스트 -->
  	<%=list.get(i).getPost_content()%>
  	<!-- 게시물 해시태그 리스트 (클릭시 해시태그별 게시물 조회 페이지 이동)-->
  	<%
  	List<Tag> tagList = daoTag.postTagView(list.get(i).getPost_seq());
  	for(int k = 0; k < tagList.size(); k++){
  	%>
	<a href="goTagMain.do?tag_seq=<%=tagList.get(k).getTag_seq()%>"><%='#'+tagList.get(k).getTag_content()%></a>
	<%};%>
	<!-- 북마크 버튼 -->
	<a href="mainBookmark.do?post_seq=<%=list.get(i).getPost_seq()%>&u_email=<%=info.getU_email()%>">
		<!-- 아이디어 주제 북마크 수 -->
		<button	id="btn"><%=list.get(i).getBookmarks()%><img src="./img/북마크.png" width="15" alt=""></button>
	</a>
  	<!-- 좋아요 버튼 -->
  	<a href="mainLike.do?post_seq=<%=list.get(i).getPost_seq()%>&u_email=<%=info.getU_email()%>">
  		<!-- 아이디어 주제 좋아요 수 -->
  		<button id="btn"><%=list.get(i).getLikes()%> 💖</button>
  	</a>
  	<!-- 댓글 작성 파트 -->
  	<form action="mainCmt.do">
		<input type="hidden" name="post_seq" value="<%=list.get(i).getPost_seq()%>">
		<input type="hidden" name="u_email" value="<%=info.getU_email()%>">
			<p class="status-bar-field">
		<input type="text" name="cmt_content" placeholder="댓글" style="width:360px">
		<input type="submit" value="등록">
			</p>
	</form>
	<!-- 댓글(아이디어) 리스트 -->
	<%
	List<CommentInfo> cmtList = dao.commentInfoList(list.get(i).getPost_seq());
	for (int j = 0; j < cmtList.size(); j++) {
	%>
	<table class="board_list" width=700>
		<tr style="width: 0px; padding: 0px;">
			<!-- 댓글(아이디어) 작성자 -->
			<td><b><%=cmtList.get(j).getU_name()%></b></td>
			<!-- 댓글(아이디어) 내용 -->
			<td style="text-align:left; padding:5px;" colspan="6"><%=cmtList.get(j).getCmt_content()%></td>
			<td>
				<!-- 댓글(아이디어) 좋아요 버튼 -->
				<a href="mainCmtLike.do?cmt_seq=<%=cmtList.get(j).getCmt_seq()%>&u_email=<%=info.getU_email()%>">
				<!-- 댓글(아이디어) 좋아요 수 -->
				<button	id="btn"><%=cmtList.get(j).getCmt_likes()%> 💖</button>
				</a>
			</td>
		</tr>
	<%};%>	
	</table>
	
	
  
  	
    <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Consectetur quam nobis quis corrupti amet maxime neque, optio, in illo, voluptatibus consequuntur! Rerum quo ea nulla qui, maxime consectetur magni soluta!</p>
    <button id="closeBtn<%=i+1%>">✖</button>
  </div>
</div>
<%}%>
						<br>
						<div class="pagination_section">
						<a href="goIdea.do" class="bt">＜＜ Previous</a>
						<%for(int i=0;i<cnt.size()/10+1;i++){ %>
						<a id="num<%=i+1 %>" class="num" href="goIdea.do?&num=<%=i+1%>"><%=i+1%></a>
						<%} %>	
						<a href="goIdea.do?num=<%=cnt.size()%>" class="bt">Next ＞＞</a>
				</div>


					</div>



				</div>
			</div>
			<footer class="main_footer">
		<div class="window" id="icons" style="width: 800px" align="center">
			<a href="goPopPostMain.do"><img src="./img/dfsfg.png" id="fire" width="50" alt=""></a> 
			<a href="goIdea.do"><img src="./img/123.png" id="idea" width="40" alt=""></a> 
			<a href="goMain.do?u_email=<%=info.getU_email()%>"><img src="./img/dff.gif" id="goMain" width="50" alt="error"></a> 
			<a href="goMainWrite.do"><img src="./img/dfsee.gif" id="goMain" width="41" alt="error"></a> 
			<a href="goRecruit.do"><img src="./img/xml-0.png" id="job" width="40" alt=""></a> 
			<a href="goMyPage.do?u_email=<%=info.getU_email()%>"><img src="./img/icon_15.png" id="my_page" width="40" alt=""></a> 
			<a href="goMessage.do"><img src="./img/sfsdffd.png" id="message" alt="" width="30"></a>
		</div>
	</footer>
		</div>
	</div>
							
</body>
<script>
  <%for(int i=1;i<=10;i++){%>
   $('#openBtn<%=i%>').on('click', function(){
	   $('#cmtnum<%=i%>').show();
	   $('bg').show();
	   $('.main_footer').css('position','static');
	   $('.window').css('position','static');
   });
  <%}%>
  <%for(int i=1;i<=10;i++){%>
   $('#closeBtn<%=i%>').on('click', function(){
	   $('#cmtnum<%=i%>').hide();
	   $('bg').hide();
	   $('.main_footer').css('position','static');
	   $('.window').css('position','static');
   });
  <%}%>
</script>
<script>
console.log($('#num<%=num%>').attr('class'))
  for( i=1;i<=<%=cnt.size()/10%>;i++){
	if($('#num<%=num%>').attr("id")=='num'+i){
		$('#num<%=num%>').attr("class","num on")
	}
}
</script>
</html>