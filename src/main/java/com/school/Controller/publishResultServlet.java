package com.school.Controller;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shcool.DBUtil.ExamDBUtil;
import com.school.model.MarksException;

/**
 * Servlet implementation class publishResultServlet
 */
@WebServlet("/publishResultServlet")
public class publishResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Each set of input are stored in an array (To fix the issue of storing only the first input)
		
		//Inserting the results
		String[] examSub = request.getParameterValues("examSub_id[]");
		String[] stdId = request.getParameterValues("Std_id[]");
		String[] marks = request.getParameterValues("marks[]");
		
		
		LocalDate currentDate = LocalDate.now();
	    String date = currentDate.toString();
	    
	    boolean isTrue2 = false;
	    

		for(int i = 0; i < stdId.length; i++)
		{
			
			 int convertedMarks = Integer.parseInt(marks[i]);
			 
			 try
			 {
				 if(convertedMarks > 100 || convertedMarks < 0)
				 {
					 throw new MarksException("Mark should be less than 100 and greater than 0");
	 
				 }
				 

			     isTrue2 = ExamDBUtil.insertResult(stdId[i], examSub[i], convertedMarks, date);
			        
				 
			 }
			 catch(MarksException e)
			 {
				 System.out.println("Mark should be less than 100 and greater than 0");
				 e.printStackTrace();
					
			 }
 
		}
		
		if(isTrue2 != true) 
		{
		    request.getRequestDispatcher("failedInsert.jsp").forward(request, response);
		} 
		else
		{
		    request.getRequestDispatcher("LoadSubIdServlet").forward(request, response);
		}
	
	}

}
