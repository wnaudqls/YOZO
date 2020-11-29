package com.yori.zori.model.dao;


import java.util.List;



import com.yori.zori.model.dto.MemberDto;


public interface AdminDao {
	String namespace = "admin.";
   
 
   
   public List<MemberDto> selectList();
	public List<MemberDto> search(String txt);
   
   public int update(MemberDto dto); 
	
   
   public int delete(MemberDto dto);
   
   public int multiDelete(String[] seq);
  
}