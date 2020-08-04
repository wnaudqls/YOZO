package com.yozo.broadcast.controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yozo.broadcast.biz.BroadcastBiz;
import com.yozo.broadcast.dto.BroadcastDto;
import com.yozo.broadcast.dto.BroadcastDto_Reservation;


/**
 * Servlet implementation class CalController
 */
@WebServlet("/broadcast.do")
public class BroadcastController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public BroadcastController() {
       
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		BroadcastBiz biz = new BroadcastBiz();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String command = request.getParameter("command");
		String url="view/broadcast/";//경로지정
		if(command.equals("broadcast")) {
			dispatch(url + "broadcast_list.jsp", request, response);
		}
		if(command.equals("list")) {
			String time = request.getParameter("time");//radio의 값을 가져온다 이말임.
			List<BroadcastDto> list = biz.selectList(time);
			//그 시간대에 해당하는 방송 리스트들을 보여주는 selectList
			request.setAttribute("list", list);
			dispatch(url + "broadcast_selectlist.jsp", request, response);
			
		}else if(command.equals("checklist")) {
			String name = request.getParameter("name");
				List<BroadcastDto_Reservation> list = biz.checklist(name);
				//자신이 접속한 id값을 파라미터든 뭐든 어떻게 해서든 넣어야 함
				request.setAttribute("list", list);
				dispatch(url + "broadcast_checktlist.jsp", request, response);
				
		}else if(command.equals("selectone")) {
			int no = Integer.parseInt(request.getParameter("no"));
			//방송의 번호를 가져옴
			BroadcastDto dto = biz.selectone(no);
			//해당 방송의 데이터들을 dto에 저장
			request.setAttribute("dto", dto);
			//전송
			dispatch(url+"broadcast_selectone.jsp", request, response);
			
		}else if(command.equals("reserve")) {
			int no = Integer.parseInt(request.getParameter("no"));
			String id = request.getParameter("id");
			System.out.println(id);
			int res = biz.insert(new BroadcastDto_Reservation(1,null,"Y",id));
			if(res > 0) {
				sendmessage("예약완료", "broadcast.do?command=checklist", response);
			}else {
				sendmessage("예약실패", "broadcast.do?command=selectone&no="+no, response);
			}
		}
		else if(command.equals("stream")) {
				dispatch(url + "broadcast_stream.jsp", request, response);
				
		}
		else if(command.equals("watch")) {
			
				dispatch(url + "broadcast_watch.jsp", request, response);
				
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		doGet(request, response);
	}
	public static void sendmessage(String msg, String url, HttpServletResponse response) {
		String s = "<script text/javascript>"
				+ "alert('"+msg+"');"
				+ "location.href='"+url+"';"
				+ "</script>";
		try {
			response.getWriter().append(s);
		} catch (IOException e) {
		
			e.printStackTrace();
		}
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
