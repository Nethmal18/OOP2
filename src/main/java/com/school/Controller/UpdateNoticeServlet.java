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

/**
 * Servlet implementation class UpdateNoticeServlet
 */
@WebServlet("/UpdateNoticeServlet")
public class UpdateNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//capturing form input data
		String notice_id = request.getParameter("notice_id");
		String t_id = request.getParameter("teacher_id");
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		String type = request.getParameter("type");
		
		//converting the received String value to INT
		int convertedNoticeID = Integer.parseInt(notice_id);
		
		LocalDate currentDate = LocalDate.now();
        String date = currentDate.toString();
        
		
        boolean isTrue;
        
        //updating the table
        isTrue = noticeDBUtil.updateNotice(convertedNoticeID, t_id, title, description, date, type);
        
        if(isTrue == true)
        {
        	RequestDispatcher dis = request.getRequestDispatcher("teacherDashboard.jsp");
			dis.forward(request, response);
        }
        else
        {
        	RequestDispatcher dis = request.getRequestDispatcher("failedInsert.jsp");
			dis.forward(request, response);
        }
		
		
        
		
}

}
