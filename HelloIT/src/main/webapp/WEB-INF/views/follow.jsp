<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Follow</title>
	<script src="js/jquery-3.1.1.min.js"></script>
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
			width: 600px;
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
		<div class="container">
			<div class="wrapper">
				<div class="window" style="width: 800px; position: sticky; top: 0; max-width:100%" align="center">
					<div class="title-bar" style="position:sticky; top:1px">
						<div class="title-bar-text">팔로우/팔로워</div>
						<div class="title-bar-controls">
							<button aria-label="Close" onclick="location.href ='goMain.do'"></button>
						</div>
					</div>
					<div class="window-body" style="justify-content: space-between;">
						<div>

							<table>
								<tr>
									<td colspan="2">
										<h5 align="center"> 팔로우, 팔로워 아이디를 검색하세요.</h5>
									</td>

								</tr>
							</table>
							<input type="text" placeholder="아이디를 검색하세요"
								style="width:100px; height: 20px; font: size 10px;;">
							<button>검색</button>
							<BR></BR>


							<ul class="tabs">
								<li class="tab-link current" data-tab="tab-1">팔로우</li>
								<li class="tab-link" data-tab="tab-2">팔로워</li>

							</ul>

							<div id="tab-1" class="tab-content current">

								<div id="job-table">


									<table style="width: 600px; height: 100px;overflow: auto; text-align: center;">
										<tbody>
											<thead>
												<tr height="30px">

													<th>아이디</th>
													<th>메신저보내기</th>
													<th>팔로우 삭제</th>
												</tr>
											</thead>
											<tr>

												<td> <a href="#">아이디</a></td>
												<td><a href="#"> <img src="img/message.png" alt="메세지보내기"></img></a></td>
												<td><img src="img/delete.png" width="50px"
														height="50px" alt="팔로워 삭제" onclick="test()"></td>
											</tr>
											
											<tr>

												<td> <a href="#">아이디</a></td>
												<td><a href="#"> <img src="img/message.png" alt="메세지보내기"></img></a></td>
												<td><img src="img/delete.png" width="50px"
														height="50px" alt="팔로워 삭제" onclick="test()"></td>
											</tr>
											
											<tr>

												<td> <a href="#">아이디</a></td>
												<td><a href="#"> <img src="img/message.png" alt="메세지보내기"></img></a></td>
												<td><img src="img/delete.png" width="50px"
														height="50px" alt="팔로워 삭제" onclick="test()"></td>
											</tr>
											
											<tr>

												<td> <a href="#">아이디</a></td>
												<td><a href="#"> <img src="img/message.png" alt="메세지보내기"></img></a></td>
												<td><img src="img/delete.png" width="50px"
														height="50px" alt="팔로워 삭제" onclick="test()"></td>
											</tr>
											
											<tr>

												<td> <a href="#">아이디</a></td>
												<td><a href="#"> <img src="img/message.png" alt="메세지보내기"></img></a></td>
												<td><img src="img/delete.png" width="50px"
														height="50px" alt="팔로워 삭제" onclick="test()"></td>
											</tr>
											
											<tr>

												<td> <a href="#">아이디</a></td>
												<td><a href="#"> <img src="img/message.png" alt="메세지보내기"></img></a></td>
												<td><img src="img/delete.png" width="50px"
														height="50px" alt="팔로워 삭제" onclick="test()"></td>
											</tr>
											
											<tr>

												<td> <a href="#">아이디</a></td>
												<td><a href="#"> <img src="img/message.png" alt="메세지보내기"></img></a></td>
												<td><img src="img/delete.png" width="50px"
														height="50px" alt="팔로워 삭제" onclick="test()"></td>
											</tr>
											
										</tbody>
									</table>
								</div>

								<br>
			

							</div>
							<div id="tab-2" class="tab-content">
								<div id="job-table">


									<table style="width: 600px; height: 100px; overflow: auto; text-align: center;" >
										<tbody>
											<thead>
												<tr height="30px">
													<th>아이디</th>
													<th>메신저보내기</th>
													<th>팔로워 삭제</th>
												</tr>
											</thead>
											<tr>
												<td> <a href="#">아이디</a></td>
												<td><a href="#"> <img src="img/message.png" alt="메세지보내기"></img></a></td>
												<td><img src="img/delete.png" width="50px"
														height="50px" alt="팔로워 삭제" onclick="test()"></td>
											</tr>
											<tr>
												<td> <a href="#">아이디</a></td>
												<td><a href="#"> <img src="img/message.png" alt="메세지보내기"></img></a></td>
												<td><img src="img/delete.png" width="50px"
														height="50px" alt="팔로워 삭제" onclick="test()"></td>

											</tr>
											<tr>
												<td> <a href="#">아이디</a></td>
												<td><a href="#"> <img src="img/message.png" alt="메세지보내기"></img></a></td>
												<td><img src="img/delete.png" width="50px"
														height="50px" alt="팔로워 삭제" onclick="test()"></td>
											</tr>
											<tr>
												<td> <a href="#">아이디</a></td>
												<td><a href="#"> <img src="img/message.png" alt="메세지보내기"></img></a></td>
												<td><img src="img/delete.png" width="50px"
														height="50px" alt="팔로워 삭제" onclick="test()"></td>

											</tr>
											<tr>
												<td> <a href="#">아이디</a></td>
												<td><a href="#"> <img src="img/message.png" alt="메세지보내기"></img></a></td>
												<td><img src="img/delete.png" width="50px"
														height="50px" alt="팔로워 삭제" onclick="test()"></td>

											</tr>
											<tr>
												<td> <a href="#">아이디</a></td>
												<td><a href="#"> <img src="img/message.png" alt="메세지보내기"></img></a></td>
												<td><img src="img/delete.png" width="50px"
														height="50px" alt="팔로워 삭제" onclick="test()"></td>

											</tr>
											

										</tbody>
									</table>
								</div>

								<br>
								
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





							function test() {
								if (!confirm("팔로우를 정말 삭제하겠습니까?")) {
									alert("취소(아니오)를 누르셨습니다.");
								} else {
									alert("확인(예)을 누르셨습니다. 삭제됩니다.");
								}
							}

						</script>

	</center>
</body>

</html>