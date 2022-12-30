package com.smhrd.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.RecruitDAO;
import com.smhrd.entity.Recruit;
import com.smhrd.entity.SearchRecruit;

public class GoRecruitSearchCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException {

		String search_word = request.getParameter("search_word");
		
		int n = 1;
		int njob = 1;
		String num = request.getParameter("num");
		String numj = request.getParameter("numj");
		
		if(num!=null) {
			n = Integer.parseInt(num);
		}
		if(numj!=null) {
			njob = Integer.parseInt(numj);
		}
		
		// 사람인
		SearchRecruit dto = new SearchRecruit();
		dto.setN(n);
		dto.setSearch_word(search_word);
		
		RecruitDAO dao = new RecruitDAO();
		List<Recruit> cnt = dao.sSearchListSize(search_word);
		List<Recruit> list  =  dao.sSearchListWithPaging(dto);
		
		String on = "on";
		System.out.println(cnt.get(0));
		System.out.println(on);
		
		request.setAttribute("list", list);
		request.setAttribute("on", on);
		request.setAttribute("cnt", cnt);
		request.setAttribute("num", n);
		
		
		// 잡코리아
		SearchRecruit dto2 = new SearchRecruit();
		dto2.setN(njob);
		dto2.setSearch_word(search_word);
		
		RecruitDAO dao_j = new RecruitDAO(); 
		List<Recruit> cnt_j = dao_j.jSearchListSize(search_word);
		List<Recruit> list_j = dao_j.jSearchListWithPaging(dto2);
		
		request.setAttribute("list_j", list_j);
		request.setAttribute("on", on); 
		request.setAttribute("cnt_j", cnt_j);
		request.setAttribute("numj", njob);
		
		request.setAttribute("search_word", search_word);
		
		return "recruitSearch";
	}

}
