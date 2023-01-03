package com.smhrd.entity;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@NoArgsConstructor // 기본생성자
@Data // 기본 method 생성(Getter / Setter / toString)
public class LikeInfo {
	
	// 좋아요 순번
	private int like_seq;
	@NonNull
	
	// 회원 이메일
	private String u_email;
	
	// 게시물 순번
	private int post_seq;
	
	// 댓글 순번
	private int cmt_seq;
	
}
