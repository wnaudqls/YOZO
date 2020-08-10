package com.yozo.goods.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yozo.goods.biz.CartService;
import com.yozo.goods.dao.CartDAO;
import com.yozo.goods.dto.CartDTO;

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
//      int goods_no = Integer.parseInt(request.getParameter("goods_no"));

      String loc = "";
      
      if(command.equals("cartmuldel")) {
         String [] chk = request.getParameterValues("chk");
         String member_Id = request.getParameter("memberId");
         System.out.println("chk : " + chk + "member_Id :" + member_Id);
         String msg = "";
         if(chk == null) {
            loc = "/list.do?memberId="+memberId;
            msg="체크된 상품이 없습니다.";
            request.setAttribute("msg", msg);
            request.setAttribute("loc", loc);
            
            request.getRequestDispatcher("/view/goods/msg.jsp").forward(request, response);
         }
         int res = dao.multiDelete(member_Id, chk);
         msg = res >0 ? "삭제하는데 성공하였습니다.": "삭제하는데 실패하였습니다.";
         if(res > 0) {
            loc = "/list.do?memberId="+memberId; 
            System.out.println("삭제완료");
            request.setAttribute("msg", msg);
            request.setAttribute("loc", loc);
            
            request.getRequestDispatcher("/view/goods/msg.jsp").forward(request, response);
         }else {
            loc = "/";
            request.setAttribute("msg", msg);
            request.setAttribute("loc", loc);
            
            request.getRequestDispatcher("/view/goods/msg.jsp").forward(request, response);
            
         }
         
      }
      
//      int result = new CartService().cartDelete(memberId, goods_no); 
      
      
      
   }
   
   
   

}