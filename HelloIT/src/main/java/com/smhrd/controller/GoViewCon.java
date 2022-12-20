package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.PostInfoDAO;
import com.smhrd.entity.PostInfo;

public class GoViewCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 데이터 수집
		int num = Integer.parseInt(request.getParameter("num"));
		
		// DAO 의 PostInfoView 사용
		PostInfoDAO dao = new PostInfoDAO();
		PostInfo PostInfo = dao.postInfoView(num);
		
		// 객체바인딩
		request.setAttribute("PostInfo", PostInfo);
		return "viewPostInfo";
	}

}
