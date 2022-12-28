package com.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//@RequiredArgsConstructor // @NonNull이 붙은 요소만 초기화해주는 생성자.
@NoArgsConstructor // 기본 생성자를 생성
@AllArgsConstructor // 모든 요소를 초기화 해주는 생성자. 
@Data // 기본 메소드 생성 ( Getter/ Setter / toprivate String ) 
public class Recruit {
	// LOMBOK : DTO 설계시 메서드들을 자동완성 시켜주는 라이브러리
	// 필드(Field) 변경시 자동으로 메소드 변경이 일어난다.
	// @~~ : class에 어노테이션(Annotation)을 붙여서 기능을 사용한다.
	
	private String no;
	
	private String company_list;
	
	private String job_list;
	
	private String addr_list;
	
	private String date_list;
	
	private String link_list;
}
