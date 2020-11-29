package com.yori.zori.model.biz;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yori.zori.model.dao.CartDao;
import com.yori.zori.model.dto.CartDto;


@Service
public class CartBizImpl implements CartBiz{

	@Autowired
	private CartDao cartDao;

   public List<CartDto> cartList(CartDto dto) {
      List<CartDto> list = cartDao.cartList(dto);
      return list;
   }

   public int cartInsert(CartDto cart) {
      int result = cartDao.cartInsert(cart);
      return result;
   }

   public CartDto cartInsertList(CartDto dto) {
      CartDto cartSearch = cartDao.cartInsertList(dto);
      return cartSearch;
   }

   public int cartUpdate(CartDto dto) {
      int result = cartDao.cartUpdate(dto);
      return result;
   }
      
}