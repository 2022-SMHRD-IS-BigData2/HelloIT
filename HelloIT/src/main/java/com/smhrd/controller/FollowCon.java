package com.smhrd.controller;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.FollowingInfoDAO;
import com.smhrd.entity.FollowingInfo;

public class FollowCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException {

		// 1. 데이터(파라미터) 수집
		String u_email = request.getParameter("u_email");
		String follower_email = request.getParameter("follower_email");
		
		System.out.println("u_email" + u_email);
		System.out.println("follower_email" + follower_email);
		
		// 2. DTO에 데이터 묶기
		FollowingInfo dto = new FollowingInfo();
		dto.setU_email(u_email);
		dto.setFollower_email(follower_email);

		// 3. DAO의 commentWrite 사용
		FollowingInfoDAO dao = new FollowingInfoDAO();
		FollowingInfo result = dao.followSearch(dto);

		int cnt = 0;
		if (result == null) {
			cnt = dao.insertFollowing(dto);
		} else if (result != null) {
			cnt = dao.deleteFollowing(dto);
		}

		// 4. 성공 여부에 따라 페이지 이동
		if (cnt > 0) {
			System.out.println("팔로우/언팔로우 성공");
		} else {
			System.out.println("팔로우/언팔로우 실패");
		}
		
		// 5. 페이지이동
		return "redirect:/goUserPage.do?u_email=" + u_email;

	}

}
