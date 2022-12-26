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

		request.setCharacterEncoding("UTF-8");
		
		// 데이터 수집
		int post_seq = Integer.parseInt(request.getParameter("post_seq"));
		System.out.println(post_seq);
		
		// DAO
		PostInfoDAO dao = new PostInfoDAO();
		CommentInfoDAO daoC = new CommentInfoDAO();
		
		PostInfo PostInfo = dao.postInfoView(post_seq);
		int postlikes = dao.postLikesView(post_seq);
		int bookmarks = dao.bookmarksView(post_seq);
		int cmts = dao.cmtCnt(post_seq);
		List<CommentInfo> list = daoC.commentInfoList(post_seq);
		
		// 객체바인딩
		request.setAttribute("PostInfo", PostInfo);
		request.setAttribute("postlikes", postlikes);
		request.setAttribute("bookmarks", bookmarks);
		request.setAttribute("cmts", cmts);
		request.setAttribute("list", list);
		
		return "viewPostInfo";
		
	}
}
