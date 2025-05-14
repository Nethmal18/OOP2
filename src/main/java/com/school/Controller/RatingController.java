package com.school.Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.school.model.Rating;
import com.school.model.Syllabus;
import com.shcool.DBUtil.RatingDAO;
import com.shcool.DBUtil.SyllabusDAO;

@WebServlet("/RatingController")
public class RatingController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private RatingDAO ratingDAO;
    private SyllabusDAO syllabusDAO;
    
    // Initialize the controller
    public RatingController() {
        super();
        ratingDAO = new RatingDAO();
        syllabusDAO = new SyllabusDAO();
    }
    
    // Handle GET requests
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        // Default action
        if (action == null) {
            action = "viewAll";
        }
        
        // Route to appropriate method based on action parameter
        switch (action) {
            case "add":
                showAddForm(request, response);
                break;
            case "view":
                viewSyllabusRatings(request, response);
                break;
            case "delete":
                deleteRating(request, response);
                break;
            case "summary":
                viewRatingSummary(request, response);
                break;
            case "listSyllabuses":
                listAllSyllabuses(request, response);
                break;
            default:
                listAllSyllabuses(request, response);  // Changed default to list all syllabuses
                break;
        }
    }
    
    // Handle POST requests for adding/updating ratings
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if ("submitRating".equals(action)) {
            submitRating(request, response);
        } else {
            // Forward other POST requests to doGet
            doGet(request, response);
        }
    }
    
    // Show page to add a new rating
    private void showAddForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get syllabus ID from request
        String syllabusIdStr = request.getParameter("syllabusId");
        
        if (syllabusIdStr != null && !syllabusIdStr.isEmpty()) {
            int syllabusId = Integer.parseInt(syllabusIdStr);
            // Get syllabus details
            Syllabus syllabus = syllabusDAO.getSyllabusById(syllabusId);
            request.setAttribute("syllabus", syllabus);
            
            // Check if user has already rated this syllabus (normally you'd use a real user ID)
            // For demonstration purposes, let's use a placeholder user ID
            int userId = 1; // This would come from user session in a real app
            int existingRatingId = ratingDAO.hasUserRated(syllabusId, userId);
            
            if (existingRatingId != -1) {
                // User has already rated, get the existing rating
                Rating existingRating = ratingDAO.getRatingById(existingRatingId);
                request.setAttribute("existingRating", existingRating);
            }
            
            // Forward to rating form
            RequestDispatcher dispatcher = request.getRequestDispatcher("syllabus-rating-form.jsp");
            dispatcher.forward(request, response);
        } else {
            // No syllabus ID provided, redirect to list of syllabuses
            response.sendRedirect("RatingController?action=listSyllabuses");
        }
    }
    
    // Process submitted rating
    private void submitRating(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        try {
            // Get parameters from form
            int syllabusId = Integer.parseInt(request.getParameter("syllabusId"));
            int ratingValue = Integer.parseInt(request.getParameter("rating"));
            String comment = request.getParameter("comment");
            
            // For demonstration, use a placeholder user ID
            int userId = 1; // This would come from user session in a real app
            
            if (ratingValue < 1 || ratingValue > 5) {
                throw new IllegalArgumentException("Rating value must be between 1 and 5");
            }
            
            // Check if user is updating an existing rating
            int existingRatingId = ratingDAO.hasUserRated(syllabusId, userId);
            boolean success;
            
            if (existingRatingId != -1) {
                // Update existing rating
                Rating rating = ratingDAO.getRatingById(existingRatingId);
                rating.setRatingValue(ratingValue);
                rating.setComment(comment);
                success = ratingDAO.updateRating(rating);
                
                if (success) {
                    session.setAttribute("message", "Your rating has been updated successfully!");
                } else {
                    session.setAttribute("message", "Error: Unable to update rating");
                }
            } else {
                // Add new rating
                Rating rating = new Rating(syllabusId, userId, ratingValue, comment);
                success = ratingDAO.addRating(rating);
                
                if (success) {
                    session.setAttribute("message", "Your rating has been submitted successfully!");
                } else {
                    session.setAttribute("message", "Error: Unable to submit rating");
                }
            }
            
            session.setAttribute("messageType", success ? "success" : "danger");
            
            // Instead of redirecting, respond with a JSON status that the frontend can use
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            
            String messageText = (String) session.getAttribute("message");
            String messageType = (String) session.getAttribute("messageType");
            
            // Create a simple JSON response
            String jsonResponse = "{\"success\":" + success + 
                                 ", \"message\":\"" + messageText + 
                                 "\", \"messageType\":\"" + messageType + 
                                 "\", \"redirectUrl\":\"RatingController?action=summary\"}";
            
            response.getWriter().write(jsonResponse);
            
        } catch (Exception e) {
            // Handle errors
            session.setAttribute("message", "Error: " + e.getMessage());
            session.setAttribute("messageType", "danger");
            
            // Return error JSON
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            String jsonResponse = "{\"success\":false, \"message\":\"Error: " + e.getMessage() + 
                                 "\", \"messageType\":\"danger\", \"redirectUrl\":\"RatingController?action=summary\"}";
            
            response.getWriter().write(jsonResponse);
        }
    }
    
    // View ratings for a specific syllabus
    private void viewSyllabusRatings(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get syllabus ID from request
            int syllabusId = Integer.parseInt(request.getParameter("syllabusId"));
            
            // Get syllabus details
            Syllabus syllabus = syllabusDAO.getSyllabusById(syllabusId);
            request.setAttribute("syllabus", syllabus);
            
            // Get ratings for this syllabus
            ArrayList<Rating> ratings = ratingDAO.getRatingsBySyllabusId(syllabusId);
            request.setAttribute("ratings", ratings);
            
            // Get rating statistics
            double averageRating = ratingDAO.getAverageRating(syllabusId);
            int ratingCount = ratingDAO.getRatingCount(syllabusId);
            Map<Integer, Integer> distribution = ratingDAO.getRatingDistribution(syllabusId);
            
            request.setAttribute("averageRating", averageRating);
            request.setAttribute("ratingCount", ratingCount);
            request.setAttribute("distribution", distribution);
            
            // Forward to syllabus rating details page
            RequestDispatcher dispatcher = request.getRequestDispatcher("syllabus-rating-details.jsp");
            dispatcher.forward(request, response);
            
        } catch (Exception e) {
            // Handle errors
            HttpSession session = request.getSession();
            session.setAttribute("message", "Error: " + e.getMessage());
            session.setAttribute("messageType", "danger");
            response.sendRedirect("RatingController?action=listSyllabuses");
        }
    }
    
    // Delete a rating
    private void deleteRating(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        try {
            // Get rating ID from request
            int ratingId = Integer.parseInt(request.getParameter("ratingId"));
            // Get syllabus ID for redirect
            int syllabusId = Integer.parseInt(request.getParameter("syllabusId"));
            
            // Delete rating
            boolean success = ratingDAO.deleteRating(ratingId);
            
            if (success) {
                session.setAttribute("message", "Rating deleted successfully!");
                session.setAttribute("messageType", "success");
            } else {
                session.setAttribute("message", "Error: Unable to delete rating");
                session.setAttribute("messageType", "danger");
            }
            
            // Redirect back to syllabus ratings
            response.sendRedirect("RatingController?action=view&syllabusId=" + syllabusId);
            
        } catch (Exception e) {
            // Handle errors
            session.setAttribute("message", "Error: " + e.getMessage());
            session.setAttribute("messageType", "danger");
            response.sendRedirect("RatingController?action=listSyllabuses");
        }
    }
    
    // View summary of all syllabus ratings
    private void viewRatingSummary(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get all syllabuses from database
            ArrayList<Syllabus> syllabusList = syllabusDAO.getAllSyllabuses();
            request.setAttribute("syllabusList", syllabusList);
            
            // Get rating summary for each syllabus
            ArrayList<Map<String, Object>> ratingSummary = ratingDAO.getAllSyllabusRatings();
            request.setAttribute("ratingSummary", ratingSummary);
            
            // Forward to syllabus ratings summary page
            RequestDispatcher dispatcher = request.getRequestDispatcher("syllabus-rating.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            // Handle errors
            HttpSession session = request.getSession();
            session.setAttribute("message", "Error: " + e.getMessage());
            session.setAttribute("messageType", "danger");
            response.sendRedirect("curriculum-dashboard.jsp");
        }
    }
    
    // List all syllabuses for selection
    private void listAllSyllabuses(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get all syllabuses from database
            ArrayList<Syllabus> syllabusList = syllabusDAO.getAllSyllabuses();
            request.setAttribute("syllabusList", syllabusList);
            
            // Get rating summary for each syllabus
            ArrayList<Map<String, Object>> ratingSummary = ratingDAO.getAllSyllabusRatings();
            request.setAttribute("ratingSummary", ratingSummary);
            
            // Forward to syllabus list page
            RequestDispatcher dispatcher = request.getRequestDispatcher("syllabus-rating.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            // Handle errors
            HttpSession session = request.getSession();
            session.setAttribute("message", "Error: " + e.getMessage());
            session.setAttribute("messageType", "danger");
            response.sendRedirect("curriculum-dashboard.jsp");
        }
    }
}