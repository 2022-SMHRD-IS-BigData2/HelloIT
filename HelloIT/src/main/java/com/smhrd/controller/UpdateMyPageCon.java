package com.smhrd.controller;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.MyPageInfoDAO;
import com.smhrd.entity.MyPageInfo;

public class UpdateMyPageCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException {
		
		request.setCharacterEncoding("UTF-8");
		String u_email = request.getParameter("u_email");
	    String u_introduction = request.getParameter("u_introduction");
	    String u_idea  = request.getParameter("u_idea");
	    String u_interest = request.getParameter("u_interest");
	    
	    MyPageInfo dto = new MyPageInfo();
	    dto.setU_email(u_email);
	    dto.setU_introduction(u_introduction);;
	    dto.setU_idea(u_idea);
	    dto.setU_interest(u_interest);
	    MyPageInfoDAO dao = new MyPageInfoDAO();
	    int cnt = dao.updateMyPage(dto);
	    String nextPage = "";
		if (cnt > 0) {
			// 성공
			System.out.println("마이페이지 수정 성공");
			// 메인페이지로
			// 이미 이동하는 컨트롤러가 있는경우, 컨트롤러로 이동시키자.
			// redirect를 하 는경우, 앞에 redirect:/ 를 붙이기로 약속
			nextPage = "redirect:/goMyPage.do";

		} else {
			// 실패
			System.out.println("마이페이지 수정 실패");
			nextPage = "redirect:/goMyPage.do";
		}
		return nextPage;
	}

}
