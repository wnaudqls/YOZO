package com.yozo.admin.dao;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.yozo.admin.dto.AdminDto;


public class AdminDao extends SqlMapConfig{
   private String namespace = "mapper.";
   
   public List<AdminDto> selectList(){
	  System.out.println("dao 입장");
      SqlSession session = null;
      List<AdminDto> list = null;
      
      try {
    	 System.out.println("dao");
         session = getSqlSessionFactory().openSession(false);
         list = session.selectList(namespace+"selectList");
      } catch (Exception e) {
    	 System.out.println("dao errors");
         e.printStackTrace();
      } finally {
         session.close();
      }
      return list;
   }
   
   public int update(AdminDto dto) {
      SqlSession session = null;
      int res = 0;
      
      try {
         session = getSqlSessionFactory().openSession(false);
         res = session.update(namespace+"update",dto);
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
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