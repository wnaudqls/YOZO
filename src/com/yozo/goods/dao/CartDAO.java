package com.yozo.goods.dao;

import static com.yozo.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import static com.yozo.common.JDBCTemplate.*;

import com.yozo.goods.dto.CartDTO;


public class CartDAO {

	public List<CartDTO> cartList(Connection conn, String memberId) {
		List<CartDTO> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = "select * from cart where member_id = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);

			rset = pstmt.executeQuery();

			list = new ArrayList<>();
			while (rset.next()) {
				CartDTO c = new CartDTO();

				c.setMember_id(rset.getString("member_id"));
				c.setGoods_no(rset.getInt("goods_no"));
				c.setGoods_title(rset.getString("goods_title"));
				c.setGoods_main_photo(rset.getString("goods_main_photo"));
				c.setGoods_price(rset.getInt("goods_price"));
				c.setMoney(rset.getInt("money"));
				c.setAmount(rset.getInt("amount"));

				list.add(c);
			}
			System.out.println(list);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}

	public int cartInsert(Connection conn, CartDTO cart) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "insert into cart(member_id, goods_no, goods_title, goods_main_photo, goods_price, money, amount)\r\n" + 
				"values(?,?,?,?,?,?,?)";

		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, cart.getMember_id());
			pstmt.setInt(2, cart.getGoods_no());
			pstmt.setString(3, cart.getGoods_title());
			pstmt.setString(4, cart.getGoods_main_photo());
			pstmt.setInt(5, cart.getGoods_price());
			pstmt.setInt(6, cart.getMoney());
			pstmt.setInt(7, cart.getAmount());
		
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		System.out.println(result);
		return result;
	}

	public int cartDelete(Connection conn, String memberId, int goods_no) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "delete from cart where member_id = ? and goods_no = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setInt(2, goods_no);
		
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		System.out.println(result);
		return result;
	}

	
	public int multiDelete(String member_id, String[] goods_no) {
		int res = 0;
		Connection conn = getConnection();
		PreparedStatement pstm = null;
		String sql = "DELETE FROM CART WHERE MEMBER_ID = ? AND GOODS_NO = ?";
		
		int[]cnt = null;
		try {
			pstm = conn.prepareStatement(sql);
			
			//반복문을 통해 물음표에 값을 넣어준다
			for(int i = 0; i<goods_no.length; i++) {
				pstm.setString(1, member_id);
				pstm.setString(2,goods_no[i]);
				
				//메모리에 적재 후 , executeBatch() 메소드가 호출될 때 한 번에 실행
				pstm.addBatch();
				System.out.println("삭제할 굿즈번호 : " + goods_no[i]);
				
			}
			cnt = pstm.executeBatch();
			for(int i =0; i<cnt.length; i++) {
			//성공 : -2 실패 : -3 
				if(cnt[i] == -2) {
					res++;
				}
			}
			if(goods_no.length == res) {
				conn.commit();
			}else {
				conn.rollback();
			}
		} catch (SQLException e) {
			System.out.println("카트다오에서 멀티딜리트오류");
			e.printStackTrace();
		}finally {
			try {
				pstm.close();
				conn.close();
			} catch (SQLException e) {
			
				e.printStackTrace();
			}
		}
		return res;
	}
}
