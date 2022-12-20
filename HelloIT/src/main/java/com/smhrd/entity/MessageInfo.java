package com.smhrd.entity;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@NoArgsConstructor // 기본생성자
@Data // 기본 method 생성(Getter / Setter / toString)
public class MessageInfo {
	
	private int msg_seq;
	private String sender_id;
	private String receiver_id;
	@NonNull
	private String msg_content;
	private Date send_time;
	
}
