package com.app.post.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.app.dao.PostDAO;
import com.app.post.Action;
import com.app.post.Result;
import com.app.vo.PostVO;

public class PostReadController implements Action {

	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		Result result = new Result();
		PostDAO postDAO = new PostDAO();
		Long id = Long.parseLong(req.getParameter("id"));
		
		JSONObject post = new JSONObject(postDAO.select(id).orElseThrow(() -> {
			throw new RuntimeException();
		}));
		
/*		PostVO findPost = postDAO.select(id).orElseThrow(() -> {
			throw new RuntimeException();
		});*/
		
		req.setAttribute("post", post);
		result.setPath("read.jsp");
		
		return result;
	}

}
