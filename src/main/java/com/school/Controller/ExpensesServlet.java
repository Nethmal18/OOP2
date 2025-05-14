package com.school.Controller;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.school.model.Expenses;
import com.shcool.DBUtil.ExpensesDBUtil;
/**
 * Servlet implementation class ExpensesServlet
 */
@WebServlet("/ExpensesServlet")
public class ExpensesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExpensesServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Just process the request directly
        processRequest(request, response);
    }
    
    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
                try {
                    String etype = request.getParameter("etype");
                    double eamount = Double.parseDouble(request.getParameter("eamount"));
                    String edate = request.getParameter("edate");
                    
                    // Debug output
                    System.out.println("Adding expense: " + etype + ", " + eamount + ", " + edate);
                    
                    boolean isSuccess = ExpensesDBUtil.addExpenses(etype, eamount, edate);
                    if (isSuccess) {
                        request.setAttribute("message", "Expenses added successfully.");
                    } else {
                        request.setAttribute("message", "Failed to add Expenses.");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    request.setAttribute("message", "Error adding expense: " + e.getMessage());
                }
            }
            else if (action.equals("update")) {
                try {
                    int eid = Integer.parseInt(request.getParameter("eid"));
                    String etype = request.getParameter("etype");
                    double eamount = Double.parseDouble(request.getParameter("eamount"));
                    String edate = request.getParameter("edate");
                    boolean isSuccess = ExpensesDBUtil.updateExpenses(eid, etype, eamount, edate);
                    if (isSuccess) {
                        request.setAttribute("message", "Expenses updated successfully.");
                    } else {
                        request.setAttribute("message", "Failed to update Expenses.");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    request.setAttribute("message", "Error updating expense: " + e.getMessage());
                }
            }
            else if (action.equals("delete")) {
                try {
                    int eid = Integer.parseInt(request.getParameter("eid"));
                    boolean isSuccess = ExpensesDBUtil.deleteExpenses(eid);
                    if (isSuccess) {
                        request.setAttribute("message", "Expenses deleted successfully.");
                    } else {
                        request.setAttribute("message", "Failed to delete Expenses.");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    request.setAttribute("message", "Error deleting expense: " + e.getMessage());
                }
            }
        }
        
        try {
            // Get all expenses and forward to the JSP
            List<Expenses> expenses = ExpensesDBUtil.getAllExpenses();
            request.setAttribute("expenses", expenses);
            
            // Use correct JSP name - note the spelling correction from Expences.jsp to Expenses.jsp
            // if your file is actually named Expences.jsp (with a 'c'), keep that spelling
            RequestDispatcher dis = request.getRequestDispatcher("Expences.jsp");
            dis.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}