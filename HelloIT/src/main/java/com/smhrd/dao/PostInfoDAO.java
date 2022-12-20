package com.smhrd.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SessionManager;
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
	
	public int postInfoWrite(PostInfo dto) {
		SqlSession session = sqlSessionFactory.openSession(true); // true >> commit
		int cnt = session.insert("postInfoWrite", dto);
		session.close();
		return cnt;
	}
	
	public PostInfo postInfoView(int post_seq) {
		SqlSession session = sqlSessionFactory.openSession(true); // true >> commit
		PostInfo post_info = session.selectOne("postInfoView", post_seq);
		session.close();
		return post_info;
	}
}
