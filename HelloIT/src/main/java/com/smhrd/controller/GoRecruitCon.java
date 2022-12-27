package com.smhrd.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.RecruitDAO;
import com.smhrd.entity.Recruit;

public class GoRecruitCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException {

		int n = 1;
		request.setCharacterEncoding("UTF-8");
		String num = request.getParameter("num");
//		NumberDTO dto = new NumberDTO();
		if(num!=null) {
			n = Integer.parseInt(num);
		}
		System.out.println(num);
		System.out.println(n);
//		dto.setN(n);
		RecruitDAO dao = new RecruitDAO();
		List<Recruit> cnt = dao.pageCnt();
		List<Recruit> list  =  dao.paging(n);
		System.out.println(cnt.get(0));
		System.out.println(cnt);
		request.setAttribute("list", list);
		request.setAttribute("cnt", cnt);
		
		return "recruit";
	}

}
