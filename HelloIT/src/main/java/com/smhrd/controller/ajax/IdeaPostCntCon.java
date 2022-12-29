package com.smhrd.controller.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.controller.Controller;
import com.smhrd.dao.IdeaDAO;
import com.smhrd.entity.PostInfo;

public class IdeaPostCntCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException {
		// 1. 데이터(파라미터) 수집
		response.setContentType("text/html; charset=UTF-8");
		int post_seq = Integer.parseInt(request.getParameter("post_seq"));
		PrintWriter out = response.getWriter();
		// 2. DTO에 데이터 묶기
		PostInfo dto = new PostInfo();
		dto.setPost_seq(post_seq);

		// 3. DAO의 updateCnt
		IdeaDAO dao = new IdeaDAO();
		int result = dao.updateCnt(dto);
		
		System.out.println(result);
		
		// 4. 성공 여부에 따라 페이지 이동
		if (result > 0) {
			System.out.println("조회수 업데이트 성공");
		} else {
			System.out.println("조회수 업데이트 실패");
		}
		
		out.print(result);
		return null;
		// 5. 페이지이동
	}

}
