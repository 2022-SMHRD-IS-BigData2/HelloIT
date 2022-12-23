<%@page import="com.smhrd.entity.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <link rel="stylesheet" href="https://unpkg.com/98.css" />
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<link rel="stylesheet" href="./css/style.css">

</head>
<body>
		<% UserInfo info = (UserInfo)session.getAttribute("info");
			
		%>
		<div class="container">
		<div class="wrapper">
        <div class="window" style="width: 800px" align="center">
		<form action="write.do" method="post" enctype="multipart/form-data">
            <div class="title-bar">
                <div class="title-bar-text">맞춤형</div>
                <div class="title-bar-controls">
                    <button aria-label="Minimize"></button>
                    <button aria-label="Maximize"></button>
                    <button aria-label="Close"></button>
                </div>
            </div>
		            
            <!-- <img src="./img/69719.png" width="50" alt=""> -->
            
            <div class="window-body">
                <p></p>
                <select name="post_kind">
                    <option value="tip"> 잇팁 (IT tip)</option>
                    <option value="idea"> 아이디어 토론방</option>
                    <option value="job"> 채용공고</option>
                  </select>
                <div class="field-row-stacked" style="width: 200px">
                    <label for="text18">제목</label>
                    <input id="text18" type="text" name="post_title" />
                </div><br> 
            </div>
                
                

                <div class="field-row-stacked" style="width: 700px">
                    <label for="text20">내용</label>
                    <textarea id="text20" rows="8" style="height: 550px;" name="post_content"></textarea>
                </div>
                <input type="file" style=" float: right;" name="post_file">
                    <br>
                
                <div class="tag " style="width: 200px">
                    <label for="tag">해시태그</label>
                    <input id="tag" type="text" />
                </div>

                <br>
                <input type="hidden" name="u_email" value=<%=info.getU_email() %>>
                <input type="submit" value="등록">
                </form>
                </div>
                </div>
                </div>
            <footer class="main_footer">
                    <div class="window" id="icons" style="width: 800px" align="center">
                        <a href=""> <img src="./img/dfsfg.png" id="fire" width="50" alt=""></a>
                        <a href=""> <img src="./img/123.png" id="idea"width="40" alt=""></a>          
                        <a href=""> <img src="./img/dff.gif" id="icon" width="50" alt="error"> </a>  
                        <a href=""> <img src="./img/xml-0.png" id="job" width="40"alt=""></a>          
                        <a href=""> <img src="./img/icon_15.png" id="my_page" width="40"alt=""></a>
                        <a href=""> <img src="./img/sfsdffd.png" alt="" width="30"> </a>
                    </div>
            </footer>
			


</body>
</html>