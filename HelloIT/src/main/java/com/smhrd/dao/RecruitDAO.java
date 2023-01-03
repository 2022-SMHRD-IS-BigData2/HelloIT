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
	
	// 1. 채용공고게시판 페이징 (사람인)
	public List<Recruit> paging(int n) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<Recruit> list = session.selectList("getListWithPaging",n);
		session.close();
		return list;
	}
	
	// 2. 채용공고 게시판 총 리스트 카운팅 (사람인)
	public List<Recruit> pageCnt() {
		SqlSession session = sqlSessionFactory.openSession();
		List<Recruit> cnt = session.selectList("getListSize");
		session.close();
		return cnt;
	}
	
	// 3. 채용공고게시판 페이징 (잡코리아)
	public List<Recruit> paging_j(int n) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<Recruit> list = session.selectList("getListWithPaging_j",n);
		session.close();
		return list;
	}
	
	// 4. 채용공고 게시판 총 리스트 카운팅 (잡코리아)
	public List<Recruit> pageCnt_j() {
		SqlSession session = sqlSessionFactory.openSession();
		List<Recruit> cnt = session.selectList("getListSize_j");
		session.close();
		return cnt;
	}
	
	// 5. 채용공고 게시판 검색 기능 (사람인)
	public List<Recruit> sSearchListWithPaging(SearchRecruit dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<Recruit> list = session.selectList("sSearchListWithPaging", dto);
		session.close();
		return list;
	}
	
	// 6. 채용공고 게시판 검색 기능 (사람인)
	public List<Recruit> sSearchListSize(String search_word) {
		SqlSession session = sqlSessionFactory.openSession();
		List<Recruit> cnt = session.selectList("sSearchListSize", search_word);
		session.close();
		return cnt;
	}
	
	
	// 7. 채용공고 게시판 검색 기능 (잡코리아)
	public List<Recruit> jSearchListWithPaging(SearchRecruit dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<Recruit> list = session.selectList("jSearchListWithPaging", dto);
		session.close();
		return list;
	}
	
	
	// 8. 채용공고 게시판 검색 기능 (잡코리아)
	public List<Recruit> jSearchListSize(String search_word) {
		SqlSession session = sqlSessionFactory.openSession();
		List<Recruit> cnt = session.selectList("jSearchListSize", search_word);
		session.close();
		return cnt;
	}
	
	// 테스트
	public List<OnclickDTO> printOn(){
		SqlSession session = sqlSessionFactory.openSession();
		List<OnclickDTO> on = session.selectList("onClicktest");
		session.close();
		return on;
	}
	
	
	
}
