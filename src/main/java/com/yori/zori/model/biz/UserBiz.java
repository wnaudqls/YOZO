package com.yori.zori.model.biz;

import com.yori.zori.model.dto.MemberDto;

public interface UserBiz {
	public MemberDto login(MemberDto dto);

	public MemberDto idCheck(MemberDto dto);

	public MemberDto nickCheck(MemberDto dto);

	public boolean insert(MemberDto dto);

	public boolean update(MemberDto dto);

	public boolean delete(MemberDto dto);

	public MemberDto findId(MemberDto dto);

	public MemberDto findPw(MemberDto dto);
}
