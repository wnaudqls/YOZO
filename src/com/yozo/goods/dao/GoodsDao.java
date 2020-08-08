package com.yozo.goods.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
			list = session.selectList(namespace+"selectList");
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
			session.commit();
			session.close();
		}
		
		
		return res;
	}
	
	//굿즈 게시글 하나 삭제
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
	
	//굿즈 게시글 여러개 삭제 
	public int multiDelete(String[] goods_no) {
		SqlSession session  = null;
		int count = 0;
		//스트링 타입으로 스트링 배열 보낼 거!
		Map<String, String[]> map = new HashMap<>();
		map.put("goods_nos", goods_no);
		
		
		try {
			session = getSqlSessionFactory().openSession(false);
			count = session.delete(namespace+"muldelete", map);
			if(count == goods_no.length) {
				session.commit();
			}
		} catch (Exception e) {
			System.out.println("goodsdao에서 멀딜 오류");
			e.printStackTrace();
		}finally {
			session.close();
		}
		return count;
	}
	
	//댓글시작
	
	public List<AnswerDto> answerList(int goods_no){
		System.out.println("dao : selectList왔나?");
		SqlSession session = null;
		List<AnswerDto> list = null;
		
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"answerList", goods_no);
		} catch (Exception e) {
			System.out.println("answerList 오류(다오)");
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
	//원댓글삭제
	public int answerdelete(int goods_re_no) {
		SqlSession session =  null;
		int res =0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.delete(namespace+"answerdelete", goods_re_no);
		} catch (Exception e) {
			System.out.println("goodsdao에서 answerdelete오류");
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		
		return res;
	}
	//끼어드는 곳 , 즉 댓글이 들어갈 공간을 만들어줌
	public int rereplyupdate(int goods_re_no) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.update(namespace+"rereplyupdate", goods_re_no);
		} catch (Exception e) {
			System.out.println("goodsdao에서 rereplyupdate오류");
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		
		return res;
	}
	
	//관리자의 댓글
	public int rereplyinsert(AnswerDto dto) {
		SqlSession session = null;
		int res = 0 ;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace+"rereplyinsert", dto);
			if(res>0) {
				session.commit();
			}else {
				System.out.println("입력실패요ㅠ");
			}
		} catch (Exception e) {
			System.out.println("goodsdao에서 rereplyInsert오류 ");
			e.printStackTrace();
		}finally {
			session.close();
		}
		return res;
	}
	

}
