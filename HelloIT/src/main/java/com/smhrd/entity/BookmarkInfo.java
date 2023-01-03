package com.smhrd.entity;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@NoArgsConstructor // 기본생성자
@Data // 기본 method 생성(Getter / Setter / toString)
public class BookmarkInfo {
	
	// 북마크순번
	private int bookmark_seq;
	@NonNull
	
	// 회원 이메일
	private String u_email;
	
	// 게시물 순번
	private int post_seq;
	
	// 북마크날짜
	private Date bookmark_dt;
	
}
