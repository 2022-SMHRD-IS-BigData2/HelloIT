package com.smhrd.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SessionManager;
import com.smhrd.entity.BookmarkInfo;

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
	
	// 3. 북마크 취소
	public int bookmarkInfoDelete(BookmarkInfo dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.delete("bookmarkInfoDelete", dto);
		session.close();
		return cnt;
	}
	
	// 4. 게시물 북마크수 업데이트
	public int bookmarksUpdate(int post_seq) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.update("bookmarksUpdate", post_seq);
		session.close();
		return cnt;
	}
	
	// 5. 북마크 기록 조회
	public BookmarkInfo bookmarkSearch(BookmarkInfo dto) {
		SqlSession session = sqlSessionFactory.openSession(true); // true >> commit
		BookmarkInfo bookmark_info = session.selectOne("bookmarkSearch", dto);
		session.close();
		return bookmark_info;
	}
	
}
