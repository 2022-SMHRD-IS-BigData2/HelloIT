package com.smhrd.entity;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@NoArgsConstructor // 기본생성자
@Data // 기본 method 생성(Getter / Setter / toString)
public class PostInfo {
	
	private int post_seq;
	
	@NonNull
	private String post_title;
	
	@NonNull
	private String post_content;
	
	@NonNull
	private String post_file;
	
	private String post_dt;
	
	@NonNull
	private String u_email;
	
	private int bookmarks;
	
	private int cnt;
	
	@NonNull
	private String post_kind;
	
	private int likes;
	
}
