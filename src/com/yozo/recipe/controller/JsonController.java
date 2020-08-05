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
@WebServlet("/json.do")
public class JsonController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public JsonController() {
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
		// Json데이터 DB에 입력
		if (command.equals("jsoninsert")) {
			System.out.println("(controller)jsoninsert!!왔다");
			String rson = request.getParameter("rson");

			JsonElement element = JsonParser.parseString(rson);
			// 어떤 형식일지를 알 수 없기 떄문에 어떤 JSON데이터 형태도 저장할 수 있는 JSONElement형태로 받아 준다
			// jsonelement는 json요소를 나타내는 클래스
			// jsonparser클래스의parseString메소드로 JSON형태의 문자열을 JSON타입으로 변경해주고
			// 처음 Json요소를 가져올 때 기본적으로 jsonelement형태로 받아온다
			// 문자열을 JSON형태로 바꿔준다
			// 지정된 JSON 문자열을 구문 분석 트리로 구문 분석

			List<RecipeDto> list = new ArrayList<RecipeDto>();
			for (int i = 0; i < element.getAsJsonObject().get("DATA").getAsJsonArray().size(); i++) {
					JsonObject tmp=element.getAsJsonObject().get("DATA").getAsJsonArray().get(i).getAsJsonObject();
					//받아온 JSON 값을 일단은 Object로 가져오고
					
					//element.getAsJsonObejct().get("DATA").getAsJsonArray()
					//elemenet.getAsJsonObejct(): {k:v}형태로 가져오겠다	(return JsonObject)
					//.get("DATA"): {k:v} 형식에서 k가 "DATA"인 v를 가져오겠다 (return JsonElement) 
					//.getAsJsonArray() : v에서 [{},{},,,{}] 형태로 가져오겠다
				
					//get(i): [{},{},,{}]에서 i번지의 {}를 가져오겠다. ( return JsonElement) ★무슨 형태인지 모르니깐
					//getAsJsonObject: return JsonObject= i번지 안에 있는 Json  {k:v}
				/*	MemberDto memberdto = (MemberDto)session.getAttribute("rdto");
					String member_id=memberdto.getMember_id();   */
					
						try {
							//if(tmp.get("recipe_title").getAsString()!=null && tmp.get("recipe_writer").getAsString()!=null && tmp.get("material").getAsJsonArray().toString()!=null&&tmp.get("recipe_step").getAsJsonArray().toString()!=null ) {
							String recipe_title=tmp.get("recipe_title").getAsString();
							String recipe_main_img=tmp.get("recipe_main_img").getAsString();
							String recipe_writer=tmp.get("recipe_writer").getAsString();
							String material=tmp.get("material").getAsJsonArray().toString();
							String recipe_step=tmp.get("recipe_step").getAsJsonArray().toString();
							
							System.out.println("recipe_title"+recipe_title);
							System.out.println("recipe_main_img:"+recipe_main_img);
							System.out.println("recipe_writer:"+recipe_writer);
							System.out.println("material:"+material);
							System.out.println("recipe_step:"+recipe_step);
							RecipeDto dto=new RecipeDto(0,recipe_main_img,"yujeong",recipe_title,
									recipe_step,null,0,"대표재료",1,1,material,0);
							list.add(dto);
						} catch (Exception e) {
							// TODO Auto-generated catch block
							System.out.println("이상해~ 넘어간다~");
							e.printStackTrace();
						}
					
			}
			int res=biz.jsonInsert(list);
			if(res>0) {
				jsResponse("입력성공",request.getContextPath()+"/view/recipe/json_insert.jsp", response);
			}else {
				jsResponse("입력실패",request.getContextPath()+"/view/recipe/json_insert.jsp", response);
			}
		}
		// for(int i=0;i<rson.length;i++) {
		/* String[] arr=rson[i].split(regex) */
		// }
		/* int res=biz.insert(); */

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
