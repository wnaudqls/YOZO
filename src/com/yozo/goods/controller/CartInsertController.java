package com.yozo.goods.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yozo.goods.biz.CartService;
import com.yozo.goods.dto.CartDTO;

@WebServlet("/CartInsert.do")
public class CartInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CartInsertController() {
		super();

	}

	/*
	 * protected void doGet(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException { doPost(request, response); }
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//utf-8 인코딩
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		System.out.println("insert왔다");

		System.out.println(request.getParameter("goods_no"));
		System.out.println(request.getParameter("goods_price"));
		
		//파라미터 값
		String memberId = request.getParameter("memberId");
		int goods_no = Integer.parseInt(request.getParameter("goods_no"));
		String goods_title = request.getParameter("goods_title");
		int goods_price = Integer.parseInt(request.getParameter("goods_price"));
		int amount = Integer.parseInt(request.getParameter("amount"));
		String goods_main_photo = request.getParameter("goods_main_photo");
		int money = goods_price * amount;
		int result = 0;
		CartDTO cart = new CartDTO(memberId, goods_no, goods_title, goods_price, money, amount, goods_main_photo);
		CartDTO cartSearch = new CartService().cartInsertList(memberId, goods_no);
		
		if(cartSearch != null) {
			result = new CartService().cartUpdate(memberId, goods_no, cartSearch.getAmount(), amount, cart.getGoods_price());
		}else {
			result = new CartService().cartInsert(cart);
		}
		

		String loc = "";
		String msg = result > 0 ? "선택하신 상품을 장바구니에 담았습니다." : "장바구니에 담는 것을 실패하였습니다.";
		if (result > 0) {
			loc = "/goods.do?command=goodslist";
		} else {
			loc = "/";
		}

		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);

		request.getRequestDispatcher("/view/goods/msg.jsp").forward(request, response);

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

}
