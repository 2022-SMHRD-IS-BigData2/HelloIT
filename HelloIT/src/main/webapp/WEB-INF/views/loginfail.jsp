<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>loginfail</title>
    <meta charset="UTF-8" />

    <link rel="stylesheet" href="https://unpkg.com/98.css@0.1.4/build/98.css" />
  </head>

  <style> 
    body {
        height: 100vh;
		background: rgba(0,130,128,255);
        background-size: cover;
    }

    
</style>


<body>

  <br><br><br><br><br>
 <!--<center>  --> 
    <!-- <div class="window" style="margin: 150px; width: 250px">
      <div class="title-bar">
        <div class="title-bar-text">
          Hello IT
        </div>

        <div class="title-bar-controls" >
          <button aria-label="Minimize"></button>
          <button aria-label="Maximize"></button>
          <button aria-label="Close"></button>
        </div>
      </div>
      <div class="window-body" >
        
        
      </div>
    </div> -->
    
<center>
    <div class="window"  style="width: 550px">
      <div class="title-bar">
        <div class="title-bar-text">잘못된 접근</div>
        <div class="title-bar-controls">
          <button aria-label="Minimize"></button>
          <button aria-label="Maximize"></button>
          <button aria-label="Close"></button>
        </div>
      </div>
      <div class="window-body">
        <img src="./img/vaporwave (1).gif" width="480px" alt="">
        <p>비밀번호가 맞지 않습니다!<br>
          다시 한번 확인해 주세요
        </p>

      </div>
      
        <a href="goLogin.do"> <button>돌아가기</button></a>
            <br>
      
    </div>
 <!-- </center> --> 
</center>
  </body>
</html>