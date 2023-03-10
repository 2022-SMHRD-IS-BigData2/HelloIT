package com.smhrd.frontController;

import java.io.IOException;
import java.text.ParseException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.controller.BookmarkCon;
import com.smhrd.controller.CheckDBCon;
import com.smhrd.controller.CheckLanguageCon;
import com.smhrd.controller.CheckRoleCon;
import com.smhrd.controller.CmtLikeCon;
import com.smhrd.controller.CommentCon;
import com.smhrd.controller.Controller;
import com.smhrd.controller.GoAllPostMainCon;
import com.smhrd.controller.GoBoardCon;
import com.smhrd.controller.GoCtpSearchMainCon;
import com.smhrd.controller.GoCustomizedMainCon;
import com.smhrd.controller.GoDevInfoCon;
import com.smhrd.controller.FollowCon;
import com.smhrd.controller.GoIdeaCon;
import com.smhrd.controller.GoJoinCon;
import com.smhrd.controller.GoLoginCon;
import com.smhrd.controller.GoMainCon;
import com.smhrd.controller.GoMainWriteCon;
import com.smhrd.controller.GoMessageCon;
import com.smhrd.controller.GoMyPageCon;
import com.smhrd.controller.GoNaverJoinCon;
import com.smhrd.controller.GoPopPostMainCon;
import com.smhrd.controller.GoRecruitCon;
import com.smhrd.controller.GoRecruitSearchCon;
import com.smhrd.controller.GoTagMainCon;
import com.smhrd.controller.GoUserPageCon;
import com.smhrd.controller.GoViewCon;
import com.smhrd.controller.GoWriteCon;
import com.smhrd.controller.GoWriteIdea;
import com.smhrd.controller.GoogleJoin;
import com.smhrd.controller.InsertCareerCon;
import com.smhrd.controller.InsertMyPageCon;
import com.smhrd.controller.JoinCon;
import com.smhrd.controller.KakaoJoinCon;
import com.smhrd.controller.LikeCon;
import com.smhrd.controller.LoginCon;
import com.smhrd.controller.LogoutCon;
import com.smhrd.controller.MainBookmarkCon;
import com.smhrd.controller.MainCmtLikeCon;
import com.smhrd.controller.MainCommentCon;
import com.smhrd.controller.NaverLoginSuccessCon;
import com.smhrd.controller.PostLikeCon;
import com.smhrd.controller.UpdateCareerCon;
import com.smhrd.controller.UpdateDBCon;
import com.smhrd.controller.UpdateLanguageCon;
import com.smhrd.controller.UpdateMyPageCon;
import com.smhrd.controller.UpdateRecruitCon;
import com.smhrd.controller.UpdateRoleCon;
import com.smhrd.controller.UpdateSkillCon;
import com.smhrd.controller.UserLevelSettingCon;
import com.smhrd.controller.WriteCon;
import com.smhrd.controller.ajax.IdeaPostCntConAjax;
import com.smhrd.controller.ajax.MainCommentConAjax;
import com.smhrd.controller.ajax.MainLikeConAjax;

@WebServlet("*.do")
public class FrontController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	HashMap<String, Controller> handlerMapping;

	public void init(ServletConfig config) throws ServletException {

		handlerMapping = new HashMap<>();

		
		
		// google 로그인 테스트
		handlerMapping.put("/google.do", new GoogleJoin()); // 구글 회원가입 컨트롤러 테스트
		
		
		handlerMapping.put("/goRecruit.do", new GoRecruitCon()); // 채용공고 페이지 이동
		handlerMapping.put("/goMain.do", new GoMainCon()); // 메인페이지 이동
		handlerMapping.put("/goJoin.do", new GoJoinCon()); // 회원가입페이지 이동
		handlerMapping.put("/goLogin.do", new GoLoginCon()); // 로그인페이지 이동 
		handlerMapping.put("/goNaverJoin.do", new GoNaverJoinCon()); // 네이버 회원가입
		handlerMapping.put("/goMyPage.do", new GoMyPageCon()); // 마이페이지 이동
		handlerMapping.put("/goIdea.do", new GoIdeaCon()); // 아이디어 페이지 이동
		handlerMapping.put("/goBoard.do", new GoBoardCon()); // 게시판 페이지 이동
		handlerMapping.put("/goWrite.do", new GoWriteCon()); // 게시물 작성 페이지 이동
		handlerMapping.put("/goMainWrite.do", new GoMainWriteCon()); // 메인에서 게시물 작성 페이지 이동
		handlerMapping.put("/goView.do", new GoViewCon()); // 게시물 조회 페이지 이동
		handlerMapping.put("/goCustomizedMain.do", new GoCustomizedMainCon()); // 맞춤형게시물 이동
		handlerMapping.put("/goTagMain.do", new GoTagMainCon()); // 태그메인 이동
		handlerMapping.put("/goCtpSearchMain.do", new GoCtpSearchMainCon()); // 
		handlerMapping.put("/goPopPostMain.do", new GoPopPostMainCon()); // 인기게시물 페이지 이동
		handlerMapping.put("/goAllPostMain.do", new GoAllPostMainCon()); // 모든 게시물 페이지 이동
		handlerMapping.put("/goRecruitSearch.do", new GoRecruitSearchCon()); // 채용공고 검색 컨트롤러
		handlerMapping.put("/goUserPage.do", new GoUserPageCon()); // 유저페이지 이동
		handlerMapping.put("/goWriteIdea.do", new GoWriteIdea()); // 아이디어토론방 글쓰기페이지 이동
		handlerMapping.put("/goMessage.do", new GoMessageCon()); // 마이페이지 이동
		handlerMapping.put("/goDevInfo.do", new GoDevInfoCon()); // 보고또보고 팀 소개페이지 이동
		
		
		handlerMapping.put("/write.do", new WriteCon()); // 게시물 등록 컨트롤러 이동
		handlerMapping.put("/comment.do", new CommentCon()); // 댓글 등록 컨트롤러 이동
		handlerMapping.put("/mainCmt.do", new MainCommentConAjax()); // 메인에서 댓글 등록 컨트롤러 이동
		handlerMapping.put("/like.do", new LikeCon()); // 좋아요 컨트롤러 이동
		handlerMapping.put("/mainLike.do", new MainLikeConAjax()); // 메인에서 좋아요 컨트롤러 이동
		handlerMapping.put("/cmtLike.do", new CmtLikeCon()); // 메인에서 댓글 좋아요 컨트롤러 이동
		handlerMapping.put("/mainCmtLike.do", new MainCmtLikeCon()); // 메인에서 댓글 좋아요 컨트롤러 이동
		handlerMapping.put("/bookmark.do", new BookmarkCon()); // 북마크 컨트롤러 이동
		handlerMapping.put("/mainBookmark.do", new MainBookmarkCon()); // 메인에서 북마크 컨트롤러 이동
		handlerMapping.put("/userLevelSetting.do", new UserLevelSettingCon()); // 유저 레벨 설정 컨트롤러 이동
		handlerMapping.put("/follow.do", new FollowCon()); // 유저 레벨 설정 컨트롤러 이동
		
		
		
		
		handlerMapping.put("/insertMyPage.do", new InsertMyPageCon()); // 마이페이지 정보 저장 컨트롤러 
		handlerMapping.put("/insertCareer.do", new InsertCareerCon()); // 커리어 정보 저장 컨트롤러
		handlerMapping.put("/checkDB.do", new CheckDBCon()); // 회원 DB 정보 저장 컨트롤러
		handlerMapping.put("/checkLanguage.do", new CheckLanguageCon()); // 회원 언어 정보 저장 컨트롤러
		handlerMapping.put("/checkRole.do", new CheckRoleCon()); // 회원 역할 저장 컨트롤러
		handlerMapping.put("/updateMyPage.do", new UpdateMyPageCon()); // 마이페이지 정보 수정 컨트롤러 
		handlerMapping.put("/updateCareer.do", new UpdateCareerCon()); // 커리어 정보 수정 컨트롤러
		handlerMapping.put("/updateDB.do", new UpdateDBCon()); // 회원 DB 정보 수정 컨트롤러
		handlerMapping.put("/updateLanguage.do", new UpdateLanguageCon()); // 회원 언어 정보 수정 컨트롤러
		handlerMapping.put("/updateRole.do", new UpdateRoleCon()); // 회원 역할 수정 컨트롤러
		handlerMapping.put("/updateSkill.do", new UpdateSkillCon()); // 회원 역할 수정 컨트롤러
		handlerMapping.put("/updateRecruit.do", new UpdateRecruitCon()); // 이력서 포트폴리오
		handlerMapping.put("/login.do", new LoginCon()); // 로그인 컨트롤러
		handlerMapping.put("/naverLoginSuccess.do", new NaverLoginSuccessCon()); // 네이버로그인 성공 컨트롤러
		handlerMapping.put("/join.do", new JoinCon()); // 회원가입 컨트롤러
		handlerMapping.put("/kakaoJoin.do", new KakaoJoinCon()); // 카카오 회원가입 컨트롤러
		handlerMapping.put("/logout.do", new LogoutCon()); // 로그아웃 컨트롤러
		
		
		handlerMapping.put("/ideaPostCnt.do", new IdeaPostCntConAjax()); // 아이디어토론방 게시물 조회수 컨트롤러 Ajax
		handlerMapping.put("/mainCmtLikeConAjax.do", new com.smhrd.controller.ajax.MainCmtLikeConAjax()); // 메인페이지 댓글 좋아요 컨트롤러 Ajax
		handlerMapping.put("/mainCommentConAjax.do", new com.smhrd.controller.ajax.MainCommentConAjax()); // 메인페이지 댓글 컨트롤러 Ajax
		handlerMapping.put("/mainBookmarkConAjax.do", new com.smhrd.controller.ajax.MainBookmarkConAjax()); // 메인페이지 게시물 북마크 컨트롤러 Ajax
		handlerMapping.put("/mainLikeConAjax.do", new com.smhrd.controller.ajax.MainLikeConAjax()); // 메인페이지 게시물 좋아요 컨트롤러 Ajax
		
		
		
		
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 1. urlMapping 확인
		// 전체 주소 : FrontController/join.do (FrontController/guest/join.do)
		String uri = request.getRequestURI();

		// Context Path : FrontController
		String cpath = request.getContextPath();

		// UrlMapping : /join.do
		String mapping = uri.substring(cpath.length());

		System.out.println(mapping);

// ----------------------------------------------------------------------------------------------------------------
		// Command Pattern
		String nextPage = null;

		// Controller Interface로 업캐스팅해서 모든 Con들을 담아줄 수 있게 만듦.
		Controller con = null;

		// 요청에 맞는 POJO 꺼내기
		con = handlerMapping.get(mapping);

		if (con != null) {
			try {
				nextPage = con.execute(request, response);
			} catch (ServletException | IOException | ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

// ----------------------------------------------------------------------------------------------------------------

		// 3. 페이지 이동

		if (nextPage != null) {

			if (nextPage.contains("redirect:/")) {
				response.sendRedirect(nextPage.split(":/")[1]);
			} 
			else {
				RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/" + nextPage + ".jsp");
				// forward이동하는 코드
				rd.forward(request, response);
			}

		}

	}

}
