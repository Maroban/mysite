package com.javaex.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaex.dao.UserDao;
import com.javaex.util.WebUtil;
import com.javaex.vo.UserVo;

@WebServlet("/user")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// post방식 한글 깨짐 방지
		request.setCharacterEncoding("UTF-8");

		// action 구분
		String action = request.getParameter("action");

		// UserDao 생성
		UserDao userDao = new UserDao();

		if ("joinForm".equals(action)) {
			/*************** joinForm ****************/
			System.out.println("[UserController.joinForm]");

			// joinForm.jsp 포워드
			WebUtil.forward(request, response, "/WEB-INF/views/user/joinForm.jsp");

		} else if ("join".equals(action)) {
			/*************** join ****************/
			System.out.println("[UserController.join");

			// 파라미터 값 꺼내기
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			String name = request.getParameter("name");
			String gender = request.getParameter("gender");

			// Vo로 묶기
			UserVo userVo = new UserVo(id, pw, name, gender);

			// Dao.insert(Vo) 메소드 사용
			userDao.insert(userVo);

			// join.jsp 포워드
			WebUtil.forward(request, response, "/WEB-INF/views/user/joinOk.jsp");

		} else if ("loginForm".equals(action)) {
			/*************** loginForm ****************/
			System.out.println("[UserController.loginForm");

			// loginForm.jsp 포워드
			WebUtil.forward(request, response, "/WEB-INF/views/user/loginForm.jsp");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);

	}

}
