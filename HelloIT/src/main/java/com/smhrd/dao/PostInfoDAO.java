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
	
	// 6. 세션 유저 레벨 조회
	public List<UserLevel> userLevelView(UserLevel dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<UserLevel> list = session.selectList("userLevelView", dto);
		session.close();
		return list;
	}
	
	// 7. 게시물 유저 레벨 등록
	public int postLevelSetting(UserLevel dto) {
		SqlSession session = sqlSessionFactory.openSession(true); // true >> commit
		int cnt = session.insert("postLevelSetting", dto);
		session.close();
		return cnt;
	}
	
	// 8. 게시글 전체 조회
	public List<Tag> tagListView() {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<Tag> list = session.selectList("tagListView");
		session.close();
		return list;
	}
	
	// 9. 해시태그 시퀀스 조회
	public Tag tagSeqView(String tag_content) {
		SqlSession session = sqlSessionFactory.openSession(true); // true >> commit
		Tag result = session.selectOne("tagSeqView", tag_content);
		session.close();
		return result;
	}
	
	// 10. 게시물 해시태그 등록
	public int postTagInsert(int tag_seq) {
		SqlSession session = sqlSessionFactory.openSession(true); // true >> commit
		int cnt = session.insert("postTagInsert", tag_seq);
		session.close();
		return cnt;
	}
	
	// 11. 해시태그 추가
	public int tagInsert(String tag_content) {
		SqlSession session = sqlSessionFactory.openSession(true); // true >> commit
		int cnt = session.insert("tagInsert", tag_content);
		session.close();
		return cnt;
	}
	
	// 12. 게시물 해시태그 조회
	public List<Tag> postTagView(int post_seq) {
		SqlSession session = sqlSessionFactory.openSession(true); // true >> commit
		List<Tag> list = session.selectList("postTagView", post_seq);
		session.close();
		return list;
	}
	
}
