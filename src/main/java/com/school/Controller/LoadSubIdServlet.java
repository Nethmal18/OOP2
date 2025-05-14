package com.school.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shcool.DBUtil.ExamDBUtil;
import com.school.model.Subject;

/**
 * Servlet implementation class LoadSubjectId
 */
@WebServlet("/LoadSubIdServlet")
public class LoadSubIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/*For the first page loadup*/
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		List<Subject> subject = ExamDBUtil.getSubId();
   	 	request.setAttribute("subject", subject);
   	 	
   	 	request.getRequestDispatcher("publishResult.jsp").forward(request, response);
	}
	
	/* When page is loaded multiple times */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
		String selectedSubId = request.getParameter("subId");

		// Passing value back to JSP
		request.setAttribute("selectedSubId", selectedSubId);
		
		
        List<Subject> subjectList = ExamDBUtil.getSubId();
        
        request.setAttribute("subject", subjectList);
        request.getRequestDispatcher("publishResult.jsp").forward(request, response);
        
        
    }

}
