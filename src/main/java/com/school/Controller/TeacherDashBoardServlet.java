package com.school.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shcool.DBUtil.noticeDBUtil;
import com.school.model.Notice;

@WebServlet("/TeacherDashBoardServlet")
public class TeacherDashBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		List<Notice> notice = noticeDBUtil.getNotice();
		
		if (notice == null || notice.isEmpty()) {
            System.out.println("No notices found in the database.");
            request.getRequestDispatcher("/failedInsert.jsp").forward(request, response);
        } else {
        	
        	request.setAttribute("notices", notice);
    		request.getRequestDispatcher("/teacherDashboard.jsp").forward(request, response);
    		
        }
		
		
	}
}
