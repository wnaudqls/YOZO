package com.yori.zori.model.dao;


import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yori.zori.model.dto.LikeDto;
import com.yori.zori.model.dto.RecipeDto;


@Repository
public class LikeDaoImpl implements LikeDao{
	
	@Autowired
	SqlSessionTemplate session;

	// 좋아요 업데이트
	@Override
	public int insert_like(LikeDto dto) {
		System.out.println("여기는 DAO의 insert_like");
		int res = 0;
		try {

			 res = session.update(namespace+"insert_like",dto);
			 
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("update_like 오류");
		}
		return res;
	}
	@Override
	public int addcount(LikeDto dto) {
	
		System.out.println("여기는 DAO의 overlapcheck");
		int res = 0;
		try {

			 res = session.update(namespace+"addcount",dto);
			 
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("overlapcheck 오류");
		}
		return res;
	}
	@Override
	public boolean overlap_check(LikeDto dto) {
		
		System.out.println("여기는 DAO의 cancel_like");
		int res = 0;
		try {
			
			 res = session.selectOne(namespace+"overlap_check",dto);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("cancel_like 오류");
		}
		return res > 0? true : false;
	}
	
	
	// 좋아요 취소
	@Override
	public int cancel_like(LikeDto dto) {
	
		System.out.println("여기는 DAO의 cancel_like");
		int res = 0;
		try {
			
			 res = session.update(namespace+"cancel_like",dto);
		
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("cancel_like 오류");
		}
		return res;
	}
	@Override
	public int delete_like(LikeDto dto) {
	
		System.out.println("여기는 DAO의 delete_like");
		int res = 0;
		try {
		
			 res = session.delete(namespace+"delete_like",dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("delete_like 오류");
		}
		return res;
	}
	@Override
	public List<RecipeDto> selectlist(RecipeDto dto) {
		// TODO Auto-generated method stub
		List<RecipeDto> list = new ArrayList<RecipeDto>();
		try {
			
			 list = session.selectList(namespace+"selectlist",dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("selectlist 오류");
		}
		return list;
	}

}
