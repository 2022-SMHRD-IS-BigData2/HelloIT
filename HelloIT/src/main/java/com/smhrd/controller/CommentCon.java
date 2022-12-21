package com.smhrd.controller;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.dao.CommentInfoDAO;
import com.smhrd.dao.PostInfoDAO;
import com.smhrd.entity.CommentInfo;
import com.smhrd.entity.PostInfo;

public class CommentCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException {
		
		// 1. 데이터(파라미터) 수집
		String u_email = request.getParameter("u_email");
		String cmt_content = request.getParameter("cmt_content");

		// 2. DTO에 데이터 묶기
		CommentInfo dto = new CommentInfo();
		dto.setU_email(u_email);
		dto.setCmt_content(cmt_content);

		// 3. DAO의 commentWrite 사용
		CommentInfoDAO dao = new CommentInfoDAO();
		int cnt = dao.commentInfoWrite(dto);

		// 4. 성공 여부에 따라 페이지 이동
		if (cnt > 0) {
			System.out.println("댓글 작성 성공");
		} else {
			System.out.println("댓글 작성 실패");
			return "redirect:/comment.do";
		}
		// 5. 페이지이동
		return "redirect:/goBoard.do";
	}

}
