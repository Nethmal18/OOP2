package com.school.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shcool.DBUtil.noticeDBUtil;

/**
 * Servlet implementation class DeleteNoticeServlet
 */
@WebServlet("/DeleteNoticeServlet")
public class DeleteNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String notice_id = request.getParameter("notice_id");
		
		int convertedId = Integer.parseInt(notice_id);
		
		 boolean isTrue = noticeDBUtil.deleteNotice(convertedId);
		
		if(isTrue == true)
		{
			RequestDispatcher dis = request.getRequestDispatcher("teacherDashboard.jsp");
			dis.forward(request, response);
			
		}
		
		
	}

}
