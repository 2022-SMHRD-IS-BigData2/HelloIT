package com.smhrd.controller;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.UserLevelSettingDAO;
import com.smhrd.entity.UserLevel;

public class UserLevelSettingCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException {
		
		String u_email = request.getParameter("u_email");
		String frontend_level = request.getParameter("frontend_level");
		String backend_level = request.getParameter("backend_level");
		String data_level = request.getParameter("data_level");
		String etc_level = request.getParameter("etc_level");
		
		UserLevelSettingDAO dao = new UserLevelSettingDAO();
		
		UserLevel dto = new UserLevel();
		dto.setU_email(u_email);
		dto.setTag_seq(1);
		dto.setTag_level(frontend_level);
		int cnt1 = dao.userLevelSetting(dto);
		dto.setTag_seq(2);
		dto.setTag_level(backend_level);
		int cnt2 = dao.userLevelSetting(dto);
		dto.setTag_seq(3);
		dto.setTag_level(data_level);
		int cnt3 = dao.userLevelSetting(dto);
		dto.setTag_seq(99);
		dto.setTag_level(etc_level);
		int cnt4 = dao.userLevelSetting(dto);
		int cnt = cnt1+cnt2+cnt3+cnt4;
		
		if (cnt == 4) {
			System.out.println("회원 레벨 설정 성공");

		} else {
			System.out.println("회원 레벨 설정 실패");
		}
		return "redirect:/goMyPage.do?u_email="+u_email;
	}

}
