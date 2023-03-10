package com.smhrd.controller;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.LikeInfoDAO;
import com.smhrd.entity.LikeInfo;

public class MainCmtLikeCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException {

		// 1. 데이터(파라미터) 수집
		int cmt_seq = Integer.parseInt(request.getParameter("cmt_seq"));
		String u_email = request.getParameter("u_email");
		String req_page = request.getParameter("req_page");
		String page_email = request.getParameter("page_email");


		// 2. DTO에 데이터 묶기
		LikeInfo dto = new LikeInfo();
		dto.setU_email(u_email);
		dto.setCmt_seq(cmt_seq);

		// 3. DAO의 commentWrite 사용
		LikeInfoDAO dao = new LikeInfoDAO();
		LikeInfo result = dao.cmtLikeSearch(dto);
		
		int cnt = 0;
		if(result == null) {
			cnt = dao.cmtLikeInfoInsert(dto);
		}else if(result != null){
			cnt = dao.cmtLikeInfoDelete(dto);
		}
		dao.cmtLikesUpdate(cmt_seq);

		// 4. 성공 여부에 따라 페이지 이동
		if (cnt > 0) {
			System.out.println("like/unlike 성공");
		} else {
			System.out.println("like/unlike 실패");
		}
		// 5. 페이지이동
		String nextPage = "goMain.do?u_email="+u_email;
		
		if(req_page == null) {
			nextPage = "goMain.do?u_email="+u_email;
		}else if(req_page.equals("popPostMain")) {
			nextPage = "goPopPostMain.do";
		}else if(req_page.equals("myPage")) {
			nextPage = "goMyPage.do?u_email="+u_email;
		}else if(req_page.equals("userPage")) {
			nextPage = "goUserPage.do?u_email="+page_email;
		}else if(req_page.equals("idea")) {
			nextPage = "goIdea.do";
		}
		
		// 5. 페이지이동
		return "redirect:/" + nextPage;
	}

}
