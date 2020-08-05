package com.yozo.recipe.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.yozo.recipe.biz.RecipeBiz;
import com.yozo.recipe.dto.RecipeDto;
import com.yozo.user.dto.MemberDto;

/**
 * Servlet implementation class RecipeController
 */
@WebServlet("/recipe.do")
public class RecipeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RecipeController() {
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		System.out.println("recipe.do왔다~");
		String command = request.getParameter("command");
		RecipeBiz biz = new RecipeBiz();
		HttpSession session=request.getSession();
		//레시피 리스트
		if(command.equals("recipe_list")) {
			System.out.println("controller_recipe_list");
			List<RecipeDto> list=biz.selectList();
			if(list!=null) {
				System.out.println("list잘왔네~");
			}else {
				System.out.println("list어딨어ㅡㅡ");
			}
			System.out.println(list.get(0));
			request.setAttribute("list", list);
			dispatch("/view/recipe/recipe_list.jsp", request, response);
			
			
		}
		//레시피 작성
		else if(command.equals("recipe_insert")) {
			System.out.println("controller_recipe_insert");
		}
		//레시피 수정
		else if(command.equals("recipe_update")) {
			System.out.println("controller_recipe_update");
		}
		//레시피 삭제
		else if(command.equals("recipe_delete")) {
			System.out.println("controller_recipe_delete");
		}

	}

	

	public void dispatch(String url, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);

	}

	public void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String s = "<script type='text/javascript'>" + "alert('" + msg + "');" + "location.href='" + url + "';"
				+ "</script>";
		response.getWriter().append(s);
	}

}
