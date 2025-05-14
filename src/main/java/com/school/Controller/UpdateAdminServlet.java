package com.school.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shcool.DBUtil.adminDBUtil;


@WebServlet("/UpdateAdminServlet")
public class UpdateAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String stf_id = request.getParameter("stf_id");
	    String stf_hireDate = request.getParameter("stf_hireDate");
	    String stf_fname = request.getParameter("stf_fname");
	    String stf_lname = request.getParameter("stf_lname");
	    String stf_email = request.getParameter("stf_email");
	    String stf_phone = request.getParameter("stf_phone");
	    String stf_address = request.getParameter("stf_address");
	    String stf_nic = request.getParameter("stf_nic");
	    String stf_dob = request.getParameter("stf_dob");
	    String stf_password = request.getParameter("stf_password");

	    Double stf_salary = Double.parseDouble(request.getParameter("stf_salary"));
	    
	    int ad_systemAccess = Integer.parseInt(request.getParameter("ad_systemAccess"));
	    String ad_designation = request.getParameter("ad_designation");

	    boolean isTrue = adminDBUtil.updateAdmin(stf_id, stf_hireDate, stf_fname, stf_lname, stf_email, stf_phone, stf_nic, stf_dob,stf_address,stf_salary, stf_password, ad_systemAccess, ad_designation);
	    
	    if(isTrue == true) {
	    	request.setAttribute("targetPage", "AdminServlet");
			RequestDispatcher dis = request.getRequestDispatcher("Success.jsp");
			dis.forward(request, response);
		}else {
			RequestDispatcher dis1 = request.getRequestDispatcher("unsuccess.jsp");
			dis1.forward(request, response);
		}
	}

}
