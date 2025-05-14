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

@WebServlet("/statPageServlet")
public class statPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String id = request.getParameter("stdId");	

		
		//GPA calculation
		float GPA = StudentDBUtil.calcGpa(id);
		
		float roundedGPA = Math.round(GPA * 100) / 100f;
		
		if(roundedGPA <= 4.0 && roundedGPA >= 0)
		{
			request.setAttribute("gpa", roundedGPA);
		
		}
		else
		{
			response.sendRedirect("invalidId.jsp");
		}
		
		
		
		//Total credits calculation
		int credits = StudentDBUtil.totalCredits(id);
		
		if(credits > 0)
		{
			System.out.println(credits);
			request.setAttribute("credits", credits);
		}
		else
		{
			response.sendRedirect("invalidId.jsp");
		}
		
		
		
		//calculating cumulative grade points
		
		float cPoints = StudentDBUtil.getCPoints(id);
		
		if(cPoints > 0)
		{
			System.out.println(cPoints);
			request.setAttribute("cPoints", cPoints);
		}
		else
		{
			response.sendRedirect("invalidId.jsp");
		}
		
		
		//retreiving student results
		List<Result> result = StudentDBUtil.getResult(id);
		
		if(result == null || result.isEmpty())
		{
			System.out.println("Null value detected");
			response.sendRedirect("invalidId.jsp");
		}
		else
		{
			request.setAttribute("result", result);
			
		}
		
		//retreiving student information
		List<Student> student = StudentDBUtil.getName(id);
		
		if(student == null || student.isEmpty())
		{
			System.out.println("Empty field detected");
		}
		else
		{	
			request.setAttribute("student", student);
			System.out.println("SatPage");
			request.getRequestDispatcher("statPage.jsp").forward(request, response);
		}
		
	}

}
