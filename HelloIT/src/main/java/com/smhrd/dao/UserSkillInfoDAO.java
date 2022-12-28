package com.smhrd.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SessionManager;
import com.smhrd.entity.UserSkillInfo;

public class UserSkillInfoDAO {
	SqlSessionFactory sqlSessionFactory = SessionManager.getSqlSessionFactory();

	public int checkSkill(UserSkillInfo dto) {
		// 1) connection 빌려오기
		SqlSession session = sqlSessionFactory.openSession(true);

		// 2) SQL문 실행
		int cnt = session.insert("checkSkill", dto);

		// 3) 빌린 Connection 반환
		session.close();

		// 4) 실행결과 리턴
		return cnt;
	}

	public int updateSkill(UserSkillInfo dto) {

		SqlSession session = sqlSessionFactory.openSession(true);

		// 2) SQL문 실행
		int cnt = session.insert("updateSkill", dto);

		// 3) 빌린 Connection 반환
		session.close();

		// 4) 실행결과 리턴
		return cnt;

	}
}
