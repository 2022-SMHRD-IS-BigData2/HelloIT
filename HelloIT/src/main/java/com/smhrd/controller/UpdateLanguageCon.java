package com.smhrd.controller;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.MyPageInfoDAO;
import com.smhrd.dao.UserLanguageInfoDAO;
import com.smhrd.dao.UserTagDAO;
import com.smhrd.entity.MyPageInfo;
import com.smhrd.entity.UserLanguageInfo;
import com.smhrd.entity.UserTag;

public class UpdateLanguageCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException {
		
		request.setCharacterEncoding("UTF-8");
		String u_email = request.getParameter("u_email");
		
		UserTag dto = new UserTag();
		dto.setU_email(u_email);
		
		UserTagDAO dao = new UserTagDAO();
		
		if(request.getParameter("html").equals("Y")) {
			dto.setTag_seq(11);
			dao.userTagSetting(dto);
			System.out.println("html 체크");
		}
		if(request.getParameter("css").equals("Y")) {
			dto.setTag_seq(12);
			dao.userTagSetting(dto);
			System.out.println("css 체크");
		}
		if(request.getParameter("c").equals("Y")) {
			dto.setTag_seq(14);
			dao.userTagSetting(dto);
			System.out.println("c 체크");
		}
		if(request.getParameter("c_pp").equals("Y")) {
			dto.setTag_seq(15);
			dao.userTagSetting(dto);
			System.out.println("c_pp 체크");
		}
		if(request.getParameter("c_sharp").equals("Y")) {
			dto.setTag_seq(16);
			dao.userTagSetting(dto);
			System.out.println("c_sharp 체크");
		}
		if(request.getParameter("java").equals("Y")) {
			dto.setTag_seq(17);
			dao.userTagSetting(dto);
			System.out.println("java 체크");
		}
		if(request.getParameter("python").equals("Y")) {
			dto.setTag_seq(18);
			dao.userTagSetting(dto);
			System.out.println("python 체크");
		}
		if(request.getParameter("php").equals("Y")) {
			dto.setTag_seq(19);
			dao.userTagSetting(dto);
			System.out.println("php 체크");
		}
		if(request.getParameter("dart").equals("Y")) {
			dto.setTag_seq(20);
			dao.userTagSetting(dto);
			System.out.println("dart 체크");
		}
		if(request.getParameter("typescript").equals("Y")) {
			dto.setTag_seq(21);
			dao.userTagSetting(dto);
			System.out.println("typescript 체크");
		}
		if(request.getParameter("kotlin").equals("Y")) {
			dto.setTag_seq(22);
			dao.userTagSetting(dto);
			System.out.println("kotlin 체크");
		}
		if(request.getParameter("go").equals("Y")) {
			dto.setTag_seq(23);
			dao.userTagSetting(dto);
			System.out.println("go 체크");
		}
		if(request.getParameter("r").equals("Y")) {
			dto.setTag_seq(24);
			dao.userTagSetting(dto);
			System.out.println("r 체크");
		}
		if(request.getParameter("rust").equals("Y")) {
			dto.setTag_seq(25);
			dao.userTagSetting(dto);
			System.out.println("rust 체크");
		}
		if(request.getParameter("swift").equals("Y")) {
			dto.setTag_seq(26);
			dao.userTagSetting(dto);
			System.out.println("swift 체크");
		}
		if(request.getParameter("scala").equals("Y")) {
			dto.setTag_seq(27);
			dao.userTagSetting(dto);
			System.out.println("scala 체크");
		}
		if(request.getParameter("objective_c").equals("Y")) {
			dto.setTag_seq(28);
			dao.userTagSetting(dto);
			System.out.println("objective_c 체크");
		}
		if(request.getParameter("ruby").equals("Y")) {
			dto.setTag_seq(29);
			dao.userTagSetting(dto);
			System.out.println("ruby 체크");
		}
		if(request.getParameter("haskell").equals("Y")) {
			dto.setTag_seq(30);
			dao.userTagSetting(dto);
			System.out.println("haskell 체크");
		}
		if(request.getParameter("clojure").equals("Y")) {
			dto.setTag_seq(31);
			dao.userTagSetting(dto);
			System.out.println("clojure 체크");
		}
		if(request.getParameter("sql").equals("Y")) {
			dto.setTag_seq(32);
			dao.userTagSetting(dto);
			System.out.println("sql 체크");
		}
		if(request.getParameter("language_etc").equals("Y")) {
			dto.setTag_seq(101);
			dao.userTagSetting(dto);
			System.out.println("language_etc 체크");
		}
	    
	    return "redirect:/goMyPage.do?u_email="+u_email;
	}

}
