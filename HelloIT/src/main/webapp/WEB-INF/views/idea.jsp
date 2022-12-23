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
        background: rgba(0,130,128,255);
        background-size: cover;
    }


    #form-commentInfo{
    width: 100%;
}

#comment-count{
    margin-bottom: 10px; 
}

#comment-input{
    width: 50%;
    height: 3.3em;
}

#submit{
    background-color: rgb(0, 128,255);
    width: 5.5em;
    height: 3.3em;;
    font-size: 15px;
    font-weight: bold;
    color: aliceblue;
}



#comments{
    margin-top: 10px;
}

.eachComment{   
    width :50%; 
    margin: 10px;  
    padding: 0.5em; 
    border-bottom: 1px solid #c1bcba;
}

.eachComment .name{
    font-size: 1.5em;
    font-weight: bold;
    margin-bottom: 0.3em;
    display: flex;
    justify-content: space-between;
}

.eachComment .inputValue{
    font-size: 1.2em;
    font-style: italic;    
}

.eachComment .time{
    font-size: 0.7em;
    color: #c1bcba;
    font-style: oblique;
    margin-top: 0.5em;
    margin-bottom: 0.5em;
    
}

.eachComment .voteDiv{
    display: flex;
    justify-content: flex-end;
}

.eachComment .deleteComment{
    background-color: red;
    color: aliceblue;
}

    
</style>

</head>
<body>
    <div class="window" style="width: 800px" >
        <div class="title-bar">
          <div class="title-bar-text">HelloIt
          </div>
          <div class="title-bar-controls">
            <button aria-label="Minimize"></button>
            <button aria-label="Maximize"></button>
            <button aria-label="Close"></button>
          </div>
        </div>
        <div class="window-body">
          <a href=""> <p>주제1</p> </a>
          <a href=""> <p>주제2</p> </a>
          <a href=""> <p>주제3</p> </a>


         
          <div class="window" style="width: 700px" >
            <div class="title-bar">
                <div class="title-bar-text">💡idea💡 </div>
            </div>
            <div class="window-body">
                


                 <div id="form-commentInfo">
                    <div id="comment-count">comments count:<span id="count">0</span></div>
                    <input id="comment-input" placeholder="당신의 아이디어를 입력해 보세요.">
                    <button id="submit">등록</button>
                </div>
                <div id=comments>
            
                </div>
                <script src="index.js"></script>





            </div>
            
              </div>

        


        <footer class="main_footer">
                <div class="window" id="icons" style="width: 800px" align-self:center; align="center">
                    <a href=""> <img src="./img/dfsfg.png" id="fire" width="50" alt=""></a>
                    <a href=""> <img src="./img/123.png" id="idea"width="40" alt=""></a>          
                    <a href=""> <img src="./img/dff.gif "id="icon" width="50" alt="error"> </a>  
                    <a href=""> <img src="./img/xml-0.png" id="job" width="40"alt=""></a>          
                    <a href=""> <img src="./img/icon_15.png" id="my_page" width="40"alt=""></a>
                    <a href=""> <img src="./img/sfsdffd.png" alt="" width="30"> </a>
                </div>
        </footer>


</body>
</html>