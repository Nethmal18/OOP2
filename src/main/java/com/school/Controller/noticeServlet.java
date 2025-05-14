 package com.school.Controller;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shcool.DBUtil.noticeDBUtil;

@WebServlet("/noticeServlet")
public class noticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		//getting jsp information to the conrtoller
		String t_id = request.getParameter("teacher_id");
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		String type = request.getParameter("type");
	
		// Get the current date
        LocalDate currentDate = LocalDate.now();
        String date = currentDate.toString();
        
        boolean isTrue;
        //passing the notice object to the database connection 
		isTrue = noticeDBUtil.insertNotice(t_id, title, description, date,type);
	
		
		if (isTrue == true)
		{
			//going to a new page
			response.sendRedirect("TeacherDashBoardServlet");
		}
		else
		{
			RequestDispatcher dis = request.getRequestDispatcher("failedInsert.jsp");
			dis.forward(request, response);
			
		}
	
		
	}

}


