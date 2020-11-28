package com.yori.zori.model.biz;

import java.util.List;

import com.yori.zori.model.dto.CartDTO;

public interface CartBiz {
	public List<CartDTO> cartList(String memberId);
	public int cartInsert(CartDTO cart);
	public CartDTO cartInsertList(String memberId, int goods_no);
	public int cartUpdate(String memberId, int goods_no, int amount, int amount2, int price);
}
