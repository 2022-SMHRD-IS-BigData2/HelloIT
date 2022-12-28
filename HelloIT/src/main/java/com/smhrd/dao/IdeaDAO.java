package com.smhrd.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SessionManager;
import com.smhrd.entity.PostInfo;

public class IdeaDAO {

	SqlSessionFactory sqlSessionFactory = SessionManager.getSqlSessionFactory();
	public List<PostInfo> paging(int n) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<PostInfo> list = session.selectList("getListWithPagingIdea",n);
		session.close();
		return list;
	}
	public List<PostInfo> pageCnt() {
		SqlSession session = sqlSessionFactory.openSession();
		List<PostInfo> cnt = session.selectList("getListSizeIdea");
		session.close();
		return cnt;
	}
	
}
