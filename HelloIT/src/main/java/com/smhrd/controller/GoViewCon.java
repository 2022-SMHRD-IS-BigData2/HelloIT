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
		List<CommentInfo> list = daoC.commentInfoList(post_seq);
		
		// 객체바인딩
		request.setAttribute("PostInfo", PostInfo);
		request.setAttribute("postlikes", postlikes);
		request.setAttribute("list", list);
		
		// BookmarkInfo
//		BookmarkInfoDAO dao3 = new BookmarkInfoDAO();
//		int bookmarklikes = dao3.bookmarkLikesView(post_seq);
		
		// 객체바인딩
		// request 영역에 list를 저장해뒀다가, jsp로 이동하고 나서 꺼내기
//		request.setAttribute("cmtlikes", cmtlikes);
//		request.setAttribute("bookmarklikes", bookmarklikes);
		return "viewPostInfo";
		
	}
}
