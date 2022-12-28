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
			UserInfo info = dao.goUserPage(u_email);
			System.out.println(u_email);
			
			PostInfoDAO dao2 = new PostInfoDAO();
			List<PostInfo> list = dao2.postInfoList();
			List<PostInfo> upList = dao2.userPostInfoList(u_email);
			List<PostInfo> bmList = dao2.bookmarkPostInfoList(u_email);
			
			request.setAttribute("list", list);
			request.setAttribute("upList", upList);
			request.setAttribute("bmList", bmList);	
			
			if(info != null) {
				System.out.println("페이지이동 성공");
				
				HttpSession session = request.getSession();
				session.setAttribute("info", info);
				return "userPage";
			} else {
				System.out.println("페이지이동 실패");
				return "loginfail";
			}
			
			
	}

}
