package com.smhrd.entity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

//@RequiredArgsConstructor // @NonNull이 붙은 요소만 초기화해주는 생성자.
@NoArgsConstructor // 기본 생성자를 생성
@AllArgsConstructor // 모든 요소를 초기화 해주는 생성자. 
@Data // 기본 메소드 생성 ( Getter/ Setter / toString ) 
public class UserSkillInfo {
	
    // 회원 이메일 
    private String u_email;

    // 웹 
    private String web;

    // IOS 
    private String ios;

    // 안드로이드 
    private String android;

    // 윈도우 
    private String windows;

    // 맥 
    private String mac;

    // 리눅스 
    private String linux;

    // 게임 
    private String game;

    // 기타 
    private String etc;
}
