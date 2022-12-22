package com.smhrd.entity;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@NoArgsConstructor // 기본생성자
@Data // 기본 method 생성(Getter / Setter / toString)
public class CommentInfo {
	
	private int cmt_seq;
	
	private int post_seq;
	
	private String cmt_content;
	
	private Date cmt_dt;
	
	private String u_email;
	
	private int cmt_cnt;
	
	private int cmt_likes;
	
}
