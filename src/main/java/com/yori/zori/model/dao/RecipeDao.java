package com.yori.zori.model.dao;


import java.util.List;

import com.yori.zori.model.dto.RecipeDto;


public interface RecipeDao {

	String namespace="recipe.";
	
	public int jsonInsert(List<RecipeDto> list);

	public List<RecipeDto> selectList(RecipeDto dto);
	public List<RecipeDto> nonlikelist(RecipeDto dto);

	// 마이레시피 selectlist
	public List<RecipeDto> MYselectList(String member_id);

	public RecipeDto selectOne(int recipe_no);

	public int update(RecipeDto dto);

	public int delete(int recipe_no);

	public List<RecipeDto> search(String txt);

	public int multiDelete(String[] recipe_no);

	public int insert(RecipeDto dto);


}
