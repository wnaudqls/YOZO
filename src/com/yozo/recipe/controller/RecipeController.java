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
		System.out.println(command);
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


			System.out.println(list);


			/* System.out.println(list.get(0)); */

			request.setAttribute("list", list);
			System.out.println(list);
			dispatch("/view/recipe/recipe_list.jsp", request, response);
			
			
		}
		//레시피 상세
		else if(command.equals("recipe_detail")) {
			System.out.println("controller_recipe_detai");
			int recipe_no=Integer.parseInt(request.getParameter("recipe_no"));
			RecipeDto dto=biz.selectOne(recipe_no);
			request.setAttribute("dto", dto);
			System.out.println(dto);
			
			List<String> detail=new ArrayList<String>();
			List<String> material=new ArrayList<String>();
			
			JsonElement element_detail=JsonParser.parseString(dto.getRecipe_detail());
			JsonElement element_material=JsonParser.parseString(dto.getRecipe_material());
			
			JsonArray tmp_detail=element_detail.getAsJsonArray();
				for(int i=0;i<tmp_detail.size();i++) {
					detail.add(tmp_detail.get(i).getAsString());
				}
				
			JsonArray tmp_material=element_material.getAsJsonArray();
				for(int i=0;i<tmp_material.size();i++) {
					material.add(tmp_material.get(i).getAsString());
				}
				
				System.out.println("detail: "+detail);
				System.out.println(detail.get(0));
				System.out.println("material: "+material);
				request.setAttribute("detail", detail);
				request.setAttribute("material", material);
				
			
			dispatch("/view/recipe/recipe_detail.jsp", request, response);
		}
		//레시피 작성
		else if(command.equals("recipe_insert")) {
			System.out.println("controller_recipe_insert");
			//여기서 등록된 값을 받아주어 db로 저장시켜야함!
			
		}
		//레시피 수정
		else if(command.equals("recipe_update")) {
			System.out.println("controller_recipe_update");
			int recipe_no = Integer.parseInt(request.getParameter("recipe_no"));
			System.out.println("recipe_ no : " + recipe_no);
			RecipeDto dto = biz.selectOne(recipe_no);
			request.setAttribute("dto", dto);
			dispatch("/view/recipe/recipe_update.jsp", request, response);
		}
		//레시피 삭제
		else if(command.equals("recipe_delete")) {
			System.out.println("controller_recipe_delete");
			int recipe_no = Integer.parseInt(request.getParameter("recipe_no"));
			
			int res = biz.delete(recipe_no);
			if(res>0) {
				System.out.println("레시피 하나 삭제성공");
				jsResponse("레시피를 성공적으로 삭제하였습니다.", "/recipe.do?command=recipe_list", response);
			}else {
				System.out.println("레시피 하나 삭제실패");
				jsResponse("레시피를 삭제하는데 실패하였습니다.", "/recipe.do?command=recipe_list", response);
			}
			
		//레시피 작성 폼
		}else if(command.equals("recipeinsertform")) {
			System.out.println("controller_recipe_insertform");
			response.sendRedirect(request.getContextPath() + "/view/recipe/recipe_insert.jsp");
		
		//레시피 여러개 삭제
		}else if(command.contentEquals("recipemuldel")) {
			System.out.println("controller_recipe_muldel");
			String[] recipe_no = request.getParameterValues("chk");
			System.out.println(recipe_no+ "레시피 번호 오냐? 오냐고 와라!!!!");
			
			int res = biz.multiDelte(recipe_no);
			
			if(res>0) {
				System.out.println("레시피 멀티 딜리트 성공");
				jsResponse("선택하신 레시피를 성공적으로 삭제하였습니다.", "recipe.do?command=recipe_list", response);
			}else {
				System.out.println("레시피 멀티 딜리트 실패");
				jsResponse("레시피를 삭제하는데 실패하였습니다.", "recipe.do?command=recipe_list", response);
			}
			

			//레시피 등록
		}else if(command.equals("recipe_insertres")) {
			System.out.println("recipe_insertres왔음!");

			
		} else if(command.equals("recipe_search")) {
			System.out.println("search controller 입장");
			String txt = request.getParameter("recipe_title");
			System.out.println(txt);
			List<RecipeDto> list = biz.search(txt);
			System.out.println("search controller 중간");
			request.setAttribute("list", list);
			dispatch("/view/recipe/recipe_list.jsp", request, response);
			System.out.println(list);

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
