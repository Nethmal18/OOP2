package com.school.Controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.school.model.Result;
import com.school.model.Student;
import com.shcool.DBUtil.StudentDBUtil;


@WebServlet("/ViewResultServlet")
public class ViewResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String stdId = request.getParameter("stdId");
		System.out.println("SID Res");
		
		//method to get the student details to the result page
		List<Student> student = StudentDBUtil.getName(stdId);
		
		if(student == null || student.isEmpty())
		{
			System.out.println("Empty field detected");
		}
		else
		{
			request.setAttribute("student", student);
			
		}
			
		
		
		//method to get the results to the result page
		List<Result> result = StudentDBUtil.getResult(stdId);
		
		if(result == null || result.isEmpty())
		{
			System.out.println("Null value detected");
			response.sendRedirect("invalidId.jsp");
		}
		else
		{
			request.setAttribute("result", result);
			request.getRequestDispatcher("viewResult.jsp").forward(request, response);
			
		}
		

	}

}
