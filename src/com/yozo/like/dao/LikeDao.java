package com.yozo.like.dao;


import org.apache.ibatis.session.SqlSession;

import com.yozo.common.SqlMapConfig;
import com.yozo.like.dto.LikeDto;


public class LikeDao extends SqlMapConfig{
	private String namespace="like.";

	// 좋아요 업데이트
	public int insert_like(LikeDto dto) {
		SqlSession session=null;
		System.out.println("여기는 DAO의 insert_like");
		int res = 0;
		try {
			session=getSqlSessionFactory().openSession(false);
			 res = session.update(namespace+"insert_like",dto);
			 session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("update_like 오류");
		}finally {
			session.close();
		}
		return res;
	}

	public int addcount(int recipe_no) {
		SqlSession session=null;
		System.out.println("여기는 DAO의 overlapcheck");
		int res = 0;
		try {
			session=getSqlSessionFactory().openSession(false);
			 res = session.update(namespace+"addcount",recipe_no);
			 session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("overlapcheck 오류");
		}finally {
			session.close();
		}
		return res;
	}
	
	public boolean overlap_check(LikeDto dto) {
		SqlSession session=null;
		System.out.println("여기는 DAO의 cancel_like");
		int res = 0;
		try {
			session=getSqlSessionFactory().openSession(false);
			 res = session.selectOne(namespace+"overlap_check",dto);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("cancel_like 오류");
		}finally {
			session.close();
		}
		return res > 0? true : false;
	}
	
	
	// 좋아요 취소
	public int cancel_like(int recipe_no) {
		SqlSession session=null;
		System.out.println("여기는 DAO의 cancel_like");
		int res = 0;
		try {
			session=getSqlSessionFactory().openSession(false);
			 res = session.update(namespace+"cancel_like",recipe_no);
			 session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("cancel_like 오류");
		}finally {
			session.close();
		}
		return res;
	}
	
	public int delete_like(LikeDto dto) {
		SqlSession session=null;
		System.out.println("여기는 DAO의 delete_like");
		int res = 0;
		try {
			session=getSqlSessionFactory().openSession(false);
			 res = session.delete(namespace+"delete_like",dto);
			 session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("delete_like 오류");
		}finally {
			session.close();
		}
		return res;
	}

}
