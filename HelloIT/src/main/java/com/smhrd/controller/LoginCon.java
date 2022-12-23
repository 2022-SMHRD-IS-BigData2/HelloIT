package com.smhrd.controller;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.dao.UserInfoDAO;
import com.smhrd.entity.UserInfo;

public class LoginCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException {
		
		request.setCharacterEncoding("UTF-8");
		String u_email = request.getParameter("u_email");
		String u_pw = request.getParameter("u_pw");
		
		UserInfo dto = new UserInfo();
		dto.setU_email(u_email);
		dto.setU_pw(u_pw);
		
		UserInfoDAO dao = new UserInfoDAO();
		UserInfo result = dao.login(dto);
		if(result != null) {
			System.out.println("로그인 성공");
			
			HttpSession session = request.getSession();
			session.setAttribute("info", result);
			return "redirect:/goMain.do";
		} else {
			System.out.println("로그인 실패");
			return "loginfail";
		}
		
	}

}
