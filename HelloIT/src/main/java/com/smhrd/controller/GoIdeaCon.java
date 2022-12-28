package com.smhrd.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.IdeaDAO;
import com.smhrd.entity.PostInfo;

public class GoIdeaCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException {
			////////////////////////////////////////////////////////////////////////////////////
			// 게시글 전체 목록 가져오기
			IdeaDAO dao = new IdeaDAO();
			int n = 1;
			request.setCharacterEncoding("UTF-8");
			String num = request.getParameter("num");
			if(num!=null) {
				n = Integer.parseInt(num);
			}
			List<PostInfo> list = dao.paging(n);
			List<PostInfo> cnt = dao.pageCnt();
			String on = "on";
			System.out.println(n);
			System.out.println(num);
			System.out.println(cnt.get(0));
			System.out.println(cnt);
			System.out.println(on);
			request.setAttribute("list", list);
			request.setAttribute("on", on);
			request.setAttribute("cnt", cnt);
			request.setAttribute("num", n);
			// 객체바인딩
			// request 영역에 list를 저장해뒀다가, jsp로 이동하고 나서 꺼내기
			request.setAttribute("list", list);
			////////////////////////////////////////////////////////////////////////////////////
			// main.jsp로 
			String nextPage = "idea";
			// URL요청이 불가능 하기 때문에
			// JSP파일로 이동시 반드시 forward이동을 해야한다.
			
			// 다음페이지가 어디인가를 리턴
			return nextPage;
	}

}
