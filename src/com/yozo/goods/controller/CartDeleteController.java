package com.yozo.goods.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yozo.goods.biz.CartService;
import com.yozo.goods.dao.CartDAO;

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
		CartDAO dao = new CartDAO();
		
		System.out.println("카트딜리트컨트롤러왔음");
		String command = request.getParameter("command");
		
		String memberId = request.getParameter("memberId");
		int goods_no = Integer.parseInt(request.getParameter("goods_no"));
		
		int result = new CartService().cartDelete(memberId, goods_no); 
		
    	String loc = "";
		String msg = result >0 ? "삭제하는데 성공하였습니다.": "삭제하는데 실패하였습니다.";
		if(result > 0) {
			loc = "/goods.do?command=goodslist"; 
		
			
		}else {
			loc = "/";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		request.getRequestDispatcher("/view/goods/msg.jsp").forward(request, response);
		
		if(command.equals("cartmuldel")) {
			String [] chk = request.getParameterValues("chk");
			String member_Id = request.getParameter("memberId");
			System.out.println("chk : " + chk + "member_Id :" + member_Id);
			
			int res = dao.multiDelete(member_Id, chk);
			if(res > 0) {
				System.out.println("삭제완료");
			}else {
				
			}
			
		}
	}
	
	
	

}
