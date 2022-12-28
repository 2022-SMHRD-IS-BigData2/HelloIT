package com.smhrd.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SessionManager;
import com.smhrd.entity.UserInfo;


public class UserPageDAO {
		// SqlSessionFactory 받아오기
		SqlSessionFactory sqlSessionFactory = SessionManager.getSqlSessionFactory();
		
		
		
		public UserInfo goUserPage(String u_email) {
			// 1) connection 빌려오기
			SqlSession session = sqlSessionFactory.openSession(true);
			// 2) SQL문 실행
			UserInfo result = session.selectOne("goUserPage", u_email);
			// 3) 빌린 Connection 반환
			session.close();
			// 4) 실행결과 리턴
			return result;
			
		}
}
