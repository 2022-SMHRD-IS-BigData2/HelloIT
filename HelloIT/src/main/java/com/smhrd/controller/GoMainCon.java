package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.PostInfoDAO;
import com.smhrd.entity.PostInfo;
import com.smhrd.entity.SearchUemail;

public class GoMainCon implements Controller {
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		
		String u_email = request.getParameter("u_email");
		
		PostInfoDAO dao = new PostInfoDAO();
		List<PostInfo> list = dao.postInfoList();
		List<PostInfo> ctpList = dao.customizedPostInfoList(u_email);
		
		System.out.println(ctpList);
		
		if(ctpList.size()==0) {
			request.setAttribute("list", list);
			return "allPostMain";
		}else {
			request.setAttribute("ctpList", ctpList);
			return "main";
		}
		
		
		
	}
	
}