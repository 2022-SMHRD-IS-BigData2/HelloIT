<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<link rel="stylesheet" href="https://unpkg.com/98.css" />
<style>
body {
    background: rgba(0,130,128,255);
	background-size: cover;
	
}
</style>
</head>

<body>
<center>
	<div align="center">
		<form action="join.do" method="post">
			<div class="window" style="margin: 10px; width: 300px">
				<div class="title-bar">
					<div class="title-bar-text">회원가입</div>
				</div>
				<table>
					<tr>
						<td colspan="2">
							<h5 align="center">개인정보</h5>
						</td>
						<img src="./img/com.gif" width="250" alt="">
					</tr>
					<tr>
						<td align="right">아이디(이메일) :</td>
						<td><input type="email" name="u_email"></td>
					</tr>

					<tr>
						<td align="right">비밀번호 :</td>
						<td><input id="pw1" type="password" name="u_pw"></td>
					</tr>
					<tr>
						<td align="right">비밀번호확인 :</td>
						<td><input id="pw2" type="password"></td>
					</tr>
					<tr>
						<td align="right">이름 :</td>
						<td><input type="text" name="u_name"></td>
					</tr>
					<tr>
						<td align="right">닉네임 :</td>
						<td><input type="text" name="u_nick"></td>
					</tr>
					<!-- <tr>
            <td colspan="2" >
                <h3>개인정보 </h3>
            </td>
 -->
					<tr>
						<td align="right">성별 :</td>

						<td><input id="man" type="radio" name="u_gender" value="M">
							<label for="man">남자</label> <input id="woman" type="radio"
							name="u_gender" value="W"> <label for="woman">여자</label>

						</td>
					</tr>
					<!-- <tr>
                <td align="right">전화번호 : </td>
                <td> <input type="tel" id="mobile" name="u_tel" class="int" maxlength="16" placeholder="숫자만 입력해주세요"> </td>
            </tr> -->
			<!-- 		<span class="error_next_box"></span> -->



					<tr>
						<td align="right">직업:</td>
						<td><select name="u_job">
								<option value="학생">학생</option>
								<option value="취업준비생">취업준비생</option>
								<option value="개발자">개발자</option>
								<option value="채용담당자">채용담당자</option>
						</select></td>
					</tr>

					<tr>
						<td align="right">생일:</td>
						<td><input type="date" name="u_birthdate"></td>

						<!--  <tr>
                <td colspan="2">
                    <h5 align="center"> 선호도 </h5>
                </td>

            </tr>


            <tr>
                <td align="right"> 관심분야 : </td>

                <td>

                    <input id="back" type="checkbox" name="hobby">
                    <label for="back">백엔드</label>
                    <input id="front" type="checkbox" name="hobby">
                    <label for="front">프론트엔드</label>
                    <input id="front" type="checkbox" name="hobby">
                    <label for="front">데이터분야</label>
                    <input id="etc" type="checkbox" name="hobby">
                    <label for="etc">기타</label>
                    </div>

                </td>
            </tr>
 -->
					<tr>
						<td colspan="2" align="center">
							<!-- <button onclick="location.href=''">가입하기</button> --> <input
							type="submit" value="가입하기"> <input type="reset"
							value="초기화">
						</td>

					</tr>
				</table>
			</div>
		</form>
	</div>
	</center>
</body>

</html>