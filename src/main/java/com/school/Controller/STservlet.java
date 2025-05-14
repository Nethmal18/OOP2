package com.school.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shcool.DBUtil.StdDBUtil;


@WebServlet("/STservlet")
public class STservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Students> stdDetails = StdDBUtil.Display(); // call the DBUtil method
        request.setAttribute("stdDetails", stdDetails); // pass list to JSP

        RequestDispatcher dis = request.getRequestDispatcher("student.jsp");
        dis.forward(request, response);
    }
	

}
