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
	
	// 2. 댓글 좋아요 추가
	public int cmtLikeInfoInsert(LikeInfo dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.insert("cmtLikeInfoInsert", dto);
		session.close();
		return cnt;
	}
	
	// 3. 좋아요 취소
	public int likeInfoDelete(LikeInfo dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.delete("likeInfoDelete", dto);
		session.close();
		return cnt;
	}
	
	
	// 4. 댓글 좋아요 취소
	public int cmtLikeInfoDelete(LikeInfo dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.delete("cmtLikeInfoDelete", dto);
		session.close();
		return cnt;
	}
	
	// 5. 좋아요 업데이트
	public int likesUpdate(int post_seq) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.update("likesUpdate", post_seq);
		session.close();
		return cnt;
	}
	
	// 6. 댓글 좋아요 업데이트
	public int cmtLikesUpdate(int cmt_seq) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.update("cmtLikesUpdate", cmt_seq);
		session.close();
		return cnt;
	}
	
	// 7. 좋아요 눌렀는지 찾기
	public LikeInfo likeSearch(LikeInfo dto) {
		SqlSession session = sqlSessionFactory.openSession(true); // true >> commit
		LikeInfo like_info = session.selectOne("likeSearch", dto);
		session.close();
		return like_info;
	}
	
	// 8. 댓글 좋아요 눌렀는지 찾기
	public LikeInfo cmtLikeSearch(LikeInfo dto) {
		SqlSession session = sqlSessionFactory.openSession(true); // true >> commit
		LikeInfo like_info = session.selectOne("cmtLikeSearch", dto);
		session.close();
		return like_info;
	}
	
	
}
