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
public class UserDBInfo {
	
	 // 이메일 
    private String u_email;

    // MYSQL 
    private String mysql;

    // ORACLE 
    private String oracle;

    // MARIADB 
    private String mariadb;

    // POSTGRESQL 
    private String pstgresql;

    // MONGODB 
    private String mongodb;

    // REDIS 
    private String redis;

    // SQLITE 
    private String sqlite;

    // AWS_AURORA 
    private String aws_aurora;

    // ELASTICSEARCH 
    private String elasticsearch;

    // DYNAMODB 
    private String dynamodb;

    // FIREBASE 
    private String firebase;

    // TIBERO 
    private String tibero;

    // HIVE 
    private String hive;

    // CASSANDRA 
    private String cassandra;
    
    // 기타 
    private String db_etc;

}
