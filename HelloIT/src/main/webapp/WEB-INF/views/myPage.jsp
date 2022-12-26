<%@page import="com.smhrd.entity.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello IT</title>
<link rel="stylesheet" href="https://unpkg.com/98.css" />
<link rel="stylesheet" href="./css/style.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
.container {
	display: flex;
	flex-direction: column;
	align-items: center;
	max-width: 100%;
}

.window-body {
	display: flex;
}

.tree-view {
	text-align: -webkit-left;
	font-family: '';
	width: max-content;
	position: sticky;
	top: 27px;
}

ul.tree-view li, ul.tree-view ul {
	margin-top: 15px;
	font-size: initial;
}

label {
	font-family: '';
}

input[type=checkbox]+label, input[type=radio]+label {
	margin-left: 24px;
	position: relative;
	font-size: initial;
	line-height: 25px;
}

input[type=checkbox]:checked+label:after {
	left: -16px;
	top: 8px;
}
</style>
</head>

<body>
	<%
	UserInfo info = (UserInfo)session.getAttribute("info");
	%>
	<div class="container">
		<div class="wrapper">
			<div class="window"
				style="width: 800px; position: sticky; top: 0; max-width: 100%"
				align="center">
				<div class="title-bar" style="position: sticky; top: 1px">
					<div class="title-bar-text">마이 페이지</div>
					<div class="title-bar-controls">
						<button aria-label="Close" onclick="location.href ='goMain.do'"></button>
					</div>
				</div>
				<div class="window-body" style="justify-content: space-between;">
					<div>
						<ul class="tree-view" style="font-family: auto;">
							<li id="listOfMyPage" style="cursor: pointer;">나의 회원정보</li>
							<li id="listOfInterest" style="cursor: pointer;">관심분야 Check</li>
							<li id="listOfPosted" style="cursor: pointer;">내가올린 게시물
							<li>
							<li id="listOfBookmark" style="cursor: pointer;">북마크한 게시물
							<li>
							<li id="listOfFollow" style="cursor: pointer;">팔로잉/팔로워</li>
							<li id="listOfMyIdea" style="cursor: pointer;">나의 아이디어
							<li>
							<li id="listOfPortfolio" style="cursor: pointer;">포트폴리오&자소서
							<li>
						</ul>
					</div>
					<div id="myPage" style="display: none;">myPage</div>
					<div class="window" id="checkInterest"
						style="display: none; margin-left: 8px">
						<div class="title-bar" style="position: sticky; top: 27px">
							<div class="title-bar-text">관심 분야 Check!!</div>
							<div class="title-bar-controls">
								<button aria-label="Close"
									onclick="location.href ='goMyPage.do'"></button>
							</div>
						</div>
						<div class="window-body" style="display: block;">
							<h4>관심있는분야나 직장에서 맡고있는 분야를 선택하세요(중복선택 가능), 체크한 분야에 따라서 게시물이
								자동 선별됩니다.</h4>
							<div id="userRole">
								<h4>맡고싶거나 맡고있는 역할을 선택하세요</h4>
								<form action="updateRole.do" method="post">
									<input type="checkbox" name="frontend" id="frontend" value="Y">
									<label for="frontend">프론트엔드</label> <input type="checkbox"
										name="backend" id="backend" value="Y"> <label
										for="backend">백엔드</label> <input type="checkbox"
										name="data_etc" id="data_etc" value="Y"> <label
										for="data_etc">데이터분야(빅데이터,인공지능포함)</label> <input
										type="checkbox" name="other_skill" id="other_skill" value="Y">
									<label for="other_skill">기타</label> <br>
									<br> <input type="hidden" name="u_email"
										value="<%=info.getU_email()%>"> <input type="hidden"
										name="frontend" id="frontend_hidden" value="N"> <input
										type="hidden" name="backend" id="backend_hidden" value="N">
									<input type="hidden" name="data_etc" id="data_etc_hidden"
										value="N"> <input type="hidden" name="other_skill"
										id="other_skill_hidden" value="N"> <input
										type="submit" value="저장"> <input type="reset"
										value="초기화">
								</form>
							</div>
							<div id="userSkill">
								<h4>담당했던분야나 관심있는 분야를 선택하세요</h4>
								<form action="updateSkill.do" method="post">
									<input type="checkbox" name="web" id="web" value="Y"> <label
										for="web">웹</label> <input type="checkbox" name="ios" id="ios"
										value="Y"> <label for="ios">iOS</label> <input
										type="checkbox" name="android" id="android" value="Y">
									<label for="android">안드로이드</label> <input type="checkbox"
										name="windows" id="windows" value="Y"> <label
										for="windows">윈도우</label> <input type="checkbox" name="mac"
										id="mac" value="Y"> <label for="mac">맥</label> <input
										type="checkbox" name="linux" id="linux" value="Y"> <label
										for="linux">리눅스</label> <input type="checkbox" name="game"
										id="game" value="Y"> <label for="game">게임</label> <input
										type="checkbox" name="skill_etc" id="skill_etc" value="Y">
									<label for="skill_etc">기타</label> <br>
									<br> <input type="hidden" name="u_email"
										value="<%=info.getU_email()%>"> <input type="hidden"
										name="web" id="web_hidden" value="N"> <input
										type="hidden" name="ios" id="ios_hidden" value="N"> <input
										type="hidden" name="android" id="android_hidden" value="N">
									<input type="hidden" name="windows" id="windows_hidden"
										value="N"> <input type="hidden" name="mac"
										id="mac_hidden" value="N"> <input type="hidden"
										name="linux" id="linux_hidden" value="N"> <input
										type="hidden" name="game" id="game_hidden" value="N">
									<input type="hidden" name="skill_etc" id="skill_etc_hidden"
										value="N"> <input type="submit" value="저장"> <input
										type="reset" value="초기화">
								</form>
							</div>
							<div id="userLanguage">
								<h4>사용할줄 아는 언어 또는 관심있는 언어를 선택하세요</h4>
								<form action="updateLanguage.do" method="post">
									<input type="checkbox" name="html" id="html" value="Y">
									<label for="html">HTML</label> <input type="checkbox"
										name="css" id="css" value="Y"> <label for="css">CSS</label>
									<input type="checkbox" name="javascript" id="javascript"
										value="Y"> <label for="javascript">JavaScript</label>
									<input type="checkbox" name="c" id="c" value="Y"> <label
										for="c">C</label> <input type="checkbox" name="c_pp" id="c_pp"
										value="Y"> <label for="c_pp">C++</label> <input
										type="checkbox" name="c_sharp" id="c_sharp" value="Y">
									<label for="c_sharp">C#</label> <input type="checkbox"
										name="java" id="java" value="Y"> <label for="java">JAVA</label>
									<input type="checkbox" name="python" id="python" value="Y">
									<label for="python">Python</label> <input type="checkbox"
										name="php" id="php" value="Y"> <label for="php">PHP</label>
									<input type="checkbox" name="dart" id="dart" value="Y">
									<label for="dart">Dart</label> <input type="checkbox"
										name="typescript" id="typescript" value="Y"> <label
										for="typescript">TypeScript</label> <input type="checkbox"
										name="kotlin" id="kotlin" value="Y"> <label
										for="kotlin">Kotlin</label> <input type="checkbox" name="go"
										id="go" value="Y"> <label for="go">Go</label> <input
										type="checkbox" name="rust" id="rust" value="Y"> <label
										for="rust">Rust</label> <input type="checkbox" name="swift"
										id="swift" value="Y"> <label for="swift">Swift</label>
									<input type="checkbox" name="scala" id="scala" value="Y">
									<label for="scala">Scala</label> <input type="checkbox"
										name="objective_c" id="objective_c" value="Y"> <label
										for="objective_c">Objective_C</label> <input type="checkbox"
										name="r" id="r" value="Y"> <label for="r">R</label> <input
										type="checkbox" name="ruby" id="ruby" value="Y"> <label
										for="ruby">Ruby</label> <input type="checkbox" name="haskell"
										id="haskell" value="Y"> <label for="haskell">Haskell</label>
									<input type="checkbox" name="clojure" id="clojure" value="Y">
									<label for="clojure">Clojure</label> <input type="checkbox"
										name="sql" id="sql" value="Y"> <label for="sql">SQL</label>
									<input type="checkbox" name="language_etc" id="language_etc"
										value="Y"> <label for="language_etc">기타</label> <br>
									<br> <input type="hidden" name="u_email"
										value="<%=info.getU_email()%>"> <input type="hidden"
										name="html" id="html_hidden" value="N"> <input
										type="hidden" name="css" id="css_hidden" value="N"> <input
										type="hidden" name="javascript" id="javascript_hidden"
										value="N"> <input type="hidden" name="c" id="c_hidden"
										value="N"> <input type="hidden" name="c_pp"
										id="c_pp_hidden" value="N"> <input type="hidden"
										name="c_sharp" id="c_sharp_hidden" value="N"> <input
										type="hidden" name="java" id="java_hidden" value="N">
									<input type="hidden" name="python" id="python_hidden" value="N">
									<input type="hidden" name="php" id="php_hidden" value="N">
									<input type="hidden" name="dart" id="dart_hidden" value="N">
									<input type="hidden" name="typescript" id="typescript_hidden"
										value="N"> <input type="hidden" name="kotlin"
										id="kotlin_hidden" value="N"> <input type="hidden"
										name="go" id="go_hidden" value="N"> <input
										type="hidden" name="rust" id="rust_hidden" value="N">
									<input type="hidden" name="swift" id="swift_hidden" value="N">
									<input type="hidden" name="scala" id="scala_hidden" value="N">
									<input type="hidden" name="objective_c" id="objective_c_hidden"
										value="N"> <input type="hidden" name="r" id="r_hidden"
										value="N"> <input type="hidden" name="ruby"
										id="ruby_hidden" value="N"> <input type="hidden"
										name="haskell" id="haskell_hidden" value="N"> <input
										type="hidden" name="clojure" id="clojure_hidden" value="N">
									<input type="hidden" name="sql" id="sql_hidden" value="N">
									<input type="hidden" name="language_etc"
										id="language_etc_hidden" value="N"> <input
										type="submit" value="저장"> <input type="reset"
										value="초기화">
								</form>
							</div>
							<div id="userDB">
								<h4>사용할줄 아는 DB 또는 관심있는 DB를 선택하세요</h4>
								<form action="updateDB.do" method="post">
									<input type="checkbox" name="mysql" id="mysql" value="Y">
									<label for="mysql">MySQL</label> <input type="checkbox"
										name="oracle" id="oracle" value="Y"> <label
										for="oracle">Oracle</label> <input type="checkbox"
										name="mariadb" id="mariadb" value="Y"> <label
										for="mariadb">MariaDB</label> <input type="checkbox"
										name="pstgresql" id="pstgresql" value="Y"> <label
										for="pstgresql">Pstgresql</label> <input type="checkbox"
										name="mongodb" id="mongodb" value="Y"> <label
										for="mongodb">MongoDB</label> <input type="checkbox"
										name="redis" id="redis" value="Y"> <label for="redis">Redis</label>
									<input type="checkbox" name="sqlite" id="sqlite" value="Y">
									<label for="sqlite">SQLite</label> <input type="checkbox"
										name="aws_aurora" id="aws_aurora" value="Y"> <label
										for="sqlite">AWS_Aurora</label> <input type="checkbox"
										name="elasticsearch" id="elasticsearch" value="Y"> <label
										for="elasticsearch">Elasticsearch</label> <input
										type="checkbox" name="dynamodb" id="dynamodb" value="Y">
									<label for="dynamodb">DynamoDB</label> <input type="checkbox"
										name="firebase" id="firebase" value="Y"> <label
										for="firebase">Firebase</label> <input type="checkbox"
										name="tibero" id="tibero" value="Y"> <label
										for="tibero">Tibero</label> <input type="checkbox" name="hive"
										id="hive" value="Y"> <label for="hive">Hive</label> <input
										type="checkbox" name="cassandra" id="cassandra" value="Y">
									<label for="cassandra">Cassandra</label> <input type="checkbox"
										name="db_etc" id="db_etc" value="Y"> <label
										for="db_etc">기타</label> <br>
									<br> <input type="hidden" name="u_email"
										value="<%=info.getU_email()%>"> <input type="hidden"
										name="mysql" id="mysql_hidden" value="N"> <input
										type="hidden" name="oracle" id="oracle_hidden" value="N">
									<input type="hidden" name="mariadb" id="mariadb_hidden"
										value="N"> <input type="hidden" name="pstgresql"
										id="pstgresql_hidden" value="N"> <input type="hidden"
										name="mongodb" id="mongodb_hidden" value="N"> <input
										type="hidden" name="redis" id="redis" value="N"> <input
										type="hidden" name="sqlite" id="sqlite_hidden" value="N">
									<input type="hidden" name="aws_aurora" id="aws_aurora_hidden"
										value="N"> <input type="hidden" name="elasticsearch"
										id="elasticsearch_hidden" value="N"> <input
										type="hidden" name="dynamodb" id="dynamodb_hidden" value="N">
									<input type="hidden" name="firebase" id="firebase_hidden"
										value="N"> <input type="hidden" name="tibero"
										id="tibero_hidden" value="N"> <input type="hidden"
										name="hive" id="hive_hidden" value="N"> <input
										type="hidden" name="cassandra" id="cassandra_hidden" value="N">
									<input type="hidden" name="db_etc" id="db_etc_hidden" value="N">
									<input type="submit" value="저장"> <input type="reset"
										value="초기화">
								</form>
							</div>
						</div>
					</div>
					<div id="bookmark" style="display: none;">bookmark</div>
					<div id="follow" style="display: none;">follow</div>
					<div id="myIdea" style="display: none;">myIdea</div>
					<div id="portfolio" style="display: none;">
						<form>
							<div class="window" style="margin: 10px; width: 400px"
								id="tablecenter">
								<div class="title-bar">
									<div class="title-bar-text">이력서 및 포트폴리오</div>
								</div>
								<table>
									<tr>
										<td><strong> 이름 </strong></td>
										<td><input type="text"></td>
									</tr>
									<tr>
										<td><strong>이메일</strong></td>
										<td><input type="email"></td>
									</tr>
									<tr>
										<td><strong> 전화번호</strong></td>
										<td><input type="tel"></td>
									</tr>
									<tr>
										<td><strong>자기소개</strong></td>
										<td colspan="2"><textarea name="talk" cols="50" rows="5"></textarea></td>
									</tr>

									<tr>
										<td><strong>관심분야</strong></td>
										<td><input id="back" type="checkbox" name="hobby">
											<label for="back">백엔드</label> <input id="front"
											type="checkbox" name="hobby"> <label for="front">프론트엔드</label>
											<input id="data" type="checkbox" name="hobby"> <label
											for="data">데이터분야</label> <input id="etc" type="checkbox"
											name="hobby"> <label for="etc">기타</label></td>
									</tr>

									<tr>
										<td><strong>프론트엔드분야</strong></td>
										<td><select name="프론트엔드">
												<option value="예비개발자">예비개발자(학생)</option>
												<option value="주니어">주니어(사원)</option>
												<option value="미드레벨">미드레벨(대리)</option>
												<option value="시니어">시니어(과장~ 부장)</option>
												<option value="디렉터">디렉터(이사~사장)</option>
												<option value="프리랜서">프리랜서</option>
										</select></td>
									</tr>
									<tr>
										<td><strong>백엔드분야</strong></td>
										<td><select name="백엔드">
												<option value="예비개발자">예비개발자(학생)</option>
												<option value="주니어">주니어(사원)</option>
												<option value="미드레벨">미드레벨(대리)</option>
												<option value="시니어">시니어(과장~ 부장)</option>
												<option value="디렉터">디렉터(이사~사장)</option>
												<option value="프리랜서">프리랜서</option>
										</select></td>
									</tr>
									<tr>
										<td><strong>데이터분야</strong></td>
										<td><select name="데이터분야">
												<option value="예비개발자">예비개발자(학생)</option>
												<option value="주니어">주니어(사원)</option>
												<option value="미드레벨">미드레벨(대리)</option>
												<option value="시니어">시니어(과장~ 부장)</option>
												<option value="디렉터">디렉터(이사~사장)</option>
												<option value="프리랜서">프리랜서</option>
										</select></td>
									</tr>

									<tr>
										<td><strong> 경력사항</strong></td>
									</tr>
									<tr>
										<td><strong>근무기간</strong></td>

									</tr>

									<tr>
										<td><strong>시작일</strong></td>
										<td><input type="date" id="start_date"></td>

									</tr>
									<tr>
										<td><strong>종료일</strong></td>
										<td><input type="date" id="start_date"></td>
									</tr>
									<tr>
										<td><strong>주요성과</strong></td>
										<td colspan="2"><textarea name="talk" cols="50" rows="8"></textarea></td>
									</tr>

									<tr>
										<td><strong>사용기술</strong></td>
										<td colspan="2"><textarea name="talk" cols="50" rows="5"></textarea></td>
									</tr>

									<tr>
										<td><strong>포트폴리오</strong></td>
										<td><input type="file" name="" id=""><br></td>
									</tr>

								</table>
								<br> <input type="submit" value="이력서 저장하기">
							</div>
						</form>
					</div>
					<div></div>
				</div>
			</div>
		</div>
		<footer class="main_footer">
			<div class="window" id="icons" style="width: 800px" align="center">
				<a href=""><img src="./img/dfsfg.png" id="fire" width="50"
					alt=""></a> <a href="goIdea.do"><img src="./img/123.png"
					id="idea" width="40" alt=""></a> <a href="goMain.do"><img
					src="./img/dff.gif" id="goMain" width="50" alt="error"></a> <a
					href="goRecruit.do"><img src="./img/xml-0.png" id="job"
					width="40" alt=""></a> <a href="goMyPage.do"><img
					src="./img/icon_15.png" id="my_page" width="40" alt=""></a> <a
					href=""><img src="./img/sfsdffd.png" id="message" alt=""
					width="30"></a>
			</div>
		</footer>
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
		});
		$('#listOfInterest').on('click', function() {
			$('#myPage').hide();
			$('#checkInterest').show();
			$('#posted').hide();
			$('#bookmark').hide();
			$('#follow').hide();
			$('#myIdea').hide();
			$('#portfolio').hide();
		});
		$('#listOfPosted').on('click', function() {
			$('#myPage').hide();
			$('#checkInterest').hide();
			$('#posted').show();
			$('#bookmark').hide();
			$('#follow').hide();
			$('#myIdea').hide();
			$('#portfolio').hide();
		});
		$('#listOfBookmark').on('click', function() {
			$('#myPage').hide();
			$('#checkInterest').hide();
			$('#posted').hide();
			$('#bookmark').show();
			$('#follow').hide();
			$('#myIdea').hide();
			$('#portfolio').hide();
		});
		$('#listOfFollow').on('click', function() {
			$('#myPage').hide();
			$('#checkInterest').hide();
			$('#posted').hide();
			$('#bookmark').hide();
			$('#follow').show();
			$('#myIdea').hide();
			$('#portfolio').hide();
		});
		$('#listOfMyIdea').on('click', function() {
			$('#myPage').hide();
			$('#checkInterest').hide();
			$('#posted').hide();
			$('#bookmark').hide();
			$('#follow').hide();
			$('#myIdea').show();
			$('#portfolio').hide();
		});
		$('#listOfPortfolio').on('click', function() {
			$('#myPage').hide();
			$('#checkInterest').hide();
			$('#posted').hide();
			$('#bookmark').hide();
			$('#follow').hide();
			$('#myIdea').hide();
			$('#portfolio').show();
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


</body>
</html>