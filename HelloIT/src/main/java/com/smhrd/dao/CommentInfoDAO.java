package com.smhrd.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SessionManager;
import com.smhrd.entity.CommentInfo;

public class CommentInfoDAO {
	
	SqlSessionFactory sqlSessionFactory = SessionManager.getSqlSessionFactory();
	
	// 1. 댓글 전체 조회
	public List<CommentInfo> commentInfoList(int post_seq) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<CommentInfo> list = session.selectList("commentInfoList", post_seq);
		session.close();
		return list;
	}
	
	// 2. 댓글 작성
	public int commentInfoWrite(CommentInfo dto) {
		SqlSession session = sqlSessionFactory.openSession(true); // true >> commit
		int cnt = session.insert("commentInfoWrite", dto);
		session.close();
		return cnt;
	}
	
	// 3. 댓글 좋아요 갱신
	public int cmtLike(int cmt_seq) {
		SqlSession session = sqlSessionFactory.openSession(true); // true >> commit
		int cnt = session.update("commentLike", cmt_seq);
		session.close();
		return cnt;
	}
	
	// 4. 댓글 좋아요 카운트
	public int cmtLikesView(int cmt_seq) {
		SqlSession session = sqlSessionFactory.openSession(true); // true >> commit
		int cnt = session.selectOne("cmtLikesView", cmt_seq);
		session.close();
		return cnt;
	}
	
	// 5. 댓글수 업데이트
	public int cmtCntUpdate(int post_seq) {
		SqlSession session = sqlSessionFactory.openSession(true); // true >> commit
		int cnt = session.update("cmtCntUpdate", post_seq);
		session.close();
		return cnt;
	}
	
}
