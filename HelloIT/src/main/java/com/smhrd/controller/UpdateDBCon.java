package com.smhrd.controller;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.MyPageInfoDAO;
import com.smhrd.dao.UserDBInfoDAO;
import com.smhrd.dao.UserTagDAO;
import com.smhrd.entity.MyPageInfo;
import com.smhrd.entity.UserDBInfo;
import com.smhrd.entity.UserTag;

public class UpdateDBCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException {
		
		request.setCharacterEncoding("UTF-8");
		String u_email = request.getParameter("u_email");
		
		UserTag dto = new UserTag();
		dto.setU_email(u_email);
		
		UserTagDAO dao = new UserTagDAO();
		
		if(request.getParameter("mysql").equals("Y")) {
			dto.setTag_seq(33);
			dao.userTagSetting(dto);
			System.out.println("mysql 체크");
		}
		if(request.getParameter("oracle").equals("Y")) {
			dto.setTag_seq(34);
			dao.userTagSetting(dto);
			System.out.println("oracle 체크");
		}
		if(request.getParameter("mariadb").equals("Y")) {
			dto.setTag_seq(35);
			dao.userTagSetting(dto);
			System.out.println("mariadb 체크");
		}
		if(request.getParameter("pstgresql").equals("Y")) {
			dto.setTag_seq(36);
			dao.userTagSetting(dto);
			System.out.println("pstgresql 체크");
		}
		if(request.getParameter("mongodb").equals("Y")) {
			dto.setTag_seq(37);
			dao.userTagSetting(dto);
			System.out.println("mongodb 체크");
		}
		if(request.getParameter("redis").equals("Y")) {
			dto.setTag_seq(38);
			dao.userTagSetting(dto);
			System.out.println("redis 체크");
		}
		if(request.getParameter("sqlite").equals("Y")) {
			dto.setTag_seq(39);
			dao.userTagSetting(dto);
			System.out.println("sqlite 체크");
		}
		if(request.getParameter("aws_aurora").equals("Y")) {
			dto.setTag_seq(40);
			dao.userTagSetting(dto);
			System.out.println("aws_aurora 체크");
		}
		if(request.getParameter("elasticsearch").equals("Y")) {
			dto.setTag_seq(41);
			dao.userTagSetting(dto);
			System.out.println("elasticsearch 체크");
		}
		if(request.getParameter("dynamodb").equals("Y")) {
			dto.setTag_seq(42);
			dao.userTagSetting(dto);
			System.out.println("dynamodb 체크");
		}
		if(request.getParameter("firebase").equals("Y")) {
			dto.setTag_seq(43);
			dao.userTagSetting(dto);
			System.out.println("firebase 체크");
		}
		if(request.getParameter("tibero").equals("Y")) {
			dto.setTag_seq(44);
			dao.userTagSetting(dto);
			System.out.println("tibero 체크");
		}
		if(request.getParameter("hive").equals("Y")) {
			dto.setTag_seq(45);
			dao.userTagSetting(dto);
			System.out.println("hive 체크");
		}
		if(request.getParameter("cassandra").equals("Y")) {
			dto.setTag_seq(46);
			dao.userTagSetting(dto);
			System.out.println("cassandra 체크");
		}
		if(request.getParameter("db_etc").equals("Y")) {
			dto.setTag_seq(102);
			dao.userTagSetting(dto);
			System.out.println("db_etc 체크");
		}
	    
	    return "redirect:/goMyPage.do?u_email="+u_email;
	}

}
