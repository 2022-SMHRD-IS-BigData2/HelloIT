package com.smhrd.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SessionManager;
import com.smhrd.entity.FollowingInfo;
import com.smhrd.entity.LikeInfo;
import com.smhrd.entity.UserInfo;

public class FollowingInfoDAO {
	
	// SqlSessionFactory 받아오기
	SqlSessionFactory sqlSessionFactory = SessionManager.getSqlSessionFactory();
	
	// 팔로우 조회
	public FollowingInfo followSearch(FollowingInfo dto) {
		SqlSession session = sqlSessionFactory.openSession(true); // true >> commit
		FollowingInfo following_info = session.selectOne("followSearch", dto);
		session.close();
		return following_info;
	}
	
	// 팔로우
	public int insertFollowing(FollowingInfo dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.insert("insertFollowing", dto);
		session.close();
		return cnt;
	}
	
	// 언팔로우
	public int deleteFollowing(FollowingInfo dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.delete("deleteFollowing", dto);
		session.close();
		return cnt;
	}
	
	// 팔로잉 조회
	public List<UserInfo> viewFollowing(String follower_email) {
		SqlSession session = sqlSessionFactory.openSession(true); // true >> commit
		List<UserInfo> user_info = session.selectList("viewFollowing", follower_email);
		session.close();
		return user_info;
	}
	
	// 팔로잉 수 카운트
	public int cntFollowing(String follower_email) {
		SqlSession session = sqlSessionFactory.openSession(true); // true >> commit
		int cnt = session.selectOne("cntFollowing", follower_email);
		session.close();
		return cnt;
	}
	
	// 팔로워 조회
	public List<UserInfo> viewFollower(String u_email) {
		SqlSession session = sqlSessionFactory.openSession(true); // true >> commit
		List<UserInfo> user_info = session.selectList("viewFollower", u_email);
		session.close();
		return user_info;
	}
	
	// 팔로워 수 카운트
	public int cntFollower(String u_email) {
		SqlSession session = sqlSessionFactory.openSession(true); // true >> commit
		int cnt = session.selectOne("cntFollower", u_email);
		session.close();
		return cnt;
	}
	
}
