package com.school.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shcool.DBUtil.StdDBUtil;
import com.shcool.DBUtil.adminDBUtil;
import com.shcool.DBUtil.cmDBUtil;
import com.shcool.DBUtil.teacherDBUtil;



@WebServlet("/CountServlet")
public class CountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int totStd = 0;
        int totTh = 0;
        int totAdmins = 0;
        int totCM = 0;

        try {
            totStd = StdDBUtil.getStudentCount();
            totTh = teacherDBUtil.getTeacherCount();
            totAdmins = adminDBUtil.getAdminCount();
            totCM = cmDBUtil.getCmCount();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Pass it to the JSP
        request.setAttribute("totalStudents", totStd);
        request.setAttribute("totalteachers", totTh);
        request.setAttribute("totaladmins", totAdmins);
        request.setAttribute("totalcm", totCM);
        // Forward to JSP:
        request.getRequestDispatcher("admin.jsp").forward(request, response);

    }
}
