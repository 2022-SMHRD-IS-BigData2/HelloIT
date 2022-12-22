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
<style> 
    body {
        height: 100vh;
        background: url(./img/backck.webp) no-repeat center;
        background-size: cover;
    }
  
/* .window {
    justify-content: space-between;
}  */
/* #icons{
    display: flex;
    justify-content: space-between;
} */



</style>





</head>
<body>
    <center>
        <div class="window" style="width: 800px" >
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
                <select>
                    <option>백엔드</option>
                    <option> 프론트엔드</option>
                    <option> 기타</option>
                  </select>
                <div class="field-row-stacked" style="width: 200px">
                    <label for="text18">제목</label>
                    <input id="text18" type="text" />
                </div><br> 
                
                
                

                <div class="field-row-stacked" style="width: 700px">
                    <label for="text20">내용</label>
                    <textarea id="text20" rows="8" style="height: 550px;"></textarea>
                </div>
                <input type="file">
                    <br>
                
                <div class="tag" style="width: 200px">
                    <label for="tag">해시태그</label>
                    <input id="tag" type="text" />
                </div>

                <br>
                
                <button>발행</button>
            </center>
            <footer class="main_footer">
                <center>
                    <div class="window" id="icons" style="width: 800px">
                        <a href=""> <img src="./img/dfsfg.png" id="fire" width="50" alt=""></a>
                        <a href=""> <img src="./img/123.png" id="idea"width="50" alt=""></a>          
                        <a href=""> <img src="./img/dff.gif" id="icon" width="50" alt="error"> </a>  
                        <a href=""> <img src="./img/xml-0.png" id="job" width="50"alt=""></a>          
                        <a href=""> <img src="./img/icon_15.png" id="my_page" width="50"alt=""></a>
                        <a href=""> <img src="./img/sfsdffd.png" alt="" width="30"> </a>
                    </div>
                </center>   
            </footer> 



</body>
</html>