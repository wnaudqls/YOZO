package com.yori.zori.model.biz;


import java.sql.Connection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yori.zori.model.dao.CartDAO;
import com.yori.zori.model.dto.CartDTO;

@Service
public class CartBizImpl {

	@Autowired
   private CartDAO cartDao;

   public List<CartDTO> cartList(String memberId) {
      List<CartDTO> list = cartDao.cartList(memberId);
      return list;
   }

   public int cartInsert(CartDTO cart) {
      int result = cartDao.cartInsert(cart);
      return result;
   }

   public CartDTO cartInsertList(String memberId, int goods_no) {
      CartDTO cartSearch = cartDao.cartInsertList(memberId, goods_no);
      return cartSearch;
   }

   public int cartUpdate(String memberId, int goods_no, int amount, int amount2, int price) {
      int result = cartDao.cartUpdate(conn, memberId, goods_no, amount, amount2, price);
      return result;
   }
      
}