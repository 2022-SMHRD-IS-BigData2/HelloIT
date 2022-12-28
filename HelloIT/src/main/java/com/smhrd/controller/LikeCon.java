package com.smhrd.controller;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.LikeInfoDAO;
import com.smhrd.entity.LikeInfo;

public class LikeCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException {

		// 1. 데이터(파라미터) 수집
		int post_seq = Integer.parseInt(request.getParameter("post_seq"));
		String u_email = request.getParameter("u_email");

		// 2. DTO에 데이터 묶기
		LikeInfo dto = new LikeInfo();
		dto.setU_email(u_email);
		dto.setPost_seq(post_seq);

		// 3. DAO의 commentWrite 사용
		LikeInfoDAO dao = new LikeInfoDAO();
		LikeInfo result = dao.likeSearch(dto);
		
		int cnt = 0;
		if(result == null) {
			cnt = dao.likeInfoInsert(dto);
		}else if(result != null){
			cnt = dao.likeInfoDelete(dto);
		}
		dao.likesUpdate(post_seq);

		// 4. 성공 여부에 따라 페이지 이동
		if (cnt > 0) {
			System.out.println("like/unlike 성공");
		} else {
			System.out.println("like/unlike 실패");
		}
		// 5. 페이지이동
		return "redirect:/goView.do?post_seq="+post_seq;
	}

}
