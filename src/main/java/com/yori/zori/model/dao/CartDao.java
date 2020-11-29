package com.yori.zori.model.dao;


import java.util.List;

import com.yori.zori.model.dto.CartDto;


public interface CartDao {

	String namespace = "cart.";
   public List<CartDto> cartList(CartDto dto);
   public int cartInsert(CartDto cart);
   public int multiDelete(CartDto dto);
   public int CartmultiDelete(CartDto dto);
   public CartDto cartInsertList(CartDto dto);

   public int cartUpdate(CartDto dto); 
}