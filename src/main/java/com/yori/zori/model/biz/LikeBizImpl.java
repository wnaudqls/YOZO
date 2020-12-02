package com.yori.zori.model.biz;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yori.zori.model.dao.LikeDao;
import com.yori.zori.model.dto.LikeDto;
import com.yori.zori.model.dto.RecipeDto;

@Service
public class LikeBizImpl implements LikeBiz{
	
	@Autowired
	LikeDao dao;
	public int insert_like(LikeDto dto) {
	
		return dao.insert_like(dto);
	}

	public int addcount(LikeDto dto) {
		return dao.addcount(dto);
	}
	
	public boolean overlap_check(LikeDto dto) {
		return dao.overlap_check(dto);
	}
	
	
	// 좋아요 취소
	public int cancel_like(LikeDto dto) {
		return dao.cancel_like(dto);
	
	}
	
	public int delete_like(LikeDto dto) {
		return dao.delete_like(dto);
	}

	@Override
	public List<RecipeDto> selectlist(RecipeDto dto) {
		// TODO Auto-generated method stub
		return dao.selectlist(dto);
	}

}
