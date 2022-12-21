package com.smhrd.controller;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.MyPageInfoDAO;
import com.smhrd.dao.UserDBInfoDAO;
import com.smhrd.entity.MyPageInfo;
import com.smhrd.entity.UserDBInfo;

public class UpdateDBCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException {
		
		request.setCharacterEncoding("UTF-8");
		String u_email = request.getParameter("u_email");
	    String mysql = request.getParameter("mysql");
	    String oracle  = request.getParameter("oracle");
	    String mariadb = request.getParameter("mariadb");
	    String pstgresql = request.getParameter("pstgresql");
	    String mongodb = request.getParameter("mongodb");
	    String redis = request.getParameter("redis");
	    String sqlite = request.getParameter("sqlite");
	    String aws_aurora = request.getParameter("aws_aurora");
	    String elasticsearch = request.getParameter("elasticsearch");
	    String dynamodb = request.getParameter("dynamodb");
	    String firebase = request.getParameter("firebase");
	    String tibero = request.getParameter("tibero");
	    String hive = request.getParameter("hive");
	    String cassandra = request.getParameter("cassandra");
	    String db_etc = request.getParameter("db_etc");
	    
	    UserDBInfo dto = new UserDBInfo();
	    dto.setU_email(u_email);
	    dto.setMysql(mysql);
	    dto.setOracle(oracle);
	    dto.setMariadb(mariadb);
	    dto.setPstgresql(pstgresql);
	    dto.setMongodb(mongodb);
	    dto.setRedis(redis);
	    dto.setSqlite(sqlite);
	    dto.setAws_aurora(aws_aurora);
	    dto.setElasticsearch(elasticsearch);
	    dto.setDynamodb(dynamodb);
	    dto.setFirebase(firebase);
	    dto.setTibero(tibero);
	    dto.setHive(hive);
	    dto.setCassandra(cassandra);
	    dto.setDb_etc(db_etc);
	    UserDBInfoDAO dao = new UserDBInfoDAO();
	    int cnt = dao.updateDB(dto);
	    String nextPage = "";
		if (cnt > 0) {
			// 성공
			System.out.println("회원DB 수정 성공");
			// 메인페이지로
			// 이미 이동하는 컨트롤러가 있는경우, 컨트롤러로 이동시키자.
			// redirect를 하 는경우, 앞에 redirect:/ 를 붙이기로 약속
			nextPage = "redirect:/goMyPage.do";

		} else {
			// 실패
			System.out.println("회원DB 수정 실패");
			nextPage = "redirect:/goMyPage.do";
		}
		return nextPage;
	}

}
