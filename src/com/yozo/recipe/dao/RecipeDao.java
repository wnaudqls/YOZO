package com.yozo.recipe.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yozo.common.SqlMapConfig;
import com.yozo.recipe.dto.RecipeDto;

public class RecipeDao extends SqlMapConfig {

	private String namespace="recipe.";
	public int jsonInsert(List<RecipeDto> list) {
		SqlSession session=null;
		int res=0;
		System.out.println("여기는 DAO의 jsonInsert");
		try {
			session=getSqlSessionFactory().openSession(false);
			res=session.insert(namespace+"jsonInsert",list);
			
			if(res>0) {
				System.out.println("입력완료");
				session.commit();
			}else {
				System.out.println("입력실패");
			}
		}catch(Exception e) {
			System.out.println("jsonInsert오류");
			e.printStackTrace();
		}finally {
			session.close();
		}
		return res;
	}

}
