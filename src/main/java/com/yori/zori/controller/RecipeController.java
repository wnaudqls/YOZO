package com.yori.zori.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.JsonPrimitive;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.yori.zori.model.biz.RecipeBizImpl;
import com.yori.zori.recipe.dto.RecipeDto;
import com.yori.zori.user.dto.MemberDto;

import net.sf.json.JSONArray;
import oracle.sql.DATE;

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
		RecipeBizImpl biz = new RecipeBizImpl();
		HttpSession session = request.getSession();

		// 레시피 리스트
	
		if (command.equals("recipe_list")) {
			System.out.println("controller_recipe_list");
			List<RecipeDto> list = biz.selectList();
			if (list != null) {
				System.out.println("list잘왔네~");
			} else {
				System.out.println("list어딨어ㅡㅡ");
			}

			/* System.out.println(list); */

			/* System.out.println(list.get(0)); */

			request.setAttribute("list", list);

			dispatch("/view/recipe/recipe_list.jsp", request, response);

			/*
			 * 이상한부분
			 * System.out.println(list);
			 * 
			 * System.out.println(list.get(0));
			 * 
			 * request.setAttribute("list", list);
			 * 
			 * System.out.println(list); dispatch("/view/recipe/recipe_list.jsp", request,
			 * response);
			 */
		}

		// 마이 레시피 리스트
		else if (command.equals("my_recipe_list")) {

			System.out.println("controller_recipe_list");
			String member_id = request.getParameter("memberId");
			List<RecipeDto> list = biz.MYselectList(member_id);
			System.out.println(member_id);
			if (list != null) {
				System.out.println("마이 레시피 list잘왔네~");
			} else {
				System.out.println("마이 레시피 list어딨어ㅡㅡ");
			}

			/* System.out.println(list.get(0)); */

			request.setAttribute("list", list);
			System.out.println(list);

			dispatch("/view/recipe/recipe_list.jsp", request, response);

		}
		// 레시피 상세
		else if (command.equals("recipe_detail")) {
			{
				System.out.println("controller_recipe_detail"); // 에러날수있어조심
				int recipe_no = Integer.parseInt(request.getParameter("recipe_no"));
				RecipeDto dto = biz.selectOne(recipe_no);
				request.setAttribute("dto", dto);
				System.out.println(dto);

				List<String> detail = new ArrayList<String>(); // 레시피내용
				List<String> material = new ArrayList<String>(); // 재료
				List<String> photo = new ArrayList<String>(); // 레시피사진

				JsonElement element_detail = JsonParser.parseString(dto.getRecipe_detail());
				JsonElement element_material = JsonParser.parseString(dto.getRecipe_material());

				if(dto.getRecipe_photo()!=null)
					{
						System.out.println("null이아니네??");
						JsonElement element_photo = JsonParser.parseString(dto.getRecipe_photo());
	
						JsonArray tmp_photo = element_photo.getAsJsonArray();
						for (int i = 0; i < tmp_photo.size(); i++) {
							photo.add(tmp_photo.get(i).getAsString());
						}
					}	
				JsonArray tmp_detail = element_detail.getAsJsonArray();
				for (int i = 0; i < tmp_detail.size(); i++) {
					detail.add(tmp_detail.get(i).getAsString());
				}

				JsonArray tmp_material = element_material.getAsJsonArray();
				for (int i = 0; i < tmp_material.size(); i++) {
					material.add(tmp_material.get(i).getAsString());
				}

				System.out.println("detail: " + detail);
				System.out.println("material: " + material);
				System.out.println("photo: " + photo);
				request.setAttribute("detail", detail);
				request.setAttribute("material", material);
				request.setAttribute("photo", photo);

				dispatch("/view/recipe/recipe_detail.jsp", request, response);

			}
		}
		// 레시피 작성
		else if (command.equals("recipe_insert")) {
			System.out.println("controller_recipe_insert");
			// 여기서 등록된 값을 받아주어 db로 저장시켜야함!

			// 이미지 업로드 하기 전에 데이터 받아옴
			String recipe_main_photo = request.getParameter("recipe_main_photo");
			String recipe_title = request.getParameter("recipe_title");
			String cate_theme = request.getParameter("cate_theme");
			String cate_kind = request.getParameter("cate_kind");
			String recipe_material_one = request.getParameter("recipe_material_one");
			String[] recipe_material_array = request.getParameterValues("recipe_material");
			String[] recipe_photo_array = request.getParameterValues("recipe_photo");
			String[] recipe_detail_array = request.getParameterValues("recipe_detail");

			System.out.println(recipe_main_photo);
			System.out.println(recipe_title);
			System.out.println(cate_theme);
			System.out.println(cate_kind);
			System.out.println(recipe_material_one);
			System.out.println(recipe_material_array);
			System.out.println(recipe_photo_array);
			System.out.println(recipe_detail_array);

			JsonArray jArray = new JsonArray();
			for (int i = 0; i < recipe_material_array.length; i++) {
				JsonPrimitive element = new JsonPrimitive(recipe_material_array[i]);
				jArray.add(element);
			}
			String recipe_material = jArray.toString();
			System.out.println("json배열을 문자열로 바꿔줌 :" + jArray.toString()); //

			JsonArray jArray2 = new JsonArray();
			for (int i = 0; i < recipe_photo_array.length; i++) {
				JsonPrimitive element = new JsonPrimitive(recipe_photo_array[i]);
				jArray2.add(element);
			}
			String recipe_photo = jArray2.toString();
			System.out.println("json배열포토 문자열 : " + jArray2.toString()); //

			JsonArray jArray3 = new JsonArray();
			for (int i = 0; i < recipe_detail_array.length; i++) {
				JsonPrimitive element = new JsonPrimitive(recipe_detail_array[i]);
				jArray3.add(element);
			}
			String recipe_detail = jArray3.toString();
			System.out.println("json배열 디테일 :" + jArray3.toString());

			MemberDto member_dto = (MemberDto) session.getAttribute("rdto");
			String member_id = member_dto.getMember_id();
			int res = 0;
			RecipeDto recipe_dto = new RecipeDto(1, recipe_main_photo, member_id, recipe_title, recipe_photo,
					recipe_detail, null, recipe_material_one, cate_theme, cate_kind, recipe_material, 0);

			res = biz.insert(recipe_dto);
			System.out.println("dto :" + recipe_dto);

			if (res > 0) {
				System.out.println("레시피 인서트 성공");
				jsResponse("레시피를 성공적으로 등록하였습니다.", "recipe.do?command=recipe_list", response);
			} else {
				System.out.println("레시피 인서트 실패;");
				jsResponse("레시피 등록을 실패하였습니다. recipe_insert컨트롤러임 ㅡㅡㅋ", "recipe.do?command=recipe_list", response);
			}

		}

		// 레시피 수정
		else if (command.equals("recipe_update")) {
			System.out.println("controller_recipe_update");
			int recipe_no = Integer.parseInt(request.getParameter("recipe_no"));
			System.out.println("recipe_ no : " + recipe_no);
			RecipeDto dto = biz.selectOne(recipe_no);
			request.setAttribute("dto", dto);
			JsonArray element_material = JsonParser.parseString(dto.getRecipe_material()).getAsJsonArray();
			JsonArray element_detail = JsonParser.parseString(dto.getRecipe_detail()).getAsJsonArray();
			JsonArray element_photo = JsonParser.parseString(dto.getRecipe_photo()).getAsJsonArray();
			List<String> material = new ArrayList<String>();
			List<String> detail = new ArrayList<String>();
			List<String> photo = new ArrayList<String>();

			for (JsonElement str : element_material) {
				material.add(str.getAsString());
				System.out.println(str.getAsString());
			}
			for (JsonElement str : element_detail) {
				detail.add(str.getAsString());
				System.out.println(str.getAsString());
			}
			for (JsonElement str : element_photo) {
				photo.add(str.getAsString());
				System.out.println(str.getAsString());
			}
			request.setAttribute("material", material);
			request.setAttribute("detail", detail);
			request.setAttribute("photo", photo);

			dispatch("/view/recipe/recipe_update.jsp", request, response);

		}
		// 레시피 삭제
		else if (command.equals("recipe_delete")) {
			System.out.println("controller_recipe_delete");
			int recipe_no = Integer.parseInt(request.getParameter("recipe_no"));

			int res = biz.delete(recipe_no);
			if (res > 0) {
				System.out.println("레시피 하나 삭제성공");
				jsResponse("레시피를 성공적으로 삭제하였습니다.", "recipe.do?command=recipe_list", response);
			} else {
				System.out.println("레시피 하나 삭제실패");
				jsResponse("레시피를 삭제하는데 실패하였습니다.", "recipe.do?command=recipe_list", response);
			}

			// 레시피 작성 폼
		} else if (command.equals("recipeinsertform")) {
			System.out.println("controller_recipe_insertform");

			response.sendRedirect(request.getContextPath() + "/view/recipe/recipe_insert.jsp");

			// 레시피 여러개 삭제
		} else if (command.contentEquals("recipemuldel")) {

			System.out.println("controller_recipe_muldel");
			String[] recipe_no = request.getParameterValues("chk");
			System.out.println(recipe_no + "레시피 번호 오냐? 오냐고 와라!!!!");
			MemberDto member_dto = (MemberDto) session.getAttribute("rdto");
			String member_id = member_dto.getMember_id();
			int res = biz.multiDelte(recipe_no);

			if (res > 0) {
				System.out.println("레시피 멀티 딜리트 성공");

				jsResponse("선택하신 레시피를 성공적으로 삭제하였습니다.", "recipe.do?command=recipe_list", response);

				jsResponse("선택하신 레시피를 성공적으로 삭제하였습니다.", "recipe.do?memberId=" + member_id + "&command=my_recipe_list",
						response);

			} else {
				System.out.println("레시피 멀티 딜리트 실패");
				jsResponse("레시피를 삭제하는데 실패하였습니다.", "recipe.do?memberId=" + member_id + "&command=my_recipe_list",
						response);
			}

			// 레시피 등록

			// 이미지 업로드
		} else if (command.equals("imgUpload")) {
			System.out.println("이미지 업로드 왔다");
			System.out.println(request.getContentType());
			String realFolder = "";

			String filename1 = ""; // 업로드한 파일이름
			int maxSize = 1024 * 1024 * 10; // 파일 사이즈 설정: 5M
			/* String encType = "multipart/form-data"; */
			String savefile = "recipeimages";
			ServletContext scontext = getServletContext();
			System.out.println("scontext:" + scontext);
			realFolder = scontext.getRealPath(savefile);

			System.out.println("realFolder" + realFolder);

			try {
				MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, "utf-8",
						new DefaultFileRenamePolicy());
				Enumeration<?> files = multi.getFileNames(); // 전송한 전체 파일이름들을 가져온다.
				System.out.println("files" + files.toString());
				String file1 = (String) files.nextElement();
				System.out.println("file1:" + file1);
				// 파일명 중복이 발생했을 때 정책에 의해 뒤에 1,2,3 처럼 숫자가 붙어 고유 파일명을 생성한다
				// 이때 생성된 이름을 FilesystemName이라고 하여 그 이름 정보를 가져온다.(중복 처리)
				filename1 = multi.getFilesystemName(file1);
			} catch (Exception e) {
				System.out.println("이런 싸발면");
				e.printStackTrace();
			}

			String fullpath = realFolder + "\\" + filename1;
			System.out.println("fullpath:" + fullpath);

		} else if (command.equals("recipe_insertres")) {
			System.out.println("recipe_insertres왔음!");

		} else if (command.equals("recipe_search")) {
			System.out.println("search controller 입장");
			String txt = request.getParameter("recipe_title");
			System.out.println(txt);
			List<RecipeDto> list = biz.search(txt);
			System.out.println("search controller 중간");
			request.setAttribute("list", list);
			dispatch("/view/recipe/recipe_list.jsp", request, response);
			System.out.println(list);

			
		}
		

		// 마이 레시피 리스트
		else if (command.equals("my_recipe_list")) {

			System.out.println("controller_recipe_list");
			String member_id = request.getParameter("memberId");
			List<RecipeDto> list = biz.MYselectList(member_id);
			System.out.println(member_id);
			if (list != null) {
				System.out.println("마이 레시피 list잘왔네~");
			} else {
				System.out.println("마이 레시피 list어딨어ㅡㅡ");
			}

			/* System.out.println(list.get(0)); */

			request.setAttribute("list", list);
			System.out.println(list);

			dispatch("/view/recipe/recipe_list.jsp", request, response);

		}
		// 레시피 상세
		else if (command.equals("recipe_detail")) {
			{
				System.out.println("controller_recipe_detail"); // 에러날수있어조심
				int recipe_no = Integer.parseInt(request.getParameter("recipe_no"));
				RecipeDto dto = biz.selectOne(recipe_no);
				request.setAttribute("dto", dto);
				System.out.println(dto);

				List<String> detail = new ArrayList<String>();
				List<String> material = new ArrayList<String>();

				JsonElement element_detail = JsonParser.parseString(dto.getRecipe_detail());
				JsonElement element_material = JsonParser.parseString(dto.getRecipe_material());

				JsonArray tmp_detail = element_detail.getAsJsonArray();
				for (int i = 0; i < tmp_detail.size(); i++) {
					detail.add(tmp_detail.get(i).getAsString());
				}

				JsonArray tmp_material = element_material.getAsJsonArray();
				for (int i = 0; i < tmp_material.size(); i++) {
					material.add(tmp_material.get(i).getAsString());
				}

				System.out.println("detail: " + detail);
				System.out.println(detail.get(0));
				System.out.println("material: " + material);
				request.setAttribute("detail", detail);
				request.setAttribute("material", material);

				dispatch("/view/recipe/recipe_detail.jsp", request, response);

			}
		}
		// 레시피 작성
		else if (command.equals("recipe_insert")) {
			System.out.println("controller_recipe_insert");
			// 여기서 등록된 값을 받아주어 db로 저장시켜야함!

			// 이미지 업로드 하기 전에 데이터 받아옴
			String recipe_main_photo = request.getParameter("recipe_main_photo");
			String recipe_title = request.getParameter("recipe_title");
			String cate_theme = request.getParameter("cate_theme");
			String cate_kind = request.getParameter("cate_kind");
			String recipe_material_one = request.getParameter("recipe_material_one");
			String[] recipe_material_array = request.getParameterValues("recipe_material");
			String[] recipe_photo_array = request.getParameterValues("recipe_photo");
			String[] recipe_detail_array = request.getParameterValues("recipe_detail");

			System.out.println(recipe_main_photo);
			System.out.println(recipe_title);
			System.out.println(cate_theme);
			System.out.println(cate_kind);
			System.out.println(recipe_material_one);
			System.out.println(recipe_material_array);
			System.out.println(recipe_photo_array);
			System.out.println(recipe_detail_array);

			JsonArray jArray = new JsonArray();
			for (int i = 0; i < recipe_material_array.length; i++) {
				JsonPrimitive element = new JsonPrimitive(recipe_material_array[i]);
				jArray.add(element);
			}
			String recipe_material = jArray.toString();
			System.out.println("json배열을 문자열로 바꿔줌 :" + jArray.toString()); //

			JsonArray jArray2 = new JsonArray();
			for (int i = 0; i < recipe_photo_array.length; i++) {
				JsonPrimitive element = new JsonPrimitive(recipe_photo_array[i]);
				jArray2.add(element);
			}
			String recipe_photo = jArray2.toString();
			System.out.println("json배열포토 문자열 : " + jArray2.toString()); //

			JsonArray jArray3 = new JsonArray();
			for (int i = 0; i < recipe_detail_array.length; i++) {
				JsonPrimitive element = new JsonPrimitive(recipe_detail_array[i]);
				jArray3.add(element);
			}
			String recipe_detail = jArray3.toString();
			System.out.println("json배열 디테일 :" + jArray3.toString());

			MemberDto member_dto = (MemberDto) session.getAttribute("rdto");
			String member_id = member_dto.getMember_id();
			int res = 0;
			RecipeDto recipe_dto = new RecipeDto(1, recipe_main_photo, member_id, recipe_title, recipe_photo,
					recipe_detail, null, recipe_material_one, cate_theme, cate_kind, recipe_material, 0);

			res = biz.insert(recipe_dto);
			System.out.println("dto :" + recipe_dto);

			if (res > 0) {
				System.out.println("레시피 인서트 성공");
				jsResponse("레시피를 성공적으로 등록하였습니다.", "recipe.do?command=recipe_list", response);
			} else {
				System.out.println("레시피 인서트 실패;");
				jsResponse("레시피 등록을 실패하였습니다. recipe_insert컨트롤러임 ㅡㅡㅋ", "recipe.do?command=recipe_list", response);
			}

		}

		// 레시피 수정
		else if (command.equals("recipe_update")) {
			System.out.println("controller_recipe_update");
			int recipe_no = Integer.parseInt(request.getParameter("recipe_no"));
			System.out.println("recipe_ no : " + recipe_no);
			RecipeDto dto = biz.selectOne(recipe_no);
			request.setAttribute("dto", dto);
			JsonArray element_material = JsonParser.parseString(dto.getRecipe_material()).getAsJsonArray();
			JsonArray element_detail = JsonParser.parseString(dto.getRecipe_detail()).getAsJsonArray();
			JsonArray element_photo = JsonParser.parseString(dto.getRecipe_photo()).getAsJsonArray();
			List<String> material = new ArrayList<String>();
			List<String> detail = new ArrayList<String>();
			List<String> photo = new ArrayList<String>();

			for (JsonElement str : element_material) {
				material.add(str.getAsString());
				System.out.println(str.getAsString());
			}
			for (JsonElement str : element_detail) {
				detail.add(str.getAsString());
				System.out.println(str.getAsString());
			}
			for (JsonElement str : element_photo) {
				photo.add(str.getAsString());
				System.out.println(str.getAsString());
			}
			request.setAttribute("material", material);
			request.setAttribute("detail", detail);
			request.setAttribute("photo", photo);

			dispatch("/view/recipe/recipe_update.jsp", request, response);

		}
		// 레시피 삭제
		else if (command.equals("recipe_delete")) {
			System.out.println("controller_recipe_delete");
			int recipe_no = Integer.parseInt(request.getParameter("recipe_no"));

			int res = biz.delete(recipe_no);
			if (res > 0) {
				System.out.println("레시피 하나 삭제성공");
				jsResponse("레시피를 성공적으로 삭제하였습니다.", "recipe.do?command=recipe_list", response);
			} else {
				System.out.println("레시피 하나 삭제실패");
				jsResponse("레시피를 삭제하는데 실패하였습니다.", "recipe.do?command=recipe_list", response);
			}

			// 레시피 작성 폼
		} else if (command.equals("recipeinsertform")) {
			System.out.println("controller_recipe_insertform");

			response.sendRedirect(request.getContextPath() + "/view/recipe/recipe_insert.jsp");

			// 레시피 여러개 삭제
		} else if (command.contentEquals("recipemuldel")) {

			System.out.println("controller_recipe_muldel");
			String[] recipe_no = request.getParameterValues("chk");
			System.out.println(recipe_no + "레시피 번호 오냐? 오냐고 와라!!!!");
			/*
			 * MemberDto member_dto = (MemberDto) session.getAttribute("rdto"); String
			 * member_id = member_dto.getMember_id();
			 */
			int res = biz.multiDelte(recipe_no);

			if (res > 0) {
				System.out.println("레시피 멀티 딜리트 성공");

				jsResponse("선택하신 레시피를 성공적으로 삭제하였습니다.", "recipe.do?command=recipe_list", response);

			} else {
				System.out.println("레시피 멀티 딜리트 실패");
				jsResponse("레시피를 삭제하는데 실패하였습니다.", "recipe.do?command=recipe_list", response);
			}

			// 레시피 등록

			// 이미지 업로드
		} else if (command.equals("imgUpload")) {
			System.out.println("이미지 업로드 왔다");
			System.out.println(request.getContentType());
			String realFolder = "";

			String filename1 = ""; // 업로드한 파일이름
			int maxSize = 1024 * 1024 * 10; // 파일 사이즈 설정: 5M
			/* String encType = "multipart/form-data"; */
			String savefile = "recipeimages";
			ServletContext scontext = getServletContext();
			System.out.println("scontext:" + scontext);
			realFolder = scontext.getRealPath(savefile);

			System.out.println("realFolder" + realFolder);

			try {
				MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize,
						new DefaultFileRenamePolicy());
				Enumeration<?> files = multi.getFileNames(); // 전송한 전체 파일이름들을 가져온다.
				System.out.println("files" + files);
				String file1 = (String) files.nextElement();
				System.out.println("file1:" + file1);
				// 파일명 중복이 발생했을 때 정책에 의해 뒤에 1,2,3 처럼 숫자가 붙어 고유 파일명을 생성한다
				// 이때 생성된 이름을 FilesystemName이라고 하여 그 이름 정보를 가져온다.(중복 처리)
				filename1 = multi.getFilesystemName(file1);
			} catch (Exception e) {
				System.out.println("이런 싸발면");
				e.printStackTrace();
			}

			String fullpath = realFolder + "\\" + filename1;
			System.out.println("fullpath:" + fullpath);

		} else if (command.equals("recipe_insertres")) {
			System.out.println("recipe_insertres왔음!");

		} else if (command.equals("recipe_search")) {
			System.out.println("search controller 입장");
			String txt = request.getParameter("recipe_title");
			System.out.println(txt);
			List<RecipeDto> list = biz.search(txt);
			System.out.println("search controller 중간");
			request.setAttribute("list", list);
			dispatch("/view/recipe/recipe_list.jsp", request, response);
			System.out.println(list);

			// 레시피 수정 완료 컨트롤러
		} else if (command.equals("recipe_updateres")) {
			System.out.println("recipe_updateres입장..");
			int recipe_no = Integer.parseInt(request.getParameter("recipe_no"));
			System.out.println("checkcheck");
			MemberDto member = (MemberDto) session.getAttribute("rdto");
			String member_id = "";
			try {
				member_id = member.getMember_id();
			} catch (Exception e) {
				// TODO Auto-generated catch block

				e.printStackTrace();
				jsResponse("로그인하세요", request.getContextPath() + "/user.do?command=loginform", response);
			}
			
			String recipe_main_photo = request.getParameter("recipe_main_photo");
			System.out.println("요기"+recipe_main_photo);
			String[] recipe_photo = request.getParameterValues("recipe_photo");
			String recipe_title = request.getParameter("recipe_title");
			String[] recipe_detail = request.getParameterValues("recipe_detail");
			String recipe_material_one = request.getParameter("recipe_material_one");
			String cate_theme = request.getParameter("cate_theme");
			String cate_kind = request.getParameter("cate_kind");
			String[] recipe_material = request.getParameterValues("recipe_material");
			System.out.println("checkcheck");
			JsonArray element_material = new JsonArray();
			for (int i = 0; i < recipe_material.length; i++) {
				element_material.add(recipe_material[i]);
			}
			System.out.println(element_material.toString());
			JsonArray element_detail = new JsonArray();
			for (int i = 0; i < recipe_detail.length; i++) {
				element_detail.add(recipe_detail[i]);
			}
			System.out.println(element_detail.toString());
			JsonArray element_photo = new JsonArray();
			for (int i = 0; i < recipe_photo.length; i++) {
				element_photo.add(recipe_photo[i]);
			}
			System.out.println(recipe_photo.toString());

			String recipe_photo1 = recipe_photo.toString();
			String recipe_detail1 = element_detail.toString();
			String recipe_material1 = element_material.toString();
			/*
			 * List<String> material= new ArrayList<String>(); List<String> detail= new
			 * ArrayList<String>(); List<String> photo= new ArrayList<String>();
			 * 
			 * for(JsonElement str:element_material) { material.add(str.getAsString());
			 * System.out.println(str.getAsString()); } for(JsonElement str:element_detail)
			 * { detail.add(str.getAsString()); System.out.println(str.getAsString()); }
			 * for(JsonElement str:element_photo) { photo.add(str.getAsString());
			 * System.out.println(str.getAsString()); }
			 */
			RecipeDto dto = new RecipeDto(recipe_no, recipe_main_photo, member_id, recipe_title, recipe_photo1,
					recipe_detail1, null, recipe_material_one, cate_theme, cate_kind, recipe_material1, 0);
			int res = biz.update(dto);
			System.out.println("이건뭔경우야"+res);
			if (res > 0) {
				jsResponse("수정성공", request.getContextPath() + "/recipe.do?command=my_recipe_list", response);
			} else {
				jsResponse("수정실패", request.getContextPath() + "/recipe.do?command=recipeinsertform", response);
			}
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