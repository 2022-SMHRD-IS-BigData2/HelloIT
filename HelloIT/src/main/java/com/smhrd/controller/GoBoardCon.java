package com.smhrd.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.PostInfoDAO;
import com.smhrd.entity.PostInfo;

public class GoBoardCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException {
		// 게시글 전체 목록 가져오기
		PostInfoDAO dao = new PostInfoDAO();
		List<PostInfo> list = dao.postInfoList();

		System.out.println(list.size());
		
		// 객체바인딩
		// request 영역에 list를 저장해뒀다가, jsp로 이동하고 나서 꺼내기
		request.setAttribute("list", list);

		// 페이지 이동
		return "boardMain";
	}

}
