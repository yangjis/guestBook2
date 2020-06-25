package com.javaex.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaex.dao.GuestDao;
import com.javaex.util.WebUtil;
import com.javaex.vo.GuestVo;

@WebServlet("/gb2")
public class GuestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException {
		System.out.println("get호출");
		
		String action = rq.getParameter("action");
		System.out.println(action);
		
		if("main".equals(action)){
			GuestDao dao = new GuestDao();
			List<GuestVo> gList = dao.getList();
			
			rq.setAttribute("gList", gList);
			
			WebUtil.forword(rq, rs, "/WEB-INF/main.jsp");
			
		}else if("addlist".equals(action)) {
			String name = rq.getParameter("name");
			String pw = rq.getParameter("password");
			String content = rq.getParameter("content");
			
			GuestVo vo = new GuestVo(name, pw, content);
			GuestDao dao = new GuestDao();
			dao.addList(vo);
			
			WebUtil.redirect(rq, rs, "/guestBook2/gb2?action=main");
			
		}else if("delete".equals(action)) {
			RequestDispatcher rd = rq.getRequestDispatcher("/WEB-INF/delete.jsp");
			rd.forward(rq, rs);
			
		}else if("deleteAction".equals(action)) {
			String no0 = rq.getParameter("no");
			int no = Integer.parseInt(no0);
			String inputNum = rq.getParameter("password");
			
			GuestDao dao = new GuestDao();
			int num = dao.delete(no, inputNum);
			
			rq.setAttribute("num", num);
			
			WebUtil.forword(rq, rs, "/WEB-INF/deleteAction.jsp");
		}	
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
