package com.smhrd.entity;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@NoArgsConstructor // 기본생성자
@Data // 기본 method 생성(Getter / Setter / toString)
public class LikeInfo {
	
	private int like_seq;
	@NonNull
	private String u_email;
	private int post_seq;
	private int cmt_seq;
	
}
