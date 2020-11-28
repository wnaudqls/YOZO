package com.yori.zori.model.biz;

import java.util.List;

import com.yori.zori.model.dto.RecipeDto;

public interface RecipeBiz {
	public int jsonInsert(List<RecipeDto> list);
	public List<RecipeDto> selectList();
	public RecipeDto selectOne(int recipe_no);
	public int update(RecipeDto dto);
	public int delete(int recipe_no);
	public List<RecipeDto> search(String txt);
}