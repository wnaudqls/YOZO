package com.yozo.goods.biz;

import com.yozo.goods.dao.GoodsDao;
import com.yozo.goods.dto.GoodsDto;

public class GoodsBiz {

	private GoodsDao  dao = new GoodsDao();
	
	public int insert(GoodsDto dto) {
		return dao.insert(dto) ;
	}
	
}
