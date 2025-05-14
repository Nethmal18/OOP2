package com.school.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shcool.DBUtil.teacherDBUtil;




@WebServlet("/TeacherServlet")
public class TeacherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		List<Teacher> tcDetails = teacherDBUtil.getAllTeachers(); // call the DBUtil method
        request.setAttribute("tcDetails", tcDetails); // pass list to JSP

        RequestDispatcher dis = request.getRequestDispatcher("Teacher.jsp");
        dis.forward(request, response);
	}

}
