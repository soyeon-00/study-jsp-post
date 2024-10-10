package com.app.post.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.app.dao.PostDAO;
import com.app.post.Action;
import com.app.post.Result;

public class PostJstlController implements Action {

	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		Result result = new Result();
		PostDAO postDAO = new PostDAO();
		String name = req.getParameter("name");
		
		req.setAttribute("posts", postDAO.selectAll());
//		req.setAttribute("name", name);
//		List<String> datas = new ArrayList<String>(Arrays.asList("<script>alert('다 내꺼 😛😛😛')</script>", "B","C"));
//		req.setAttribute("datas", datas);
		
		JSONArray datas = new JSONArray();
		postDAO.selectAll().stream().map(JSONObject::new).forEach((json) -> datas.put(json));
		req.setAttribute("datas", datas);
		
		result.setPath("jstl.jsp");
		return result;
	}

}
