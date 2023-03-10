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
/*    List<PostInfo> miList = (List<PostInfo>)request.getAttribute("miList");
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
              <div class="title-bar-text">?????? ?????????</div>
              <div class="title-bar-controls">
              <button aria-label="Close" onclick="location.href='goMain.do?u_email=<%=info.getU_email()%>'"></button>
              </div>
            </div>
          <div class="window-body" style="justify-content: space-between;">
             <div>
             <ul class="tree-view" style="font-family:auto;">
                 <li id="listOfMyPage" style="cursor:pointer;">?????? ????????????</li>
                 <li id="listOfInterest" style="cursor:pointer;">???????????? Check</li>
                 <li id="listOfPosted" style="cursor:pointer;">???????????? ?????????<li>
                 <li id="listOfBookmark" style="cursor:pointer;">???????????? ?????????<li>
                 <li id="listOfFollow" style="cursor:pointer;">?????????/?????????</li>  
                 <li id="listOfMyIdea" style="cursor:pointer;">?????? ????????????<li>
                 <li id="listOfPortfolio" style="cursor:pointer;">???????????????&?????????<li>
                 <li id="listOfFAQ" style="cursor:pointer;">FAQ<li>
            </ul>
            <p class="status-bar-field">
               <b>????????? : <%=request.getAttribute("followingCnt")%></b>
               <b>????????? : <%=request.getAttribute("followerCnt")%></b>
            </p>
            </div>
            <div style="display:block;width:632px;">
         <div id="myPage" style="display:none;">
             <div class="container">
              <div class="wrapper" style="position: sticky; top: 27px;">
                  <div class="window" style="width: 400px; position: sticky; top: 0; max-width: 100%; width: 400px;display: block; margin: 0 100px; margin-bottom: 50px;" align="center">
                      <div class="title-bar">
                          <div class="title-bar-text">?????? ??????</div>
                          <div class="title-bar-controls">
                              <button aria-label="Close" onclick="location.href ='goMyPage.do?u_email=<%=info.getU_email()%>'"></button>
                          </div>
                      </div>
                          <form action="" method="post" style="margin:20px; font-size:initial">
                              <table class="userInfo">
                                 <tbody>
                                  <tr>
                                      <td style="width:140px">?????? ?????????</td>
                                      <td style="padding-left:4px"><%=info.getU_email() %></td>
                                  </tr>
                                  <tr>
                                      <td>??????</td>
                                      <td style="padding-left:4px"><%=info.getU_name() %></td>
                                  </tr>
                                  <tr>
                                      <td>?????????</td>
                                      <td style="padding-left:4px"><%=info.getU_nick() %></td>
                                  </tr>
                                  <tr>
                                      <td>??????????????????</td>
                                      <td style="padding-left:4px"><input type="password" name="pw1" placeholder="?????? ???????????? ??????"></td>
                                  </tr>
                                  <tr>
                                      <td>????????? ????????????</td>
                                      <td style="padding-left:4px"><input type="password" name="repw2" placeholder="????????? ???????????? ??????"></td>
                                  </tr>
                                  <tr>
                                      <td>????????? ???????????? ??????</td>
                                      <td style="padding-left:4px"><input type="password" name="repw3" placeholder="????????? ???????????? ??????"></td>
                                  </tr>
                                  <tr>
                                      <td>????????????</td>
                                      <td style="padding-left:4px"><%=info.getU_birthdate()%></td>
                                  </tr>
                                  <tr>
                                      <td>??????</td>
                                      <td style="padding-left:4px"><%=info.getU_job() %></td>
                                  </tr>
                                  <tr>
                                      <td>????????????</td>
                                      <td style="padding-left:4px"><%=info.getU_activity_score() %></td>
                                  </tr>
                                  </tbody>
                              </table>
                              <br>
                                     <div><input type="submit" onclick="myInfoPopup();" value="??????"></div>
                          </form>
                  </div>
              </div>
          </div>
         </div>
          <div class="window" id="checkInterest" style="display:none; margin-left:8px">
              <div class="title-bar" style="position:sticky; top:27px">
                  <div class="title-bar-text">?????? ?????? Check!!</div>
                  <div class="title-bar-controls">
                  <button aria-label="Close" onclick="location.href ='goMyPage.do?u_email=<%=info.getU_email()%>'"></button>
                  </div>
                </div>
              <div class="window-body" style="display:block;">
                  <p style="font-size: large; font-weight: bold;">????????????????????? ???????????? ???????????? ????????? ???????????????<sub>(???????????? ??????)</sub></p> 
                  <p style="font-size: small; font-weight: bold;">????????? ????????? ????????? ???????????? ?????? ???????????????.</p>
                  <br>
                   <form action="userLevelSetting.do" method="post">
                   <input type="hidden" name="u_email" value="<%=info.getU_email()%>">
                    <table style="width:600px">
                    <tr class="interest" id="userRole">
                    <td><h4>??????</h4></td>
                        <td style="display:flex; justify-content: center; height:50px;">
                        <div style="text-align:end; margin: 0 5px">
                        <div>???????????????
                         <select name="frontend_level" id="frontend_level">
                            <option value="1">???????????????(??????)</option>
                            <option value="2">??????(?????????)</option>
                            <option value="3">??????(????????????)</option>
                            <option value="4">??????~??????(?????????)</option>
                            <option value="5">??????~??????(?????????)</option>
                            <option value="6">????????????</option>
                         </select>
                         </div>
                         <div>
                            ?????????
                            <select name="backend_level" id="backend_level">
                            <option value="1">???????????????(??????)</option>
                            <option value="2">??????(?????????)</option>
                            <option value="3">??????(????????????)</option>
                            <option value="4">??????~??????(?????????)</option>
                            <option value="5">??????~??????(?????????)</option>
                            <option value="6">????????????</option>
                         </select>
                         </div>
                         </div>
                         <div style="text-align:end; margin: 0 5px">
                         <div>?????????
                         <select name="data_level" id="data_level">
                            <option value="1">???????????????(??????)</option>
                            <option value="2">??????(?????????)</option>
                            <option value="3">??????(????????????)</option>
                            <option value="4">??????~??????(?????????)</option>
                            <option value="5">??????~??????(?????????)</option>
                            <option value="6">????????????</option>
                         </select>
                         </div>
                         <div>
                         ??????
                         <select name="etc_level" id="etc_level">
                            <option value="1">???????????????(??????)</option>
                            <option value="2">??????(?????????)</option>
                            <option value="3">??????(????????????)</option>
                            <option value="4">??????~??????(?????????)</option>
                            <option value="5">??????~??????(?????????)</option>
                            <option value="6">????????????</option>
                         </select>
                         </div>
                         </div>
                         </td>
                         <td>
                            <input type="submit" onclick="levelPopup();" value="??????">
                            <input type="reset" value="?????????">
                       </td>
                    </tr>
                    </table>
               </form>
                   <form action="updateRole.do" method="post">
                    <table>
                    <tr class="interest" id="userRole">
                    <td><h4>??????</h4></td>
                        <td>
                         <input type="checkbox" name="frontend" id="frontend" value="Y">
                         <label for="frontend">???????????????</label>
                         <input type="checkbox" name="backend" id="backend" value="Y">
                         <label for="backend">?????????</label>
                         <input type="checkbox" name="data_etc" id="data_etc" value="Y">
                         <label for="data_etc">???????????????(????????????,??????????????????)</label>
                         <input type="checkbox" name="other_skill" id="other_skill" value="Y">
                         <label for="other_skill">??????</label>
                         <br><br>
                         <input type="hidden" name="u_email" value="<%=info.getU_email()%>">
                         <input type="hidden" name="frontend" id="frontend_hidden" value="N">
                         <input type="hidden" name="backend" id="backend_hidden" value="N">
                         <input type="hidden" name="data_etc" id="data_etc_hidden" value="N">
                         <input type="hidden" name="other_skill" id="other_skill_hidden" value="N">
                         </td>
                         <td>
                         <input type="submit" onclick="rolePopup();" value="??????">
                         <input type="reset" value="?????????">
                       </td>
                    </tr>
                    </table>
               </form>
                  <form action="updateSkill.do" method="post">
                  <table>
                     <tr class="interest" id="userSkill">
                        <td><h4>??????</h4></td>
                        <td>
                           <input type="checkbox" name="web" id="web" value="Y">
                           <label for="web">???</label>
                           <input type="checkbox" name="ios" id="ios" value="Y">
                           <label for="ios">iOS</label>
                           <input type="checkbox" name="android" id="android" value="Y">
                           <label for="android">???????????????</label>
                           <input type="checkbox" name="windows" id="windows" value="Y">
                           <label for="windows">?????????</label>
                           <input type="checkbox" name="mac" id="mac" value="Y">
                           <label for="mac">???</label>
                           <input type="checkbox" name="linux" id="linux" value="Y">
                           <label for="linux">?????????</label>
                           <input type="checkbox" name="game" id="game" value="Y">
                           <label for="game">??????</label>
                           <input type="checkbox" name="skill_etc" id="skill_etc" value="Y">
                           <label for="skill_etc">??????</label>
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
                           <input type="submit" onclick="skillPopup();" value="??????">
                           <input type="reset" value="?????????">
                        </td>
                     </tr>
                  </table>
                  </form>
                  
                  <form action="updateLanguage.do" method="post">
                     <table>
                       <tr class="interest" id="userLanguage">
                           <td><h4>??????</h4></td>
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
                              <label for="language_etc">??????</label>
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
                              <input type="submit" onclick="langPopup();" value="??????">
                              <input type="reset" value="?????????">
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
                            <label for="db_etc">??????</label>
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
                            <input type="submit" onclick="dbPopup();" value="??????">
                            <input type="reset" value="?????????">
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
                  <td>?????????</td>
                  <td style="width: 650px"><%=upList.get(i).getU_name()%></td>
               </tr>
               <tr>
                  <td colspan="2">??????</td>
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
               <button   id="btn">
                  <%=upList.get(i).getBookmarks()%>
                  <img src="./img/?????????.png" width="15" alt="">
               </button>
               </a>
            </p>
            <%-- ????????? ?????? --%>
            <p class="status-bar-field">
               <a href="mainLike.do?req_page=myPage&post_seq=<%=upList.get(i).getPost_seq()%>&u_email=<%=info.getU_email()%>">
               <button   id="btn"><%=upList.get(i).getLikes()%> ????
               </button></a>
            <%-- ????????? ?????? ??? --%>
            </p>
            <form action="mainCmt.do">
               <input type="hidden" name="req_page" value="myPage">
               <input type="hidden" name="post_seq" value="<%=upList.get(i).getPost_seq()%>">
               <input type="hidden" name="u_email" value="<%=info.getU_email()%>">
               <p class="status-bar-field">
                  <input type="text" name="cmt_content" placeholder="??????"
                  style="width:290px">
                  <input type="submit" value="??????">
               </p>
            </form>
            
               
               <p class="status-bar-field"><a href=""><button id="btn">??????<%=upList.get(i).getCmts()%> </button></a></p>
            
            <%
            // comment ??????
            CommentInfoDAO dao = new CommentInfoDAO();
            List<CommentInfo> cmtList = dao.commentInfoList(upList.get(i).getPost_seq());
            %>
         </div>
         <%for (int j = 0; j < cmtList.size(); j++) {%>         
         <table style="width:630px;">
            <tr>
               <td ><b><%=cmtList.get(j).getU_name()%></b></td>
               <td style="width:360px;"><%=cmtList.get(j).getCmt_content()%></td>
               <td>
               <a href="mainCmtLike.do?req_page=myPage&cmt_seq=<%=cmtList.get(j).getCmt_seq()%>&u_email=<%=info.getU_email()%>">
               <button   id="btn"><%=cmtList.get(j).getCmt_likes()%> ????
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
                  <td>?????????</td>
                  <td style="width: 650px"><%=bmList.get(i).getU_name()%></td>
               </tr>
               <tr>
                  <td colspan="2">??????</td>
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
               <button   id="btn">
                  <%=bmList.get(i).getBookmarks()%>
                  <img src="./img/?????????.png" width="15" alt="">
               </button>
               </a>
            </p>
            <%-- ????????? ?????? --%>
            <p class="status-bar-field">
               <a href="mainLike.do?req_page=myPage&post_seq=<%=bmList.get(i).getPost_seq()%>&u_email=<%=info.getU_email()%>">
               <button   id="btn"><%=bmList.get(i).getLikes()%> ????
               </button></a>
            <%-- ????????? ?????? ??? --%>
            </p>
            <form action="mainCmt.do">
               <input type="hidden" name="req_page" value="myPage">
               <input type="hidden" name="post_seq" value="<%=bmList.get(i).getPost_seq()%>">
               <input type="hidden" name="u_email" value="<%=info.getU_email()%>">
               <p class="status-bar-field">
                  <input type="text" name="cmt_content" placeholder="??????"
                  style="width:290px">
                  <input type="submit" value="??????">
               </p>
            </form>
            
               
               <p class="status-bar-field"><a href=""><button id="btn">??????<%=bmList.get(i).getCmts()%> </button></a></p>
            
            <%
            // comment ??????
            CommentInfoDAO dao = new CommentInfoDAO();
            List<CommentInfo> cmtList = dao.commentInfoList(bmList.get(i).getPost_seq());
            %>
         </div>
         <%for (int j = 0; j < cmtList.size(); j++) {%>         
         <table style="width:630px;">
            <tr>
               <td ><b><%=cmtList.get(j).getU_name()%></b></td>
               <td style="width:360px;"><%=cmtList.get(j).getCmt_content()%></td>
               <td>
               <a href="mainCmtLike.do?req_page=myPage&cmt_seq=<%=cmtList.get(j).getCmt_seq()%>&u_email=<%=info.getU_email()%>">
               <button   id="btn"><%=cmtList.get(j).getCmt_likes()%> ????
               </button></a>
               </td>
            </tr>
         <%}%>   
         </table>
      </div>
      <%}%>
      </div>
         
         
         
         
         <!--????????? ????????? ?????? ??????????????? -->
         <div id="follow" style="display:none; font-family:auto;">
            <div class="window" style="max-width:100%" align="center">
               <div class="title-bar">
                  <div class="title-bar-text">?????????/?????????</div>
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
                                 <h5 align="center"> ?????????, ????????? ???????????? ???????????????.</h5>
                              </td>
            
                           </tr>
                           <tr>
                           <td>
                           <input type="text" placeholder="???????????? ???????????????"
                              style="width:120px; height: 20px; font: size 10px;;"></td>
                           <td><button>??????</button></td>
                           </tr>
                        </table>
                           <br>
         
      
         
            
                                                                                          
                        <ul class="tabs" >
                        <!-- style="display:flex;justify-content: space-around; margin: 8px; list-style:none;" -->
                           <li class="tab-link current" data-tab="tab-1">?????????</li>
                           <li class="tab-link" data-tab="tab-2">?????????</li>
                        </ul>
                  
                     
                     <div id="tab-1" style="margin-bottom:50px" class="tab-content current" >
            <div id="follow-table">
                           <table style="width: 600px; height: 100px; overflow: auto; text-align: center;">
                              <thead>
                                 <tr height="30px">
                                    <th>?????????</th>
                                    <th>??????????????????</th>
                                    <th>????????? ??????</th>
                                 </tr>
                              </thead>
                              <tbody>
                                 <%for(int i = 0; i < following.size(); i++){%>
                                 <tr>
                                    <td><a href="#"><%=following.get(i).getU_name()%></a></td>
                                    <td><a href="#"><img src="img/message.png" alt="??????????????????"></img></a></td>
                                    <td>
                                       <a href="follow.do?follower_email=<%=info.getU_email()%>&u_email=<%=following.get(i).getU_email()%>">
                                       <button   id="btn"> ??????
                                       </button></a>
                                       <!-- <img src="img/delete.png" width="50px"
                                       height="50px" alt="????????? ??????" onclick="test()"> -->
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
                                    <th>?????????</th>
                                    <th>??????????????????</th>
                                    <th>?????????</th>
                                 </tr>
                              </thead>
                              <tbody id="follower">
                                 <%for(int i = 0; i < follower.size(); i++){%>
                                 <tr>
                                    <td><a href="#"><%=follower.get(i).getU_name()%></a></td>
                                    <td><a href="#"><img src="img/message.png" alt="??????????????????"></img></a></td>
                                    <td>
                                       <a href="follow.do?follower_email=<%=info.getU_email()%>&u_email=<%=follower.get(i).getU_email()%>">
                                       <button   id="btn"> ?????????
                                       </button></a>
                                       <!-- <img src="img/delete.png" width="50px"
                                       height="50px" alt="????????? ??????" onclick="test()"> -->
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
       
         <!-- ?????? ???????????? ?????? -->
         <div id="myIdea" style="display:none; font-family:auto;">
            <div class="myIdea_list_wrap board_list_wrap">
                 <table class="myIdea_list board_list" border="1">
                     <caption>?????? ???????????? ??????</caption>
                        <thead>
                            <tr>
                                <th>??????</th>
                                <th>??????</th>
                                <th>?????????</th>
                                <th>?????????</th>
                                <th>?????????</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                            
                            <!-- ?????? ????????????..  -->
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
                  <a href="goIdea.do" class="bt">?????? Previous</a>
                  <%for(int i=0;i<cnt.size()/10+1;i++){ %>
                  <a id="num<%=i+1 %>" class="num" href="goIdea.do?&num=<%=i+1%>"><%=i+1%></a>
                  <%} %>   
                  <a href="goIdea.do?num=<%=cnt.size()%>" class="bt">Next ??????</a>
               </div> --%>
             </div>
         </div>
         
         <!-- ????????? ??? ???????????????  -->
         <div id="portfolio" style="display:none;">
                  <div class="window" style="width: 400px; display:block; margin:0 100px; margin-bottom:50px;">
                      <div class="title-bar">
                          <div class="title-bar-text">
                              ????????? ??? ???????????????
                          </div>
                          <div class="title-bar-controls">
                             <button aria-label="Close" onclick="location.href='goMyPage.do?u_email=<%=info.getU_email()%>'"></button>
                          </div>
                      </div>
              <form>
                      <table class="userInfo">
                         <tbody>
                          <tr>
                              <td> <strong> ?????? </strong></td>
                              <td><input type="text"></td>
                          </tr>
                          <tr>
                              <td><strong>?????????</strong></td>
                              <td><input type="email"></td>
                          </tr>
                          <tr>
                              <td> <strong> ????????????</strong> </td>
                              <td><input type="tel"></td>
                          </tr>
                          <tr>
                              <td> <strong>????????????</strong></td>
                              <td colspan="2"> <textarea name="talk" cols="50" rows="5"></textarea></td>
                          </tr>
      
                          <tr>
                              <td><strong>????????????</strong></td>
                              <td>
                                  <input id="back" type="checkbox" name="hobby">
                                  <label for="back">?????????</label>
                                  <input id="front" type="checkbox" name="hobby">
                                  <label for="front">???????????????</label>
                                  <input id="data" type="checkbox" name="hobby">
                                  <label for="data">???????????????</label>
                                  <input id="etc" type="checkbox" name="hobby">
                                  <label for="etc">??????</label>
                              </td>
                          </tr>
      
                          <tr>
                              <td><strong>?????????????????????</strong> </td>
                              <td>
                                  <select name="???????????????">
                                      <option value="???????????????">???????????????(??????)</option>
                                      <option value="?????????">?????????(??????)</option>
                                      <option value="????????????">????????????(??????)</option>
                                      <option value="?????????">?????????(??????~ ??????)</option>
                                      <option value="?????????">?????????(??????~??????)</option>
                                      <option value="????????????">????????????</option>
                                  </select>
                              </td>
                          </tr>
                          <tr>
                              <td><strong>???????????????</strong> </td>
                              <td>
                                  <select name="?????????">
                                      <option value="???????????????">???????????????(??????)</option>
                                      <option value="?????????">?????????(??????)</option>
                                      <option value="????????????">????????????(??????)</option>
                                      <option value="?????????">?????????(??????~ ??????)</option>
                                      <option value="?????????">?????????(??????~??????)</option>
                                      <option value="????????????">????????????</option>
                                   </select>
                              </td>
                          </tr>
                          <tr>
                              <td><strong>???????????????</strong></td>
                              <td>
                                  <select name="???????????????">
                                      <option value="???????????????">???????????????(??????)</option>
                                      <option value="?????????">?????????(??????)</option>
                                      <option value="????????????">????????????(??????)</option>
                                      <option value="?????????">?????????(??????~ ??????)</option>
                                      <option value="?????????">?????????(??????~??????)</option>
                                      <option value="????????????">????????????</option>
                                  </select>
                              </td>
                          </tr>
                         
                          <tr>
                              <td> <strong> ????????????</strong></td>
                          </tr>
                          <tr>
                              <td> <strong>????????????</strong> </td>
                              
                          </tr>
      
                          <tr>
                              <td> <strong>?????????</strong> </td>
                              <td> <input type="date" id="start_date"></td>
                              
                          </tr>
                          <tr>
                              <td> <strong>?????????</strong> </td>
                              <td> <input type="date" id="start_date"></td>
                          </tr>
                          <tr>
                              <td> <strong>????????????</strong></td>
                              <td colspan="2"> <textarea name="talk" cols="50" rows="8"></textarea></td>
                          </tr>
      
                          <tr>
                              <td><strong>????????????</strong></td>
                              <td colspan="2"> <textarea name="talk" cols="50" rows="5"></textarea></td>
                          </tr>
      
                          <tr>
                              <td> <strong>???????????????</strong> </td>
                              <td> <input type="file" name="" id=""><br></td>
                          </tr>
                     </tbody>
                      </table>
                      <br>
                      <input type="submit" onclick="pfPopup();" value="????????? ????????????">
              </form>
               </div>
         </div>
            
         <!-- FAQ -->
         <div id="faq" style="display:none;">
            <div class="window" style="width: 630px; margin-bottom:40px" align="center"><span style="display: flex; flex-direction: column;"></span>
               <div class="title-bar">
                  <div class="title-bar-text">Hello IT</div>
                  <div class="title-bar-controls">
                  <button aria-label="Close" onclick="location.href ='goMyPage.do?u_email=<%=info.getU_email()%>'"></button>
                  </div>
               </div>   
                 <br><br>
               <img src="./img/window.gif" width="200" alt="">
               <h3>?????? ?????? ??????</h3>
               <div class="faq-container">
                  <div class="faq">
                     <h4 class="faq-title">"Hello IT"??? ?????? ???????????? ??????????</h4>
                     
                     <p class="faq-text">??????????????? ???????????? "Hello IT"??? ?????? ?????? ??????????????? ?????? SNS??? ???????????? ??????????????? ?????? ????????? ?????? ?????? ??? ???????????????. </p>
                  
                      <button class="faq-toggle">
                        <i class="fas fa-chevron-down"></i>
                        <i class="fas fa-times"></i>
                      </button>
                  </div>      
                  <div class="faq">
                      <h4 class="faq-title">???????????? ???????????? ????????? ????????????????</h4>
                  
                      <p class="faq-text">??????????????? ???????????? ?????? ???????????? ????????? ?????? ?????? ???????????? ????????? ??? ????????? ?????? ?????? ????????? ????????? ????????? ???????????? ?????? ??????????????? ???????????? ????????? ????????? ?????????! </p>
                  
                      <button class="faq-toggle">
                        <i class="fas fa-chevron-down"></i>
                        <i class="fas fa-times"></i>
                      </button>
                  </div>
                  <div class="faq">
                     <h4 class="faq-title">??????????????? ??????????????? ???????????? ?????????????</h4>
                     
                     <p class="faq-text">??? ???????????????! ?????? Hello IT??? ?????? ????????? ?????? ???????????? ???????????? ?????? ???????????? ???????????? ????????? ??? ????????????. </p>
                     
                     <button class="faq-toggle">
                        <i class="fas fa-chevron-down"></i>
                        <i class="fas fa-times"></i>
                     </button>
                  </div>
                  <div class="faq">
                     <h4 class="faq-title">???????????? ????????? ???????????????!</h4>
                     <p class="faq-text"> ????????? ??????????????????! 
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
         <a href="goPopPostMain.do" title="???????????????"><img src="./img/dfsfg.png" id="fire" width="50" alt=""></a> 
         <a href="goIdea.do" title="?????????????????????"><img src="./img/123.png" id="idea" width="40" alt=""></a> 
         <a href="goMain.do?u_email=<%=info.getU_email()%>" title="???????????????"><img src="./img/dff.gif" id="goMain" width="50" alt="error"></a> 
         <a href="goMainWrite.do" title="?????????"><img src="./img/dfsee.gif" id="goMain" width="41" alt="error"></a> 
         <a href="goRecruit.do" title="?????????????????????"><img src="./img/xml-0.png" id="job" width="40" alt=""></a> 
         <a href="goMyPage.do?u_email=<%=info.getU_email()%>" title="???????????????"><img src="./img/icon_15.png" id="my_page" width="40" alt=""></a> 
         <a href="goMessage.do" title="?????????"><img src="./img/sfsdffd.png" id="message" alt="" width="30"></a>
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

   <%-- ???????????? DB ????????? value??? ?????? ???????????? --%>
   <script>
      // ?????? ??????
      var frontend_hidden = $("#frontend").prop("checked") ? "Y" : "N";
      $("#frontend_hidden").val(frontend_hidden);
      var backend_hidden = $("#backend").prop("checked") ? "Y" : "N";
      $("#backend_hidden").val(backend_hidden);
      var data_etc_hidden = $("#data_etc").prop("checked") ? "Y" : "N";
      $("#data_etc_hidden").val(data_etc_hidden);
      var other_skill_hidden = $("#other_skill").prop("checked") ? "Y" : "N";
      $("#other_skill_hidden").val(other_skill_hidden);

      // ??????
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

      // ??????
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
    
    <%-- ?????????/????????? ???????????? --%>
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
         if (!confirm("???????????? ?????? ??????????????????????")) {
            alert("??????(?????????)??? ??????????????????.");
         } else {
            alert("??????(???)??? ??????????????????. ???????????????.");
         }
      }
   </script>
   <script src="./js/load.js"></script>
   
   <!-- ?????? ???????????? ????????? -->
<%--    <script>
   console.log($('#num<%=num%>').attr('class'))
     for( i=1;i<=<%=cnt.size()/10%>;i++){
      if($('#num<%=num%>').attr("id")=='num'+i){
         $('#num<%=num%>').attr("class","num on")
      }
   }   
</script> --%>
</body>
</html>