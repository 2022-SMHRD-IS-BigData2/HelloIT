package com.smhrd.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor // 기본생성자
@Data // 기본 method 생성(Getter / Setter / toString)
public class PostLevel {

	private int post_seq ;
	private int tag_seq;
	private String tag_level;

}
