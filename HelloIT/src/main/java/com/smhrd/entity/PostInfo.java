package com.smhrd.entity;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@NoArgsConstructor // 기본생성자
@Data // 기본 method 생성(Getter / Setter / toString)
public class PostInfo {
	
	// 게시물 순번
	private int post_seq;
	
	@NonNull
	// 게시물 제목
	private String post_title;
	
	// 게시물 내용
	private String post_content;
	
	// 게시물 첨부파일
	private String post_file;
	
	// 게시물 날짜
	private String post_dt;
	
	@NonNull
	
	// 회원 이메일
	private String u_email;
	
	// 게시물 북마크 수
	private int bookmarks;
	
	// 게시물 조회수
	private int cnt;
	
	@NonNull
	
	// 게시물 종류
	private String post_kind;
	
	// 게시물 좋아요수
	private int likes;
	
	// 회원 이름
	private String u_name;
	
	// 게시물 댓글수
	private int cmts;
	
	// 로우넘버
	private int row_num;
	
	// 검색 글자
	private String search_word;
	
}
