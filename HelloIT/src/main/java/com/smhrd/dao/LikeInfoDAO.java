package com.smhrd.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SessionManager;
import com.smhrd.entity.LikeInfo;

public class LikeInfoDAO {
	
	SqlSessionFactory sqlSessionFactory = SessionManager.getSqlSessionFactory();
	
	// 1. 좋아요 추가
	public int likeInfoInsert(LikeInfo dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.insert("likeInfoInsert", dto);
		session.close();
		return cnt;
	}
	
	
}
