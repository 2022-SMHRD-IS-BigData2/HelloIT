package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.BookmarkInfoDAO;
import com.smhrd.dao.LikeInfoDAO;
import com.smhrd.dao.PostInfoDAO;
import com.smhrd.entity.BookmarkInfo;
import com.smhrd.entity.LikeInfo;

public class MainBookmarkConAjax implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException {

		// 1. 데이터(파라미터) 수집
		response.setContentType("text/html; charset=UTF-8");
		int post_seq = Integer.parseInt(request.getParameter("post_seq"));
		String u_email = request.getParameter("u_email");
		PrintWriter out = response.getWriter();
		// 2. DTO에 데이터 묶기
		BookmarkInfo dto = new BookmarkInfo();
		dto.setU_email(u_email);
		dto.setPost_seq(post_seq);


		// 3. DAO의 commentWrite 사용
		BookmarkInfoDAO dao = new BookmarkInfoDAO();
		BookmarkInfo result = dao.bookmarkSearch(dto);
		System.out.println(result);
		
		PostInfoDAO dao2 = new PostInfoDAO();
		// 4. 성공 여부에 따라 페이지 이동
		int cnt = 0;
		if(result == null) {
			cnt = dao.bookmarkInfoInsert(dto);
		}else if(result != null){
			cnt = dao.bookmarkInfoDelete(dto);
		}
		dao.bookmarksUpdate(post_seq);

		// 4. 성공 여부에 따라 페이지 이동
		if (cnt > 0) {
			System.out.println("북마크 성공");
		} else {
			System.out.println("북마크 실패");
		}
		
		int likes =  dao2.bookmarksView(post_seq);
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
