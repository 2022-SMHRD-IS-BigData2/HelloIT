package com.smhrd.database;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SessionManager {
	
	// 필드로 선언
	// static : 프로그램이 시작하자마자 메모리에 할당시켜두겠다.
	// SqlSessionFactory : Connection들을 생성하고, 저장해두는 객체
	private static SqlSessionFactory sqlSessionFactory;
	
	
	// 초기화 블럭
	// 생성자가 사용된 직후
	
	
	// DBCP 만들기
	// static 초기화 블럭
	// static 변수들이 할당된 직후
	
	static {
		try {
			String resource = "com/smhrd/database/config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	
	// Getter,Setter 만들기

	public static SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}

	public static void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		SessionManager.sqlSessionFactory = sqlSessionFactory;
	}
	
	
}
