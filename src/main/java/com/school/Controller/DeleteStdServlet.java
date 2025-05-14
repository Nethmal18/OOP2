package com.school.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shcool.DBUtil.StdDBUtil;



@WebServlet("/DeleteStdServlet")
public class DeleteStdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String action = request.getParameter("action");

	    if ("delete".equals(action)) {
	        String sid = request.getParameter("sid");

	        boolean success = StdDBUtil.deleteStudent(sid);

	        if (success) {
	            response.sendRedirect("STservlet"); // or reload the list
	        } else {
	            request.setAttribute("error", "Failed to delete student.");
	            RequestDispatcher dis = request.getRequestDispatcher("STservlet");
	            dis.forward(request, response);
	        }
	    }
	}


}
