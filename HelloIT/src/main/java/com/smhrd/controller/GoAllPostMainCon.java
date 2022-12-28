package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.PostInfoDAO;
import com.smhrd.entity.PostInfo;
import com.smhrd.entity.Tag;

public class GoAllPostMainCon implements Controller {
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		PostInfoDAO dao = new PostInfoDAO();
		List<PostInfo> list = dao.postInfoList();
		request.setAttribute("list", list);
		// main.jsp로 이동
		String nextPage = "allPostMain";
		// URL요청이 불가능 하기 때문에
		// JSP파일로 이동시 반드시 forward이동을 해야한다.
			
		// 다음페이지가 어디인가를 리턴
		return nextPage;
	}
	
}
