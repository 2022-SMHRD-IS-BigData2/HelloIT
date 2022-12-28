package com.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//@RequiredArgsConstructor // @NonNull이 붙은 요소만 초기화해주는 생성자.
@NoArgsConstructor // 기본 생성자를 생성
@AllArgsConstructor // 모든 요소를 초기화 해주는 생성자. 
@Data // 기본 메소드 생성 ( Getter/ Setter / toString ) 

public class UserRoleInfo {

    // 회원 이메일 
    private String u_email;

    // 프론트엔드 
    private String frontend;

    // 백앤드 
    private String backend;

    // 데이터 분야 
    private String data_etc;

    // 기타 
    private String other_skill;
	
}
