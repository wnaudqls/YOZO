package com.yori.zori.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yori.zori.model.dao.RecipeDao;
import com.yori.zori.model.dto.RecipeDto;

@Service
public class RecipeBizImpl implements RecipeBiz{
	@Autowired
	RecipeDao dao;
	
	@Override
	public int jsonInsert(List<RecipeDto> list) {
		return dao.jsonInsert(list);
	}

	@Override
	public List<RecipeDto> selectList(RecipeDto dto) {
		return dao.selectList(dto);
	}
	@Override
	public List<RecipeDto> nonlikelist(RecipeDto dto) {
		return dao.nonlikelist(dto);
	}
	@Override
	public RecipeDto selectOne(int recipe_no) {
		return dao.selectOne(recipe_no);
	}
	@Override
	public int update(RecipeDto dto) {
		return dao.update(dto);
	}
	@Override
	public int delete(int recipe_no) {
		return dao.delete(recipe_no);
	}
	@Override
	public List<RecipeDto> search(String txt) {
		return dao.search(txt);
	}

	@Override
	public int multiDelte(String[] recipe_no) {
		return dao.multiDelete(recipe_no);

	}

	@Override
	public int insert(RecipeDto dto) {
		return dao.insert(dto);
	}
//마이레시피  MYselectList
	public List<RecipeDto> MYselectList(String member_id) {
		return dao.MYselectList(member_id);
	}
}
