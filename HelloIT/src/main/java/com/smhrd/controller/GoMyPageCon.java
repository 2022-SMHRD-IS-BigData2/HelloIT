package com.smhrd.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.PostInfoDAO;
import com.smhrd.entity.PostInfo;

public class GoMyPageCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException {
		String u_email = request.getParameter("u_email");
		int n = 1;
		request.setCharacterEncoding("UTF-8");
		String num = request.getParameter("num");
//		NumberDTO dto = new NumberDTO();
		if (num != null) {
			n = Integer.parseInt(num);
		}
		PostInfoDAO dao = new PostInfoDAO();
		List<PostInfo> list = dao.postInfoList();
		List<PostInfo> upList = dao.userPostInfoList(u_email);
		List<PostInfo> bmList = dao.bookmarkPostInfoList(u_email);
//		List<PostInfo> miList = dao.paging(n);
//		List<PostInfo> cnt = dao.pageCnt();
		request.setAttribute("list", list);
		request.setAttribute("upList", upList);
		request.setAttribute("bmList", bmList);
//		request.setAttribute("miList", miList);
//		request.setAttribute("cnt", cnt);

		return "myPage";
	}

}
