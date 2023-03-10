package com.smhrd.controller;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.UserLanguageInfoDAO;
import com.smhrd.entity.UserLanguageInfo;

public class CheckLanguageCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException {
		
		request.setCharacterEncoding("UTF-8");
		String u_email = request.getParameter("u_email");
	    String html = request.getParameter("html");
	    String css  = request.getParameter("css");
	    String javascript = request.getParameter("javascript");
	    String c_sharp = request.getParameter("c_sharp");
	    String java = request.getParameter("java");
	    String python = request.getParameter("python");
	    String php = request.getParameter("php");
	    String dart = request.getParameter("dart");
	    String typescript = request.getParameter("typescript");
	    String kotlin = request.getParameter("kotlin");
	    String go = request.getParameter("go");
	    String r = request.getParameter("r");
	    String rust = request.getParameter("rust");
	    String swift = request.getParameter("swift");
	    String scala = request.getParameter("scala");
	    String objective_c = request.getParameter("objective_c");
	    String ruby = request.getParameter("ruby");
	    String haskell = request.getParameter("haskell");
	    String clojure = request.getParameter("clojure");
	    String sql = request.getParameter("sql");
	    String language_etc = request.getParameter("language_etc");
	    
	    UserLanguageInfo dto = new UserLanguageInfo();
	    dto.setU_email(u_email);
	    dto.setHtml(html);;
	    dto.setCss(css);
	    dto.setJavascript(javascript);
	    dto.setC_sharp(c_sharp);;
	    dto.setJava(java);
	    dto.setPython(python);
	    dto.setPhp(php);
	    dto.setDart(dart);
	    dto.setTypescript(typescript);
	    dto.setKotlin(kotlin);
	    dto.setGo(go);
	    dto.setRust(rust);
	    dto.setSwift(swift);
	    dto.setScala(scala);
	    dto.setObjective_c(objective_c);
	    dto.setR(r);
	    dto.setRuby(ruby);
	    dto.setHaskell(haskell);
	    dto.setClojure(clojure);
	    dto.setSql(sql);
	    dto.setLanguage_etc(language_etc);
	    UserLanguageInfoDAO dao = new UserLanguageInfoDAO();
	    int cnt = dao.checkLanguage(dto);
	    String nextPage = "";
		if (cnt > 0) {
			// ??????
			System.out.println("?????? ?????? ?????? ??????");
			// ??????????????????
			// ?????? ???????????? ??????????????? ????????????, ??????????????? ???????????????.
			// redirect??? ??? ?????????, ?????? redirect:/ ??? ???????????? ??????
			nextPage = "redirect:/goMyPage.do";

		} else {
			// ??????
			System.out.println("?????? ?????? ?????? ??????");
			nextPage = "redirect:/goMyPage.do";
		}
		return nextPage;
	}

}
