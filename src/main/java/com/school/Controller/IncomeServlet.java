package com.school.Controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.school.model.Income;
import com.shcool.DBUtil.IncomeDBUtil;

/**
 * Servlet implementation class IncomeServlet
 */
@WebServlet("/IncomeServlet")
public class IncomeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IncomeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Just process the request - no need to append anything to the response
        processRequest(request, response);
    }
    
    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Process the request directly
        processRequest(request, response);
    }
    
    /**
     * Common method to process requests from both doGet and doPost
     */
    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
            
        // Handle null action parameter to prevent NullPointerException
        if (action != null) {
            if (action.equals("add")) {
                String type = request.getParameter("type");
                double amount = Double.parseDouble(request.getParameter("amount"));
                String date = request.getParameter("date");
                boolean isSuccess = IncomeDBUtil.addIncome(type, amount, date);
                if (isSuccess) {
                    request.setAttribute("message", "Income added successfully.");
                } else {
                    request.setAttribute("message", "Failed to add income.");
                }
            }
            else if (action.equals("update")) {
                int id = Integer.parseInt(request.getParameter("id"));
                String type = request.getParameter("type");
                double amount = Double.parseDouble(request.getParameter("amount"));
                String date = request.getParameter("date");
                boolean isSuccess = IncomeDBUtil.updateIncome(id, type, amount, date);
                if (isSuccess) {
                    request.setAttribute("message", "Income updated successfully.");
                } else {
                    request.setAttribute("message", "Failed to update income.");
                }
            }
            else if (action.equals("delete")) {
                int id = Integer.parseInt(request.getParameter("id"));
                boolean isSuccess = IncomeDBUtil.deleteIncome(id);
                if (isSuccess) {
                    request.setAttribute("message", "Income deleted successfully.");
                } else {
                    request.setAttribute("message", "Failed to delete income.");
                }
            }
        }
            
        // Get all incomes and forward to the JSP
        List<Income> incomes = IncomeDBUtil.getAllIncomes();
        request.setAttribute("incomes", incomes);
        RequestDispatcher dis = request.getRequestDispatcher("Income.jsp");
        dis.forward(request, response);
    }
}