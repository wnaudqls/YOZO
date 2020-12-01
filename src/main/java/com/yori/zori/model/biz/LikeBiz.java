package com.yori.zori.model.biz;

import com.yori.zori.model.dto.LikeDto;

public interface LikeBiz {
	public int insert_like(LikeDto dto);
	public int addcount(LikeDto dto);
	public boolean overlap_check(LikeDto dto);
	public int cancel_like(LikeDto dto);
	public int delete_like(LikeDto dto);
}
