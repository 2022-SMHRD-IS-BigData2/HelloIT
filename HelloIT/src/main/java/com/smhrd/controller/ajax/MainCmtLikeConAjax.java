package com.smhrd.controller.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.controller.Controller;
import com.smhrd.dao.CommentInfoDAO;
import com.smhrd.dao.LikeInfoDAO;
import com.smhrd.entity.LikeInfo;

public class MainCmtLikeConAjax implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException {

		// 1. 데이터(파라미터) 수집
		response.setContentType("text/html; charset=UTF-8");
		int cmt_seq = Integer.parseInt(request.getParameter("cmt_seq"));
		String u_email = request.getParameter("u_email");
		PrintWriter out = response.getWriter();

		// 2. DTO에 데이터 묶기
		LikeInfo dto = new LikeInfo();
		dto.setU_email(u_email);
		dto.setCmt_seq(cmt_seq);

		// 3. DAO의 commentWrite 사용
		LikeInfoDAO dao = new LikeInfoDAO();
		LikeInfo result = dao.cmtLikeSearch(dto);
		
		CommentInfoDAO dao2 = new CommentInfoDAO();
		
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
		
		int likes = dao2.cmtLikesView(cmt_seq);
		/*
		 * Gson gson = new Gson();
		 * 
		 * // 2. 변환 String json = gson.toJson(list);
		 */
		 		
		out.print(likes);
		return null;
		// 5. 페이지이동
	}

}
