package com.smhrd.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.MyPageInfoDAO;
import com.smhrd.dao.UserRoleInfoDAO;
import com.smhrd.dao.UserTagDAO;
import com.smhrd.entity.MyPageInfo;
import com.smhrd.entity.UserRoleInfo;
import com.smhrd.entity.UserTag;

public class UpdateRoleCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException {
		
		request.setCharacterEncoding("UTF-8");
		String u_email = request.getParameter("u_email");
		
		UserTag dto = new UserTag();
		dto.setU_email(u_email);
		
		UserTagDAO dao = new UserTagDAO();
		
		if(request.getParameter("frontend").equals("Y")) {
			dto.setTag_seq(1);
			dao.userTagSetting(dto);
			System.out.println("frontend 체크");
		}
		if(request.getParameter("backend").equals("Y")) {
			dto.setTag_seq(2);
			dao.userTagSetting(dto);
			System.out.println("backend 체크");
		}
		if(request.getParameter("data_etc").equals("Y")) {
			dto.setTag_seq(3);
			dao.userTagSetting(dto);
			System.out.println("data_etc 체크");
		}
		if(request.getParameter("other_skill").equals("Y")) {
			dto.setTag_seq(99);
			dao.userTagSetting(dto);
			System.out.println("other_skill 체크");
		}
	    
		return "redirect:/goMyPage.do";
	}

}
