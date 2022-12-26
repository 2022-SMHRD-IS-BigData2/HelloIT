package com.smhrd.controller;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.MyPageInfoDAO;
import com.smhrd.dao.UserRoleInfoDAO;
import com.smhrd.entity.MyPageInfo;
import com.smhrd.entity.UserRoleInfo;

public class UpdateRoleCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException {
		
		request.setCharacterEncoding("UTF-8");
		String u_email = request.getParameter("u_email");
		String[] frontend = request.getParameterValues("frontend");
		String[] backend = request.getParameterValues("backend");
		String[] data_etc = request.getParameterValues("data_etc");
		String[] other_skill = request.getParameterValues("other_skill");
		System.out.println(frontend[0]);
		System.out.println(backend[0]);
		System.out.println(data_etc[0]);
		System.out.println(other_skill[0]);
	    UserRoleInfo dto = new UserRoleInfo();
	    dto.setU_email(u_email);
	    dto.setFrontend(frontend[0]);;
	    dto.setBackend(backend[0]);
	    dto.setData_etc(data_etc[0]);
	    dto.setOther_skill(other_skill[0]);
	    UserRoleInfoDAO dao = new UserRoleInfoDAO();
	    int cnt = dao.updateRole(dto);
	    String nextPage = "";
		if (cnt > 0) {
			// 성공
			System.out.println("회원 역할 수정 성공");
			// 메인페이지로
			// 이미 이동하는 컨트롤러가 있는경우, 컨트롤러로 이동시키자.
			// redirect를 하 는경우, 앞에 redirect:/ 를 붙이기로 약속
			nextPage = "redirect:/goMyPage.do";

		} else {
			// 실패
			System.out.println("회원 역할 수정 실패");
			nextPage = "redirect:/goMyPage.do";
		}
		return nextPage;
	}

}
