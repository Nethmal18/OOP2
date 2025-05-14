package com.school.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shcool.DBUtil.StudentDBUtil;
import com.school.model.Result;
import com.school.model.Student;

/**
 * Servlet implementation class StdInfoServlet
 */
@WebServlet("/StdInfoServlet")
public class StdInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String stdId = request.getParameter("stdId");
		
		//Retreiving results of the student
		List<Result> result = StudentDBUtil.getResult(stdId);
		
		if(result == null || result.isEmpty())
		{
			System.out.println("Null value detected");
			
		}
		else
		{
			request.setAttribute("result", result);
			
		}
		//Retreiving student information
		List<Student> student = StudentDBUtil.getName(stdId);
		
		if(student == null || student.isEmpty())
		{
			System.out.println("Empty field detected");
			response.sendRedirect("invalidId.jsp");
		}
		else
		{
			request.setAttribute("student", student);
			request.getRequestDispatcher("viewStdInfo.jsp").forward(request, response);
		}
		
		
		
		
		
		
		
	}

}
