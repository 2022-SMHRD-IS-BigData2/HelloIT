package com.smhrd.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SessionManager;
import com.smhrd.entity.UserLevel;

public class UserLevelSettingDAO {
	
	SqlSessionFactory sqlSessionFactory = SessionManager.getSqlSessionFactory();
	
	// 1. 유저 레벨 세팅
	public int userLevelSetting(UserLevel dto) {
		SqlSession session = sqlSessionFactory.openSession(true); // true >> commit
		int cnt = session.insert("userLevelSetting", dto);
		session.close();
		return cnt;
	}
	
	// 1. 유저 레벨 초기 세팅
	public int userLevelFirstSetting(UserLevel dto) {
		SqlSession session = sqlSessionFactory.openSession(true); // true >> commit
		int cnt = session.insert("userLevelFirstSetting", dto);
		session.close();
		return cnt;
	}
	

	
}
