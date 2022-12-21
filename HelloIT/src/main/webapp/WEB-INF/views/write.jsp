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
        background: url(./img/다운로드.gif) no-repeat center;
        background-size: cover;
    }
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
                    <textarea id="text20" rows="8"></textarea>
                </div>
                    <br>
                
                <div class="tag" style="width: 200px">
                    <label for="tag">해시태그</label>
                    <input id="tag" type="text" />
                </div>

                <br>
                
                <button>발행</button>
            </center>
        







</body>
</html>