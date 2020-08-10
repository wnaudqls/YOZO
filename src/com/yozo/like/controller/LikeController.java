
package com.yozo.like.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yozo.like.biz.LikeBiz;
import com.yozo.like.dto.LikeDto;

@WebServlet("/like.do")
public class LikeController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		String command = request.getParameter("command");
		if (command.equals("like")) {

			int recipe_no = Integer.parseInt(request.getParameter("recipe_no"));
			int member_no = Integer.parseInt(request.getParameter("member_no"));
			LikeBiz biz = new LikeBiz();
			boolean chk = biz.overlap_check(new LikeDto(member_no, recipe_no));
			System.out.println(chk);
			if (chk) {
				int cancel = biz.cancel_like(recipe_no);
				int delete = biz.delete_like(new LikeDto(member_no, recipe_no));
				System.out.println("레시피번호: " + recipe_no + "유저번호: " + member_no);
				int result = cancel + delete;
				System.out.println(result);
				if (result >= 2) {
					response.getWriter().write("좋아요 취소 성공");
				}
			} else {
				int res = biz.insert_like(new LikeDto(member_no, recipe_no));
				if (res > 0) {

					int overlap = biz.addcount(recipe_no);
					if (overlap > 0) {
						System.out.println("좋아요 추가 성공");
						response.getWriter().write("추가 성공");
					} else {
						System.out.println("오류 발생");
						response.getWriter().write("오류 발생");
					}
				}
			}
		}
	}
}
