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

import com.smhrd.controller.Controller;
import com.smhrd.controller.GoJoinCon;
import com.smhrd.controller.GoMainCon;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	HashMap<String, Controller> handlerMapping;
	
	public void init(ServletConfig config) throws ServletException {
		
		handlerMapping = new HashMap<>();
		handlerMapping.put("/goMain.do", new GoMainCon()); // 메인 이동
		handlerMapping.put("/goJoin.do", new GoJoinCon()); // 메인 이동
		
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


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
		 con = handlerMapping.get( mapping );		
		
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
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/"+nextPage+".jsp");
				// forward이동하는 코드
				rd.forward(request, response);
			}
			
		}
	
	}

}
