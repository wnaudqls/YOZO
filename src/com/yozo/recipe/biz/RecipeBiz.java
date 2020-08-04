package com.yozo.recipe.biz;

import java.util.List;

import com.yozo.recipe.dao.RecipeDao;
import com.yozo.recipe.dto.RecipeDto;

public class RecipeBiz {
	RecipeDao dao=new RecipeDao();
	
	public int jsonInsert(List<RecipeDto> list) {
		return dao.jsonInsert(list);
	}
}
