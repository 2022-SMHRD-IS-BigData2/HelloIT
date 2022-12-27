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
import com.smhrd.controller.GoBoardCon;
import com.smhrd.controller.GoJoinCon;
import com.smhrd.controller.GoNaverJoinCon;
import com.smhrd.controller.GoLoginCon;
import com.smhrd.controller.GoMainCon;
import com.smhrd.controller.GoMainWriteCon;
import com.smhrd.controller.GoMyPageCon;
import com.smhrd.controller.GoViewCon;
import com.smhrd.controller.GoWriteCon;
import com.smhrd.controller.GoogleJoin;
import com.smhrd.controller.InsertCareerCon;
import com.smhrd.controller.InsertMyPageCon;
import com.smhrd.controller.JoinCon;
import com.smhrd.controller.KakaoJoinCon;
import com.smhrd.controller.LikeCon;
import com.smhrd.controller.LoginCon;
import com.smhrd.controller.MainBookmarkCon;
import com.smhrd.controller.MainCmtLikeCon;
import com.smhrd.controller.MainCommentCon;
import com.smhrd.controller.MainLikeCon;
import com.smhrd.controller.NaverLoginSuccessCon;
import com.smhrd.controller.UpdateCareerCon;
import com.smhrd.controller.UpdateDBCon;
import com.smhrd.controller.UpdateLanguageCon;
import com.smhrd.controller.UpdateMyPageCon;
import com.smhrd.controller.UpdateRecruitCon;
import com.smhrd.controller.UpdateRoleCon;
import com.smhrd.controller.UpdateSkillCon;
import com.smhrd.controller.WriteCon;
import com.smhrd.controller.GoRecruitCon;
import com.smhrd.dao.GoIdeaCon;

@WebServlet("*.do")
public class FrontController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	HashMap<String, Controller> handlerMapping;

	public void init(ServletConfig config) throws ServletException {

		handlerMapping = new HashMap<>();
		handlerMapping.put("/goMain.do", new GoMainCon()); // 메인 이동
		handlerMapping.put("/goJoin.do", new GoJoinCon()); // 회원가입창 이동
		handlerMapping.put("/goLogin.do", new GoLoginCon()); // 로그인창 이동 
		handlerMapping.put("/goNaverJoin.do", new GoNaverJoinCon()); // 네이버 회원가입
		handlerMapping.put("/goMyPage.do", new GoMyPageCon()); // 마이페이지 이동
		handlerMapping.put("/goRecruit.do", new GoRecruitCon()); // 마이페이지 이동
		
		
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
		handlerMapping.put("/naverLoginSuccess.do", new NaverLoginSuccessCon()); // 
		handlerMapping.put("/join.do", new JoinCon()); // 
		handlerMapping.put("/kakaoJoin.do", new KakaoJoinCon()); // 
		
		
		// google 로그인 테스트
		handlerMapping.put("/google.do", new GoogleJoin()); // 
		
		
		handlerMapping.put("/goIdea.do", new GoIdeaCon()); // 
		handlerMapping.put("/goBoard.do", new GoBoardCon()); // 게시판 페이지 이동
		handlerMapping.put("/goWrite.do", new GoWriteCon()); // 게시물 작성 페이지 이동
		handlerMapping.put("/goMainWrite.do", new GoMainWriteCon()); // 메인에서 게시물 작성 페이지 이동
		handlerMapping.put("/goView.do", new GoViewCon()); // 게시물 조회 페이지 이동
		
		
		handlerMapping.put("/recruit.do", new GoRecruitCon());
		
		
		handlerMapping.put("/write.do", new WriteCon()); // 게시물 등록 컨트롤러 이동
		handlerMapping.put("/comment.do", new CommentCon()); // 댓글 등록 컨트롤러 이동
		handlerMapping.put("/mainCmt.do", new MainCommentCon()); // 메인에서 댓글 등록 컨트롤러 이동
		handlerMapping.put("/like.do", new LikeCon()); // 좋아요 컨트롤러 이동
		handlerMapping.put("/mainLike.do", new MainLikeCon()); // 메인에서 좋아요 컨트롤러 이동
		
		
		handlerMapping.put("/cmtLike.do", new CmtLikeCon()); // 메인에서 댓글 좋아요 컨트롤러 이동
		handlerMapping.put("/mainCmtLike.do", new MainCmtLikeCon()); // 메인에서 댓글 좋아요 컨트롤러 이동
		handlerMapping.put("/bookmark.do", new BookmarkCon()); // 북마크 컨트롤러 이동
		handlerMapping.put("/mainBookmark.do", new MainBookmarkCon()); // 메인에서 북마크 컨트롤러 이동
		
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
