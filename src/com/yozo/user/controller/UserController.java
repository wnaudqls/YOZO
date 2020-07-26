package com.yozo.user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yozo.user.dao.UserDao;
import com.yozo.user.dto.MemberDto;



@WebServlet("/user.do")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UserController() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		HttpSession session = request.getSession(true);


		String command = request.getParameter("command");
		UserDao dao = new UserDao();
		
		if(command.equals("login")) {
			
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			System.out.println("좀 되세요 싸발1");
			
			MemberDto dto = new MemberDto();
			dto.setMember_id(id);
			dto.setMember_pw(pw);
			
			
			MemberDto rdto = dao.login(id, pw);
			System.out.println("좀 되세요 싸발2");
			if (rdto != null) {
				session.setAttribute("dto", rdto);
				session.setMaxInactiveInterval(10*60);
				
				if (rdto.getMember_role().equals("ADMIN")) {
					response.sendRedirect("index.jsp");
				}
				
			} else {
				session = request.getSession();
				session.invalidate();
				System.out.println("로그아웃");
			}
			
			RequestDispatcher dispatch = request.getRequestDispatcher("index.jsp");
			dispatch.forward(request, response);	// 3 code이름을 받아온 값 info에 전달(option에서 받아온 주소)
			
		}
		
		
		
		
		
		if(command.equals("main")) {
		
			RequestDispatcher dispatch = request.getRequestDispatcher("index.jsp");
			dispatch.forward(request, response);	// 3 code이름을 받아온 값 info에 전달(option에서 받아온 주소)
			
		}
	}

}
