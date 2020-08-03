package com.yozo.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.yozo.admin.dao.AdminDao;
import com.yozo.user.dto.MemberDto;

@WebServlet("/admin.do")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminController() {
        
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("뭔데 싸발");
    	   
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        
        //HttpSession session = request.getSession(true);

        System.out.println("컨트롤러 입장");
        String command = request.getParameter("command");
        AdminDao dao = new AdminDao();
        String url="view/admin/";
        if(command.equals("list")) {
            List<MemberDto> list = dao.selectList();
            request.setAttribute("list", list);
            dispatch(url+"user_list.jsp", request, response);
        } else if (command.equals("update")) {
        	int member_no = Integer.parseInt(request.getParameter("member_no"));
        	String member_role = request.getParameter("member_role");
        	
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
			/*
			 * int member_no = Integer.parseInt(request.getParameter("member_no")); String
			 * member_id = request.getParameter("member_id"); String member_nick =
			 * request.getParameter("member_nick"); String member_name =
			 * request.getParameter("member_name"); String member_addr =
			 * request.getParameter("member_addr");
			 */
        	String txt=request.getParameter("txt");
        	System.out.println("Sdsd"+txt);
        	Map<String, String> map = new HashMap<String, String>();
        	map.put("txt", txt);
        	List<MemberDto> list = dao.search(map);
        	JSONObject obj = new JSONObject();
        	
//        	obj.put("member_id",member_id);
//        	obj.put("member_nick",member_nick);
//        	obj.put("member_name",member_name);
//        	obj.put("member_addr",member_addr);
        	
        	PrintWriter out = response.getWriter();
        	out.println(obj.toJSONString());
        	
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

}
