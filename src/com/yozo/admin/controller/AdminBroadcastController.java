//package com.yozo.admin.controller;
//
//import java.io.IOException;
//import java.util.List;
//
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import com.yozo.admin.dao.AdminBroadcastDao;
//import com.yozo.broadcast.dto.BroadcastDto;
//
//
//@WebServlet("/adminBroadcast.do")
//public class AdminBroadcastController extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//       
//   
//    public AdminBroadcastController() {
//        super();
//       
//    }
//
//	
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//		System.out.println("뭔데 싸발");
// 	   
//        request.setCharacterEncoding("UTF-8");
//        response.setContentType("text/html; charset=UTF-8");
//   
//        //HttpSession session = request.getSession(true);
//
//        System.out.println("컨트롤러 입장");
//        String command = request.getParameter("command");
//        AdminBroadcastDao dao = new AdminBroadcastDao();
//        String url = "view/admin/";
//        if(command.equals("list")) {
//        	List<BroadcastDto> list = dao.selectList();
//        	request.setAttribute("list", list);
//        	dispatch(url+"schedule.jsp", request, response);
//        } else if (command.equals("update")) {
//        	
//        } else if (command.equals("delete")) {
//        	
//        }
//	}
//
//	
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	
//		doGet(request, response);
//	}
//	
//	 public static void dispatch(String url, HttpServletRequest request, HttpServletResponse response) {
//	        RequestDispatcher dispatch = request.getRequestDispatcher(url);
//	        
//	        try {
//	           dispatch.forward(request, response);
//	        } catch (ServletException e) {
//	           e.printStackTrace();
//	        } catch (IOException e) {
//	           e.printStackTrace();
//	        } 
//	     }
//
//}
