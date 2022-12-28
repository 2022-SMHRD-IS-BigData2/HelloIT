package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.dao.PostInfoDAO;
import com.smhrd.entity.PostInfo;
import com.smhrd.entity.UserInfo;

public class GoCustomizedMainCon implements Controller {
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
////////////////////////////////////////////////////////////////////////////////////
		// 게시글 전체 목록 가져오기
		HttpSession session = request.getSession();
		UserInfo info = (UserInfo) session.getAttribute("info");
		String u_email = info.getU_email();
		
		PostInfoDAO dao = new PostInfoDAO();
		List<PostInfo> ctpList = dao.customizedPostInfoList(u_email);
		
		// 객체바인딩
		// request 영역에 list를 저장해뒀다가, jsp로 이동하고 나서 꺼내기
		request.setAttribute("ctpList", ctpList);
////////////////////////////////////////////////////////////////////////////////////		
		// main.jsp로 이동
		String nextPage = "customizedMain";
		// URL요청이 불가능 하기 때문에
		// JSP파일로 이동시 반드시 forward이동을 해야한다.
			
		// 다음페이지가 어디인가를 리턴
		return nextPage;
	}
	
}
