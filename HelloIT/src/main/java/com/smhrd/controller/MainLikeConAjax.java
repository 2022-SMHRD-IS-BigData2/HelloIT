package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.dao.LikeInfoDAO;
import com.smhrd.dao.PostInfoDAO;
import com.smhrd.entity.LikeInfo;
import com.smhrd.entity.PostInfo;

public class MainLikeConAjax implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException {

		// 1. 데이터(파라미터) 수집
		response.setContentType("text/html; charset=UTF-8");
		int post_seq = Integer.parseInt(request.getParameter("post_seq"));
		String u_email = request.getParameter("u_email");
		PrintWriter out = response.getWriter();
		// 2. DTO에 데이터 묶기
		LikeInfo dto = new LikeInfo();
		dto.setU_email(u_email);
		dto.setPost_seq(post_seq);

		// 3. DAO의 commentWrite 사용
		LikeInfoDAO dao = new LikeInfoDAO();
		LikeInfo result = dao.likeSearch(dto);
		System.out.println(result);
		
		PostInfoDAO dao2 = new PostInfoDAO();
		// 4. 성공 여부에 따라 페이지 이동
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
		System.out.println(dto.getLike_seq());
		
		int likes =  dao2.postLikesView(post_seq);
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
