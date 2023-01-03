package com.smhrd.entity;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor // 기본생성자
@Data // 기본 method 생성(Getter / Setter / toString)
public class CommentInfo {

	// 댓글 순번
	private int cmt_seq;
	
	// 게시물 순번
	private int post_seq;
	
	// 댓글 내용
	private String cmt_content;
	
	// 댓글 날짜
	private Date cmt_dt;
	
	// 회원 이메일
	private String u_email;
	
	// 댓글 수
	private int cmt_cnt;
	
	// 댓글좋아요수
	private int cmt_likes;
	
	// 회원 이름
	private String u_name;
	
}
