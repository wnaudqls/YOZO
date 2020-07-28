package com.yozo.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		HttpSession session = request.getSession(true);


		String command = request.getParameter("command");
		UserDao dao = new UserDao();
		
		

		if(command.equals("main")) {
		
			RequestDispatcher dispatch = request.getRequestDispatcher("view/main/main.jsp");
			dispatch.forward(request, response);	// 3 code이름을 받아온 값 info에 전달(option에서 받아온 주소)
			
		} else if(command.equals("loginform")) {
			
			RequestDispatcher dispatch = request.getRequestDispatcher("view/user/login.jsp");
			dispatch.forward(request, response);	// 3 code이름을 받아온 값 info에 전달(option에서 받아온 주소)
			
		} else if (command.equals("login")) {
			
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			
			MemberDto dto = new MemberDto();
			dto.setMember_id(id);
			dto.setMember_pw(pw);
			System.out.println("id = " +id);
			
			MemberDto rdto = dao.login(id, pw);
			
			System.out.println(rdto);
			
			
			if (rdto != null) {
				session.setAttribute("dto", rdto);		
				session.setMaxInactiveInterval(10*60);
				
				RequestDispatcher dispatch = request.getRequestDispatcher("user.do?command=main");
				dispatch.forward(request, response);
				
				/* 사용자 권한 관련 if문
				 * if (rdto.getMember_role().equals("ADMIN")) {
				 * response.sendRedirect("index.jsp?"); }
				 */
				
				
				
			} else {
				System.out.println("로그인 실패");
				
				response.sendRedirect("user.do?command=loginform");
				PrintWriter out = response.getWriter();
				out.println();
				out.println("<html><head></head><script type=\"text/javascript\">"); 
				out.println("<h1>Hello, world</h1><p>this is sample servlet.</p>"); 
				out.println("</script></html>");

				
			}
			
			
			/* 로그아웃
			 * else { session = request.getSession(); session.invalidate();
			 * System.out.println("로그아웃"); }
			 */
			
			
			
		} else if (command.equals("joinform")) {
			
			response.sendRedirect("view/user/join.jsp");
			
		} else if (command.equals("idcheck")) {
			// 1.
			String id = request.getParameter("id");
			
			System.out.println(id);
			// 2.
			MemberDto dto = dao.idCheck(id);
			System.out.println("잘왔니??"+dto);
			boolean idnotused = true;
			if (dto != null) {
				idnotused = false;
			}
			// 3.
			// 4.
			response.sendRedirect("/YORIZORI/view/user/idcheck.jsp?idnotused="+idnotused);
		
		} else if (command.equals("nickcheck")) {
			
			String nick = request.getParameter("nick");
			
			System.out.println(nick);
			// 2.
			MemberDto dto = dao.nickCheck(nick);
			System.out.println("잘왔니??"+dto);
			boolean nicknotused = true;
			if (dto != null) {
				nicknotused = false;
			}
			// 3.
			// 4.
			response.sendRedirect("/YORIZORI/view/user/nickcheck.jsp?nicknotused="+nicknotused);
			
		}
		
		
		
		
		
	}

}
