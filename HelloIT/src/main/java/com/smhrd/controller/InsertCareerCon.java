package com.smhrd.controller;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.CareerInfoDAO;
import com.smhrd.entity.CareerInfo;

public class InsertCareerCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException {
		
		request.setCharacterEncoding("UTF-8");
		Double career_seq = Double.parseDouble(request.getParameter("career_seq"));
		String career_period = request.getParameter("career_period");
		String career_content = request.getParameter("career_content");
		String u_email = request.getParameter("u_email");
		
		CareerInfo dto = new CareerInfo();
		dto.setCareer_content(career_content);
		dto.setCareer_period(career_period);
		dto.setU_email(u_email);
		dto.setCareer_seq(career_seq);
		
		CareerInfoDAO dao = new CareerInfoDAO();
		int cnt = dao.insertMyCareer(dto);
		
		String nextPage = "";
		if (cnt > 0) {
			// 성공
			System.out.println("회원 커리어 작성 성공");
			// 메인페이지로
			// 이미 이동하는 컨트롤러가 있는경우, 컨트롤러로 이동시키자.
			// redirect를 하 는경우, 앞에 redirect:/ 를 붙이기로 약속
			nextPage = "redirect:/goMyPage.do";

		} else {
			// 실패
			System.out.println("회원 커리어 작성 실패");
			nextPage = "redirect:/goMyPage.do";
		}
		return nextPage;
		
	}

}
