package com.yori.zori.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yori.zori.model.admin.dao.AdminDao;
import com.yori.zori.user.dto.MemberDto;



@WebServlet("/admin.do")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminController() {
        
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	   
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
   
        //HttpSession session = request.getSession(true);

        System.out.println("컨트롤러 입장");
        String command = request.getParameter("command");
        AdminDao dao = new AdminDao();
        String url="view/admin/";
        if(command.equals("list")) {
            List<MemberDto> list = dao.selectList();
            System.out.println("컨트롤러 list 여기까지");
            request.setAttribute("list", list);
            System.out.println("디스패치 가기전 list 사이즈" +list.size());
            dispatch(url+"user_list.jsp", request, response);
        
        } else if (command.equals("update")) {
        	String txt =request.getParameter("member_id");
        	String txt2 = request.getParameter("member_role");
        	
        	System.out.println(txt + txt2);
        	MemberDto dto = new MemberDto();
        	dto.setMember_id(txt);
        	if(txt2.equals("회원")) {
        		dto.setMember_role("관리자");
        	} else {
        		dto.setMember_role("회원");
        	}
        	System.out.println("member_role : " + txt2);
        	System.out.println("member_id : "+txt);
        	
        	int res = dao.update(dto);
        	System.out.println("컨트롤러 res : "+ res);
        	if(res > 0) {
        		jsResponse("변경성공", request.getContextPath()+"/admin.do?command=list", response);
        	} else if(res == 0){
        		jsResponse("변경실패", request.getContextPath()+"/admin.do?command=list", response);
        	} else {
        		jsResponse("이건뭐냐", request.getContextPath()+"/admin.do?command=list", response);
        	}
        	
        	
        	
        } else if (command.equals("delete")) {
        	int member_no = Integer.parseInt(request.getParameter("member_no"));
        	int res = dao.delete(member_no);
        	if(res > 0) {
        		response.sendRedirect("admin.do?command=list");
        	} else {
        		response.sendRedirect("admin.do?command=list");
        	}
        
        } else if (command.equals("search")) {
        	System.out.println("search 입장");
        	String txt=request.getParameter("member_id");
        	System.out.println("Sdsd"+txt);
        	List<MemberDto> list = dao.search(txt);
        	System.out.println("여기는왓냐?");
        	request.setAttribute("list", list);
        	dispatch("view/admin/user_list.jsp", request, response);
        	
        }
     }

     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        doGet(request,response);
     }
     
     public static void dispatch(String url, HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatch = request.getRequestDispatcher(url);
        
        try {
           dispatch.forward(request, response);
        } catch (ServletException e) {
           e.printStackTrace();
        } catch (IOException e) {
           e.printStackTrace();
        } 
     }
     
     public void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
 		String s = "<script type='text/javascript'>" + "alert('" + msg + "');" + "location.href='" + url + "';"
 				+ "</script>";
 		response.getWriter().append(s);
 	}
     
     

}
