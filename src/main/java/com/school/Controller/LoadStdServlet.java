package com.school.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shcool.DBUtil.ExamDBUtil;
import com.school.model.Student;


@WebServlet("/LoadStdServlet")
public class LoadStdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//Takes the subject Id from the Dropdown menu
        String subId = request.getParameter("subId");
        
        //Gets the student IDs that belongs to the subject ID
        List<Student> studentList = ExamDBUtil.getStdId(subId);
        
        if(studentList == null || studentList.isEmpty())
        {
        	 System.out.println("No students found in the database.");
        	 request.getRequestDispatcher("failedInsert.jsp").forward(request, response);
        } 
        else {
        	
        	request.setAttribute("student", studentList);
    		request.getRequestDispatcher("LoadSubIdServlet").forward(request, response);
    		
        }

	}

}
