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
		System.out.println(rdto);
		session.close();
		
		
		return rdto;
	}
	
	public MemberDto idCheck(String member_id) {
		
		SqlSession session = null;
		MemberDto rdto = null;
		MemberDto dto = new MemberDto();
		System.out.println("id어딧게"+member_id);
		dto.setMember_id(member_id);
		
		
		session = getSqlSessionFactory().openSession(true);
		rdto = session.selectOne(namespace+"idcheck",dto);
		
		System.out.println("넌뭐니"+rdto);
		session.close();
		
		
		return rdto;
	}
	public MemberDto nickCheck(String member_nick) {
		
		SqlSession session = null;
		MemberDto rdto = null;
		MemberDto dto = new MemberDto();
		System.out.println("id어딧게"+member_nick);
		dto.setMember_nick(member_nick);
		
		
		session = getSqlSessionFactory().openSession(true);
		rdto = session.selectOne(namespace+"nickcheck",dto);
		
		System.out.println("넌뭐니"+rdto);
		session.close();
		
		
		return rdto;
	}
	
	public MemberDto join(MemberDto dto) {
		
		SqlSession session = null;
		
		
		
		return null;
	}
	
	
	
}
