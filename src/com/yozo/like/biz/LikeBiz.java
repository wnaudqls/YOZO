package com.yozo.like.biz;


import com.yozo.like.dao.LikeDao;
import com.yozo.like.dto.LikeDto;

public class LikeBiz {
	LikeDao dao = new LikeDao();
	public int insert_like(LikeDto dto) {
	
		return dao.insert_like(dto);
	}

	public int addcount(int recipe_no) {
		return dao.addcount(recipe_no);
	}
	
	public boolean overlap_check(LikeDto dto) {
		return dao.overlap_check(dto);
	}
	
	
	// 좋아요 취소
	public int cancel_like(int recipe_no) {
		return dao.cancel_like(recipe_no);
	
	}
	
	public int delete_like(LikeDto dto) {
		return dao.delete_like(dto);
	}

}
