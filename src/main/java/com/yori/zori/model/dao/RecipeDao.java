package com.yori.zori.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yori.zori.model.dto.RecipeDto;


public interface RecipeDao {

	String namespace="recipe.";
	
	public int jsonInsert(List<RecipeDto> list);

	public List<RecipeDto> selectList();

	// 마이레시피 selectlist
	public List<RecipeDto> MYselectList(String member_id);

	public RecipeDto selectOne(int recipe_no);

	public int update(RecipeDto dto);

	public int delete(int recipe_no);

	public List<RecipeDto> search(String txt);

	public int multiDelete(String[] recipe_no);

	public int insert(RecipeDto dto);


}
