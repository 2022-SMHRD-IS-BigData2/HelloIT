<%@page import="com.smhrd.entity.UserInfo"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.entity.Tag"%>
<%@page import="com.smhrd.dao.PostInfoDAO"%>
<%@page import="com.smhrd.entity.CommentInfo"%>
<%@page import="com.smhrd.dao.CommentInfoDAO"%>
<%@page import="com.smhrd.entity.PostInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello IT</title>
<link rel="stylesheet" href="https://unpkg.com/98.css" />
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/FAQ.css">
<link rel="stylesheet" href="./css/mypage.css">
<link rel="stylesheet" href="./css/follow.css">

<link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
      integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog=="
      crossorigin="anonymous"
    />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="./js/mousePointer.js"></script>
<style>

</style>
</head>

<body>
	<%
	UserInfo info = (UserInfo)session.getAttribute("info");
	List<PostInfo> upList = (List<PostInfo>)request.getAttribute("upList");
	List<PostInfo> bmList = (List<PostInfo>)request.getAttribute("bmList");
/* 	List<PostInfo> miList = (List<PostInfo>)request.getAttribute("miList");
	List<PostInfo> cnt = (List<PostInfo>) request.getAttribute("cnt");
	String on = (String)request.getAttribute("on");
	int num = (int)request.getAttribute("num");*/
	
	List<UserInfo> following = (List<UserInfo>)request.getAttribute("following");
	List<UserInfo> follower = (List<UserInfo>)request.getAttribute("follower");
	%>
	
	<div class="container">
		<div class="wrapper">
			<div class="window" style="width: 800px; position: sticky; top: 0; max-width:100%"align="center">
				<div class="title-bar" style="position:sticky; top:1px">
				  <div class="title-bar-text">마이 페이지</div>
				  <div class="title-bar-controls">
				  <button aria-label="Close" onclick="location.href='goMain.do?u_email=<%=info.getU_email()%>'"></button>
				  </div>
				</div>
		 	<div class="window-body" style="justify-content: space-between;">
			 	<div>
			 	<ul class="tree-view" style="font-family:auto;">
					  <li id="listOfMyPage" style="cursor:pointer;">나의 회원정보</li>
					  <li id="listOfInterest" style="cursor:pointer;">관심분야 Check</li>
					  <li id="listOfPosted" style="cursor:pointer;">내가올린 게시물<li>
					  <li id="listOfBookmark" style="cursor:pointer;">북마크한 게시물<li>
					  <li id="listOfFollow" style="cursor:pointer;">팔로잉/팔로워</li>  
					  <li id="listOfMyIdea" style="cursor:pointer;">나의 아이디어<li>
					  <li id="listOfPortfolio" style="cursor:pointer;">포트폴리오&자소서<li>
					  <li id="listOfFAQ" style="cursor:pointer;">FAQ<li>
				</ul>
				<p class="status-bar-field">
					<b>팔로잉 : <%=request.getAttribute("followingCnt")%></b>
					<b>팔로워 : <%=request.getAttribute("followerCnt")%></b>
				</p>
				</div>
				<div style="display:block;width:632px;">
			<div id="myPage" style="display:none;">
			    <div class="container">
		        <div class="wrapper" style="position: sticky; top: 27px;">
		            <div class="window" style="width: 400px; position: sticky; top: 0; max-width: 100%; width: 400px;display: block; margin: 0 100px; margin-bottom: 50px;" align="center">
		                <div class="title-bar">
		                    <div class="title-bar-text">회원 정보</div>
		                    <div class="title-bar-controls">
		                        <button aria-label="Close" onclick="location.href ='goMyPage.do?u_email=<%=info.getU_email()%>'"></button>
		                    </div>
		                </div>
		                    <form action="" method="post" style="margin:20px; font-size:initial">
		                        <table class="userInfo">
		                        	<tbody>
		                            <tr>
		                                <td style="width:140px">회원 이메일</td>
		                                <td style="padding-left:4px"><%=info.getU_email() %></td>
		                            </tr>
		                            <tr>
		                                <td>이름</td>
		                                <td style="padding-left:4px"><%=info.getU_name() %></td>
		                            </tr>
		                            <tr>
		                                <td>닉네임</td>
		                                <td style="padding-left:4px"><%=info.getU_nick() %></td>
		                            </tr>
		                            <tr>
		                                <td>현재비밀번호</td>
		                                <td style="padding-left:4px"><input type="password" name="pw1" placeholder="현재 비밀번호 입력"></td>
		                            </tr>
		                            <tr>
		                                <td>변경할 비밀번호</td>
		                                <td style="padding-left:4px"><input type="password" name="repw2" placeholder="변경할 비밀번호 입력"></td>
		                            </tr>
		                            <tr>
		                                <td>변경할 비밀번호 확인</td>
		                                <td style="padding-left:4px"><input type="password" name="repw3" placeholder="변경할 비밀번호 확인"></td>
		                            </tr>
		                            <tr>
		                                <td>생년월일</td>
		                                <td style="padding-left:4px"><%=info.getU_birthdate()%></td>
		                            </tr>
		                            <tr>
		                                <td>직업</td>
		                                <td style="padding-left:4px"><%=info.getU_job() %></td>
		                            </tr>
		                            <tr>
		                                <td>활동점수</td>
		                                <td style="padding-left:4px"><%=info.getU_activity_score() %></td>
		                            </tr>
		                            </tbody>
		                        </table>
		                        <br>
		                            	<div><input type="submit" onclick="myInfoPopup();" value="저장"></div>
		                    </form>
		            </div>
		        </div>
		    </div>
			</div>
		    <div class="window" id="checkInterest" style="display:none; margin-left:8px">
		        <div class="title-bar" style="position:sticky; top:27px">
		            <div class="title-bar-text">관심 분야 Check!!</div>
		            <div class="title-bar-controls">
		            <button aria-label="Close" onclick="location.href ='goMyPage.do?u_email=<%=info.getU_email()%>'"></button>
		            </div>
		          </div>
		        <div class="window-body" style="display:block;">
		            <p style="font-size: large; font-weight: bold;">관심있는분야나 직장에서 맡고있는 분야를 선택하세요<sub>(중복선택 가능)</sub></p> 
		            <p style="font-size: small; font-weight: bold;">체크한 분야에 따라서 게시물이 자동 선별됩니다.</p>
		            <br>
		       		<form action="userLevelSetting.do" method="post">
		       		<input type="hidden" name="u_email" value="<%=info.getU_email()%>">
				        <table style="width:600px">
				        <tr class="interest" id="userRole">
				     	<td><h4>레벨</h4></td>
				            <td style="display:flex; justify-content: center; height:50px;">
				            <div style="text-align:end; margin: 0 5px">
				            <div>프론트엔드
				             <select name="frontend_level" id="frontend_level">
				             	<option value="1">예비개발자(학생)</option>
				             	<option value="2">사원(주니어)</option>
				             	<option value="3">대리(미드레벨)</option>
				             	<option value="4">과장~부장(시니어)</option>
				             	<option value="5">이사~사장(디렉터)</option>
				             	<option value="6">프리랜서</option>
				             </select>
				             </div>
				             <div>
				             	백엔드
				             	<select name="backend_level" id="backend_level">
				             	<option value="1">예비개발자(학생)</option>
				             	<option value="2">사원(주니어)</option>
				             	<option value="3">대리(미드레벨)</option>
				             	<option value="4">과장~부장(시니어)</option>
				             	<option value="5">이사~사장(디렉터)</option>
				             	<option value="6">프리랜서</option>
				             </select>
				             </div>
				             </div>
				             <div style="text-align:end; margin: 0 5px">
				             <div>데이터
				             <select name="data_level" id="data_level">
				             	<option value="1">예비개발자(학생)</option>
				             	<option value="2">사원(주니어)</option>
				             	<option value="3">대리(미드레벨)</option>
				             	<option value="4">과장~부장(시니어)</option>
				             	<option value="5">이사~사장(디렉터)</option>
				             	<option value="6">프리랜서</option>
				             </select>
				             </div>
				             <div>
				             기타
				             <select name="etc_level" id="etc_level">
				             	<option value="1">예비개발자(학생)</option>
				             	<option value="2">사원(주니어)</option>
				             	<option value="3">대리(미드레벨)</option>
				             	<option value="4">과장~부장(시니어)</option>
				             	<option value="5">이사~사장(디렉터)</option>
				             	<option value="6">프리랜서</option>
				             </select>
				             </div>
				             </div>
				             </td>
				             <td>
					             <input type="submit" onclick="levelPopup();" value="저장">
					             <input type="reset" value="초기화">
				        	</td>
				        </tr>
				        </table>
					</form>
		       		<form action="updateRole.do" method="post">
				        <table>
				        <tr class="interest" id="userRole">
				     	<td><h4>역할</h4></td>
				            <td>
				             <input type="checkbox" name="frontend" id="frontend" value="Y">
				             <label for="frontend">프론트엔드</label>
				             <input type="checkbox" name="backend" id="backend" value="Y">
				             <label for="backend">백엔드</label>
				             <input type="checkbox" name="data_etc" id="data_etc" value="Y">
				             <label for="data_etc">데이터분야(빅데이터,인공지능포함)</label>
				             <input type="checkbox" name="other_skill" id="other_skill" value="Y">
				             <label for="other_skill">기타</label>
				             <br><br>
				             <input type="hidden" name="u_email" value="<%=info.getU_email()%>">
				             <input type="hidden" name="frontend" id="frontend_hidden" value="N">
				             <input type="hidden" name="backend" id="backend_hidden" value="N">
				             <input type="hidden" name="data_etc" id="data_etc_hidden" value="N">
				             <input type="hidden" name="other_skill" id="other_skill_hidden" value="N">
				             </td>
				             <td>
				             <input type="submit" onclick="rolePopup();" value="저장">
				             <input type="reset" value="초기화">
				        	</td>
				        </tr>
				        </table>
					</form>
		            <form action="updateSkill.do" method="post">
						<table>
							<tr class="interest" id="userSkill">
								<td><h4>분야</h4></td>
								<td>
									<input type="checkbox" name="web" id="web" value="Y">
									<label for="web">웹</label>
									<input type="checkbox" name="ios" id="ios" value="Y">
									<label for="ios">iOS</label>
									<input type="checkbox" name="android" id="android" value="Y">
									<label for="android">안드로이드</label>
									<input type="checkbox" name="windows" id="windows" value="Y">
									<label for="windows">윈도우</label>
									<input type="checkbox" name="mac" id="mac" value="Y">
									<label for="mac">맥</label>
									<input type="checkbox" name="linux" id="linux" value="Y">
									<label for="linux">리눅스</label>
									<input type="checkbox" name="game" id="game" value="Y">
									<label for="game">게임</label>
									<input type="checkbox" name="skill_etc" id="skill_etc" value="Y">
									<label for="skill_etc">기타</label>
									<br><br>
									<input type="hidden" name="u_email" value="<%=info.getU_email()%>">
									<input type="hidden" name="web" id="web_hidden" value="N">
									<input type="hidden" name="ios" id="ios_hidden" value="N">
									<input type="hidden" name="android" id="android_hidden" value="N">
									<input type="hidden" name="windows" id="windows_hidden" value="N">
									<input type="hidden" name="mac" id="mac_hidden" value="N">
									<input type="hidden" name="linux" id="linux_hidden" value="N">
									<input type="hidden" name="game" id="game_hidden" value="N">
									<input type="hidden" name="skill_etc" id="skill_etc_hidden" value="N">
								</td>
								<td>
									<input type="submit" onclick="skillPopup();" value="저장">
									<input type="reset" value="초기화">
								</td>
							</tr>
						</table>
		            </form>
		            
		            <form action="updateLanguage.do" method="post">
			            <table>
					        <tr class="interest" id="userLanguage">
					            <td><h4>언어</h4></td>
					            <td>
						            <input type="checkbox" name="html" id="html" value="Y">
						            <label for="html">HTML</label>
						            <input type="checkbox" name="css" id="css" value="Y">
									<label for="css">CSS</label>
						            <input type="checkbox" name="c" id="c" value="Y">
						            <label for="c">C</label>
						            <input type="checkbox" name="c_pp" id="c_pp" value="Y">
						            <label for="c_pp">C++</label>
						            <input type="checkbox" name="c_sharp" id="c_sharp" value="Y">
						            <label for="c_sharp">C#</label>
						            <input type="checkbox" name="java" id="java" value="Y">
						            <label for="java">JAVA</label>
						            <input type="checkbox" name="python" id="python" value="Y">
						            <label for="python">Python</label>
						            <input type="checkbox" name="php" id="php" value="Y">
						            <label for="php">PHP</label>
						            <input type="checkbox" name="dart" id="dart" value="Y">
						            <label for="dart">Dart</label>
						            <input type="checkbox" name="typescript" id="typescript" value="Y">
						            <label for="typescript">TypeScript</label>
						            <input type="checkbox" name="kotlin" id="kotlin" value="Y">
						            <label for="kotlin">Kotlin</label>
						            <input type="checkbox" name="go" id="go" value="Y">
						            <label for="go">Go</label>
						            <input type="checkbox" name="rust" id="rust" value="Y">
						            <label for="rust">Rust</label>
						            <input type="checkbox" name="swift" id="swift" value="Y">
						            <label for="swift">Swift</label>
						            <input type="checkbox" name="scala" id="scala" value="Y">
						            <label for="scala">Scala</label>
						            <input type="checkbox" name="objective_c" id="objective_c" value="Y">
						            <label for="objective_c">Objective_C</label>
						            <input type="checkbox" name="r" id="r" value="Y">
						            <label for="r">R</label>
						            <input type="checkbox" name="ruby" id="ruby" value="Y">
						            <label for="ruby">Ruby</label>
						            <input type="checkbox" name="haskell" id="haskell" value="Y">
						            <label for="haskell">Haskell</label>
						            <input type="checkbox" name="clojure" id="clojure" value="Y">
						            <label for="clojure">Clojure</label>
						            <input type="checkbox" name="sql" id="sql" value="Y">
						            <label for="sql">SQL</label>
						            <input type="checkbox" name="language_etc" id="language_etc" value="Y">
						            <label for="language_etc">기타</label>
						           	<br><br>
						           	<input type="hidden" name="u_email" value="<%=info.getU_email()%>">
						           	<input type="hidden" name="html" id="html_hidden" value="N">
						            <input type="hidden" name="css" id="css_hidden" value="N">
						            <input type="hidden" name="c" id="c_hidden" value="N">
						            <input type="hidden" name="c_pp" id="c_pp_hidden" value="N">
						            <input type="hidden" name="c_sharp" id="c_sharp_hidden" value="N">
						            <input type="hidden" name="java" id="java_hidden" value="N">
						            <input type="hidden" name="python" id="python_hidden" value="N">
						            <input type="hidden" name="php" id="php_hidden" value="N">
						            <input type="hidden" name="dart" id="dart_hidden" value="N">
						            <input type="hidden" name="typescript" id="typescript_hidden" value="N">
						            <input type="hidden" name="kotlin" id="kotlin_hidden" value="N">
						            <input type="hidden" name="go" id="go_hidden" value="N">
						            <input type="hidden" name="rust" id="rust_hidden" value="N">
						            <input type="hidden" name="swift" id="swift_hidden" value="N">
						            <input type="hidden" name="scala" id="scala_hidden" value="N">
						            <input type="hidden" name="objective_c" id="objective_c_hidden" value="N">
						            <input type="hidden" name="r" id="r_hidden" value="N">
						            <input type="hidden" name="ruby" id="ruby_hidden" value="N">
						            <input type="hidden" name="haskell" id="haskell_hidden" value="N">
						            <input type="hidden" name="clojure" id="clojure" value="N">
						            <input type="hidden" name="sql" id="sql_hidden" value="N">
						            <input type="hidden" name="language_etc" id="language_etc_hidden" value="N">
					            </td>
					            <td>
						            <input type="submit" onclick="langPopup();" value="저장">
						            <input type="reset" value="초기화">
					            </td>
					        </tr>
				        </table>
		            </form>
		            <form action="updateDB.do" method="post">
						<table>
							<tr class="interest" id="userDB">
							    <td><h4>DB</h4></td>
							    <td>
								    <input type="checkbox" name="mysql" id="mysql" value="Y">
								    <label for="mysql">MySQL</label>
								    <input type="checkbox" name="oracle" id="oracle" value="Y">
								    <label for="oracle">Oracle</label>
								    <input type="checkbox" name="mariadb" id="mariadb" value="Y">
								    <label for="mariadb">MariaDB</label>
								    <input type="checkbox" name="pstgresql" id="pstgresql" value="Y">
								    <label for="pstgresql">Pstgresql</label>
								    <input type="checkbox" name="mongodb" id="mongodb" value="Y">
								    <label for="mongodb">MongoDB</label>
								    <input type="checkbox" name="redis" id="redis" value="Y">
								    <label for="redis">Redis</label>
								    <input type="checkbox" name="sqlite" id="sqlite" value="Y">
								    <label for="sqlite">SQLite</label>
								    <input type="checkbox" name="aws_aurora" id="aws_aurora" value="Y">
								    <label for="sqlite">AWS_Aurora</label>
								    <input type="checkbox" name="elasticsearch" id="elasticsearch" value="Y">
								    <label for="elasticsearch">Elasticsearch</label>
								    <input type="checkbox" name="dynamodb" id="dynamodb" value="Y">
								    <label for="dynamodb">DynamoDB</label>
								    <input type="checkbox" name="firebase" id="firebase" value="Y">
								    <label for="firebase">Firebase</label>
								    <input type="checkbox" name="tibero" id="tibero" value="Y">
								    <label for="tibero">Tibero</label>
								    <input type="checkbox" name="hive" id="hive" value="Y">
								    <label for="hive">Hive</label>
								    <input type="checkbox" name="cassandra" id="cassandra" value="Y">
								    <label for="cassandra">Cassandra</label>
								    <input type="checkbox" name="db_etc" id="db_etc" value="Y">
								    <label for="db_etc">기타</label>
								    <br><br>
								    <input type="hidden" name="u_email" value="<%=info.getU_email()%>">
								    <input type="hidden" name="mysql" id="mysql_hidden" value="N">
								    <input type="hidden" name="oracle" id="oracle_hidden" value="N">
								    <input type="hidden" name="mariadb" id="mariadb_hidden" value="N">
								    <input type="hidden" name="pstgresql" id="pstgresql_hidden" value="N">
								    <input type="hidden" name="mongodb" id="mongodb_hidden" value="N">
								    <input type="hidden" name="redis" id="redis" value="N">
								    <input type="hidden" name="sqlite" id="sqlite_hidden" value="N">
								    <input type="hidden" name="aws_aurora" id="aws_aurora_hidden" value="N">
								    <input type="hidden" name="elasticsearch" id="elasticsearch_hidden" value="N">
								    <input type="hidden" name="dynamodb" id="dynamodb_hidden" value="N">
								    <input type="hidden" name="firebase" id="firebase_hidden" value="N">
								    <input type="hidden" name="tibero" id="tibero_hidden" value="N">
								    <input type="hidden" name="hive" id="hive_hidden" value="N">
								    <input type="hidden" name="cassandra" id="cassandra_hidden" value="N">
								    <input type="hidden" name="db_etc" id="db_etc_hidden" value="N">
							    </td>
							    <td>
								    <input type="submit" onclick="dbPopup();" value="저장">
								    <input type="reset" value="초기화">
							    </td>
							</tr>
						</table>
		            </form>
		        </div>
		    </div>

		    <div id="posted">
			<%for(int i = 0; i < upList.size(); i++){ %>
			<div id="checkPost" class="window posted" style="width: 630px">
			<div class="title-bar">
				<div class="title-bar-text"><%=upList.get(i).getPost_title()%></div>
			</div>
			
			<div class="window-body">
				<table id="list" border="1" bgcolor="white">
					<tr>
						<td>작성자</td>
						<td style="width: 650px"><%=upList.get(i).getU_name()%></td>
					</tr>
					<tr>
						<td colspan="2">내용</td>
					</tr>
					<tr>
						<td colspan="2" align="center"><img alt=""
							src="img/<%=upList.get(i).getPost_file()%>"><br><br> <b><%=upList.get(i).getPost_content()%></b>
						</td>
					</tr>
					<%
						PostInfoDAO daoTag = new PostInfoDAO();
						List<Tag> list2 = daoTag.postTagView(upList.get(i).getPost_seq());
					%>
					<tr style="height: 20px">
						<td colspan="2">
						<%for(int k = 0; k < list2.size(); k++){ %>
						<a href="goTagMain.do?tag_seq=<%=list2.get(k).getTag_seq()%>"><%='#'+list2.get(k).getTag_content()%></a>
						<%};%>
						</td>
					</tr>
				</table>
			</div>

			<div class="status-bar">
				<p class="status-bar-field">
					<a href="mainBookmark.do?req_page=myPage&post_seq=<%=upList.get(i).getPost_seq()%>
					&u_email=<%=info.getU_email()%>">
					<button	id="btn">
						<%=upList.get(i).getBookmarks()%>
						<img src="./img/북마크.png" width="15" alt="">
					</button>
					</a>
				</p>
				<%-- 좋아요 기능 --%>
				<p class="status-bar-field">
					<a href="mainLike.do?req_page=myPage&post_seq=<%=upList.get(i).getPost_seq()%>&u_email=<%=info.getU_email()%>">
					<button	id="btn"><%=upList.get(i).getLikes()%> 💖
					</button></a>
				<%-- 좋아요 기능 끝 --%>
				</p>
				<form action="mainCmt.do">
					<input type="hidden" name="req_page" value="myPage">
					<input type="hidden" name="post_seq" value="<%=upList.get(i).getPost_seq()%>">
					<input type="hidden" name="u_email" value="<%=info.getU_email()%>">
					<p class="status-bar-field">
						<input type="text" name="cmt_content" placeholder="댓글"
						style="width:290px">
						<input type="submit" value="등록">
					</p>
				</form>
				
					
					<p class="status-bar-field"><a href=""><button id="btn">댓글<%=upList.get(i).getCmts()%> </button></a></p>
				
				<%
				// comment 출력
				CommentInfoDAO dao = new CommentInfoDAO();
				List<CommentInfo> cmtList = dao.commentInfoList(upList.get(i).getPost_seq());
				%>
			</div>
			<%for (int j = 0; j < cmtList.size(); j++) {%>			
			<table style="width:630px;">
				<tr>
					<td><a href="goUserPage.do?u_email=<%=cmtList.get(j).getU_email()%>"><b><%=cmtList.get(j).getU_name()%></b></a></td>
					<td style="width:360px;"><%=cmtList.get(j).getCmt_content()%></td>
					<td>
					<a href="mainCmtLike.do?req_page=myPage&cmt_seq=<%=cmtList.get(j).getCmt_seq()%>&u_email=<%=info.getU_email()%>">
					<button	id="btn"><%=cmtList.get(j).getCmt_likes()%> 💖
					</button></a>
					</td>
				</tr>
			<%}%>	
			</table>
		</div>
		<%}%>
		</div>

	    <div id="bookmark">
			<%for(int i = 0; i < bmList.size(); i++){ %>
			<div id="checkPost" class="window posted" style="width: 630px">
			<div class="title-bar">
				<div class="title-bar-text"><%=bmList.get(i).getPost_title()%></div>
			</div>
			
			<div class="window-body">
				<table id="list" border="1" bgcolor="white">
					<tr>
						<td>작성자</td>
						<td style="width: 650px"><a href="goUserPage.do?u_email=<%=bmList.get(i).getU_email()%>"><%=bmList.get(i).getU_name()%></a></td>
					</tr>
					<tr>
						<td colspan="2">내용</td>
					</tr>
					<tr>
						<td colspan="2" align="center"><img alt=""
							src="img/<%=bmList.get(i).getPost_file()%>"><br><br> <b><%=bmList.get(i).getPost_content()%></b>
						</td>
					</tr>
					<%
						PostInfoDAO daoTag = new PostInfoDAO();
						List<Tag> list2 = daoTag.postTagView(bmList.get(i).getPost_seq());
					%>
					<tr style="height: 20px">
						<td colspan="2">
						<%for(int k = 0; k < list2.size(); k++){ %>
						<a href="goTagMain.do?tag_seq=<%=list2.get(k).getTag_seq()%>"><%='#'+list2.get(k).getTag_content()%></a>
						<%};%>
						</td>
					</tr>
				</table>
			</div>

			<div class="status-bar">
				<p class="status-bar-field">
					<a href="mainBookmark.do?req_page=myPage&post_seq=<%=bmList.get(i).getPost_seq()%>
					&u_email=<%=info.getU_email()%>">
					<button	id="btn">
						<%=bmList.get(i).getBookmarks()%>
						<img src="./img/북마크.png" width="15" alt="">
					</button>
					</a>
				</p>
				<%-- 좋아요 기능 --%>
				<p class="status-bar-field">
					<a href="mainLike.do?req_page=myPage&post_seq=<%=bmList.get(i).getPost_seq()%>&u_email=<%=info.getU_email()%>">
					<button	id="btn"><%=bmList.get(i).getLikes()%> 💖
					</button></a>
				<%-- 좋아요 기능 끝 --%>
				</p>
				<form action="mainCmt.do">
					<input type="hidden" name="req_page" value="myPage">
					<input type="hidden" name="post_seq" value="<%=bmList.get(i).getPost_seq()%>">
					<input type="hidden" name="u_email" value="<%=info.getU_email()%>">
					<p class="status-bar-field">
						<input type="text" name="cmt_content" placeholder="댓글"
						style="width:290px">
						<input type="submit" value="등록">
					</p>
				</form>
				
					
					<p class="status-bar-field"><a href=""><button id="btn">댓글<%=bmList.get(i).getCmts()%> </button></a></p>
				
				<%
				// comment 출력
				CommentInfoDAO dao = new CommentInfoDAO();
				List<CommentInfo> cmtList = dao.commentInfoList(bmList.get(i).getPost_seq());
				%>
			</div>
			<%for (int j = 0; j < cmtList.size(); j++) {%>			
			<table style="width:630px;">
				<tr>
					<td><a href="goUserPage.do?u_email=<%=cmtList.get(j).getU_email()%>"><b><%=cmtList.get(j).getU_name()%></b></a></td>
					<td style="width:360px;"><%=cmtList.get(j).getCmt_content()%></td>
					<td>
					<a href="mainCmtLike.do?req_page=myPage&cmt_seq=<%=cmtList.get(j).getCmt_seq()%>&u_email=<%=info.getU_email()%>">
					<button	id="btn"><%=cmtList.get(j).getCmt_likes()%> 💖
					</button></a>
					</td>
				</tr>
			<%}%>	
			</table>
		</div>
		<%}%>
		</div>
			
			
			
			
			<!--팔로잉 팔로워 기능 추가해야함 -->
			<div id="follow" style="display:none; font-family:auto;">
				<div class="window" style="max-width:100%" align="center">
					<div class="title-bar">
						<div class="title-bar-text">팔로우/팔로워</div>
						<div class="title-bar-controls">
							<button aria-label="Close" onclick="location.href ='goMyPage.do?u_email=<%=info.getU_email()%>'"></button>
						</div>
					</div>
					<div class="window-body" style="justify-content: space-between;">
						<div>
							<div>
								<table>
									<tr>
										<td colspan="2">
											<h5 align="center"> 팔로우, 팔로워 아이디를 검색하세요.</h5>
										</td>
				
									</tr>
									<tr>
									<td>
									<input type="text" placeholder="아이디를 검색하세요"
										style="width:120px; height: 20px; font: size 10px;;"></td>
									<td><button>검색</button></td>
									</tr>
								</table>
									<br>
			
		
			
				
																														
								<ul class="tabs" >
								<!-- style="display:flex;justify-content: space-around; margin: 8px; list-style:none;" -->
									<li class="tab-link current" data-tab="tab-1">팔로우</li>
									<li class="tab-link" data-tab="tab-2">팔로워</li>
								</ul>
						
							<div id="tab-1" style="margin-bottom:50px" class="tab-content current" >
				<div id="follow-table">
									<table style="width: 600px; height: 100px; overflow: auto; text-align: center;">
										<thead>
											<tr height="30px">
												<th>아이디</th>
												<th>메신저보내기</th>
												<th>팔로우 삭제</th>
											</tr>
										</thead>
										<tbody>
											<%for(int i = 0; i < following.size(); i++){%>
											<tr>
												<td><a href="goUserPage.do?u_email=<%=following.get(i).getU_email()%>"><%=following.get(i).getU_name()%></a></td>
												<td><a href="#"><img src="img/message.png" alt="메세지보내기"></img></a></td>
												<td>
													<a href="follow.do?follower_email=<%=info.getU_email()%>&u_email=<%=following.get(i).getU_email()%>">
													<button	id="btn"> 삭제
													</button></a>
													<!-- <img src="img/delete.png" width="50px"
													height="50px" alt="팔로워 삭제" onclick="test()"> -->
												</td>
											</tr>
											<%}%>
										</tbody>
									</table>
							</div>
							
								<br>
							</div>
							<div id="tab-2" style="margin-bottom:50px" class="tab-content">
								<div id="follow-table">
									<table style="width: 600px; height: 100px; overflow: auto; text-align: center;" >
										<thead>
											<tr height="30px">
												<th>아이디</th>
												<th>메신저보내기</th>
												<th>팔로잉</th>
											</tr>
										</thead>
										<tbody id="follower">
											<%for(int i = 0; i < follower.size(); i++){%>
											<tr>
												<td><a href="goUserPage.do?u_email=<%=follower.get(i).getU_email()%>"><%=follower.get(i).getU_name()%></a></td>
												<td><a href="#"><img src="img/message.png" alt="메세지보내기"></img></a></td>
												<td>
													<a href="follow.do?follower_email=<%=info.getU_email()%>&u_email=<%=follower.get(i).getU_email()%>">
													<button	id="btn"> 팔로잉
													</button></a>
													<!-- <img src="img/delete.png" width="50px"
													height="50px" alt="팔로워 삭제" onclick="test()"> -->
												</td>
											</tr>
											<%}%>
										</tbody>
									</table>
								</div>
								<br>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 나의 아이디어 목록 -->
			<div id="myIdea" style="display:none; font-family:auto;">
				<div class="myIdea_list_wrap board_list_wrap">
			        <table class="myIdea_list board_list" border="1">
			            <caption>나의 아이디어 목록</caption>
				            <thead>
				                <tr>
				                    <th>번호</th>
				                    <th>제목</th>
				                    <th>작성자</th>
				                    <th>작성일</th>
				                    <th>조회수</th>
				                </tr>
				            </thead>
				            <tbody>
				                <tr>
				                
				                <!-- 나의 아이디어..  -->
				         <%--            <td><%=miList.get(0).getRow_num() %></td>
				                    <td class="tit">
				                        <a href="#"><%=miList.get(0).getPost_title() %></a>
				                    </td>
				                    <td><%=miList.get(0).getU_name() %></td>
				                    <td><%=miList.get(0).getPost_dt() %></td>
				                    <td><%=miList.get(0).getCnt() %></td> --%>
				                </tr>
				              
				            </tbody>
			        </table>
			        <br>
					<%-- <div class="pagination_section">
						<a href="goIdea.do" class="bt">＜＜ Previous</a>
						<%for(int i=0;i<cnt.size()/10+1;i++){ %>
						<a id="num<%=i+1 %>" class="num" href="goIdea.do?&num=<%=i+1%>"><%=i+1%></a>
						<%} %>	
						<a href="goIdea.do?num=<%=cnt.size()%>" class="bt">Next ＞＞</a>
					</div> --%>
			    </div>
			</div>
			
			<!-- 이력서 및 포트폴리오  -->
			<div id="portfolio" style="display:none;">
		            <div class="window" style="width: 400px; display:block; margin:0 100px; margin-bottom:50px;">
		                <div class="title-bar">
		                    <div class="title-bar-text">
		                        이력서 및 포트폴리오
		                    </div>
		                    <div class="title-bar-controls">
		                    	<button aria-label="Close" onclick="location.href='goMyPage.do?u_email=<%=info.getU_email()%>'"></button>
		                    </div>
		                </div>
		        <form>
		                <table class="userInfo">
		                	<tbody>
		                    <tr>
		                        <td> <strong> 이름 </strong></td>
		                        <td><input type="text"></td>
		                    </tr>
		                    <tr>
		                        <td><strong>이메일</strong></td>
		                        <td><input type="email"></td>
		                    </tr>
		                    <tr>
		                        <td> <strong> 전화번호</strong> </td>
		                        <td><input type="tel"></td>
		                    </tr>
		                    <tr>
		                        <td> <strong>자기소개</strong></td>
		                        <td colspan="2"> <textarea name="talk" cols="50" rows="5"></textarea></td>
		                    </tr>
		
		                    <tr>
		                        <td><strong>관심분야</strong></td>
		                        <td>
		                            <input id="back" type="checkbox" name="hobby">
		                            <label for="back">백엔드</label>
		                            <input id="front" type="checkbox" name="hobby">
		                            <label for="front">프론트엔드</label>
		                            <input id="data" type="checkbox" name="hobby">
		                            <label for="data">데이터분야</label>
		                            <input id="etc" type="checkbox" name="hobby">
		                            <label for="etc">기타</label>
		                        </td>
		                    </tr>
		
		                    <tr>
		                        <td><strong>프론트엔드분야</strong> </td>
		                        <td>
		                            <select name="프론트엔드">
		                                <option value="예비개발자">예비개발자(학생)</option>
		                                <option value="주니어">주니어(사원)</option>
		                                <option value="미드레벨">미드레벨(대리)</option>
		                                <option value="시니어">시니어(과장~ 부장)</option>
		                                <option value="디렉터">디렉터(이사~사장)</option>
		                                <option value="프리랜서">프리랜서</option>
		                            </select>
		                        </td>
		                    </tr>
		                    <tr>
		                        <td><strong>백엔드분야</strong> </td>
		                        <td>
		                            <select name="백엔드">
		                                <option value="예비개발자">예비개발자(학생)</option>
		                                <option value="주니어">주니어(사원)</option>
		                                <option value="미드레벨">미드레벨(대리)</option>
		                                <option value="시니어">시니어(과장~ 부장)</option>
		                                <option value="디렉터">디렉터(이사~사장)</option>
		                                <option value="프리랜서">프리랜서</option>
		                             </select>
		                        </td>
		                    </tr>
		                    <tr>
		                        <td><strong>데이터분야</strong></td>
		                        <td>
		                            <select name="데이터분야">
		                                <option value="예비개발자">예비개발자(학생)</option>
		                                <option value="주니어">주니어(사원)</option>
		                                <option value="미드레벨">미드레벨(대리)</option>
		                                <option value="시니어">시니어(과장~ 부장)</option>
		                                <option value="디렉터">디렉터(이사~사장)</option>
		                                <option value="프리랜서">프리랜서</option>
		                            </select>
		                        </td>
		                    </tr>
		                   
		                    <tr>
		                        <td> <strong> 경력사항</strong></td>
		                    </tr>
		                    <tr>
		                        <td> <strong>근무기간</strong> </td>
		                        
		                    </tr>
		
		                    <tr>
		                        <td> <strong>시작일</strong> </td>
		                        <td> <input type="date" id="start_date"></td>
		                        
		                    </tr>
		                    <tr>
		                        <td> <strong>종료일</strong> </td>
		                        <td> <input type="date" id="start_date"></td>
		                    </tr>
		                    <tr>
		                        <td> <strong>주요성과</strong></td>
		                        <td colspan="2"> <textarea name="talk" cols="50" rows="8"></textarea></td>
		                    </tr>
		
		                    <tr>
		                        <td><strong>사용기술</strong></td>
		                        <td colspan="2"> <textarea name="talk" cols="50" rows="5"></textarea></td>
		                    </tr>
		
		                    <tr>
		                        <td> <strong>포트폴리오</strong> </td>
		                        <td> <input type="file" name="" id=""><br></td>
		                    </tr>
							</tbody>
		                </table>
		                <br>
		                <input type="submit" onclick="pfPopup();" value="이력서 저장하기">
		        </form>
					</div>
			</div>
				
			<!-- FAQ -->
			<div id="faq" style="display:none;">
				<div class="window" style="width: 630px; margin-bottom:40px" align="center"><span style="display: flex; flex-direction: column;"></span>
					<div class="title-bar">
						<div class="title-bar-text">HEllo iT</div>
						<div class="title-bar-controls">
						<button aria-label="Close" onclick="location.href ='goMyPage.do?u_email=<%=info.getU_email()%>'"></button>
						</div>
					</div>	
			        <br><br>
					<img src="./img/window.gif" width="200" alt="">
					<h3>자주 묻는 질문</h3>
					<div class="faq-container">
						<div class="faq">
							<h4 class="faq-title">"Hello it"은 무슨 웹사이트 인가요?</h4>
							
							<p class="faq-text">안녕하세요 이용자님 "Hello it"은 국내 모든 개발자들을 위한 SNS로 개발관련 정보공유를 보다 손쉽게 캐치 하실 수 있으십니다. </p>
						
						    <button class="faq-toggle">
								<i class="fas fa-chevron-down"></i>
								<i class="fas fa-times"></i>
					    	</button>
						</div>		
						<div class="faq">
						    <h4 class="faq-title">아이디어 토론장은 뭐하는 공간인가요?</h4>
						
						    <p class="faq-text">여러분들의 머리속에 있는 프로젝트 주제를 등록 할수 있으면서 동시에 그 주제에 대해 다른 사용자 분들과 토론이 진행가능 하며 채용자들의 스카우트 대상이 될수도 있어요! </p>
						
						    <button class="faq-toggle">
								<i class="fas fa-chevron-down"></i>
								<i class="fas fa-times"></i>
						    </button>
						</div>
						<div class="faq">
							<h4 class="faq-title">입문자들은 이용하는데 어려움은 없을까요?</h4>
							
							<p class="faq-text">네 당연합니다! 우리 Hello it은 개인 역량에 맞춰 언어별로 자신에게 맞는 눈높이로 정보들을 습득할 수 있습니다. </p>
							
							<button class="faq-toggle">
								<i class="fas fa-chevron-down"></i>
								<i class="fas fa-times"></i>
							</button>
						</div>
						<div class="faq">
							<h4 class="faq-title">개발자의 정보를 알고싶어요!</h4>
							<p class="faq-text"> 여기로 모시겠습니다! 
							<br><br>
							<a href="goDevInfo.do"><img src="./img/KakaoTalk_20221207_141006268.png" width="100" alt=""></a>
							</p>
							<button class="faq-toggle">
								<i class="fas fa-chevron-down"></i>
								<i class="fas fa-times"></i>
							</button>
						</div>
					</div>
				</div>
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
	<script type="text/javascript">
		$('#listOfMyPage').on('click', function() {
			$('#myPage').show();
			$('#checkInterest').hide();
			$('#posted').hide();
			$('#bookmark').hide();
			$('#follow').hide();
			$('#myIdea').hide();
			$('#portfolio').hide();
			$('#faq').hide();
		});
		$('#listOfInterest').on('click', function() {

			$('#myPage').hide();
			$('#checkInterest').show();
			$('#posted').hide();
			$('#bookmark').hide();
			$('#follow').hide();
			$('#myIdea').hide();
			$('#portfolio').hide();
			$('#faq').hide();
		});
		$('#listOfPosted').on('click', function() {
			$('#myPage').hide();
			$('#checkInterest').hide();
			$('#posted').show();
			$('#bookmark').hide();
			$('#follow').hide();
			$('#myIdea').hide();
			$('#portfolio').hide();
			$('#faq').hide();
		});
		$('#listOfBookmark').on('click', function() {
			$('#myPage').hide();
			$('#checkInterest').hide();
			$('#posted').hide();
			$('#bookmark').show();
			$('#follow').hide();
			$('#myIdea').hide();
			$('#portfolio').hide();
			$('#faq').hide();
		});
		$('#listOfFollow').on('click', function() {
			$('#myPage').hide();
			$('#checkInterest').hide();
			$('#posted').hide();
			$('#bookmark').hide();
			$('#follow').show();
			$('#myIdea').hide();
			$('#portfolio').hide();
			$('#faq').hide();
		});
		$('#listOfMyIdea').on('click', function() {
			$('#myPage').hide();
			$('#checkInterest').hide();
			$('#posted').hide();
			$('#bookmark').hide();
			$('#follow').hide();
			$('#myIdea').show();
			$('#portfolio').hide();
			$('#faq').hide();
		});
		$('#listOfPortfolio').on('click', function() {
			$('#myPage').hide();
			$('#checkInterest').hide();
			$('#posted').hide();
			$('#bookmark').hide();
			$('#follow').hide();
			$('#myIdea').hide();
			$('#portfolio').show();
			$('#faq').hide();
		});
		$('#listOfFAQ').on('click', function() {
			$('#myPage').hide();
			$('#checkInterest').hide();
			$('#posted').hide();
			$('#bookmark').hide();
			$('#follow').hide();
			$('#myIdea').hide();
			$('#portfolio').hide();
			$('#faq').show();
		});
	</script>

	<%-- 체크박스 DB 연결전 value값 체크 스크립트 --%>
	<script>
		// 역할 관련
		var frontend_hidden = $("#frontend").prop("checked") ? "Y" : "N";
		$("#frontend_hidden").val(frontend_hidden);
		var backend_hidden = $("#backend").prop("checked") ? "Y" : "N";
		$("#backend_hidden").val(backend_hidden);
		var data_etc_hidden = $("#data_etc").prop("checked") ? "Y" : "N";
		$("#data_etc_hidden").val(data_etc_hidden);
		var other_skill_hidden = $("#other_skill").prop("checked") ? "Y" : "N";
		$("#other_skill_hidden").val(other_skill_hidden);

		// 스킬
		var web_hidden = $("#web").prop("checked") ? "Y" : "N";
		$("#web_hidden").val(web_hidden);
		var ios_hidden = $("#ios").prop("checked") ? "Y" : "N";
		$("#ios_hidden").val(ios_hidden);
		var android_hidden = $("#android").prop("checked") ? "Y" : "N";
		$("#android_hidden").val(android_hidden);
		var windows_hidden = $("#windows").prop("checked") ? "Y" : "N";
		$("#windows_hidden").val(windows_hidden);
		var mac_hidden = $("#mac").prop("checked") ? "Y" : "N";
		$("#mac_hidden").val(mac_hidden);
		var linux_hidden = $("#linux").prop("checked") ? "Y" : "N";
		$("#linux_hidden").val(linux_hidden);
		var game_hidden = $("#game").prop("checked") ? "Y" : "N";
		$("#game_hidden").val(game_hidden);
		var skill_etc_hidden = $("#skill_etc").prop("checked") ? "Y" : "N";
		$("#skill_etc_hidden").val(skill_etc_hidden);

		// 언어
		var html_hidden = $("#html").prop("checked") ? "Y" : "N";
		$("#html_hidden").val(html_hidden);
		var css_hidden = $("#css").prop("checked") ? "Y" : "N";
		$("#css_hidden").val(css_hidden);
		var javascript_hidden = $("#javascript").prop("checked") ? "Y" : "N";
		$("#javascript_hidden").val(javascript_hidden);
		var c_hidden = $("#c").prop("checked") ? "Y" : "N";
		$("#c_hidden").val(c_hidden);
		var c_pp_hidden = $("#c_pp").prop("checked") ? "Y" : "N";
		$("#c_pp_hidden").val(c_pp_hidden);
		var c_sharp_hidden = $("#c_sharp").prop("checked") ? "Y" : "N";
		$("#c_sharp_hidden").val(c_sharp_hidden);
		var java_hidden = $("#java").prop("checked") ? "Y" : "N";
		$("#java_hidden").val(java_hidden);
		var python_hidden = $("#python").prop("checked") ? "Y" : "N";
		$("#python_hidden").val(python_hidden);
		var php_hidden = $("#php").prop("checked") ? "Y" : "N";
		$("#php_hidden").val(php_hidden);
		var dart_hidden = $("#dart").prop("checked") ? "Y" : "N";
		$("#dart_hidden").val(dart_hidden);

		var typescript_hidden = $("#typescript").prop("checked") ? "Y" : "N";
		$("#typescript_hidden").val(typescript_hidden);
		var kotlin_hidden = $("#kotlin").prop("checked") ? "Y" : "N";
		$("#kotlin_hidden").val(kotlin_hidden);
		var go_hidden = $("#go").prop("checked") ? "Y" : "N";
		$("#go_hidden").val(go_hidden);
		var rust_hidden = $("#rust").prop("checked") ? "Y" : "N";
		$("#rust_hidden").val(rust_hidden);
		var swift_hidden = $("#swift").prop("checked") ? "Y" : "N";
		$("#swift_hidden").val(swift_hidden);
		var scala_hidden = $("#scala").prop("checked") ? "Y" : "N";
		$("#scala_hidden").val(scala_hidden);
		var objective_c_hidden = $("#objective_c").prop("checked") ? "Y" : "N";
		$("#objective_c_hidden").val(objective_c_hidden);
		var r_hidden = $("#r").prop("checked") ? "Y" : "N";
		$("#r_hidden").val(r_hidden);
		var ruby_hidden = $("#ruby").prop("checked") ? "Y" : "N";
		$("#ruby_hidden").val(ruby_hidden);
		var haskell_hidden = $("#haskell").prop("checked") ? "Y" : "N";
		$("#haskell_hidden").val(haskell_hidden);
		var clojure_hidden = $("#clojure").prop("checked") ? "Y" : "N";
		$("#clojure_hidden").val(clojure_hidden);
		var sql_hidden = $("#sql").prop("checked") ? "Y" : "N";
		$("#sql_hidden").val(r_hsql_hiddenidden);
		var language_etc_hidden = $("#language_etc").prop("checked") ? "Y"
				: "N";
		$("#language_etc_hidden").val(language_etc_hidden);

		// DB
		var mysql_hidden = $("#mysql").prop("checked") ? "Y" : "N";
		$("#mysql_hidden").val(mysql_hidden);
		var oracle_hidden = $("#oracle").prop("checked") ? "Y" : "N";
		$("#oracle_hidden").val(oracle_hidden);
		var mariadb_hidden = $("#mariadb").prop("checked") ? "Y" : "N";
		$("#mariadb_hidden").val(mariadb_hidden);
		var pstgresql_hidden = $("#pstgresql").prop("checked") ? "Y" : "N";
		$("#pstgresql_hidden").val(pstgresql_hidden);
		var mongodb_hidden = $("#mongodb").prop("checked") ? "Y" : "N";
		$("#mongodb_hidden").val(mongodb_hidden);
		var redis = $("#redis").prop("checked") ? "Y" : "N";
		$("#redis").val(redis);
		var sqlite_hidden = $("#sqlite").prop("checked") ? "Y" : "N";
		$("#sqlite_hidden").val(sqlite_hidden);
		var aws_aurora_hidden = $("#aws_aurora").prop("checked") ? "Y" : "N";
		$("#aws_aurora_hidden").val(aws_aurora_hidden);
		var elasticsearch_hidden = $("#elasticsearch").prop("checked") ? "Y"
				: "N";
		$("#elasticsearch_hidden").val(elasticsearch_hidden);
		var dynamodb_hidden = $("#dynamodb").prop("checked") ? "Y" : "N";
		$("#dynamodb_hidden").val(dynamodb_hidden);
		var firebase_hidden = $("#firebase").prop("checked") ? "Y" : "N";
		$("#firebase_hidden").val(firebase_hidden);
		var tibero_hidden = $("#tibero").prop("checked") ? "Y" : "N";
		$("#tibero_hidden").val(tibero_hidden);
		var hive_hidden = $("#hive").prop("checked") ? "Y" : "N";
		$("#hive_hidden").val(hive_hidden);
		var cassandra_hidden = $("#cassandra").prop("checked") ? "Y" : "N";
		$("#cassandra_hidden").val(cassandra_hidden);
		var db_etc_hidden = $("#db_etc").prop("checked") ? "Y" : "N";
		$("#db_etc_hidden").val(db_etc_hidden);
	</script>

    <script src="./js/FAQ.js"></script>
    
    <%-- 팔로우/팔로워 스크립트 --%>
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
		
		function test() {
			if (!confirm("팔로우를 정말 삭제하겠습니까?")) {
				alert("취소(아니오)를 누르셨습니다.");
			} else {
				alert("확인(예)을 누르셨습니다. 삭제됩니다.");
			}
		}
	</script>
	<script src="./js/load.js"></script>
	
	<!-- 나의 아이디어 페이징 -->
<%-- 	<script>
	console.log($('#num<%=num%>').attr('class'))
	  for( i=1;i<=<%=cnt.size()/10%>;i++){
		if($('#num<%=num%>').attr("id")=='num'+i){
			$('#num<%=num%>').attr("class","num on")
		}
	}	
</script> --%>
</body>
</html>