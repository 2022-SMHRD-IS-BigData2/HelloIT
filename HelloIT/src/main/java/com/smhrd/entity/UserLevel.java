package com.smhrd.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor // 기본생성자
@Data // 기본 method 생성(Getter / Setter / toString)
public class UserLevel {

	private String u_email;
	private int tag_seq;
	private String tag_level;

}
