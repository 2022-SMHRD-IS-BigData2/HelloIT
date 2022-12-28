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
	
	public int cmtLikeInfoInsert(LikeInfo dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.insert("cmtLikeInfoInsert", dto);
		session.close();
		return cnt;
	}
	
	public int likeInfoDelete(LikeInfo dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.delete("likeInfoDelete", dto);
		session.close();
		return cnt;
	}
	
	public int cmtLikeInfoDelete(LikeInfo dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.delete("cmtLikeInfoDelete", dto);
		session.close();
		return cnt;
	}
	
	public int likesUpdate(int post_seq) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.update("likesUpdate", post_seq);
		session.close();
		return cnt;
	}
	
	public int cmtLikesUpdate(int cmt_seq) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.update("cmtLikesUpdate", cmt_seq);
		session.close();
		return cnt;
	}
	
	public LikeInfo likeSearch(LikeInfo dto) {
		SqlSession session = sqlSessionFactory.openSession(true); // true >> commit
		LikeInfo like_info = session.selectOne("likeSearch", dto);
		session.close();
		return like_info;
	}
	
	public LikeInfo cmtLikeSearch(LikeInfo dto) {
		SqlSession session = sqlSessionFactory.openSession(true); // true >> commit
		LikeInfo like_info = session.selectOne("cmtLikeSearch", dto);
		session.close();
		return like_info;
	}
	
	
}
