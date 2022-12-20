package com.smhrd.entity;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@NoArgsConstructor // 기본생성자
@Data // 기본 method 생성(Getter / Setter / toString)
public class BookmarkInfo {
	
	private int bookmark_seq;
	@NonNull
	private String u_email;
	private int post_seq;
	private Date bookmark_dt;
	
}
