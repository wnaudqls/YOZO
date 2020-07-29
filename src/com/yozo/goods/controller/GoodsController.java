package com.yozo.goods.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yozo.goods.biz.GoodsBiz;
import com.yozo.goods.dto.GoodsDto;

/**
 * Servlet implementation class GoodsController
 */
@WebServlet("/goodscontroller.do")
public class GoodsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

   
    public GoodsController() {
   
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		
		System.out.println("정신차리지");
		String command = request.getParameter("command");
		System.out.println("["+command+"]");
		
		GoodsBiz biz = new GoodsBiz();
		
		if(command.equals("goodsinsertres")) {
			System.out.println("goodsinsertres왔음");
			//response.sendRedirect(request.getContextPath()+"/view/goods/goods_insert.jsp");
			String goods_title = request.getParameter("goods_title");
			int goods_quantity = Integer.parseInt(request.getParameter("goods_quantity"));
			int goods_price = Integer.parseInt(request.getParameter("goods_price"));
			String goods_content = request.getParameter("goods_content");
			
			System.out.println(goods_content);
			
			
			 int res = biz.insert(new GoodsDto(0,"아이디",goods_title,goods_price,goods_quantity, "사진", goods_content,null));
			 
			 

		}
		
		
	}
	public void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
		
	}
	public void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String s = "<script type='text/javascript'>" +
					"alert('"+msg+"');" +
					"location.href='" + url + "';" +
					"</script>";
		response.getWriter().append(s);
	}
	
	

}
