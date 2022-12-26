package com.smhrd.controller;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.MyPageInfoDAO;
import com.smhrd.dao.UserDBInfoDAO;
import com.smhrd.dao.UserSkillInfoDAO;
import com.smhrd.entity.MyPageInfo;
import com.smhrd.entity.UserDBInfo;
import com.smhrd.entity.UserSkillInfo;

public class UpdateSkillCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException {
		
		request.setCharacterEncoding("UTF-8");
		String u_email = request.getParameter("u_email");
		String[] web = request.getParameterValues("web");
		String[] ios = request.getParameterValues("ios");
		String[] android = request.getParameterValues("android");
		String[] windows = request.getParameterValues("windows");
		String[] mac = request.getParameterValues("mac");
		String[] linux = request.getParameterValues("linux");
		String[] game = request.getParameterValues("game");
		String[] skill_etc = request.getParameterValues("skill_etc");
		/*
		 * web       
		 */
	    UserSkillInfo dto = new UserSkillInfo();
	    dto.setU_email(u_email);
	    dto.setWeb(web[0]);
	    dto.setIos(ios[0]);
	    dto.setAndroid(android[0]);
	    dto.setWindows(windows[0]);
	    dto.setMac(mac[0]);
	    dto.setLinux(linux[0]);
	    dto.setGame(game[0]);
	    dto.setEtc(skill_etc[0]);
	    UserSkillInfoDAO dao = new UserSkillInfoDAO();
	    int cnt = dao.updateSkill(dto);
	    String nextPage = "";
		if (cnt > 0) {
			// 성공
			System.out.println("회원 스킬 수정 성공");
			// 메인페이지로
			// 이미 이동하는 컨트롤러가 있는경우, 컨트롤러로 이동시키자.
			// redirect를 하 는경우, 앞에 redirect:/ 를 붙이기로 약속
			nextPage = "redirect:/goMyPage.do";

		} else {
			// 실패
			System.out.println("회원 스킬 수정 실패");
			nextPage = "redirect:/goMyPage.do";
		}
		return nextPage;
	}

}
