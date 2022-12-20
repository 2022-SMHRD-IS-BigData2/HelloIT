<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		http://localhost:8083/FrontController/
		기본 URL로 요청했을 때 보여지는 페이지 >> Welcome Page 라고 한다.
		
		단 파일이 webapp 아래에 있어야함
		이름이 반드시 index.jsp 여야함
	 -->
	 <jsp:forward page="goMain.do"></jsp:forward>
	 
</body>
</html>