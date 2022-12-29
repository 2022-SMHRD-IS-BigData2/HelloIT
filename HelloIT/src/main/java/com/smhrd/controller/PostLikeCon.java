package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.dao.PostInfoDAO;
import com.smhrd.entity.PostInfo;

public class PostLikeCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException {
		
		System.out.println("요청받음");
		int post_seq = Integer.parseInt(request.getParameter("post_seq"));
		System.out.println(post_seq);
		
		// ajax에 응답해줄 때, out객체 사용
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		// JavaScript Object Notation ( JSON )
		
		//		String json = "{ \"key\": \"value\", "
		//					  + "\"key1\": \"value1\"}"; 
		PostInfoDAO dao = new PostInfoDAO();
		int likes = dao.postLikesView(post_seq);
		likes++;
		// Java Object를 JSON 으로 변경하기
		
		// 1. 객체 생성
		Gson gson = new Gson();
		
		// 2. 변환
		String json = gson.toJson(likes);
		
		out.print(json);
		return null;
	}

}
