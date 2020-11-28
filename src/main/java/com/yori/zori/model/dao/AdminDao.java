package com.yori.zori.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.yori.zori.model.dto.MemberDto;


public class AdminDao {
   private String namespace = "admin.";
   
   public List<MemberDto> selectList(){
	  System.out.println("dao list입장");
      SqlSession session = null;
      List<MemberDto> list = null;
      
      try {
    	 System.out.println("dao list 중간");
         session = getSqlSessionFactory().openSession(false);
         System.out.println(session);
         list = session.selectList(namespace+"selectList");
         System.out.println(list);
         System.out.println(list.get(0).getMember_id());
      } catch (Exception e) {
    	 System.out.println("dao errors");
         e.printStackTrace();
      } finally {
         session.close();
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
   public List<MemberDto> search(String txt){
	   System.out.println("search dao입장");
	   SqlSession session = null;
	   List<MemberDto> list = null;
	  
	   try {
		System.out.println("search dao 중간");
		session = getSqlSessionFactory().openSession(false);
	    list = session.selectList(namespace+"search",txt);
	} catch (Exception e) {
		System.out.println("dao search error");
		e.printStackTrace();
	} finally {
		session.close();
	}
	   return list;
   }
   
   public int update(MemberDto dto) {
	  System.out.println("업데이트 입장");
      SqlSession session = null;
      int res = 0;
      System.out.println("아이디" +dto.getMember_id());
      
      try {
    	  System.out.println("중간");
         session = getSqlSessionFactory().openSession(false);
         System.out.println(dto.getMember_role());
         System.out.println(session);
         res = session.update("admin.update",dto);
         System.out.println(res);
         System.out.println("왓냐?");
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
    	 session.commit();
    	 System.out.println("병신이냐");
         session.close();
      }
      return res;
   }
   
   public int delete(int seq) {
      SqlSession session = null;
      int res = 0;
      
      try {
         session = getSqlSessionFactory().openSession();
         res = session.delete(namespace+"delete", seq);
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
      SqlSession session = null;
      
      try {
         session = getSqlSessionFactory().openSession(false);
         count = session.delete(namespace+"multdel",map);
         if(count == seq.length) {
            session.commit();
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         session.close();
      }
      
      return count;
   }
  
}