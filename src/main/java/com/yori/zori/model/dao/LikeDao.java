package com.yori.zori.model.dao;


import java.util.List;

import com.yori.zori.model.dto.LikeDto;
import com.yori.zori.model.dto.RecipeDto;

public interface LikeDao {
	String namespace = "like.";

	// 좋아요 업데이트
	public int insert_like(LikeDto dto);

	public int addcount(LikeDto dto);

	public boolean overlap_check(LikeDto dto);

	// 좋아요 취소
	public int cancel_like(LikeDto dto);

	public int delete_like(LikeDto dto);
	
	public List<RecipeDto> selectlist(RecipeDto dto);

}
