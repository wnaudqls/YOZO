package com.yozo.user.dao;

import org.apache.ibatis.session.SqlSession;

import com.yozo.common.SqlMapConfig;
import com.yozo.user.dto.MemberDto;

public class UserDao extends SqlMapConfig{

	private String namespace = "member.";
	
	public MemberDto login(String member_id, String member_pw) {
		
		SqlSession session = null;
		MemberDto rdto = null;
		MemberDto dto = new MemberDto();
		dto.setMember_id(member_id);
		dto.setMember_pw(member_pw);
		
		
		//System.out.println(dto.getMember_pw());
		
		

		session = getSqlSessionFactory().openSession(true);
		rdto = session.selectOne(namespace+"login",dto);
		System.out.println("아무거나 ..");
		session.close();
		
		
		return rdto;
	}
	
	
	
}
