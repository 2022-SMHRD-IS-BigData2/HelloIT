package com.smhrd.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SessionManager;
import com.smhrd.entity.UserInfo;

public class UserInfoDAO {
	
	// SqlSessionFactory 받아오기
	SqlSessionFactory sqlSessionFactory = SessionManager.getSqlSessionFactory();
	
	// 1. 회원가입 SQL문을 실행하는 메소드
	public int join( UserInfo dto) {
		// 1) connection 빌려오기
		SqlSession session = sqlSessionFactory.openSession( true );
		
		// 2) SQL문 실행
		int cnt = session.insert("join", dto);
		
		// 3) 빌린 Connection 반환
		session.close();
		
		// 4) 실행결과 리턴
		return cnt;
	}
	
	
	// 2. 로그인 메서드
	public UserInfo login(UserInfo dto) {
		// 1) connection 빌려오기
		SqlSession session = sqlSessionFactory.openSession( true);
		// 2) SQL문 실행
		UserInfo result = session.selectOne("login", dto);
		// 3) 빌린 Connection 반환
		session.close();
		// 4) 실행결과 리턴
		return result;
		
	}
	
	
}
