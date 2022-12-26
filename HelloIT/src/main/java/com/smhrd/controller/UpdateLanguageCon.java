package com.smhrd.controller;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.MyPageInfoDAO;
import com.smhrd.dao.UserLanguageInfoDAO;
import com.smhrd.entity.MyPageInfo;
import com.smhrd.entity.UserLanguageInfo;

public class UpdateLanguageCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException {
		
		request.setCharacterEncoding("UTF-8");
		String u_email = request.getParameter("u_email");
	    String[] html = request.getParameterValues("html");
	    String[] css  = request.getParameterValues("css");
	    String[] javascript = request.getParameterValues("javascript");
	    String[] c_sharp = request.getParameterValues("c_sharp");
	    String[] java = request.getParameterValues("java");
	    String[] python = request.getParameterValues("python");
	    String[] php = request.getParameterValues("php");
	    String[] dart = request.getParameterValues("dart");
	    String[] typescript = request.getParameterValues("typescript");
	    String[] kotlin = request.getParameterValues("kotlin");
	    String[] go = request.getParameterValues("go");
	    String[] r = request.getParameterValues("r");
	    String[] rust = request.getParameterValues("rust");
	    String[] swift = request.getParameterValues("swift");
	    String[] scala = request.getParameterValues("scala");
	    String[] objective_c = request.getParameterValues("objective_c");
	    String[] ruby = request.getParameterValues("ruby");
	    String[] haskell = request.getParameterValues("haskell");
	    String[] clojure = request.getParameterValues("clojure");
	    String[] sql = request.getParameterValues("sql");
	    String[] language_etc = request.getParameterValues("language_etc");
	    
	    UserLanguageInfo dto = new UserLanguageInfo();
	    dto.setU_email(u_email);
	    dto.setHtml(html[0]);
	    dto.setCss(css[0]);
	    dto.setJavascript(javascript[0]);
	    dto.setC_sharp(c_sharp[0]);
	    dto.setJava(java[0]);
	    dto.setPython(python[0]);
	    dto.setPhp(php[0]);
	    dto.setDart(dart[0]);
	    dto.setTypescript(typescript[0]);
	    dto.setKotlin(kotlin[0]);
	    dto.setGo(go[0]);
	    dto.setRust(rust[0]);
	    dto.setSwift(swift[0]);
	    dto.setScala(scala[0]);
	    dto.setObjective_c(objective_c[0]);
	    dto.setR(r[0]);
	    dto.setRuby(ruby[0]);
	    dto.setHaskell(haskell[0]);
	    dto.setClojure(clojure[0]);
	    dto.setSql(sql[0]);
	    dto.setLanguage_etc(language_etc[0]);
	    UserLanguageInfoDAO dao = new UserLanguageInfoDAO();
	    int cnt = dao.updateLanguage(dto);
	    String nextPage = "";
		if (cnt > 0) {
			// 성공
			System.out.println("회원 언어 수정 성공");
			// 메인페이지로
			// 이미 이동하는 컨트롤러가 있는경우, 컨트롤러로 이동시키자.
			// redirect를 하 는경우, 앞에 redirect:/ 를 붙이기로 약속
			nextPage = "redirect:/goMyPage.do";

		} else {
			// 실패
			System.out.println("회원 언어 수정 실패");
			nextPage = "redirect:/goMyPage.do";
		}
		return nextPage;
	}

}
