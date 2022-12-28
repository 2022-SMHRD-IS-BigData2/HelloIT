package com.smhrd.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SessionManager;
import com.smhrd.entity.PostInfo;
import com.smhrd.entity.Tag;
import com.smhrd.entity.UserLevel;

public class PostInfoDAO {
	
	SqlSessionFactory sqlSessionFactory = SessionManager.getSqlSessionFactory();
	
	// 게시글 전체 조회
	public List<PostInfo> postInfoList() {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<PostInfo> list = session.selectList("postInfoList");
		session.close();
		return list;
	}
	
	// 인기게시물 상위 10개 조회
	public List<PostInfo> popPostInfoList() {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<PostInfo> list = session.selectList("popPostInfoList");
		session.close();
		return list;
	}
	
	// 본인 게시글 리스트 조회
	public List<PostInfo> userPostInfoList(String u_email) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<PostInfo> list = session.selectList("userPostInfoList", u_email);
		session.close();
		return list;
	}
	
	// 북마크 게시글 리스트 조회
	public List<PostInfo> bookmarkPostInfoList(String u_email) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<PostInfo> list = session.selectList("bookmarkPostInfoList", u_email);
		session.close();
		return list;
	}
	
	// 맞춤형 게시글 리스트 조회
	public List<PostInfo> customizedPostInfoList(String u_email) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<PostInfo> list = session.selectList("customizedPostInfoList", u_email);
		session.close();
		return list;
	}
	
	// 태그별 게시글 리스트 조회
	public List<PostInfo> tagPostInfoList(int tag_seq) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<PostInfo> list = session.selectList("tagPostInfoList", tag_seq);
		session.close();
		return list;
	}
	
	// 게시글 작성
	public int postInfoWrite(PostInfo dto) {
		SqlSession session = sqlSessionFactory.openSession(true); // true >> commit
		int cnt = session.insert("postInfoWrite", dto);
		session.close();
		return cnt;
	}
	
	// 게시글 1개 조회
	public PostInfo postInfoView(int post_seq) {
		SqlSession session = sqlSessionFactory.openSession(true); // true >> commit
		PostInfo post_info = session.selectOne("postInfoView", post_seq);
		session.close();
		return post_info;
	}
	
	// 게시물 좋아요 카운트
	public int postLikesView(int post_seq) {
		SqlSession session = sqlSessionFactory.openSession(true); // true >> commit
		int cnt = session.selectOne("postLikesView", post_seq);
		session.close();
		return cnt;
	}

	// 게시물 북마크 카운트
	public int bookmarksView(int post_seq) {
		SqlSession session = sqlSessionFactory.openSession(true); // true >> commit
		int cnt = session.selectOne("bookmarksView", post_seq);
		session.close();
		return cnt;
	}
	
	// 게시물 댓글수 카운트
	public int cmtCnt(int post_seq) {
		SqlSession session = sqlSessionFactory.openSession(true); // true >> commit
		int cnt = session.selectOne("cmtCountsView", post_seq);
		session.close();
		return cnt;
	}
	
	// 세션 유저 레벨 조회
	public List<UserLevel> userLevelView(UserLevel dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<UserLevel> list = session.selectList("userLevelView", dto);
		session.close();
		return list;
	}
	
	// 게시물 유저 레벨 등록
	public int postLevelSetting(UserLevel dto) {
		SqlSession session = sqlSessionFactory.openSession(true); // true >> commit
		int cnt = session.insert("postLevelSetting", dto);
		session.close();
		return cnt;
	}
	
	// 해시태그 전체 조회
	public List<Tag> tagListView() {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<Tag> list = session.selectList("tagListView");
		session.close();
		return list;
	}
	
	// 해시태그 시퀀스 조회
	public Tag tagSeqView(String tag_content) {
		SqlSession session = sqlSessionFactory.openSession(true); // true >> commit
		Tag result = session.selectOne("tagSeqView", tag_content);
		session.close();
		return result;
	}
	
	// 게시물 해시태그 등록
	public int postTagInsert(int tag_seq) {
		SqlSession session = sqlSessionFactory.openSession(true); // true >> commit
		int cnt = session.insert("postTagInsert", tag_seq);
		session.close();
		return cnt;
	}
	
	// 해시태그 추가
	public int tagInsert(String tag_content) {
		SqlSession session = sqlSessionFactory.openSession(true); // true >> commit
		int cnt = session.insert("tagInsert", tag_content);
		session.close();
		return cnt;
	}
	
	// 게시물 해시태그 조회
	public List<Tag> postTagView(int post_seq) {
		SqlSession session = sqlSessionFactory.openSession(true); // true >> commit
		List<Tag> list = session.selectList("postTagView", post_seq);
		session.close();
		return list;
	}
	
	
	// 마이페이지 아이디어 게시물 조회 
//	public List<PostInfo> paging(int n) {
//		SqlSession session = sqlSessionFactory.openSession(true);
//		List<PostInfo> list = session.selectList("getListWithPagingMyIdea",n);
//		return list;
//	}
//	public List<PostInfo> pageCnt() {
//		SqlSession session = sqlSessionFactory.openSession();
//		List<PostInfo> cnt = session.selectList("getListSizeMyIdea");
//		session.close();
//		return cnt;
//	}

	
}
