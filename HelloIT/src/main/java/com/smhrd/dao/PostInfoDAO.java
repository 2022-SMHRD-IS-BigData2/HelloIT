package com.smhrd.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SessionManager;
import com.smhrd.entity.CommentInfo;
import com.smhrd.entity.PostInfo;

public class PostInfoDAO {
	
	SqlSessionFactory sqlSessionFactory = SessionManager.getSqlSessionFactory();
	
	// 1. 게시글 전체 조회
	public List<PostInfo> postInfoList() {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<PostInfo> list = session.selectList("postInfoList");
		session.close();
		return list;
	}
	
	// 2. 게시글 작성
	public int postInfoWrite(PostInfo dto) {
		SqlSession session = sqlSessionFactory.openSession(true); // true >> commit
		int cnt = session.insert("postInfoWrite", dto);
		session.close();
		return cnt;
	}
	
	// 3. 게시글 1개 조회
	public PostInfo postInfoView(int post_seq) {
		SqlSession session = sqlSessionFactory.openSession(true); // true >> commit
		PostInfo post_info = session.selectOne("postInfoView", post_seq);
		session.close();
		return post_info;
	}
	
	// 4. 게시물 좋아요 카운트
	public int postLikesView(int post_seq) {
		SqlSession session = sqlSessionFactory.openSession(true); // true >> commit
		int cnt = session.selectOne("postLikesView", post_seq);
		session.close();
		return cnt;
	}

	// 5. 게시물 북마크 카운트
	public int bookmarksView(int post_seq) {
		SqlSession session = sqlSessionFactory.openSession(true); // true >> commit
		int cnt = session.selectOne("bookmarksView", post_seq);
		session.close();
		return cnt;
	}
	
	// 5. 게시물 댓글수 카운트
	public int cmtCnt(int post_seq) {
		SqlSession session = sqlSessionFactory.openSession(true); // true >> commit
		int cnt = session.selectOne("cmtCountsView", post_seq);
		session.close();
		return cnt;
	}
	
}
