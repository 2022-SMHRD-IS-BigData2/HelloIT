<%@page import="com.google.gson.JsonParser"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.smhrd.utils.NaverApiUserInfo2"%>
<%@page import="com.smhrd.utils.NaverApiUserInfo"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.net.URL"%>
<%@ page import="java.net.HttpURLConnection"%>
<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.InputStreamReader"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<%-- 유남욱 : 네이버 회원정보관련 확인중 --%>
<html>
<head>
<title>네이버로그인</title>
</head>
<body>
	<%
	String clientId = "zpztEFLfY06RGS88839H";//애플리케이션 클라이언트 아이디값";
	String clientSecret = "x8pLA9mOd_";//애플리케이션 클라이언트 시크릿값";
	String code = request.getParameter("code");
	String state = request.getParameter("state");
	String redirectURI = URLEncoder.encode("http://localhost:8083/FrontController/goMain.do", "UTF-8");
	String apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code" + "&client_id=" + clientId
			+ "&client_secret=" + clientSecret + "&redirect_uri=" + redirectURI + "&code=" + code + "&state=" + state;
	String accessToken = "";
	String refresh_token = "";
	try {
		URL url = new URL(apiURL);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("GET");
		int responseCode = con.getResponseCode();
		BufferedReader br;
		if (responseCode == 200) { // 정상 호출
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		} else { // 에러 발생
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		}
		String inputLine;
		StringBuilder res = new StringBuilder();
		while ((inputLine = br.readLine()) != null) {
			res.append(inputLine);
		}
		br.close();
		if (responseCode == 200) {
			//out.println(res.toString()); // 출력 문장
			JsonParser parser = new JsonParser();
			Object obj = parser.parse(res.toString());
			JsonObject json = (JsonObject) obj;

			accessToken = json.get("access_token").toString();
			refresh_token = json.get("refresh_token").toString();

			session.setAttribute("access_token", accessToken);
			session.setAttribute("refresh_token", refresh_token);

			response.sendRedirect("goNaverJoin.do");

		}
	} catch (Exception e) {
		// Exception 로깅
	}
	%>
</body>

</html>