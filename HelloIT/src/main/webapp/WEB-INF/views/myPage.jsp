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
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
.container{
    display: flex;
    flex-direction: column;
    align-items: center;
    max-width:100%;
}
.window-body{
	display: flex;
}
.tree-view{
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
label{
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
	<%UserInfo info = new UserInfo();%>
	<div class="container">
	<div class="wrapper">
	<div class="window" style="width: 800px; position: sticky; top: 0; max-width:100%"align="center">
	<div class="title-bar" style="position:sticky; top:1px">
	  <div class="title-bar-text">마이 페이지</div>
	  <div class="title-bar-controls">
	    <button aria-label="Close" onclick = "location.href ='goMain.do'"></button>
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
	</ul>
	</div>
	<div id="myPage" style="display:none;">myPage</div>
    <div class="window" id="checkInterest" style="display:none; margin-left:8px">
        <div class="title-bar" style="position:sticky; top:27px">
            <div class="title-bar-text">관심 분야 Check!!</div>
            <div class="title-bar-controls">
              <button aria-label="Close" onclick = "location.href ='goMyPage.do'"></button>
            </div>
          </div>
        <div class="window-body" style="display:block;">
            <h4>관심있는분야나 직장에서 맡고있는 분야를 선택하세요(중복선택 가능), 체크한 분야에 따라서 게시물이 자동 선별됩니다.</h4>
            <div id="userRole">
                <h4>맡고싶거나 맡고있는 역할을 선택하세요</h4>
                <form action="checkRole.do" method="post">
	                <input type="checkbox" name="userRole" id="frontend" value="Y"><label for="frontend">프론트엔드</label>
	                <input type="checkbox" name="userRole" id="backend" value="Y"><label for="backend">백엔드</label>
	                <input type="checkbox" name="userRole" id="data_etc" value="Y"><label for="data_etc">데이터분야(빅데이터,인공지능포함)</label>
	                <input type="checkbox" name="userRole" id="other_skill" value="Y"><label for="other_skill">기타</label>
	                <br><br>
	                <input type="hidden" name="u_email" value="<%=info.getU_email()%>">
	                <input type="hidden" name="userRole" id="frontend_hidden" value="N">
	                <input type="hidden" name="userRole" id="backend_hidden" value="N">
	                <input type="hidden" name="userRole" id="data_etc_hidden" value="N">
	                <input type="hidden" name="userRole" id="other_skill_hidden" value="N">
	                <input type="submit" value="저장">
	                <input type="reset" value="초기화">
                </form>
            </div>
            <div id="userSkill">
                <h4>담당했던분야나 관심있는 분야를 선택하세요</h4>
                <form action="" method="post">
	                <input type="checkbox" id="web"><label for="web">웹</label>
	                <input type="checkbox" id="ios"><label for="ios">iOS</label>
	                <input type="checkbox" id="android"><label for="android">안드로이드</label>
	                <input type="checkbox" id="windows"><label for="windows">윈도우</label>
	                <input type="checkbox" id="mac"><label for="mac">맥</label>
	                <input type="checkbox" id="linux"><label for="linux">리눅스</label>
	                <input type="checkbox" id="game"><label for="game">게임</label>
	                <input type="checkbox" id="skill_etc"><label for="skill_etc">기타</label>
	                <br><br>
	                <input type="submit" value="저장">
	                <input type="reset" value="초기화">
                </form>
            </div>
            <div id="userLanguage">
                <h4>사용할줄 아는 언어 또는 관심있는 언어를 선택하세요</h4>
                <form action="" method="post">
                <input type="checkbox" id="html"><label for="html">HTML</label>
                <input type="checkbox" id="css"><label for="css">CSS</label>
                <input type="checkbox" id="c"><label for="c">C</label>
                <input type="checkbox" id="c_pp"><label for="c_pp">C++</label>
                <input type="checkbox" id="c_sharp"><label for="c_sharp">C#</label>
                <input type="checkbox" id="java"><label for="java">JAVA</label>
                <input type="checkbox" id="python"><label for="python">Python</label>
                <input type="checkbox" id="php"><label for="php">PHP</label>
                <input type="checkbox" id="dart"><label for="dart">Dart</label>
                <input type="checkbox" id="typescript"><label for="typescript">TypeScript</label>
                <input type="checkbox" id="kotlin"><label for="kotlin">Kotlin</label>
                <input type="checkbox" id="go"><label for="go">Go</label>
                <input type="checkbox" id="rust"><label for="rust">Rust</label>
                <input type="checkbox" id="swift"><label for="swift">Swift</label>
                <input type="checkbox" id="scala"><label for="scala">Scala</label>
                <input type="checkbox" id="objective_c"><label for="objective_c">Objective_C</label>
                <input type="checkbox" id="r"><label for="r">R</label>
                <input type="checkbox" id="ruby"><label for="ruby">Ruby</label>
                <input type="checkbox" id="haskell"><label for="haskell">Haskell</label>
                <input type="checkbox" id="clojure"><label for="clojure">Clojure</label>
                <input type="checkbox" id="sql"><label for="sql">SQL</label>
                <input type="checkbox" id="language_etc"><label for="language_etc">기타</label>
               	<br><br>
                <input type="submit" value="저장">
                <input type="reset" value="초기화">
                </form>
            </div>
            <div id="userDB">
                <h4>사용할줄 아는 DB 또는 관심있는 DB를 선택하세요</h4>
                <form action="" method="post">
                <input type="checkbox" id="mysql"><label for="mysql">MySQL</label>
                <input type="checkbox" id="oracle"><label for="oracle">Oracle</label>
                <input type="checkbox" id="mariadb"><label for="mariadb">MariaDB</label>
                <input type="checkbox" id="pstgresql"><label for="pstgresql">Pstgresql</label>
                <input type="checkbox" id="mongodb"><label for="mongodb">MongoDB</label>
                <input type="checkbox" id="redis"><label for="redis">Redis</label>
                <input type="checkbox" id="sqlite"><label for="sqlite">SQLite</label>
                <input type="checkbox" id="aws_aurora"><label for="sqlite">AWS_Aurora</label>
                <input type="checkbox" id="elasticsearch"><label for="elasticsearch">Elasticsearch</label>
                <input type="checkbox" id="dynamodb"><label for="dynamodb">DynamoDB</label>
                <input type="checkbox" id="firebase"><label for="firebase">Firebase</label>
                <input type="checkbox" id="tibero"><label for="tibero">Tibero</label>
                <input type="checkbox" id="hive"><label for="hive">Hive</label>
                <input type="checkbox" id="cassandra"><label for="cassandra">Cassandra</label>
                <input type="checkbox" id="db_etc"><label for="db_etc">기타</label>
                <br><br>
                <input type="submit" value="저장">
                <input type="reset" value="초기화">
                </form>
            </div>
        </div>
    </div>
	<div id="bookmark" style="display:none;">bookmark</div>
	<div id="follow" style="display:none;">follow</div>
	<div id="myIdea" style="display:none;">myIdea</div>
	<div id="portfolio" style="display:none;">portfolio</div>
	<div></div>
  	</div>
	</div>
	</div>
		<footer class="main_footer">
				<div class="window" id="icons" style="width: 800px" align="center">
					<a href=""><img src="./img/dfsfg.png" id="fire" width="50" alt=""></a> 
					<a href="goIdea.do"><img src="./img/123.png" id="idea" width="40" alt=""></a> 
					<a href="goMain.do"><img src="./img/dff.gif" id="goMain" width="50" alt="error"></a> 
					<a href="goJobHunting.do"><img src="./img/xml-0.png" id="job" width="40" alt=""></a> 
					<a href="goMyPage.do"><img src="./img/icon_15.png" id="my_page" width="40" alt=""></a> 
					<a href=""><img src="./img/sfsdffd.png" id="message" alt="" width="30"></a>
				</div>
		</footer>
	</div>
	<script type="text/javascript">
		$('#listOfMyPage').on('click',function(){
			$('#myPage').show();
			$('#checkInterest').hide();
			$('#posted').hide();
			$('#bookmark').hide();
			$('#follow').hide();
			$('#myIdea').hide();
			$('#portfolio').hide();
		});
		$('#listOfInterest').on('click',function(){
			$('#myPage').hide();
			$('#checkInterest').show();
			$('#posted').hide();
			$('#bookmark').hide();
			$('#follow').hide();
			$('#myIdea').hide();
			$('#portfolio').hide();
		});
		$('#listOfPosted').on('click',function(){
			$('#myPage').hide();
			$('#checkInterest').hide();
			$('#posted').show();
			$('#bookmark').hide();
			$('#follow').hide();
			$('#myIdea').hide();
			$('#portfolio').hide();
		});
		$('#listOfBookmark').on('click',function(){
			$('#myPage').hide();
			$('#checkInterest').hide();
			$('#posted').hide();
			$('#bookmark').show();
			$('#follow').hide();
			$('#myIdea').hide();
			$('#portfolio').hide();
		});
		$('#listOfFollow').on('click',function(){
			$('#myPage').hide();
			$('#checkInterest').hide();
			$('#posted').hide();
			$('#bookmark').hide();
			$('#follow').show();
			$('#myIdea').hide();
			$('#portfolio').hide();
		});
		$('#listOfMyIdea').on('click',function(){
			$('#myPage').hide();
			$('#checkInterest').hide();
			$('#posted').hide();
			$('#bookmark').hide();
			$('#follow').hide();
			$('#myIdea').show();
			$('#portfolio').hide();
		});
		$('#listOfPortfolio').on('click',function(){
			$('#myPage').hide();
			$('#checkInterest').hide();
			$('#posted').hide();
			$('#bookmark').hide();
			$('#follow').hide();
			$('#myIdea').hide();
			$('#portfolio').show();
		}); 
	</script>
	
	<script>
	var frontend_hidden = $("#frontend").prop("checked")? "Y" :"N";
	$("#frontend_hidden").val(frontend_hidden);
	var backend_hidden = $("#backend").prop("checked")? "Y" :"N";
	$("#backend_hidden").val(backend_hidden);
	var data_etc_hidden = $("#data_etc").prop("checked")? "Y" :"N";
	$("#data_etc_hidden").val(data_etc_hidden);
	var other_skill_hidden = $("#other_skill").prop("checked")? "Y" :"N";
	$("#other_skill_hidden").val(other_skill_hidden);
	</script>
	
</body>
</html>