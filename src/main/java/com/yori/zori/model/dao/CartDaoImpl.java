package com.yori.zori.model.dao;


import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yori.zori.model.dto.CartDto;




@Repository
public class CartDaoImpl implements CartDao{
	@Autowired
	SqlSessionTemplate session;

   @Override
   public List<CartDto> cartList(CartDto dto) {
      List<CartDto> list = new ArrayList<CartDto>();

      
      try {
		list = session.selectList(namespace+"selectlist",dto);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
      return list;
      
   }
   @Override
   public int cartInsert(CartDto dto) {
      int result = 0;

      result = session.insert(namespace+"insert",dto);

      return result;
   }
   @Override
   public int multiDelete(CartDto dto) {
      int res = 0;
     
      String sql = "DELETE FROM CART WHERE MEMBER_ID = ? AND GOODS_NO = ?";
  
      return res;
   }
   @Override
   public int CartmultiDelete(CartDto dto) {
      int res = 0;
    
      String sql = "DELETE FROM CART WHERE GOODS_NO = ?";
      
    
      return res;
   }

   @Override
   public CartDto cartInsertList(CartDto dto) {
      CartDto cartSearch = null;
    

      String sql = "select * from cart where member_id = ? and goods_no = ?";

     
      return cartSearch;
      
   }

   @Override
   public int cartUpdate(CartDto dto) {
      int result = 0;
      
      String sql = "update cart set amount=?, money = ? where member_id = ? and goods_no = ?";
      return result;
   }

}