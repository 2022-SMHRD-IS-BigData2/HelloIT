package com.smhrd.controller;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.dao.PostInfoDAO;
import com.smhrd.entity.PostInfo;

public class WriteCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException {

		// 0. MultiPartRequest 생성
		// 저장할 폴더 경로
		// webapp 밑에있는 images 폴더 경로
		// request.getServletContext() : Tomcat이 복사해서 만든 폴더 정보들 == webapp
		
		// webapp/img
		String savePath = request.getServletContext().getRealPath("img");

		// 최대 사이즈
		// byte 단위
		int maxSize = 5 * 1024 * 1024; // 5MB

		// 인코딩 방식
		String encoding = "UTF-8";

		System.out.println(savePath);

		// MultipartRequest 생성
		MultipartRequest multi = new MultipartRequest(
				request, 
				savePath, 
				maxSize, 
				encoding,
				new DefaultFileRenamePolicy() // 중복된 파일 이름을 변경
				);

		// 1. 데이터(파라미터) 수집
		String post_title = multi.getParameter("post_title");
		String post_content = multi.getParameter("post_content");
		String u_email = multi.getParameter("u_email");
		String post_kind = multi.getParameter("post_kind");

		// 이미지파일의 이름 가져오기
		// 이 때, 파일 저장이 일어난다
		String post_file = multi.getFilesystemName("post_file");

		// 2. DTO에 데이터 묶기
		PostInfo dto = new PostInfo();
		dto.setPost_title(post_title);
		dto.setPost_content(post_content);
		dto.setU_email(u_email);
		dto.setPost_kind(post_kind);
		dto.setPost_file(post_file);
		

		// 3. DAO의 boardWrite 사용
		PostInfoDAO dao = new PostInfoDAO();
		int cnt = dao.postInfoWrite(dto);

		// 4. 성공 여부에 따라 페이지 이동
		if (cnt > 0) {
			System.out.println("게시글 작성 성공");
		} else {
			System.out.println("게시글 작성 실패");
			return "redirect:/write.do";
		}
		// 5. 페이지이동
		return "redirect:/goMain.do";
	}

}
