package com.yori.zori.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.yori.zori.model.dto.MemberDto;


public class AdminDao {
	private String namespace = "admin.";
   
   @Autowired
   SqlSessionTemplate session;
   
   public List<MemberDto> selectList(){
	  System.out.println("dao list입장");
      List<MemberDto> list = new ArrayList<MemberDto>();
      
      try {
         list = session.selectList(namespace+"selectList");
      } catch (Exception e) {
    	 System.out.println("dao errors");
         e.printStackTrace();
      }
      return list;
   }
//   public MemberDto selectOne(int member_no) {
//	   System.out.println("dao selectOne입장");
//	   SqlSession session = null;
//	   MemberDto dto = null;
//	   
//	   try {
//		session = getSqlSessionFactory().openSession(true);
//		   dto = session.selectOne(namespace+"selectOne",member_no);
//	} catch (Exception e) {
//		// TODO Auto-generated catch block
//		e.printStackTrace();
//	} finally {
//		session.close();
//	}
//	   return dto;
//	   
//   }
	public List<MemberDto> search(String txt) {

		List<MemberDto> list = new ArrayList<MemberDto>();

		try {
			list = session.selectList(namespace + "search", txt);
		} catch (Exception e) {
			System.out.println("dao search error");
			e.printStackTrace();
		}
		return list;
	}
   
   public int update(MemberDto dto) {
	  System.out.println("업데이트 입장");

      int res = 0;
      
      try {
 
         res = session.update(namespace+"update",dto);
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
    	 session.commit();
    	 System.out.println("병신이냐");
         session.close();
      }
      return res;
   }
   
   public int delete(MemberDto dto) {
      int res = 0;
      
      try {
         res = session.delete(namespace+"delete", dto);
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         session.close();
      }
      
      return res;
   }
   
   public int multiDelete(String[] seq) {
      int count = 0;
      Map<String, String[]> map = new HashMap<>();
      map.put("seqs", seq);
      
      try {
         count = session.delete(namespace+"multdel",map);
  
      } catch (Exception e) {
         e.printStackTrace();
      } 
      return count;
   }
  
}