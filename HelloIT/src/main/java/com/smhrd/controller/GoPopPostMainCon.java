package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.dao.PostInfoDAO;
import com.smhrd.entity.PostInfo;
import com.smhrd.entity.Tag;
import com.smhrd.entity.UserInfo;

public class GoPopPostMainCon implements Controller {
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		PostInfoDAO dao = new PostInfoDAO();
		List<PostInfo> ppList = dao.popPostInfoList();
		
		request.setAttribute("ppList", ppList);
		
		String nextPage = "popPostMain";
			
		return nextPage;
	}
	
}
