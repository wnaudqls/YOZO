package com.yori.zori.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yori.zori.model.dto.MemberDto;

public interface UserDao {

	String namespace = "member";

	public MemberDto login(String member_id, String member_pw);

	public MemberDto idCheck(String member_id);

	public MemberDto nickCheck(String member_nick);

	public boolean insert(MemberDto dto);

	public boolean update(MemberDto dto);

	public boolean delete(MemberDto dto);

	public MemberDto findId(String member_email);

	public MemberDto findPw(String member_email);

}
