package com.yozo.goods.dao;

import org.apache.ibatis.session.SqlSession;

import com.yozo.common.SqlMapConfig;
import com.yozo.goods.dto.GoodsDto;

public class GoodsDao extends SqlMapConfig {

	private String namespace ="goods.";
	
	public int insert(GoodsDto dto) {
		SqlSession session = null;
		int res = 0;
		System.out.println(dto);
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace+"insert",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		
		return res;
	}
}
