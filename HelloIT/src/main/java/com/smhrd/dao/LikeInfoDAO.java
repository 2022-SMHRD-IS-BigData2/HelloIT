package com.smhrd.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SessionManager;
import com.smhrd.entity.LikeInfo;
import com.smhrd.entity.PostInfo;

public class LikeInfoDAO {
	
	SqlSessionFactory sqlSessionFactory = SessionManager.getSqlSessionFactory();
	
	// 1. 좋아요 추가
	public int likeInfoInsert(LikeInfo dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.insert("likeInfoInsert", dto);
		session.close();
		return cnt;
	}
	
	public int likeInfoDelete(LikeInfo dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.delete("likeInfoDelete", dto);
		session.close();
		return cnt;
	}
	
	public int likesUpdate(int post_seq) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.update("likesUpdate", post_seq);
		session.close();
		return cnt;
	}
	
	
	public LikeInfo likeSearch(LikeInfo dto) {
		SqlSession session = sqlSessionFactory.openSession(true); // true >> commit
		LikeInfo like_info = session.selectOne("likeSearch", dto);
		session.close();
		return like_info;
	}
	
}
