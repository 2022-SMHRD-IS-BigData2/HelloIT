package com.smhrd.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SessionManager;
import com.smhrd.entity.PostInfo;

public class IdeaDAO {
	
	
	// 아이디어 토론방 페이징 10개 게시글씩 구현
	SqlSessionFactory sqlSessionFactory = SessionManager.getSqlSessionFactory();
	public List<PostInfo> paging(int n) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<PostInfo> list = session.selectList("getListWithPagingIdea",n);
		session.close();
		return list;
	}
	
	// 아이디어토론방 페이지 카운팅
	public List<PostInfo> pageCnt() {
		SqlSession session = sqlSessionFactory.openSession();
		List<PostInfo> cnt = session.selectList("getListSizeIdea");
		session.close();
		return cnt;
	}
	
	// 아이디어 토론방 게시물 조회수 업데이트
	public int updateCnt(PostInfo dto) {
		SqlSession session = sqlSessionFactory.openSession();
		int result = session.update("ideaPostCnt", dto);
		session.close();
		return result;
	}
	
}
