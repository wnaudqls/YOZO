package com.yozo.recipe.biz;

import java.util.List;

import com.yozo.recipe.dao.RecipeDao;
import com.yozo.recipe.dto.RecipeDto;

public class RecipeBiz {
	RecipeDao dao=new RecipeDao();
	
	public int jsonInsert(List<RecipeDto> list) {
		return dao.jsonInsert(list);
	}

	public List<RecipeDto> selectList() {
		return dao.selectList();
	}
	public RecipeDto selectOne(int recipe_no) {
		return dao.selectOne(recipe_no);
	}
	public int update(RecipeDto dto) {
		return dao.update(dto);
	}
	public int delete(int recipe_no) {
		return dao.delete(recipe_no);
	}
}
