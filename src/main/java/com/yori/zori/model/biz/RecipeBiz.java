package com.yori.zori.model.biz;

import java.util.List;

import com.yori.zori.model.dto.RecipeDto;

public interface RecipeBiz {
	public int jsonInsert(List<RecipeDto> list);
	public List<RecipeDto> selectList(RecipeDto dto);
	public List<RecipeDto> nonlikelist(RecipeDto dto);
	public RecipeDto selectOne(int recipe_no);
	public int update(RecipeDto dto);
	public int delete(int recipe_no);
	public List<RecipeDto> search(String txt);
	int multiDelte(String[] recipe_no);
	int insert(RecipeDto dto);
}