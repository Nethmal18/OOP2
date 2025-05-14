package com.school.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.school.model.Admin;
import com.shcool.DBUtil.adminDBUtil;




@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Admin> adminDetails = adminDBUtil.Display();
		request.setAttribute("adminDetails", adminDetails);
		
		RequestDispatcher dis = request.getRequestDispatcher("adminDetails.jsp");
		dis.forward(request, response);
	}
}
