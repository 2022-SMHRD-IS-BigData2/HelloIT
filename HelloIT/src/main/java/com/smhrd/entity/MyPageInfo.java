package com.smhrd.entity;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

//@RequiredArgsConstructor // @NonNull이 붙은 요소만 초기화해주는 생성자.
@NoArgsConstructor // 기본 생성자를 생성
//@AllArgsConstructor // 모든 요소를 초기화 해주는 생성자. 
@Data // 기본 메소드 생성 ( Getter/ Setter / toString ) 
public class MyPageInfo {
	// LOMBOK : DTO 설계시 메서드들을 자동완성 시켜주는 라이브러리
	// 필드(Field) 변경시 자동으로 메소드 변경이 일어난다.
	// @~~ : class에 어노테이션(Annotation)을 붙여서 기능을 사용한다.
	
	// 이메일
	@NonNull // 우리한테 필요한 데이터임을 표시
    private String u_email;

    // 자개 소개서
    private String u_introduction;

    // 나의 아이디어
    private String u_idea;

    // 관심 분야
    private String u_interest;
}
