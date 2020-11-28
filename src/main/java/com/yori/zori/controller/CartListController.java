package com.yori.zori.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yori.zori.goods.biz.CartService;
import com.yori.zori.goods.dto.CartDTO;


@WebServlet("/list.do")
public class CartListController extends HttpServlet {
   private static final long serialVersionUID = 1L;
       

    public CartListController() {
        super();
        // TODO Auto-generated constructor stub
    }


   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");
      response.setContentType("text/html; charset=utf-8");
          
       String memberId = request.getParameter("memberId");
        if(memberId != null) {
           List<CartDTO> list = new CartService().cartList(memberId);
           request.setAttribute("list", list);
           request.getRequestDispatcher("/view/user/cart_list.jsp").forward(request, response);
        }else {
           System.out.println("no login");
        }
           
       }
   

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */

   protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {


   }


}