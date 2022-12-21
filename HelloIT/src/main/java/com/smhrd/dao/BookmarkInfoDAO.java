package com.smhrd.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SessionManager;
import com.smhrd.entity.BookmarkInfo;
import com.smhrd.entity.CommentInfo;
import com.smhrd.entity.PostInfo;

public class BookmarkInfoDAO {
	
	SqlSessionFactory sqlSessionFactory = SessionManager.getSqlSessionFactory();
	
	// 1. 유저별 북마크 전체 조회 (post_seq 리스트로 반환)
	public List<Integer> bookmarkInfoList() {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<Integer> list = session.selectList("bookmarkInfoList");
		session.close();
		return list;
	}
	
	// 2. 북마크 추가
	public int bookmarkInfoInsert(BookmarkInfo dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.insert("bookmarkInfoInsert", dto);
		session.close();
		return cnt;
	}
	
	// 3. 북마크 수 카운트
	public int bookmarkLikesView(int post_seq) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.selectOne("bookmarkLikesView", post_seq);
		session.close();
		return cnt;
	}
	
}
