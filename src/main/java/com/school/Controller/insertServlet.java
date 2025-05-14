package com.school.Controller;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/insertServlet")
public class insertServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String std_Fname = request.getParameter("std_Fname");
            String std_Lname = request.getParameter("std_Lname");
            String std_email = request.getParameter("std_email");
            String std_phone = request.getParameter("std_phone");
            String std_address = request.getParameter("std_address");
            String std_NIC = request.getParameter("std_NIC");
            String std_DOB = request.getParameter("std_DOB");
            String std_password = request.getParameter("std_password");
            
            System.out.println("Processing student registration: " + std_Fname + " " + std_Lname);
            
            boolean isTrue = StudentController.insertdata(std_Fname, std_Lname, std_email, std_phone, 
                                                         std_address, std_NIC, std_DOB, std_password);
            
            if (isTrue) {
                String alertMessage = "Data Insert Successful";
                response.getWriter().println("<script>alert('" + alertMessage + "'); window.location.href='Login.jsp';</script>");
            } else {
                RequestDispatcher dis2 = request.getRequestDispatcher("Signup.jsp");
                dis2.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<script>alert('Error: " + e.getMessage() + "'); window.history.back();</script>");
        }
    }
}