package com.app.post;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.post.controller.PostDeleteOkController;
import com.app.post.controller.PostJstlController;
import com.app.post.controller.PostListController;
import com.app.post.controller.PostReadController;
import com.app.post.controller.PostUpdateController;
import com.app.post.controller.PostUpdateOkController;
import com.app.post.controller.PostWriteOkController;


public class PostFrontController extends HttpServlet{
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=utf-8");
		
		String target = req.getRequestURI().replace(req.getContextPath() + "/", "" ).split("\\.")[0];
		Result result = null;
		
		
		if(target.equals("write")) {
			result = new Result();
			result.setPath("write.jsp");
			
		}else if(target.equals("write-ok")) {
			result = new PostWriteOkController().execute(req, resp);
		}else if(target.equals("list")) {
			result = new PostListController().execute(req, resp);
			
		}else if(target.equals("jstl")) {
			result = new PostJstlController().execute(req, resp);
		}else if(target.equals("read")) {
			result = new PostReadController().execute(req, resp);
		}else if(target.equals("update")) {
			result = new PostUpdateController().execute(req, resp);
		}else if(target.equals("update-ok")) {
			result = new PostUpdateOkController().execute(req, resp);
		}else if(target.equals("delete-ok")) {
			result = new PostDeleteOkController().execute(req, resp);
		}else {
			result = new Result();
			result.setPath("notFound.jsp");
		}
		
		if(result != null) {
			if(result.isRedirect()) {
//				redirect
				resp.sendRedirect(result.getPath());
			}else {
//				forward
				req.getRequestDispatcher(result.getPath()).forward(req, resp);
			}
		}
	}
	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
