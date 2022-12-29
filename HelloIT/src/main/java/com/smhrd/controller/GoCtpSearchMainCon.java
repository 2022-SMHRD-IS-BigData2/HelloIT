package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.PostInfoDAO;
import com.smhrd.entity.PostInfo;
import com.smhrd.entity.SearchUemail;

public class GoCtpSearchMainCon implements Controller {
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		
		String u_email = request.getParameter("u_email");
		String search_word = request.getParameter("search_word");
		
		SearchUemail dto = new SearchUemail();
		dto.setU_email(u_email);
		dto.setSearch_word(search_word);
		
		PostInfoDAO dao = new PostInfoDAO();
		/* List<PostInfo> list = dao.postInfoList(); */
		List<PostInfo> ctpSearchList = dao.ctpSearch(dto);
		
		request.setAttribute("ctpSearchList", ctpSearchList);
		request.setAttribute("search_word", search_word);
		
		return "ctpSearchMain";
	}
	
}