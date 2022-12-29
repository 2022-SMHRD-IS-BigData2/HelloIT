package com.smhrd.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.dao.FollowingInfoDAO;
import com.smhrd.dao.PostInfoDAO;
import com.smhrd.dao.UserPageDAO;
import com.smhrd.entity.PostInfo;
import com.smhrd.entity.UserInfo;

public class GoUserPageCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException {
		
		
			String u_email = request.getParameter("u_email");
			UserPageDAO dao = new UserPageDAO();
			UserInfo info = dao.goUserPage(u_email);
			System.out.println(u_email);
			
			PostInfoDAO dao2 = new PostInfoDAO();
			List<PostInfo> list = dao2.postInfoList();
			List<PostInfo> upList = dao2.userPostInfoList(u_email);
			List<PostInfo> bmList = dao2.bookmarkPostInfoList(u_email);
			
			request.setAttribute("list", list);
			request.setAttribute("upList", upList);
			request.setAttribute("bmList", bmList);	
			
			FollowingInfoDAO dao3 = new FollowingInfoDAO();
			int followerCnt = dao3.cntFollower(u_email);
			String follower_email = u_email;
			int followingCnt = dao3.cntFollowing(follower_email);
			List<UserInfo> follower = dao3.viewFollower(u_email);
			List<UserInfo> following = dao3.viewFollowing(u_email);
			
			request.setAttribute("followingCnt", followingCnt);
			request.setAttribute("followerCnt", followerCnt);
			request.setAttribute("following", following);
			request.setAttribute("follower", follower);
			
			if(info != null) {
				System.out.println("페이지이동 성공");
				
				HttpSession session = request.getSession();
				session.setAttribute("pageInfo", info);
				return "userPage";
			} else {
				System.out.println("페이지이동 실패");
				return "loginfail";
			}
			
			
	}

}
