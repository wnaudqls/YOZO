package com.yozo.recipe.dto;

import java.sql.Date;

public class RecipereDto {

	private int recipe_re_no;
	private int recipe_no;
	private String recipe_re_content;
	private Date recipe_re_regdate;
	private int recipe_re_groupno;
	private int recipe_re_seq;
	private int recipe_re_titletab;
	private String member_id;
	
	
	
	
	
	public RecipereDto() {
	}
	public RecipereDto(int recipe_re_no, int recipe_no, String recipe_re_content, Date recipe_re_regdate,
			int recipe_re_groupno, int recipe_re_seq, int recipe_re_titletab, String member_id) {
		super();
		this.recipe_re_no = recipe_re_no;
		this.recipe_no = recipe_no;
		this.recipe_re_content = recipe_re_content;
		this.recipe_re_regdate = recipe_re_regdate;
		this.recipe_re_groupno = recipe_re_groupno;
		this.recipe_re_seq = recipe_re_seq;
		this.recipe_re_titletab = recipe_re_titletab;
		this.member_id = member_id;
	}
	public int getRecipe_re_no() {
		return recipe_re_no;
	}
	public void setRecipe_re_no(int recipe_re_no) {
		this.recipe_re_no = recipe_re_no;
	}
	public int getRecipe_no() {
		return recipe_no;
	}
	public void setRecipe_no(int recipe_no) {
		this.recipe_no = recipe_no;
	}
	public String getRecipe_re_content() {
		return recipe_re_content;
	}
	public void setRecipe_re_content(String recipe_re_content) {
		this.recipe_re_content = recipe_re_content;
	}
	public Date getRecipe_re_regdate() {
		return recipe_re_regdate;
	}
	public void setRecipe_re_regdate(Date recipe_re_regdate) {
		this.recipe_re_regdate = recipe_re_regdate;
	}
	public int getRecipe_re_groupno() {
		return recipe_re_groupno;
	}
	public void setRecipe_re_groupno(int recipe_re_groupno) {
		this.recipe_re_groupno = recipe_re_groupno;
	}
	public int getRecipe_re_seq() {
		return recipe_re_seq;
	}
	public void setRecipe_re_seq(int recipe_re_seq) {
		this.recipe_re_seq = recipe_re_seq;
	}
	public int getRecipe_re_titletab() {
		return recipe_re_titletab;
	}
	public void setRecipe_re_titletab(int recipe_re_titletab) {
		this.recipe_re_titletab = recipe_re_titletab;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	@Override
	public String toString() {
		return "RecipereDto [recipe_re_no=" + recipe_re_no + ", recipe_no=" + recipe_no + ", recipe_re_content="
				+ recipe_re_content + ", recipe_re_regdate=" + recipe_re_regdate + ", recipe_re_groupno="
				+ recipe_re_groupno + ", recipe_re_seq=" + recipe_re_seq + ", recipe_re_titletab=" + recipe_re_titletab
				+ ", member_id=" + member_id + "]";
	}
	
}
