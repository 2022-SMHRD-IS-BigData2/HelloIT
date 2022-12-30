package com.smhrd.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SessionManager;
import com.smhrd.entity.OnclickDTO;
import com.smhrd.entity.Recruit;
import com.smhrd.entity.SearchRecruit;

public class RecruitDAO {

	SqlSessionFactory sqlSessionFactory = SessionManager.getSqlSessionFactory();
	public List<Recruit> paging(int n) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<Recruit> list = session.selectList("getListWithPaging",n);
		session.close();
		return list;
	}
	public List<Recruit> pageCnt() {
		SqlSession session = sqlSessionFactory.openSession();
		List<Recruit> cnt = session.selectList("getListSize");
		session.close();
		return cnt;
	}
	public List<Recruit> paging_j(int n) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<Recruit> list = session.selectList("getListWithPaging_j",n);
		session.close();
		return list;
	}
	public List<Recruit> pageCnt_j() {
		SqlSession session = sqlSessionFactory.openSession();
		List<Recruit> cnt = session.selectList("getListSize_j");
		session.close();
		return cnt;
	}

	public List<OnclickDTO> printOn(){
		SqlSession session = sqlSessionFactory.openSession();
		List<OnclickDTO> on = session.selectList("onClicktest");
		session.close();
		return on;
	}
	
	public List<Recruit> sSearchListWithPaging(SearchRecruit dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<Recruit> list = session.selectList("sSearchListWithPaging", dto);
		session.close();
		return list;
	}
	public List<Recruit> sSearchListSize(String search_word) {
		SqlSession session = sqlSessionFactory.openSession();
		List<Recruit> cnt = session.selectList("sSearchListSize", search_word);
		session.close();
		return cnt;
	}
	public List<Recruit> jSearchListWithPaging(SearchRecruit dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<Recruit> list = session.selectList("jSearchListWithPaging", dto);
		session.close();
		return list;
	}
	public List<Recruit> jSearchListSize(String search_word) {
		SqlSession session = sqlSessionFactory.openSession();
		List<Recruit> cnt = session.selectList("jSearchListSize", search_word);
		session.close();
		return cnt;
	}
	
	
	
	
}
