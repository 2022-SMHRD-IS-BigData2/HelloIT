package com.smhrd.entity;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

//@RequiredArgsConstructor // @NonNull이 붙은 요소만 초기화해주는 생성자.
@NoArgsConstructor // 기본 생성자를 생성
//@AllArgsConstructor // 모든 요소를 초기화 해주는 생성자. 
@Data // 기본 메소드 생성 ( Getter/ Setter / toString ) 
public class FollowingInfo {
	
	
    // 팔로잉 순번
    private Double following_seq;

    // 회원 이메일 
    private String u_email;

    // 팔로워 이메일 
    private String follower_email;

    // 팔로잉 날짜 
    private Date following_dt;
}
