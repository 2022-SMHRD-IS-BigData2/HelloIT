package com.smhrd.controller;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.CommentInfoDAO;
import com.smhrd.entity.CommentInfo;

public class CommentCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException {
		
		request.setCharacterEncoding("UTF-8");
		
		// 1. 데이터(파라미터) 수집
		int post_seq = Integer.parseInt(request.getParameter("post_seq"));
		String u_email = request.getParameter("u_email");
		String cmt_content = request.getParameter("cmt_content");

		System.out.println(post_seq + u_email + cmt_content);
		
		// 2. DTO에 데이터 묶기
		CommentInfo dto = new CommentInfo();
		dto.setPost_seq(post_seq);
		dto.setU_email(u_email);
		dto.setCmt_content(cmt_content);

		// 3. DAO의 commentWrite 사용
		CommentInfoDAO dao = new CommentInfoDAO();
		int cnt = dao.commentInfoWrite(dto);
		dao.cmtCntUpdate(post_seq);

		// 4. 성공 여부에 따라 페이지 이동
		if (cnt > 0) {
			System.out.println("댓글 작성 성공");
		} else {
			System.out.println("댓글 작성 실패");
		}
		// 5. 페이지이동
		return "redirect:/goView.do?post_seq="+post_seq;
	}

}
