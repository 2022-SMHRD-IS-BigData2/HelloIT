package com.smhrd.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.dao.PostInfoDAO;
import com.smhrd.dao.UserPageDAO;
import com.smhrd.entity.PostInfo;
import com.smhrd.entity.UserInfo;

public class GoUserPageCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException {
		
			String u_email = request.getParameter("u_email");
			UserPageDAO dao = new UserPageDAO();
			List<UserInfo> info = dao.goUserPage(u_email);
			System.out.println(u_email);
			if(info != null) {
				System.out.println("페이지이동 성공");
				
				HttpSession session = request.getSession();
				session.setAttribute("info", info);
				return "redirect:/goUserPage.do";
			} else {
				System.out.println("페이지이동 실패");
				return "loginfail";
			}
			
			
	}

}
