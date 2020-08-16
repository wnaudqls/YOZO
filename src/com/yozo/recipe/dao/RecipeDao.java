package com.yozo.recipe.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
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
	
	public List<RecipeDto> selectList(){
		List<RecipeDto> list=new ArrayList<RecipeDto>();
		SqlSession session=null;
		System.out.println("여기는 DAO의 selectList");
		
		try {
			session=getSqlSessionFactory().openSession(false);
			list=session.selectList(namespace+"selectList");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("selectList오류");
		}finally {
			session.close();
		}
		return list;
	}
	
	//마이레시피 selectlist
	public List<RecipeDto> MYselectList(String member_id){
		List<RecipeDto> list=new ArrayList<RecipeDto>();
		SqlSession session=null;
		System.out.println("여기는 DAO의 selectList");
		
		try {
			session=getSqlSessionFactory().openSession(false);
			list=session.selectList(namespace+"MYselectList",member_id);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("selectList오류");
		}finally {
			session.close();
		}
		
		return list;
	}
	
	public RecipeDto selectOne(int recipe_no) {
		RecipeDto dto=null;
		SqlSession session=null;
		System.out.println("여기는 DAO의 selectOne");
		
		try {
			session=getSqlSessionFactory().openSession(false);
			dto=session.selectOne(namespace+"selectOne",recipe_no);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("selectOne오류");
		}finally {
			session.close();
		}
		return dto;
	}
	
	
	
	public int update(RecipeDto dto) {
		int res=0;
		SqlSession session=null;
		System.out.println("여기는 DAO의 update");
		
		try {
			session=getSqlSessionFactory().openSession(false);
			res=session.update(namespace+"update", dto);
			if(res>0) {
				System.out.println("업데이트 성공");
				session.commit();
			}else {
				System.out.println("업데이트 실패");
			}
		} catch (Exception e) {
			System.out.println("update오류");
			e.printStackTrace();
		}finally {
			session.close();
		}
		return res;
	}
	
	public int delete(int recipe_no) {
		int res=0;
		SqlSession session=null;
		System.out.println("여기는 DAO의 delete");
		
		try {
			session=getSqlSessionFactory().openSession(false);
			res=session.delete(namespace+"delete",recipe_no);
			if(res>0) {
				System.out.println("삭제성공");
				session.commit();
			}else {
				System.out.println("삭제실패");
			}
		} catch (Exception e) {
			System.out.println("delete오류");
			e.printStackTrace();
		}finally {
			session.close();
		}
		return res;
	}


	public List<RecipeDto> search(String txt) {
		System.out.println("search dao 입장");
		SqlSession session = null;
		List<RecipeDto> list = null;
		
		try {
			System.out.println("search dao 중간");
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"search", txt);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}


	public int multiDelete(String[] recipe_no) {
		SqlSession session = null;
		int count = 0;
		Map<String, String[]> map = new HashMap<>();
		map.put("recipe_no", recipe_no);
		
		try {
			session = getSqlSessionFactory().openSession(false);
			count = session.delete(namespace+"muldelete", map);
			if(count == recipe_no.length) {
				session.commit();
			}
		} catch (Exception e) {
			System.out.println("recipe dao에서 muldel오류");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return count;
	}
	
	public int insert(RecipeDto dto) {
		SqlSession session = null;
		int res = 0;
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace+"insert", dto);
			if(res>0) {
				session.commit();
			}
		} catch (Exception e) {
			System.out.println("recipe dao에서 insert오류");
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		
		return res;
	}


}
