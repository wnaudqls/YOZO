package com.yori.zori.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yori.zori.model.dao.UserDao;
import com.yori.zori.model.dto.MemberDto;

@Service
public class UserBizImpl implements UserBiz{

	@Autowired
	UserDao dao;
	@Override
	public MemberDto login(MemberDto dto) {
		// TODO Auto-generated method stub
		return dao.login(dto);
	}

	@Override
	public MemberDto idCheck(MemberDto dto) {
		// TODO Auto-generated method stub
		return dao.idCheck(dto);
	}

	@Override
	public MemberDto nickCheck(MemberDto dto) {
		// TODO Auto-generated method stub
		return dao.nickCheck(dto);
	}

	@Override
	public boolean insert(MemberDto dto) {
		// TODO Auto-generated method stub
		return dao.insert(dto);
	}

	@Override
	public boolean update(MemberDto dto) {
		// TODO Auto-generated method stub
		return dao.update(dto);
	}

	@Override
	public boolean delete(MemberDto dto) {
		// TODO Auto-generated method stub
		return dao.delete(dto);
	}

	@Override
	public MemberDto findId(MemberDto dto) {
		// TODO Auto-generated method stub
		return dao.findId(dto);
	}

	@Override
	public MemberDto findPw(MemberDto dto) {
		// TODO Auto-generated method stub
		return dao.findPw(dto);
	}

}
