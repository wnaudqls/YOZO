package com.yozo.goods.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yozo.common.SqlMapConfig;
import com.yozo.goods.dto.AnswerDto;
import com.yozo.goods.dto.GoodsDto;

public class GoodsDao extends SqlMapConfig {

	private String namespace ="goods.";
	
	public int insert(GoodsDto dto) {
		SqlSession session = null;
		int res = 0;
		System.out.println("여기는 insert dao다 오바오바"+dto);
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace+"insert",dto);
		} catch (Exception e) {
			System.out.println("insert오류");
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		return res;
	}
	
	public List<GoodsDto> selectList(){
		System.out.println("dao : selectList왔나?");
		SqlSession session = null;
		List<GoodsDto> list = null;
		
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList("goods.selectList");
		} catch (Exception e) {
			System.out.println("selectList 오류");
			e.printStackTrace();
		}finally {
			session.close();
		}

	
		
		return list;
	}
	
	public GoodsDto selectOne(int goods_no) {
		SqlSession session = null;
		GoodsDto dto = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			dto = session.selectOne(namespace+"selectOne", goods_no);
		} catch (Exception e) {
			System.out.println("selectOne 오류");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return dto;
		
	}
	
	public int update(GoodsDto dto) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res=session.update(namespace+"update", dto);
			
			if(res>0) {
				session.commit();
			}
		} catch (Exception e) {
			System.out.println("update오류");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		
		return res;
	}
	
	public int delete(int goods_no) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.delete(namespace+"delete", goods_no);
			
			if(res>0) {
				session.commit();
			}
		} catch (Exception e) {
			System.out.println("delete 오류");
			e.printStackTrace();
		}finally {
			session.close();
		}
		return res;
	}
	
	//댓글시작
	
	public List<AnswerDto> answerList(){
		System.out.println("dao : selectList왔나?");
		SqlSession session = null;
		List<AnswerDto> list = null;
		
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"answerList");
		} catch (Exception e) {
			System.out.println("answerList 오류");
			e.printStackTrace();
		}finally {
			session.close();
		}

	
		return list;
	}
	
	public int answerinsert(AnswerDto dto) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			System.out.println(dto);
			res = session.insert(namespace+"answerinsert", dto);
		} catch (Exception e) {
			System.out.println("answerinsert오류");
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		return res;
	}
	

}
