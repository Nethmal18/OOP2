package com.school.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shcool.DBUtil.adminDBUtil;



@WebServlet("/DeleteAdminServlet")
public class DeleteAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		if("delete".equals(action)) {
			String aid = request.getParameter("id");
			
			boolean success = adminDBUtil.deleteAdmin(aid);
			
			if(success == true) {
				response.sendRedirect("AdminServlet");
			}else {
				request.setAttribute("error", "Failed to delete student.");
	            RequestDispatcher dis = request.getRequestDispatcher("AdminServlet");
	            dis.forward(request, response);
			}
		}
	}

}
