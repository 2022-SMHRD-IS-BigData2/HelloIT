package com.smhrd.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.PostInfoDAO;
import com.smhrd.entity.PostInfo;

public class GoMyPageCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException {
		String u_email = request.getParameter("u_email");
		PostInfoDAO dao = new PostInfoDAO();
		List<PostInfo> list = dao.postInfoList();
		List<PostInfo> upList = dao.userPostInfoList(u_email);
		List<PostInfo> bmList = dao.bookmarkPostInfoList(u_email);
		
		request.setAttribute("list", list);
		request.setAttribute("upList", upList);
		request.setAttribute("bmList", bmList);
			
		return "myPage";
	}

}
