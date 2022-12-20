package com.smhrd.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SessionManager;
import com.smhrd.entity.CareerInfo;

public class CareerInfoDAO {

SqlSessionFactory sqlSessionFactory = SessionManager.getSqlSessionFactory();
	
	// 1. 회원가입 SQL문을 실행하는 메소드
	public int insertMyCareer( CareerInfo dto) {
		// 1) connection 빌려오기
		SqlSession session = sqlSessionFactory.openSession( true );
		
		// 2) SQL문 실행
		int cnt = session.insert("insertMyCareer", dto);
		
		// 3) 빌린 Connection 반환
		session.close();
		
		// 4) 실행결과 리턴
		return cnt;
	}
	
	public int updateCareer( CareerInfo dto ) {
		
		SqlSession session = sqlSessionFactory.openSession( true );
		
		// 2) SQL문 실행
		int cnt = session.insert("updateCareer", dto);
		
		// 3) 빌린 Connection 반환
		session.close();
		
		// 4) 실행결과 리턴
		return cnt;
		
	}	
}