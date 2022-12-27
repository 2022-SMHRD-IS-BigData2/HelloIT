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
	    String[] mysql = request.getParameterValues("mysql");
	    String[] oracle  = request.getParameterValues("oracle");
	    String[] mariadb = request.getParameterValues("mariadb");
	    String[] pstgresql = request.getParameterValues("pstgresql");
	    String[] mongodb = request.getParameterValues("mongodb");
	    String[] redis = request.getParameterValues("redis");
	    String[] sqlite = request.getParameterValues("sqlite");
	    String[] aws_aurora = request.getParameterValues("aws_aurora");
	    String[] elasticsearch = request.getParameterValues("elasticsearch");
	    String[] dynamodb = request.getParameterValues("dynamodb");
	    String[] firebase = request.getParameterValues("firebase");
	    String[] tibero = request.getParameterValues("tibero");
	    String[] hive = request.getParameterValues("hive");
	    String[] cassandra = request.getParameterValues("cassandra");
	    String[] db_etc = request.getParameterValues("db_etc");
	    
	    UserDBInfo dto = new UserDBInfo();
	    dto.setU_email(u_email);
	    dto.setMysql(mysql[0]);
	    dto.setOracle(oracle[0]);
	    dto.setMariadb(mariadb[0]);
	    dto.setPstgresql(pstgresql[0]);
	    dto.setMongodb(mongodb[0]);
	    dto.setRedis(redis[0]);
	    dto.setSqlite(sqlite[0]);
	    dto.setAws_aurora(aws_aurora[0]);
	    dto.setElasticsearch(elasticsearch[0]);
	    dto.setDynamodb(dynamodb[0]);
	    dto.setFirebase(firebase[0]);
	    dto.setTibero(tibero[0]);
	    dto.setHive(hive[0]);
	    dto.setCassandra(cassandra[0]);
	    dto.setDb_etc(db_etc[0]);
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
