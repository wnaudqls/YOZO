package com.yozo.like.dto;

public class LikeDto {

	private int recipe_no;
	private int like_check;
	private int like_it;
	private int member_no;
	public LikeDto() {

	}
	
	public LikeDto(int member_no, int recipe_no) {
		
		
		this.member_no = member_no;
		this.recipe_no = recipe_no;
	}
	
	
	public LikeDto(int recipe_no, int like_check, int like_it, int member_no) {
	
		this.recipe_no = recipe_no;
		this.like_check = like_check;
		this.like_it = like_it;
		this.member_no = member_no;
	}



	public int getLike_seq() {
		return recipe_no;
	}
	public void setLike_seq(int recipe_no) {
		this.recipe_no = recipe_no;
	}
	public int getLike_check() {
		return like_check;
	}
	public void setLike_check(int like_check) {
		this.like_check = like_check;
	}
	public int getLike_it() {
		return like_it;
	}
	public void setLike_it(int like_it) {
		this.like_it = like_it;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	

}