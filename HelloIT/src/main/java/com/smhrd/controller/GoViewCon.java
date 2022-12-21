package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.CommentInfoDAO;
import com.smhrd.dao.PostInfoDAO;
import com.smhrd.entity.CommentInfo;
import com.smhrd.entity.PostInfo;

public class GoViewCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 데이터 수집
		int post_seq = Integer.parseInt(request.getParameter("post_seq"));
		

		// DAO 의 PostInfoView 사용
		PostInfoDAO dao = new PostInfoDAO();
		PostInfo PostInfo = dao.postInfoView(post_seq);

		// 객체바인딩
		request.setAttribute("PostInfo", PostInfo);

		
		// 댓글 목록 가져오기
		CommentInfoDAO dao2 = new CommentInfoDAO();
		List<CommentInfo> list = dao2.commentInfoList();

		// 객체바인딩
		// request 영역에 list를 저장해뒀다가, jsp로 이동하고 나서 꺼내기
		request.setAttribute("list", list);
		return "viewPostInfo";
	}

}
