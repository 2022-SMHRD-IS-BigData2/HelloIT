<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://unpkg.com/98.css" />
    <link rel="stylesheet" href="./css/style.css">
    <script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <title>Message</title>
    <style>
       * {
    padding: 0;
    margin: 0;
    box-sizing: border-box;
}

a {
    text-decoration: none;
}

.wrap {
    padding: 40px 0;
    background-color: #A8C0D6;
}

.wrap .chat {
    display: flex;
    align-items: flex-start;
    padding: 20px;
}


.wrap .chat .textbox {
    position: relative;
    display: inline-block;
    max-width: calc(100% - 70px);
    padding: 10px;
    margin-top: 7px;
    font-size: 13px;
    border-radius: 10px;
}

.wrap .chat .textbox::before {
    position: absolute;
    display: block;
    top: 0;
    font-size: 1.5rem;
}

.wrap .ch1 .textbox {
    margin-left: 20px;
    background-color: #ddd;
}

.wrap .ch1 .textbox::before {
    left: -15px;
    content: "◀";
    color: #ddd;
}

.wrap .ch2 {
    flex-direction: row-reverse;
}

.wrap .ch2 .textbox {
    margin-right: 20px;
    background-color: white;
}

.wrap .ch2 .textbox::before {
    right: -15px;
    content: "▶";
    color: white;
}


#btn {
	width: 20px;
	height: 10px;
	border-radius: 40px;
}
        </style>
</head>
<body>
    <div class="window" style="width: 800px; position: sticky; top: 0;" align="center">
        <div class="title-bar">
            <div class="title-bar-text">HEllo iT</div>
            <div class="title-bar-controls">
                <button aria-label="Minimize"></button>
                <button aria-label="Maximize"></button>
                <button aria-label="Close"></button>
            </div>
        </div>
    </div>
    
    <div class="window" style="width: 800px" align="center">
        <div class="window" style="position:sticky; top:26.6px">
            <div class="title-bar">
                <div class="title-bar-text">Message</div>
            </div>
            <div class="window-body" style="display:flex">
                
                
                
                <div class="wrap">
            <div>   
                <img src="./img/message.gif" width="60px" alt="">
                </div>
                <div class="chat ch1">
                    
                    <img src="./img/icon_3.png" width="50px" alt="">
                    
                    사용자이름
                    <div class="textbox">안녕하세요. 반갑습니다.</div>
            </div>
            <div class="chat ch2">
                
                <img src="./img/icon_2.png" width="55px" >
                <div class="textbox">안녕하세요. 그동안 잘 지내셨어요?</div>
            </div>
            <div class="chat ch1">
                <img src="./img/icon_3.png" width="50px" alt="">
                사용자이름
                <div class="textbox">아유~ 그럼요! 요즘 어떻게 지내세요?</div>
            </div>
            <div class="chat ch2">
                <img src="./img/icon_2.png" width="55px" alt="">
                <div class="textbox">뭐~ 늘 코딩하면서 똑같은 하루 하루를 보내는 중이에요.
                    너무 힘드네요 살려주세요. js 어떻게해야하지 </div>
            
            
                </div>

               
                
                   
                    


                                
                <input type=text style="width:300pt;height:35pt;" >   

                                <!-- <textarea  id="text" cols="50" rows="2" ></textarea> -->
                                
                                <input type=button style="width:60pt;height:35pt;" value="전송">         
<br><br><br><br>
                                <button id="btn">뒤로가기</button>
                                
                            </div>
                        </body>
                        
                    </body>
</html>