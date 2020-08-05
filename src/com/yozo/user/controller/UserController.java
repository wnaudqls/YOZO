package com.yozo.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yozo.user.dao.UserDao;
import com.yozo.user.dto.MemberDto;
import com.yozo.user.util.MyAuthentication;

@WebServlet("/user.do")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserController() {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		//세션객체 만들어줌
		HttpSession session = request.getSession(true);


		String command = request.getParameter("command");
		System.out.println(command);
		UserDao dao = new UserDao();
		

		if(command.equals("main")) {
			System.out.println("............입성");
		
			RequestDispatcher dispatch = request.getRequestDispatcher("view/main/main.jsp");
			dispatch.forward(request, response);	// 3 code이름을 받아온 값 info에 전달(option에서 받아온 주소)
			
		} else if(command.equals("loginform")) {
			System.out.println("loginform........입성");
			RequestDispatcher dispatch = request.getRequestDispatcher("view/user/login.jsp");
			dispatch.forward(request, response);	// 3 code이름을 받아온 값 info에 전달(option에서 받아온 주소)
			
		} else if (command.equals("login")) {
			System.out.println("login입성........입성");
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			
			MemberDto dto = new MemberDto();
			dto.setMember_id(id);
			dto.setMember_pw(pw);
			System.out.println("id = " +id);
			
			MemberDto rdto = dao.login(id, pw);
			
			System.out.println(rdto+"sdsd");
			
			
			if (rdto != null) {
				//세션만들기
				session.setAttribute("rdto", rdto);			
				session.setMaxInactiveInterval(10*60);	

				System.out.println("세션 정보 : "+ session);
				
				PrintWriter out = response.getWriter();
				out.println("<script type='text/javascript'>alert('계정이 등록 되었습니다'); </script>");
				
				request.setAttribute("session", session);
				
				RequestDispatcher dispatch = request.getRequestDispatcher("user.do?command=main");
				dispatch.forward(request, response);
				
				/* 사용자 권한 관련 if문
				 * if (rdto.getMember_role().equals("ADMIN")) {
				 * response.sendRedirect("index.jsp?"); }
				 */
				
				
				
				
			} else {
				System.out.println("로그인 실패");
				
				response.sendRedirect("user.do?command=loginform");
				

				/*
				 * out.println(); out.
				 * println("<html><head></head><script type=\"text/javascript\" src=\"https://code.jquery.com/jquery-3.5.1.min.js\"></script><script type=\"text/javascript\">"
				 * ); out.println("alert('아이디 or 비밀번호를 확인해 주세요')");
				 * out.println("</script></html>");
				 */

				
			}
			
			
			/* 로그아웃
			 * else { session = request.getSession(); session.invalidate();
			 * System.out.println("로그아웃"); }
			 */
			
			
			
		} else if (command.equals("joinform")) {
			System.out.println("JOINFORM.......입성");
			RequestDispatcher dispatch = request.getRequestDispatcher("/view/user/join.jsp");
			dispatch.forward(request, response);
			System.out.println("............입성1");
			
		} else if (command.equals("idcheck")) {
			// 1.
			String id = request.getParameter("id");
			
			// 2.
			MemberDto dto = dao.idCheck(id);
			boolean idnotused = true;
			if (dto != null) {
				idnotused = false;
			}
			// 3.
			// 4.
			response.sendRedirect("/YORIZORI/view/user/idcheck.jsp?idnotused="+idnotused);
		
		} else if (command.equals("nickcheck")) {
			System.out.println("nickcheck.......입성");
			String nick = request.getParameter("nick");
			
			// 2.
			MemberDto dto = dao.nickCheck(nick);
			boolean nicknotused = true;
			if (dto != null) {
				nicknotused = false;
			}
			// 3.
			// 4.
			response.sendRedirect("/YORIZORI/view/user/nickcheck.jsp?nicknotused="+nicknotused);
			
		
		} else if (command.equals("join")){
			System.out.println("join입성");
			
			
			
			 String id = request.getParameter("id"); 
			 String nick = request.getParameter("nick"); 
			 String name = request.getParameter("name");
			 String pw = request.getParameter("pw"); 
			 String email = request.getParameter("email"); 
			 String road_addr_part1 = request.getParameter("road_addr_part1");
			 String road_addr_part2 = request.getParameter("road_addr_part2");
			 String addr_detail = request.getParameter("addr_detail");
			 String phone = request.getParameter("phone");
			 
			 String addr = road_addr_part1 + " " + road_addr_part2 + " " + addr_detail;
			 
			 System.out.println(id+nick+name+pw+email+addr+phone);
			 
			 
			
			
			 MemberDto dto = new
			 MemberDto(0,id,pw,name,nick,email,"OO",true,"N",phone,addr,"회원");
			 
			 System.out.println("controller dto = "+dto);
			 
			 boolean res = dao.insert(dto);
			 
			 if (res) { 
				 PrintWriter out = response.getWriter();
				 out.println("<script>alert('계정이 등록 되었습니다.'); </script>");
				 response.sendRedirect("/YORIZORI/view/user/login.jsp"); 
			 } else { 
				 PrintWriter out = response.getWriter();
				 out.println("<script>alert('계정이 등록 되지 않았습니다.'); </script>");
				 response.sendRedirect("history.back()"); 
			 }
			
		
		
		} else if (command.equals("sendEmail")) {
			

			Properties props = System.getProperties();
			/*
			props.put("mail.smtp.starttls.enable", "true"); // gmail은 무조건 true 고정
			props.put("mail.smtp.host", "smtp.gmail.com"); // smtp 서버 주소
			props.put("mail.smtp.auth","true"); // gmail은 무조건 true 고정 
			props.put("mail.smtp.port","587"); // gmail 포트
			*/         
	        props.put("mail.smtp.user", "lhseunge"); // 서버 아이디만 쓰기
			props.put("mail.smtp.host", "smtp.gmail.com"); // 구글 SMTP
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.socketFactory.fallback", "false");
	           
	        Authenticator auth = new MyAuthentication();
	         
	        //session 생성 및  MimeMessage생성
	        Session session1 = Session.getDefaultInstance(props, auth);
	        MimeMessage msg = new MimeMessage(session1);
	       
	        try{
	            //편지보낸시간
	            msg.setSentDate(new Date());
	             
	            InternetAddress from = new InternetAddress("YORIZORI") ;             

	            // 이메일 발신자
	            msg.setFrom(from);           
	             
	            // 이메일 수신자
	            String email = request.getParameter("email"); //사용자가 입력한 이메일 받아오기
	            InternetAddress to = new InternetAddress(email);
	            msg.setRecipient(Message.RecipientType.TO, to);
	             
	            // 이메일 제목
	            msg.setSubject("요리조리에서 보내는 인증번호." , "UTF-8");
	             
	            // 이메일 내용 

	            String code = request.getParameter("random"); //인증번호 값 받기
	            request.setAttribute("code", code);
	            msg.setText("인증번호는 "+code+" 입니다.\n 정확하게 입력해 주세요.", "UTF-8");
	             
	            // 이메일 헤더 
	            msg.setHeader("content-Type", "text/html");
	             
	            //메일보내기
	            javax.mail.Transport.send(msg);
	          
	            
	             
	        }catch (AddressException addr_e) {
	            addr_e.printStackTrace();
	        }catch (MessagingException msg_e) {
	            msg_e.printStackTrace();
	        }

		        
		}
		
		
		
	}
		
		



}
