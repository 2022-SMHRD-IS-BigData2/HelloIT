package com.smhrd.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

//@RequiredArgsConstructor // @NonNull이 붙은 요소만 초기화해주는 생성자.
@NoArgsConstructor // 기본 생성자를 생성
@AllArgsConstructor // 모든 요소를 초기화 해주는 생성자. 
@Data // 기본 메소드 생성 ( Getter/ Setter / toString ) 
public class UserInfo {
	// LOMBOK : DTO 설계시 메서드들을 자동완성 시켜주는 라이브러리
	// 필드(Field) 변경시 자동으로 메소드 변경이 일어난다.
	// @~~ : class에 어노테이션(Annotation)을 붙여서 기능을 사용한다.
	
	// 이메일
    // 회원 이메일 
    // 회원 이메일 
    private String u_email;

    // 비밀번호 
    private String u_pw;

    // 이름 
    private String u_name;

    // 닉네임 
    private String u_nick;

    // 생년월일 
    private Date u_birthdate;

    // 직업 
    private String u_job;

    // 성별 
    private String u_gender;

    // 레벨 
    private String u_level;

    // 활동점수 
    private int u_activity_score;

    // 회원 유형 일반회원:'U', 관리자:'A'
    private String u_type;

    // 회원 가입일자
    private Date u_joindate;
	
}
