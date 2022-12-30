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

<style type="text/css">
tbody td:nth-child(1){
	text-align:center;
}
tbody td:nth-child(2):hover{
	cursor: pointer;
}

tbody td:nth-child(3){
	text-align:center;
}
tbody td:nth-child(5){
	text-align:center;
}
body{
	font-family:'';
}	
thead th:nth-child(1){
	width: 50px;
}
thead th:nth-child(2){
	width: 400px;
}
thead>tr{
	height: 30px;
}
#ideaWriter{
   	display: flex;
    font-weight: bold;
    text-decoration: auto;
    padding: 10px;
}
#commentWrite{
    display: flex;
    justify-content: space-between;
}
body{
display: flex;
    justify-content: center;
    align-items: center;
    position: fixed;
    width: 100%;
    height: 100%;
}
</style>

</head>
<body style="position:fixed;">
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
			<div class="window" style="width: 800px; height:800px; position: sticky; top: 0; font-size:14px;"
				align="center">
				<div class="title-bar" style="position: sticky; top: 0">
					<div class="title-bar-text">아이디어 토론방</div>
					<div class="title-bar-controls">
					<button aria-label="Close" onclick="location.href='goMain.do?u_email=<%=info.getU_email()%>'"></button>
					</div>
				</div>
				<div class="window-body">
					<div style="margin-top:180px;display: flex;justify-content: center; align-items: center;">
						<input type="text" placeholder="여러 아이디어를 검색 하세요"
							style="width: 150px; height: 20px; font: size 10px;">
						<button>검색</button>
					</div>
					<div style="display: flex; flex-direction: row-reverse; padding:0 15px">
						<button onclick="location.href='goWriteIdea.do'">글쓰기</button>
					</div>
					
					<div id="tab-1" style="margin-bottom: 50px"
						class="tab-content current">
						<div id="job-table">
						
							<%-- 아이디어 게시판 테이블 --%>
							<table style="height: 100px; overflow: auto;">
								<thead>
									<tr>
										<th>번호</th>
										<th>주 제</th>
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
										<td id="openBtn<%=i%>"><a><%=list.get(i).getPost_title()%></a></td>
										<td><a href="goUserPage.do?u_email=<%=list.get(i).getU_email()%>"><%=list.get(i).getU_name()%></a></td>
										<td><%=list.get(i).getPost_dt()%></td>
										<td id="idea-post-cnt<%=i%>"><%=list.get(i).getCnt()%></td>
									</tr>
									<%} %>
								
								</tbody>
							</table>

						</div>
<%for(int i=0;i<list.size();i++){ %>
<div id="cmtnum<%=i%>" class="modal" style="display:none;">
  <div class="bg"></div>
  <div class="modalBox" style="width:1200px; background:rgba(0,130,128,255);">
		<div class="window">
			<div class="title-bar">
				<div class="title-bar-text">아이디어 토론방</div>
					<div class="title-bar-controls">
					<button aria-label="Close" id="closeBtn<%=i%>"></button>
					</div>
			</div>
			<div class="window-body" style="display:flex;">
				<div style="width:750px; display:grid">
					<!-- 아이디어 주제 -->
			  		<div style="font-size:30px;"><%=list.get(i).getPost_title()%></div>
			  		<div style="font-size:18px;">
			  			<!-- 이미지 -->
				  		<img src="./img/<%=list.get(i).getPost_file()%>">
				  		<!-- 게시물 텍스트 -->
				  		<%=list.get(i).getPost_content()%>
			  		</div>
			  		<div>
			  			<!-- 게시물 해시태그 리스트 (클릭시 해시태그별 게시물 조회 페이지 이동)-->
				 	 	<%
					  	List<Tag> tagList = daoTag.postTagView(list.get(i).getPost_seq());
					  	for(int k = 0; k < tagList.size(); k++){
					  	%>
						<a style="font-size:14px" href="goTagMain.do?tag_seq=<%=tagList.get(k).getTag_seq()%>"><%='#'+tagList.get(k).getTag_content()%></a>
						<%};%>
			  		</div>
			  	</div>
			  	<div style="width:450px; display:grid">
			  		<!-- 아이디어 주제 제시자 (클릭시 유저 페이지 이동)-->
			  		<p id="ideaWriter">작성자&nbsp;&nbsp;<a style="text-decoration: none;color: black; font-size: larger;"href="goUserPage.do?u_email=<%=list.get(i).getU_email()%>"><%=list.get(i).getU_name()%></a></p>
			  		<!-- 댓글(아이디어) 리스트 -->
			  		<div>
			  			<%
						List<CommentInfo> cmtList = dao.commentInfoList(list.get(i).getPost_seq());
						for (int j = 0; j < cmtList.size(); j++) {
						%>
						<table class="board_list" style="width:auto;">
							<tr style="width: 450px;display: flex;padding: 0px; justify-content: space-between;">
								<!-- 댓글(아이디어) 작성자 -->
								<td style="border-bottom:none;"><a href="goUserPage.do?u_email=<%=list.get(j).getU_email()%>"><b><%=cmtList.get(j).getU_name()%></b></a></td>
								<!-- 댓글(아이디어) 내용 -->
								<td style="text-align:left; padding:5px; width:290px; border-bottom:0"><%=cmtList.get(j).getCmt_content()%></td>
								<td style="border-bottom:none;">
									<!-- 댓글(아이디어) 좋아요 버튼 -->
									<a href="mainCmtLike.do?req_page=idea&cmt_seq=<%=cmtList.get(j).getCmt_seq()%>&u_email=<%=info.getU_email()%>">
										<!-- 댓글(아이디어) 좋아요 수 -->
										<button	id="btn"><%=cmtList.get(j).getCmt_likes()%> 💖</button>
									</a>
								</td>
							</tr>
						<%};%>	
						</table>
			  		</div>
			  		<div style="display:flex;">
				  		<!-- 북마크 버튼 -->
						<a href="mainBookmark.do?req_page=idea&post_seq=<%=list.get(i).getPost_seq()%>&u_email=<%=info.getU_email()%>">
							<!-- 아이디어 주제 북마크 수 -->
							<button	id="btn"><%=list.get(i).getBookmarks()%><img src="./img/북마크.png" width="15" alt=""></button>
						</a>
			  		  	<!-- 좋아요 버튼 -->
					  	<a href="mainLike.do?req_page=idea&post_seq=<%=list.get(i).getPost_seq()%>&u_email=<%=info.getU_email()%>">
					  		<!-- 아이디어 주제 좋아요 수 -->
					  		<button id="btn"><%=list.get(i).getLikes()%> 💖</button>
					  	</a>
			  		</div>
			  		<div>
					  	<!-- 댓글 작성 파트 -->
					  	<form action="mainCmt.do">
					  		<input type="hidden" name="req_page" value="idea">
							<input type="hidden" name="post_seq" value="<%=list.get(i).getPost_seq()%>">
							<input type="hidden" name="u_email" value="<%=info.getU_email()%>">
							<p id="commentWrite" class="status-bar-field" >
								<input type="text" name="cmt_content" placeholder="댓글" style="width:360px">
								<input type="submit" value="등록">
							</p>
						</form>
			  		</div>
			  	</div>
		  	</div>
  		</div>
  </div>
</div>
<%}%>
						<br>
						<div class="pagination_section">
						<a href="goIdea.do" class="bt">처음</a>
						<a href="goIdea.do" class="bt">이전</a>
						<%for(int i=1;i<cnt.size()/10+1;i++){ %>
						<a id="num<%=i %>" class="num" href="goIdea.do?&num=<%=i%>"><%=i%></a>
						<%} %>	
						<a href="goIdea.do?num=<%=cnt.size()%>" class="bt">다음</a>
						<a href="goIdea.do?num=<%=cnt.size()%>" class="bt">마지막</a>
				</div>


					</div>



				</div>
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
	</div>
							
</body>
<script>
  <%for(int i=0;i<10;i++){%>
   $('#openBtn<%=i%>').on('click', function(){

	   $('#cmtnum<%=i%>').show();
	   $('bg').show();
	   $('.main_footer').css('position','static');
	   $('.window').css('position','static');
	  
   });
   <%}%>
   <%for(int i=0;i<10;i++){%>
   $('#closeBtn<%=i%>').on('click', function(){
	   $('#cmtnum<%=i%>').hide();
	   $('bg').hide();
	   $('.main_footer').css('position','static');
	   $('.window').css('position','static');
	   $.ajax({
		   url:'ideaPostCnt.do',
		   data:{'post_seq':<%=list.get(i).getPost_seq()%>},
		   dataType:'json',
		   success:function(res){
			   console.log(res);
			   $('#idea-post-cnt<%=i%>').text(res);
		   },
		   error:function(res){
			   console.log('error');
		   }
	   });
   });
  <%}%>
</script>
<script>
console.log($('#num<%=num%>').attr('class'))
  for( i=1;i<=<%=cnt.size()/10+1%>;i++){
	if($('#num<%=num%>').attr("id")=='num'+i){
		$('#num<%=num%>').attr("class","num on")
	}
}
</script>
</html>