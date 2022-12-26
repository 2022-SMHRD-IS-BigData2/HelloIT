package com.smhrd.controller;

import java.io.IOException;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.dao.UserInfoDAO;
import com.smhrd.entity.UserInfo;

public class KakaoJoinCon implements Controller {
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException{
		request.setCharacterEncoding("UTF-8");

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		// 1. 데이터(파라미터) 수집
		String u_email = request.getParameter("u_email");
		String u_pw = request.getParameter("u_pw");
		String u_name = request.getParameter("u_name");
		String u_nick = request.getParameter("u_nick");
		Date _u_birthdate = (Date) formatter.parse(request.getParameter("u_birthdate"));
		java.sql.Date u_birthdate = new java.sql.Date(_u_birthdate.getTime()); 
		String u_job = request.getParameter("u_job");
		String u_gender = request.getParameter("u_gender");
//		String u_level = request.getParameter("u_level");
//		int u_activity_score = Integer.parseInt(request.getParameter("u_activity_score"));
//		String u_type = request.getParameter("u_type");
//		Date u_joindate = (Date) formatter.parse(request.getParameter("u_joindate"));

		// 생년월일    private Date u_birthdate;
	    // 활동점수    private Double u_activity_score;
	    // 회원 유형 일반회원:'U', 관리자:'A'    private String u_type;
	    // 회원 가입일자     private Date u_joindate;

		// 2. DTO에 데이터 묶기
		UserInfo dto = new UserInfo();
		dto.setU_email(u_email);
		dto.setU_pw(u_pw);
		dto.setU_name(u_name);
		dto.setU_nick(u_nick);
		dto.setU_birthdate(u_birthdate);
		dto.setU_job(u_job);
		dto.setU_gender(u_gender);
		// 3. 받아온 데이터를 DB에 저장 (DAO의 join 메소드 사용
		UserInfoDAO dao = new UserInfoDAO();
		UserInfo result = dao.compareId(dto);
		String nextPage = "";
		if(result==null) {
			int cnt = dao.join(dto);			

		// ========================================

		// 4. 회원가입 성공여부에 따라서
		// 성공 --> Main.jsp
		// 실패 --> join.jsp
		if (cnt > 0) {
			// 성공
			System.out.println("회원가입 성공");
			// 메인페이지로
			// 이미 이동하는 컨트롤러가 있는경우, 컨트롤러로 이동시키자.
			// redirect를 하 는경우, 앞에 redirect:/ 를 붙이기로 약속
			HttpSession session = request.getSession();
			session.setAttribute("info", result);
			nextPage = "redirect:/goMain.do";

		} else {
			// 실패
			System.out.println("회원가입 실패");
			nextPage = "redirect:/goMain.do";
		}

		// 5. 다음페이지로 이동
		// Controller --> Controller
		}else {
			System.out.println("이미 가입된 회원");
			HttpSession session = request.getSession();
			session.setAttribute("info", result);
			nextPage = "redirect:/goMain.do";
		}

		return nextPage;
		
	}
	
}
