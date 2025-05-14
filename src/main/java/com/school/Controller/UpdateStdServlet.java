package com.school.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shcool.DBUtil.StdDBUtil;



@WebServlet("/UpdateStdServlet")
public class UpdateStdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String sid =request.getParameter("sid");
		String fname =request.getParameter("fname");
		String lname =request.getParameter("lname");
		String email =request.getParameter("email");
		String phone =request.getParameter("phone");
		String address =request.getParameter("address");
		String nic =request.getParameter("nic");
		String dob =request.getParameter("dob");
		String pass =request.getParameter("pass");
		
		boolean isTrue = StdDBUtil.updatestudent( sid,  fname,  lname,  email,  phone,  address, nic,  dob,  pass);
		
		if(isTrue == true) {
			request.setAttribute("targetPage", "STservlet");
			RequestDispatcher dis = request.getRequestDispatcher("Success.jsp");
			dis.forward(request, response);
		}else {
			RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
			dis.forward(request, response);
			System.out.println("Fucked");
		}
		
	}

}
