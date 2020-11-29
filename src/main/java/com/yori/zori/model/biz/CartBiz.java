package com.yori.zori.model.biz;

import java.util.List;

import com.yori.zori.model.dto.CartDto;

public interface CartBiz {
	public List<CartDto> cartList(CartDto dto);
	public int cartInsert(CartDto cart);
	public CartDto cartInsertList(CartDto dto);
	public int cartUpdate(CartDto dto);
}
