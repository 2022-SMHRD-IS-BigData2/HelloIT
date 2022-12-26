<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<script src="./js/jquery-3.1.1.min.js"></script>
	<link rel="stylesheet" href="https://unpkg.com/98.css" />

	<style>
		body {
			height: 100vh;
			background: url(./img/KakaoTalk_20221221_111631302.webp) no-repeat center;
			background-size: cover;
		}

		table {
			width: 600px;
			margin-left: auto;
			margin-right: auto;
		}

		#job-table {
			display: flex;
			flex-direction: column;
		}

		body {
			margin-top: 100px;
			font-family: 'Trebuchet MS', serif;
			line-height: 1.6
		}

		.container {
			width: 650px;
			margin: 0 auto;
		}


		ul.tabs {
			margin: 0px;
			padding: 0px;
			list-style: none;
		}

		ul.tabs li {
			background: none;
			color: #222;
			display: inline-block;
			padding: 10px 15px;
			cursor: pointer;
		}

		ul.tabs li.current {
			background: #ededed;
			color: #222;
		}

		.tab-content {
			display: none;
			background: #ededed;
			padding: 15px;
		}

		.tab-content.current {
			display: inherit;
		}
	</style>
</head>

<body>
	<center>
	<div class="window" style="margin: 10px; width: 800px">
		<div class="title-bar">
			<div class="title-bar-text">
				채용 공고
	  </div>
			</div>
		</div>
		<div class="container">
			<table>
				<tr>
					<td colspan="2">
						<h5 align="center"> 채용 내용을 클릭하면 해당 공고로 이동합니다.</h5>
					</td>

				</tr>
			</table>
			<input type="text" placeholder="원하는 채용을 검색하세요" style="width:100px;height: 20px; font: size 10px;;">
			<button>검색</button>
			<BR></BR>


			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1">사람인</li>
				<li class="tab-link" data-tab="tab-2">잡코리아</li>

			</ul>

			<div id="tab-1" class="tab-content current">

				<div id="job-table">


					<table style="width: 600px; height: 100px; overflow: auto" border="1px">
						<tbody>
							<thead>
								<tr height="30px">
									<th>기업명</th>
									<th>채용 내용</th>
									<th>경력/학력/지역</th>
									<th>마감일</th>
								</tr>
							</thead>
							<tr>
								<td>사+크롤링(회사)</td>
								<td> <a href="#">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>

						</tbody>
					</table>
				</div>

				<br>
				<div class="pagination_section">
					<a href="#">
						<< Previous</a>
							<a href="#" title="">1</a>
							<a href="#" title="">2</a>
							<a href="#" title="">3</a>
							<a href="#" title="">4</a>
							<a href="#" title="">5</a>
							<a href="#" title="">6</a>
							<a href="#" title="">7</a>
							<a href="#" title="">8</a>
							<a href="#" title="">9</a>
							<a href="#" title="">10</a>
							<a href="#">Next >></a>
				</div>






			</div>
			<div id="tab-2" class="tab-content">
				<div id="job-table">


					<table style="width: 600px; height: 100px; overflow: auto" border="1px">
						<tbody>
							<thead>
								<tr height="30px">
									<th>기업명</th>
									<th>채용 내용</th>
									<th>경력/학력/지역</th>
									<th>마감일</th>
								</tr>
							</thead>
							<tr>
								<td>잡+크롤링(회사)</td>
								<td> <a href="#">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>
							<tr>
								<td>크롤링(회사)</td>
								<td><a href="">크롤링(채용내용)</a></td>
								<td>크롤링(경력/학력/지역)</td>
								<td>크롤링(마감일)</td>
							</tr>

						</tbody>
					</table>
				</div>

				<br>
				<div class="pagination_section">
					<a href="#">
						<< Previous</a>
							<a href="#" title="">1</a>
							<a href="#" title="">2</a>
							<a href="#" title="">3</a>
							<a href="#" title="">4</a>
							<a href="#" title="">5</a>
							<a href="#" title="">6</a>
							<a href="#" title="">7</a>
							<a href="#" title="">8</a>
							<a href="#" title="">9</a>
							<a href="#" title="">10</a>
							<a href="#">Next >></a>
				</div>
				
			</div>


		</div>


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

		</script>

		<a href="http://www.naver.com/"><img src="icons/KakaoTalk_20221221_163912885_01.png" alt="인기게시글"
				width="30px"></a>
		<a href="#"> <img src="icons/KakaoTalk_20221221_163912885_04.png" alt="아이디어" width="30px"></a>
		<a href="#"> <img src="icons/KakaoTalk_20221221_163912885.png" alt="메인홈" width="30px"></a>
		<a href="#"><img src="icons/KakaoTalk_20221221_163912885_02.png" alt="채용공고" width="30px"></a>
		<a href="#"><img src="icons/KakaoTalk_20221221_163912885_03.png" alt="개인정보" width="30px"></a>
	</center>
</body>

</html>