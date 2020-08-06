package com.yozo.goods.biz;

import static com.yozo.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.yozo.goods.dao.CartDAO;
import com.yozo.goods.dto.CartDTO;


public class CartService {

	private CartDAO cartDao = new CartDAO();

	public List<CartDTO> cartList(String memberId) {
		Connection conn = getConnection();
		List<CartDTO> list = cartDao.cartList(conn, memberId);
		close(conn);
		return list;
	}

	public int cartInsert(CartDTO cart) {
		Connection conn = getConnection();
		int result = cartDao.cartInsert(conn, cart);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public int cartDelete(String memberId, int goods_no) {
		Connection conn = getConnection();
		int result = cartDao.cartDelete(conn, memberId, goods_no);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
		
}
