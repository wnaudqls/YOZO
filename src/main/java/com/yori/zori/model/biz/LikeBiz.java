package com.yori.zori.model.biz;

import java.util.List;

import com.yori.zori.model.dto.LikeDto;
import com.yori.zori.model.dto.RecipeDto;

public interface LikeBiz {
	public int insert_like(LikeDto dto);
	public int addcount(LikeDto dto);
	public boolean overlap_check(LikeDto dto);
	public int cancel_like(LikeDto dto);
	public int delete_like(LikeDto dto);
	public List<RecipeDto> selectlist(RecipeDto dto);
}
