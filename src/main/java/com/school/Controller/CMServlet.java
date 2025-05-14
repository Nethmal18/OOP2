package com.school.Controller;

import java.io.IOException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.school.model.CM;
import com.shcool.DBUtil.cmDBUtil;



@WebServlet("/CMServlet")
public class CMServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<CM> cmDetails = cmDBUtil.Display();
		request.setAttribute("cmDetails", cmDetails);
		
		RequestDispatcher dis = request.getRequestDispatcher("CM_Details.jsp");
		dis.forward(request, response);
	}
}
