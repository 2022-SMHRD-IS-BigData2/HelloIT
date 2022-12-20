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
public class UserLanguageInfo {
	
	// 회원 이메일 
    private String u_email;

    // HTML 
    private String html;

    // CSS 
    private String css;

    // JAVASCRIPT 
    private String javascript;

    // C 
    private String c;

    // C++ 
    private String c_pp;

    // C# 
    private String c_sharp;

    // JAVA 
    private String java;

    // PYTHON 
    private String python;

    // PHP 
    private String php;

    // DART 
    private String dart;

    // TYPESCRIPT 
    private String typescript;

    // KOTLIN 
    private String kotlin;

    // GO 
    private String go;

    // RUST 
    private String rust;

    // SWIFT 
    private String swift;

    // SCALA 
    private String scala;

    // OBJECTIVE-C 
    private String objective_c;

    // R 
    private String r;

    // RUBY 
    private String ruby;

    // HASKELL 
    private String haskell;

    // CLOJURE 
    private String clojure;

    // SQL 
    private String sql;

    // 기타 
    private String language_etc;
}
