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

@Repository
public class RecipeDaoImpl implements RecipeDao {

	String namespace = "recipe.";

	@Autowired
	SqlSessionTemplate session;

	@Override
	public int jsonInsert(List<RecipeDto> list) {

		int res = 0;
		System.out.println("여기는 DAO의 jsonInsert");
		try {
			res = session.insert(namespace + "jsonInsert", list);

		} catch (Exception e) {
			System.out.println("jsonInsert오류");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<RecipeDto> selectList(RecipeDto dto) {
		List<RecipeDto> list = new ArrayList<RecipeDto>();

		System.out.println("여기는 DAO의 selectList");

		try {

			list = session.selectList(namespace + "likelist", dto);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("selectList오류");
		}
		return list;
	}
	
	@Override
	public List<RecipeDto> nonlikelist(RecipeDto dto) {
		List<RecipeDto> list = new ArrayList<RecipeDto>();

		System.out.println("여기는 DAO의 selectList");

		try {

			list = session.selectList(namespace + "non_likelist", dto);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("selectList오류");
		}
		return list;
	}

	// 마이레시피 selectlist
	@Override
	public List<RecipeDto> MYselectList(String member_id) {
		List<RecipeDto> list = new ArrayList<RecipeDto>();
		System.out.println("여기는 DAO의 selectList");

		try {

			list = session.selectList(namespace + "MYselectList", member_id);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("selectList오류");
		}

		return list;
	}

	@Override
	public RecipeDto selectOne(int recipe_no) {
		RecipeDto dto = null;
		System.out.println("여기는 DAO의 selectOne");

		try {

			dto = session.selectOne(namespace + "selectOne", recipe_no);
			System.out.println(dto);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("selectOne오류");
		}
		return dto;
	}

	@Override
	public int update(RecipeDto dto) {
		int res = 0;

		System.out.println("여기는 DAO의 update");

		try {

			res = session.update(namespace + "update", dto);

		} catch (Exception e) {
			System.out.println("update오류");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int delete(int recipe_no) {
		int res = 0;

		System.out.println("여기는 DAO의 delete");

		try {

			res = session.delete(namespace + "delete", recipe_no);

		} catch (Exception e) {
			System.out.println("delete오류");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<RecipeDto> search(String txt) {
		System.out.println("search dao 입장");
		List<RecipeDto> list = null;

		try {
			System.out.println("search dao 중간");
			list = session.selectList(namespace + "search", txt);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int multiDelete(String[] recipe_no) {

		int count = 0;
		Map<String, String[]> map = new HashMap<>();
		map.put("recipe_no", recipe_no);

		try {
			count = session.delete(namespace + "muldelete", map);
			if (count == recipe_no.length) {

			}
		} catch (Exception e) {
			System.out.println("recipe dao에서 muldel오류");
			e.printStackTrace();
		}

		return count;
	}

	@Override
	public int insert(RecipeDto dto) {

		int res = 0;
		try {

			res = session.insert(namespace + "insert", dto);
			if (res > 0) {

			}
		} catch (Exception e) {
			System.out.println("recipe dao에서 insert오류");
			e.printStackTrace();
		}
		return res;
	}




}
