<%@page import="com.smhrd.entity.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <link rel="stylesheet" href="https://unpkg.com/98.css" />
<head>
	<meta http-equiv="Content-Type">
    <meta charset="UTF-8">
    <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hello IT</title>
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/write.css">
<script type="text/javascript" src="./js/mousePointer.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="./js/mousePointer.js"></script>

</head>

<body>
		<% UserInfo info = (UserInfo)session.getAttribute("info");
			
		%>
		<div class="container">
		<div class="wrapper">
        <div class="window" style="width: 800px; top:0" align="center">
            <div class="title-bar">
                <div class="title-bar-text">게시물 작성하기</div>
                <div class="title-bar-controls">
                    <button aria-label="Minimize"></button>
                    <button aria-label="Maximize"></button>
                    <button aria-label="Close"></button>
                </div>
            </div>
		            
		<form action="write.do" method="post" enctype="multipart/form-data">
            <!-- <img src="./img/69719.png" width="50" alt=""> -->
            
            <div class="window-body" style="display: flex;margin: auto; justify-content: center;">
                <p></p>
                <select name="post_kind" style="margin-right:10px">
                   	<option value="tip"> 잇팁 (IT tip)</option>
                    <option value="idea"> 아이디어 토론방</option>
                    <option value="job"> 채용공고</option>
                  </select>
                <div class="field-row-stacked" style="width: 575px; flex-direction: row;">
                	<span style="width: 30px;text-align: center;font-size: larger;font-weight: bold;">주제</span> 
                	<input id="text18" type="text" name="post_title" style="margin-left: 10px; margin-top:0;margin-bottom:0; width:535px">
                </div><br> 
            </div>
                  
                

                <div class="field-row-stacked" style="width: 700px">
                    <label for="text20">내용</label>
                    <textarea id="text20" rows="8" style="height: 550px;" name="post_content"></textarea>
                </div>
                <input type="file" style=" float: right;" name="post_file">
                    <br>
                	<br>
                <div class="tag" style="width: 500px;">
                    <label for="tag">해시태그</label>
					<div class="tr_hashTag_area">
						<div class="form-group">
							<input type="hidden" value="" name="tag" id="rdTag" />
			            </div>
                        
    		        	<div class="form-group">
            				<input type="text" id="tag" size="7" placeholder="스페이스바로 해시태그를 등록해주세요." style="width: 500px;"/>
						</div>
						
						<ul id="tag-list"></ul>
					</div>                    
                </div>

                <input type="hidden" name="u_email" value=<%=info.getU_email() %>>
                <input type="submit" value="등록">
                </form>
                </div>
                </div>
                </div>
           	<footer class="main_footer">
		<div class="window" id="icons" style="width: 800px" align="center">
			<a href="goPopPostMain.do"><img src="./img/dfsfg.png" id="fire" width="50" alt=""></a> 
			<a href="goIdea.do"><img src="./img/123.png" id="idea" width="40" alt=""></a> 
			<a href="goMain.do?u_email=<%=info.getU_email()%>"><img src="./img/dff.gif" id="goMain" width="50" alt="error"></a> 
			<a href="goMainWrite.do"><img src="./img/dfsee.gif" id="goMain" width="41" alt="error"></a> 
			<a href="goRecruit.do"><img src="./img/xml-0.png" id="job" width="40" alt=""></a> 
			<a href="goMyPage.do?u_email=<%=info.getU_email()%>"><img src="./img/icon_15.png" id="my_page" width="40" alt=""></a> 
			<a href="goMessage.do"><img src="./img/sfsdffd.png" id="message" alt="" width="30"></a>
		</div>
	</footer>

<script>
/* test/박해성 */
$(document).ready(function () {
    var tag = {};
    var counter = 0;

    // 입력한 값을 태그로 생성한다.
    function addTag (value) {
        tag[counter] = value;
        counter++; // del-btn 의 고유 id 가 된다.
    }

    // tag 안에 있는 값을 array type 으로 만들어서 넘긴다.
    function marginTag () {
        return Object.values(tag).filter(function (word) {
            return word !== "";
        });
    }

    // 서버에 제공
    $("#tag-form").on("submit", function (e) {
        var value = marginTag(); // return array
        $("#rdTag").val(value); 

        $(this).submit();
    });

    $("#tag").on("keypress", function (e) {
        var self = $(this);

        //엔터나 스페이스바 눌렀을때 실행
        if (e.key === "SPACE BAR" || e.keyCode == 32) {

            var tagValue = self.val(); // 값 가져오기

            // 해시태그 값 없으면 실행X
            if (tagValue !== "") {

                // 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
                var result = Object.values(tag).filter(function (word) {
                    return word === tagValue;
                })
            
                // 해시태그가 중복되었는지 확인
                if (result.length == 0) { 
                    $("#tag-list").append
                    ("<li class='tag-item'>"+tagValue+"<span class='del-btn' idx='"+counter+"'>❌</span></li>");
                    addTag(tagValue);
                    self.val("");
                    $("div.tag").append('<input type="hidden" name="tag_content" value="'+tagValue+'">');
                    
                } else {
                    alert("태그값이 중복됩니다.");
                }
            }
            e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
        }
    });
    
    // 삭제 버튼 
    // 인덱스 검사 후 삭제
    $(document).on("click", ".del-btn", function (e) {
        var index = $(this).attr("idx");
        tag[index] = "";
        $(this).parent().remove();
    });
})
</script>

</body>
</html>