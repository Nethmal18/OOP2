package com.school.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import com.school.model.Exam;
import com.school.model.Notice;
import com.shcool.DBUtil.StudentDBUtil;
import com.shcool.DBUtil.noticeDBUtil;

/**
 * Servlet implementation class StudentExamServlet
 */
@WebServlet("/StudentDashboardServlet")
public class StudentDashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	//include both servlets together cuz they both need to be triggered
		
	//For getting the Exam details
	List<Exam> exam = StudentDBUtil.getExams();
	
	if(exam == null || exam.isEmpty())
	{
		System.out.println("Data not found");
		request.getRequestDispatcher("/failedInsert.jsp").forward(request, response);
		
	}
	else
	{
		request.setAttribute("Exams", exam);
		
	}
	

	
	//For getting the notice details
	List<Notice> notice = noticeDBUtil.getNotice();
	
	if(notice == null || notice.isEmpty())
	{
		System.out.println("Notice not found!!");
		request.getRequestDispatcher("/failedInsert.jsp").forward(request, response);

	}
	else
	{
		request.setAttribute("notices", notice);
		request.getRequestDispatcher("/studentDashboard.jsp").forward(request, response);
	}
	
	
		
	}

}
