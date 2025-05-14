package com.school.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shcool.DBUtil.cmDBUtil;



@WebServlet("/DeleteCMServlet")
public class DeleteCMServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		if("delete".equals(action)) {
			String cid = request.getParameter("cid");
			
			boolean success = cmDBUtil.deletCM(cid);
			
			if(success == true) {
				response.sendRedirect("CMServlet");
			}else {
				request.setAttribute("error", "Failed to delete student.");
	            RequestDispatcher dis = request.getRequestDispatcher("CMServlet");
	            dis.forward(request, response);
			}
		}
	}

}
