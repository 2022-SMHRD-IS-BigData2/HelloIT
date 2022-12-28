package com.smhrd.controller;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.MyPageInfoDAO;
import com.smhrd.dao.UserDBInfoDAO;
import com.smhrd.dao.UserSkillInfoDAO;
import com.smhrd.dao.UserTagDAO;
import com.smhrd.entity.MyPageInfo;
import com.smhrd.entity.UserDBInfo;
import com.smhrd.entity.UserSkillInfo;
import com.smhrd.entity.UserTag;

public class UpdateSkillCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException {
		
		request.setCharacterEncoding("UTF-8");
		String u_email = request.getParameter("u_email");
		
		UserTag dto = new UserTag();
		dto.setU_email(u_email);
		
		UserTagDAO dao = new UserTagDAO();
		
		if(request.getParameter("web").equals("Y")) {
			dto.setTag_seq(4);
			dao.userTagSetting(dto);
			System.out.println("web 체크");
		}
		if(request.getParameter("ios").equals("Y")) {
			dto.setTag_seq(5);
			dao.userTagSetting(dto);
			System.out.println("ios 체크");
		}
		if(request.getParameter("android").equals("Y")) {
			dto.setTag_seq(6);
			dao.userTagSetting(dto);
			System.out.println("android 체크");
		}
		if(request.getParameter("windows").equals("Y")) {
			dto.setTag_seq(7);
			dao.userTagSetting(dto);
			System.out.println("windows 체크");
		}
		if(request.getParameter("mac").equals("Y")) {
			dto.setTag_seq(8);
			dao.userTagSetting(dto);
			System.out.println("mac 체크");
		}
		if(request.getParameter("linux").equals("Y")) {
			dto.setTag_seq(9);
			dao.userTagSetting(dto);
			System.out.println("linux 체크");
		}
		if(request.getParameter("game").equals("Y")) {
			dto.setTag_seq(10);
			dao.userTagSetting(dto);
			System.out.println("game 체크");
		}
		if(request.getParameter("skill_etc").equals("Y")) {
			dto.setTag_seq(100);
			dao.userTagSetting(dto);
			System.out.println("skill_etc 체크");
		}
	    
		return "redirect:/goMyPage.do?u_email="+u_email;
	}

}
