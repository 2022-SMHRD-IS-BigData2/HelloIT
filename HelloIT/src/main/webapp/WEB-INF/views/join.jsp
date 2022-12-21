<%@page import="com.google.gson.JsonParser"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.smhrd.utils.NaverApiUserInfo2"%>
<%@page import="com.smhrd.utils.NaverApiUserInfo"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String accessToken = (String)session.getAttribute("access_token");
		String refreshToken = (String)session.getAttribute("refresh_token");
		
/* 		out.print(accessToken);
		out.print("<br>");
		out.print(refreshToken); */
		
		String header = "Bearer " + accessToken;
		
	
	
		if(accessToken != null) { // access_token을 잘 받아왔다면

			try {

		    	// 이 안에 코드 작성
				String apiurl = "https://openapi.naver.com/v1/nid/me";
				URL url = new URL(apiurl);
				HttpURLConnection con = (HttpURLConnection)url.openConnection();
				con.setRequestMethod("GET");
				con.setRequestProperty("Authorization", header);
				int responseCode = con.getResponseCode();
				BufferedReader br;

				if(responseCode==200) { // 정상 호출
				  br = new BufferedReader(new InputStreamReader(con.getInputStream()));
				} else {  // 에러 발생
				  br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
				}

				String inputLine;
				StringBuffer res = new StringBuffer();
				while ((inputLine = br.readLine()) != null) {
				  res.append(inputLine);
				}

				br.close();
				
				out.print(res.toString());

		    } catch (Exception e) {

		    	e.printStackTrace();

		    }

		}
	%>
	
	<form>
		<input type="text" value="<%=%>">
	</form>
</body>
</html>