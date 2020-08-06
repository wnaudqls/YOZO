package com.yozo.goods.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yozo.goods.biz.CartService;

/**
 * Servlet implementation class CartDeleteController
 */
@WebServlet("/CartDelete.do")
public class CartDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String memberId = request.getParameter("memberId");
		int goods_no = Integer.parseInt(request.getParameter("goods_no"));
		
		int result = new CartService().cartDelete(memberId, goods_no); 
		
    	String loc = "";
		String msg = result >0 ? "성공": "실패!";
		if(result > 0) {
			loc = "/goods.do?command=goodslist"; 
		
			
		}else {
			loc = "/";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		request.getRequestDispatcher("/view/goods/msg.jsp").forward(request, response);
	}

}
