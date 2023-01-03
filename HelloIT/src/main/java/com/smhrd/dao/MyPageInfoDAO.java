package com.smhrd.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SessionManager;
import com.smhrd.entity.MyPageInfo;

public class MyPageInfoDAO {
	
	// SqlSessionFactory 받아오기
	SqlSessionFactory sqlSessionFactory = SessionManager.getSqlSessionFactory();
	
	// 1. 마이페이지 정보 저장
	public int insertMyPage( MyPageInfo dto) {
		// 1) connection 빌려오기
		SqlSession session = sqlSessionFactory.openSession( true );
		
		// 2) SQL문 실행
		int cnt = session.insert("insertMyPage", dto);
		
		// 3) 빌린 Connection 반환
		session.close();
		
		// 4) 실행결과 리턴
		return cnt;
	}
	
	
	// 2. 마이페이지 업데이트
	public int updateMyPage( MyPageInfo dto ) {
		
		SqlSession session = sqlSessionFactory.openSession( true );
		
		// 2) SQL문 실행
		int cnt = session.insert("updateMyPage", dto);
		
		// 3) 빌린 Connection 반환
		session.close();
		
		// 4) 실행결과 리턴
		return cnt;
		
	}
}
