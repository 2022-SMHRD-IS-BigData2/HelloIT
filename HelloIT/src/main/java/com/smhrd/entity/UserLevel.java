package com.smhrd.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor // 기본생성자
@Data // 기본 method 생성(Getter / Setter / toString)
public class UserLevel {
	
	// 회원 이메일
	private String u_email;
	
	// 태그 순번
	private int tag_seq;
	
	// 태그 레벨
	private String tag_level;

}
