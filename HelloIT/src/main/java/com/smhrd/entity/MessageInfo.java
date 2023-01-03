package com.smhrd.entity;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@NoArgsConstructor // 기본생성자
@Data // 기본 method 생성(Getter / Setter / toString)
public class MessageInfo {
	
	// 메시지순번
	private int msg_seq;
	
	// 보내는사람 회원아이디
	private String sender_id;
	
	// 받는사람 회원 아이디
	private String receiver_id;
	@NonNull
	
	// 메시지 내용
	private String msg_content;
	
	// 보낸 시간
	private Date send_time;
	
}
