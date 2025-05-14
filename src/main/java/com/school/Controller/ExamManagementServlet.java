package com.school.Controller;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shcool.DBUtil.ExamDBUtil;

@WebServlet("/ExamManagementServlet")
public class ExamManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//for saving the exam details
		String sub_id = request.getParameter("sub_id");
		String duration = request.getParameter("duration"); //convert
		String type = request.getParameter("type");
		String weight = request.getParameter("weight"); //convert
		String description = request.getParameter("description");
		
		LocalDate date = LocalDate.now(); // gets current local date
        String dateString = date.toString();
		
		int convertedDuration = 0;
		int convertedWeight = 0;
		
		
		try {
		    if (duration != null && !duration.trim().isEmpty()) 
		    {
		        convertedDuration = Integer.parseInt(duration.trim());
		        
		    } 
		    else 
		    {
		        throw new NumberFormatException("Duration is null or empty");
		    }

		    if (weight != null && !weight.trim().isEmpty()) 
		    {
		        convertedWeight = Integer.parseInt(weight.trim());
		    } 
		    else 
		    {
		        throw new NumberFormatException("Weight is null or empty");
		    }

		} catch (NumberFormatException e)
		{
		    e.printStackTrace();
		    request.getRequestDispatcher("notShowing.jsp").forward(request, response);
		    return;
		}
			
		
		boolean isTrue1;
		
		isTrue1 = ExamDBUtil.insertExam(sub_id, dateString,convertedDuration,type, convertedWeight, description);
		
		if(isTrue1 == true)
		{
			response.sendRedirect("teacherDashboard.jsp");
		}
		else
		{
			 request.getRequestDispatcher("notShowing.jsp").forward(request, response);
		}
		
		

	     
	}
	
	

}
