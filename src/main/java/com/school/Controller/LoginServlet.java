package com.school.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.school.model.Staffs;
import com.shcool.DBUtil.LoginDBUtil;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String stfId = request.getParameter("uid");
        String stfPassword = request.getParameter("pass");
        System.out.println("Login attempt with ID: " + stfId);
        
        try {
            List<Staffs> result = LoginDBUtil.validte(stfId, stfPassword);
            
            System.out.println("Authentication result: " + (result != null ? "Not null" : "Null"));
            if (result != null) {
                System.out.println("Result list size: " + result.size());
            }
    
            if (result != null && !result.isEmpty()) {
                String id = result.get(0).getId();
                System.out.println("Retrieved staff ID: " + id);
                
                String startChar = "";
                if (id != null && id.length() >= 2) {
                    startChar = id.substring(0, 2);
                    System.out.println("ID prefix: " + startChar);
                } else {
                    System.out.println("ID is null or less than 2 characters");
                }
    
                System.out.println("About to check user type with startChar: '" + startChar + "'");
                
                // Store user info in session for the destination page
                request.getSession().setAttribute("currentUser", result.get(0));
                
                String jspPage = null;
                
                if ("ST".equals(startChar)) {
                    jspPage = "/studentDashboard.jsp";
                    System.out.println("User is a Student, forwarding to: " + jspPage);
                } else if ("TC".equals(startChar)) {
                    jspPage = "/teacherDashboard.jsp";
                    System.out.println("User is a Teacher, forwarding to: " + jspPage);
                } else if ("AD".equals(startChar)) {
                	
                	System.out.println("User is an Admin, forwarding to: " + jspPage);
                	response.sendRedirect("CountServlet"); // Not good if servlet sets attributes
                    return;
                    
                } else if ("CM".equals(startChar)) {
                    jspPage = "/curriculum-dashboard.jsp";
                    System.out.println("User is a Content Manager, forwarding to: " + jspPage);
                } else if ("FM".equals(startChar)) {
                    jspPage = "/FinanceManager.jsp";
                    System.out.println("User is a Finance Manager, forwarding to: " + jspPage);
                } else {
                    System.out.println("Unknown user type: '" + startChar + "'");
                    response.sendRedirect("error.jsp?reason=unknownUserType");
                    return;  // Exit method to prevent further processing
                }
                
                if (jspPage != null) {
                    // Check if the JSP file exists
                    String realPath = getServletContext().getRealPath(jspPage);
                    System.out.println("Full path to JSP: " + realPath);
                    
                    java.io.File file = new java.io.File(realPath);
                    if (!file.exists()) {
                        System.out.println("WARNING: JSP file does not exist at: " + realPath);
                        response.sendRedirect("error.jsp?reason=jspNotFound&page=" + jspPage);
                        return;
                    }
                    
                    try {
                        System.out.println("Forwarding request to: " + jspPage);
                        RequestDispatcher dispatcher = request.getRequestDispatcher(jspPage);
                        dispatcher.forward(request, response);
                        System.out.println("Forward completed successfully");
                    } catch (Exception e) {
                        System.out.println("Exception during forward: " + e.getMessage());
                        e.printStackTrace();
                        response.sendRedirect("error.jsp?reason=forwardError&message=" + e.getMessage());
                    }
                }
            } else {
                // Authentication failed
                System.out.println("Authentication failed - redirecting to Login.jsp");
                request.setAttribute("errorMessage", "Invalid username or password");
                
                try {
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/Login.jsp");
                    dispatcher.forward(request, response);
                } catch (Exception e) {
                    System.out.println("Error forwarding to login page: " + e.getMessage());
                    e.printStackTrace();
                    response.sendRedirect("error.jsp?reason=loginForwardError");
                }
            }
        } catch (Exception e) {
            System.out.println("Unexpected exception in servlet: " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect("error.jsp?reason=unexpectedError&message=" + e.getMessage());
        }
    }
} 