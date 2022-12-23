<%@page import="com.smhrd.entity.UserInfo"%>
<%@page import="com.smhrd.utils.NaverApiUserInfo"%>
<%@page import="com.smhrd.utils.NaverApiUserInfo2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <title>HelloIt_Main</title>
  <meta charset="UTF-8" />
  <link rel="stylesheet" href="https://unpkg.com/98.css" />
  <title>Document</title>
</head>



<style>

/* 
#icon{
    align-items: center;
    left: 480px;
    top: 540px;
    margin-top: 8px;
}

#idea{
    left: 370px;
    top: 550px;
    
}
#my_page{
    left: 600px;
    top: 535px;

}
#job{
    left: 700px;
    top: 550px;

}
#fire{
    left: 350px;
    top: 540px;

} */

body {
    height: 100vh;
    background: url(./img/backck.webp) no-repeat center;
    background-size: cover;
  
}






.window {
    justify-content: space-between;
}  
 /* #icons{
    display: flex;
    justify-content: space-between;
} */


#btn{

    width: 20px;
        height: 10px;
       
        border-radius: 40px;
       }



 

</style>
<body>
    <header class="main_header" >
    <!-- <center> -->
    <div class="window" style="width: 800px"  align-self:center; align="center"><span style="display: flex; flex-direction: column;"></span>
        <div class="title-bar">
          <div class="title-bar-text">HEllo iT</div>
          <div class="title-bar-controls">
            <button aria-label="Minimize"></button>
            <button aria-label="Maximize"></button>
            <button aria-label="Close"></button>
          </div>
        </div>
        <br><br>

        <div class="window" style="width: 400px">
            <div class="title-bar">
              <div class="title-bar-text">검색창</div>
            </div> 
            <div class="window-body"> <img src="./img/comm.gif" width="50" alt="">
          <p> </p>
          <ul>
              <ol> <form action="https://search.naver.com/search.naver" method="GET" target="_blank">
                <input type="search" placeholder="Naver">
                <button id="btn" class="Button" type="submit">
                  검색
                </button>
              </form></ol>
              <ol><form action="https://www.google.com/search" method="GET" target="_blank">
                <input  type="search" placeholder="Google">
                <button id="btn" class="Button" type="submit">검색
                </button>
              </form></ol>
              <ol><form action="https://www.youtube.com/results" method="GET" target="_blank">
                <input  type="search" placeholder="Youtube">
                <button id="btn" class="Button" type="submit">검색
                </button>
              </form></ol>
          </ul>


            </div>
           
          </div>

        

          
          

        
        <div class="window-body"  align-self:center; align="center">
            
            <div class="window" style="width: 600px" >
                <div class="title-bar">
                    <div class="title-bar-text">맞춤형</div>
                    <input type="text" style="width:150pt;height:15pt;"  placeholder= "검색창"  name="" id="">
                    <input type="button" style="width:30pt;height:15pt;" value="🔍">
                </div>
                <div class="window-body">
                    <img src="./img/test.png" width="600px"  alt="">
                    <p> 제목</p>
                    
                     <p>내용 (보완중)</p>
                     <p>#hello #front #java #bogoddobogo</p>
                    
                </div>
                
                <div class="status-bar">
                    <p class="status-bar-field"><button id="btn">  <img src="./img/공유.png" width="10" alt="">  </button></p>
                    <p class="status-bar-field"><button id="btn">  <img src="./img/북마크.png" width="15" alt=""> </button></p>
                    <p class="status-bar-field"><button id="btn">💖</button> 하트수제작중</p> 
                    <p class="status-bar-field"><input type="text" placeholder= "댓글">
                        <input type="button" value="등록"></p>
                       <a href=""> <p class="status-bar-field">댓글보기</p></a>
                </div>
                
                
                
                
            </div>
            
            <br>
            <a href="goWrite.do"><button id="btn">글쓰기</button></a>
            <a href="goBoard.do"><button id="btn">게시판</button></a>
        <!-- </center> -->
        
    </div>
</div>
</header>

<footer class="main_footer">
    <!-- <center> -->
        <div class="window" id="icons" style="width: 800px" align-self:center; align="center">
            <a href=""> <img src="./img/dfsfg.png" id="fire" width="50" alt=""></a>
            <a href=""> <img src="./img/123.png" id="idea"width="40" alt=""></a>          
            <a href=""> <img src="./img/dff.gif "id="icon" width="50" alt="error"> </a>  
            <a href=""> <img src="./img/xml-0.png" id="job" width="40"alt=""></a>          
            <a href=""> <img src="./img/icon_15.png" id="my_page" width="40"alt=""></a>
            <a href=""> <img src="./img/sfsdffd.png" alt="" width="30"> </a>
        </div>
    <!-- </center>    -->
</footer>

<script>

</script>


</body>
</html>