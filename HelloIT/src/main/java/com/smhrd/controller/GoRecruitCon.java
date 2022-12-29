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
		int njob = 1;
		request.setCharacterEncoding("UTF-8");
		String num = request.getParameter("num");
		String numj = request.getParameter("numj");
//		NumberDTO dto = new NumberDTO();
		if(num!=null) {
			n = Integer.parseInt(num);
		}
		if(numj!=null) {
			njob = Integer.parseInt(numj);
		}
//		dto.setN(n);
		// 사람인
		RecruitDAO dao = new RecruitDAO();
		List<Recruit> cnt = dao.pageCnt();
		List<Recruit> list  =  dao.paging(n);
		String on = "on";
		System.out.println(cnt.get(0));
		System.out.println(on);
		request.setAttribute("list", list);
		request.setAttribute("on", on);
		request.setAttribute("cnt", cnt);
		request.setAttribute("num", n);
		
		// 잡코리아
		
		RecruitDAO dao_j = new RecruitDAO(); 
		List<Recruit> cnt_j = dao_j.pageCnt_j();
		List<Recruit> list_j = dao_j.paging_j(njob);
		
		System.out.println(n); System.out.println(num);
		System.out.println(cnt.get(0)); System.out.println(cnt);
		System.out.println(on); request.setAttribute("list_j", list_j);
		request.setAttribute("on", on); request.setAttribute("cnt_j", cnt_j);
		request.setAttribute("numj", njob);
		
		
		return "recruit";
	}

}
