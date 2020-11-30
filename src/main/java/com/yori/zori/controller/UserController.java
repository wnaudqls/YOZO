package com.yori.zori.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.yori.zori.model.biz.UserBiz;
import com.yori.zori.model.dto.MemberDto;

@Controller
public class UserController {
	Logger logger = LoggerFactory.getLogger("UserController");
	@Autowired
	UserBiz biz;
	public UserController() {
	}


	@RequestMapping(value="loginres",method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Boolean> login(@RequestBody MemberDto dto, HttpSession session) {
		
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		boolean chk = false;
		

		MemberDto res = biz.login(dto);
		logger.info("아이디: {} \n 비밀번호: {}",dto.getMember_id(),
				dto.getMember_pw());
		
		if(res != null) {
			chk = true;
			session.setAttribute("login", res);
		}
		
		map.put("check", chk);
		return map;
		
	}
	@RequestMapping("/success")
	public String loginsuccess() {
		return "redirect:/";
	}
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	
	/*protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		//세션객체 만들어줌
		HttpSession session = request.getSession(true);


		String command = request.getParameter("command");
		System.out.println(command);
		
		

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
			
			MemberDto rdto = dao.login(id, pw);
			
			
			
			if (rdto != null) {
				//세션만들기
					
					

				System.out.println("세션 정보 : "+ session.getId());
				System.out.println("세션 정보 : "+ session.getCreationTime());
				System.out.println("세션 정보 : "+ session.getMaxInactiveInterval());
				
				PrintWriter out = response.getWriter();
				out.println("<script type='text/javascript'>alert('계정이 등록 되었습니다'); </script>");
				session.setAttribute("rdto", rdto);		
				session.setMaxInactiveInterval(4000*60);
				
				RequestDispatcher dispatch = request.getRequestDispatcher("recipe.do?command=recipe_list");
				dispatch.forward(request, response);
				
			} else {
				
				 * session.setAttribute("rdto", rdto); 
				 * session.setMaxInactiveInterval(1000*60);
				 
				System.out.println("로그인 실패");
				
				String s = "<script type='text/javascript'>" + "alert('ID, PW를 확인해 주세요');" + "location.href='view/user/login.jsp';"
						+ "</script>";
				response.getWriter().append(s);
			}
			
		} else if (command.equals("moveMap")) {
			
			//RequestDispatcher dispatch = request.getRequestDispatcher("/view/map/map.jsp");
			//dispatch.forward(request, response);
			
			
			 * session.setAttribute("rdto", rdto); session.setMaxInactiveInterval(1000*60);
			 
			
			System.out.println("컨트롤러 무브맵");
			response.sendRedirect("/YORIZORI/view/map/map.jsp");
			
		} else if (command.equals("logout")) {

			response.sendRedirect("user.do?command=main");
			session.invalidate();

			
		} else if (command.equals("joinform")) {
			System.out.println("JOINFORM.......입성");
			response.sendRedirect("/YORIZORI/view/user/join.jsp");
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
			 MemberDto(0,id,pw,name,nick,email,null,"TRUE","N",phone,addr,"회원");
			 
			 System.out.println("controller dto = "+dto);
			 
			 boolean res = dao.insert(dto);
			 
			 if (res) { 
				// PrintWriter out = response.getWriter();
				 //out.println("<script>alert('계정이 등록 되었습니다.'); </script>");
				 //response.sendRedirect("/YORIZORI/view/user/login.jsp");
				 jsResponse("회원가입을 성공적으로 마쳤습니다.로그인을 해주세요.","user.do?command=loginform" , response);
			 } else { 
				 //PrintWriter out = response.getWriter();
				 //out.println("<script>alert('계정이 등록 되지 않았습니다.'); </script>");
				 //response.sendRedirect("history.back()");
				 jsResponse("회원가입을 실패했습니다!","user.do?command=main" , response);
			 }
			
		
		
		} else if (command.equals("kakao_join")){
			System.out.println("Kjoin입성");
			
			
			
			 String id = request.getParameter("id"); 
			 String nick = request.getParameter("nick"); 
			 String name = request.getParameter("name");
			 String pw = request.getParameter("pw"); 
			 String email = request.getParameter("email"); 
			 
			 
			System.out.println(id + nick+ name + pw + email);
			
			 MemberDto dto = new MemberDto(0,id,pw,name,nick,email,"null","TRUE","N","null","null","회원");
			 
			 System.out.println("controller dto = "+dto);
			 
			 boolean res = dao.insert(dto);
			 
			 if (res) { 
				 
				 response.sendRedirect("/YORIZORI/view/user/login.jsp"); 
			 } else { 

				 response.sendRedirect("history.back()"); 
			 }
			 
		} else if (command.equals("naver_join")){
			System.out.println("Njoin입성");
			
			
			
			String id = request.getParameter("id"); 
			String nick = request.getParameter("nick"); 
			String name = request.getParameter("name");
			String pw = request.getParameter("pw"); 
			String email = request.getParameter("email"); 
			
			
			System.out.println(id + nick+ name + pw + email);
			
			MemberDto dto = new MemberDto(0,id,pw,name,nick,email,"null","TRUE","N","null","null","회원");
			
			System.out.println("controller dto = "+dto);
			
			boolean res = dao.insert(dto);
			
			if (res) { 
				
				response.sendRedirect("/YORIZORI/view/user/login.jsp"); 
			} else { 

				response.sendRedirect("history.back()"); 
			}
			
		} else if (command.equals("updateform")) {
			
			
			response.sendRedirect("/YORIZORI/view/user/editLogin.jsp");

			
			 //RequestDispatcher dispatch = request.getRequestDispatcher("/view/user/editLogin.jsp");
			 //dispatch.forward(request, response);
			
		} else if (command.equals("edit_account")) {
			
			System.out.println("update입성........입성");
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			
			MemberDto dto = new MemberDto();
			dto.setMember_id(id);
			dto.setMember_pw(pw);
			
			MemberDto rdto = dao.login(id, pw);
			
			request.setAttribute("rdto", rdto);
			
			System.out.println("");

			if (rdto != null) {
				
					System.out.println("아무거나 테스트");			
				RequestDispatcher dispatch = request.getRequestDispatcher("/view/user/edit_account.jsp");
				dispatch.forward(request, response);
				
			} else {
				
				String s = "<script type='text/javascript'>" + "alert('ID, PW를 확인해 주세요');" + "location.href='view/user/login.jsp';"
						+ "</script>";
				
				response.getWriter().append(s);
				
				RequestDispatcher dispatch = request.getRequestDispatcher("/view/user/editLogin.jsp");
				dispatch.forward(request, response);
			}
			
			
			 
		} else if (command.equals("update")) {
			
			System.out.println("컨트롤러 업데이트");
			
			int no = Integer.parseInt(request.getParameter("no"));
			System.out.println(no);
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

			 MemberDto dto = new MemberDto(no,id,pw,name,nick,email,"null","TRUE","N",phone,addr,"회원");
			 
				System.out.println("controller dto = "+dto);

			
			boolean res = dao.update(dto);
			
			if (res) { 
				session.invalidate();
				response.sendRedirect("view/user/login.jsp");
				String s = "<script type='text/javascript'>" + "alert('수정되었습니다.\n다시 로그인 해주세요.');" + "location.href='view/user/login.jsp';"
						+ "</script>";
				response.getWriter().append(s);

				
			} else { 

				System.out.println("안바뀌었어 다시 해");
			}
			
			
		} else if (command.equals("deleteUser")) {
			
			String id = request.getParameter("id");
			
			MemberDto dto = new MemberDto(id, id);
					
			boolean res = dao.delete(dto);
			
			if (res) {
				session.invalidate();
				String s = "<script type='text/javascript'>" + "alert('탈퇴되었습니다.');" + "location.href='view/main/main.jsp';"
						+ "</script>";
				response.getWriter().append(s);
			} else {
				System.out.println("탈퇴 안됨 ㅠ");
			}
			
		} else if (command.equals("findId")) {
			
			response.sendRedirect("view/user/find_id.jsp");
			
			
			
			
			
			
		} else if (command.equals("resetPw")) {
			
			response.sendRedirect("view/user/find_password.jsp");

			
			
			
			
		} else if (command.equals("sendEmail")) {
			

			Properties props = System.getProperties();
			
			props.put("mail.smtp.starttls.enable", "true"); // gmail은 무조건 true 고정
			props.put("mail.smtp.host", "smtp.gmail.com"); // smtp 서버 주소
			props.put("mail.smtp.auth","true"); // gmail은 무조건 true 고정 
			props.put("mail.smtp.port","587"); // gmail 포트
			         
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
	            msg.setText("인증번호는 ["+code+"] 입니다.\n 정확하게 입력해 주세요.", "UTF-8");
	             
	            // 이메일 헤더 
	            msg.setHeader("content-Type", "text/html");
	             
	            //메일보내기
	            javax.mail.Transport.send(msg);
	          
	            
	             
	        }catch (AddressException addr_e) {
	            addr_e.printStackTrace();
	        }catch (MessagingException msg_e) {
	            msg_e.printStackTrace();
	        }

		        
		} else if (command.equals("idEmail")) {
		
			
			
			Properties props = System.getProperties();
			
				props.put("mail.smtp.starttls.enable", "true"); // gmail은 무조건 true 고정
				props.put("mail.smtp.host", "smtp.gmail.com"); // smtp 서버 주소
				props.put("mail.smtp.auth","true"); // gmail은 무조건 true 고정 
				props.put("mail.smtp.port","587"); // gmail 포트
			          
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
				msg.setSubject("요리조리에서 보내는 이메일." , "UTF-8");
				
				// 이메일 내용 
				
				MemberDto dto = dao.findId(email);
				System.out.println(dto);
				
				String id = dto.getMember_id();
				
				System.out.println(id);
				
				
				
				// 4 request.setAttribute("dto", dto);
				
				msg.setText("회원님의 아이디는 \n["+id+"] 입니다.", "UTF-8");
				
				// 이메일 헤더 
				msg.setHeader("content-Type", "text/html");
				
				//메일보내기
				javax.mail.Transport.send(msg);
				
				
				
			}catch (AddressException addr_e) {
				addr_e.printStackTrace();
			}catch (MessagingException msg_e) {
				msg_e.printStackTrace();
			}
		
		
		} else if (command.equals("pwEmail")) {
			Properties props = System.getProperties();
			
				props.put("mail.smtp.starttls.enable", "true"); // gmail은 무조건 true 고정
				props.put("mail.smtp.host", "smtp.gmail.com"); // smtp 서버 주소
				props.put("mail.smtp.auth","true"); // gmail은 무조건 true 고정 
				props.put("mail.smtp.port","587"); // gmail 포트
			          
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
				msg.setSubject("요리조리에서 보내는 이메일." , "UTF-8");
				
				// 이메일 내용 
				
				MemberDto dto = dao.findPw(email);
				System.out.println(dto);
				
				String pw = dto.getMember_pw();
				
				System.out.println(pw);
				
				
				
				// 4 request.setAttribute("dto", dto);
				
				msg.setText("회원님의 비밀번호는 \n["+pw+"] 입니다.", "UTF-8");
				
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
	
	public void dispatch(String url, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);

	}

	public void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String s = "<script type='text/javascript'>" + "alert('" + msg + "');" + "location.href='" + url + "';"
				+ "</script>";
		response.getWriter().append(s);
	}*/
		
		



}
