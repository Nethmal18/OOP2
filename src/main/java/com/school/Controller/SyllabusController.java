package com.school.Controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.school.model.Syllabus;
import com.shcool.DBUtil.SyllabusDAO;


@WebServlet("/SyllabusController")
@MultipartConfig(maxFileSize = 16177215) // 16MB max file size
public class SyllabusController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private SyllabusDAO syllabusDAO;
    private static final String UPLOAD_DIRECTORY = "syllabus_files";

    // Initialize the controller and create DAO object
    public SyllabusController() {
        super();
        syllabusDAO = new SyllabusDAO();
    }

    // Handle GET requests
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        // Default action is list if none provided
        if (action == null) {
            action = "list";
        }

        // Route the request to the appropriate method based on the action parameter
        switch (action) {
            case "new":
                showNewForm(request, response);
                break;
            case "insert":
                insertSyllabus(request, response);
                break;
            case "delete":
                deleteSyllabus(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "update":
                updateSyllabus(request, response);
                break;
            case "download":
                downloadSyllabus(request, response);
                break;
            case "dashboard":
                showDashboard(request, response);
                break;
            case "getDetails":
                getSyllabusDetails(request, response);
                break;
            default:
                listSyllabus(request, response);
                break;
        }
    }

    // Forward POST requests to doGet
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    // Display dashboard with summary statistics
    private void showDashboard(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get all syllabuses
        ArrayList<Syllabus> allSyllabuses = syllabusDAO.getAllSyllabuses();
        int totalSyllabuses = allSyllabuses.size();
        int approvedSyllabuses = 0;
        int pendingSyllabuses = 0;

        // Count approved and pending syllabuses
        for (Syllabus syllabus : allSyllabuses) {
            String approval = syllabus.getSyllabusApproval();
            if ("Approved".equals(approval)) {
                approvedSyllabuses++;
            } else if ("Pending".equals(approval)) {
                pendingSyllabuses++;
            }
        }

        // Set attributes for JSP
        request.setAttribute("totalSyllabuses", totalSyllabuses);
        request.setAttribute("approvedSyllabuses", approvedSyllabuses);
        request.setAttribute("pendingSyllabuses", pendingSyllabuses);

        // Forward to dashboard page
        RequestDispatcher dispatcher = request.getRequestDispatcher("curriculum-dashboard.jsp");
        dispatcher.forward(request, response);
    }

    // Display the list of syllabuses, with optional filtering
    private void listSyllabus(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get filter parameters
            String startDate = request.getParameter("startDate");
            String endDate = request.getParameter("endDate");
            String approval = request.getParameter("approval");
            String subId = request.getParameter("subId");

            ArrayList<Syllabus> syllabusList;
            boolean isFiltered = (startDate != null && !startDate.isEmpty()) ||
                                 (endDate != null && !endDate.isEmpty()) ||
                                 (approval != null && !approval.isEmpty()) ||
                                 (subId != null && !subId.isEmpty());

            // Get filtered or all syllabuses based on parameters
            if (isFiltered) {
                syllabusList = syllabusDAO.getFilteredSyllabuses(startDate, endDate, approval, subId);
                request.setAttribute("startDate", startDate);
                request.setAttribute("endDate", endDate);
                request.setAttribute("approval", approval);
                request.setAttribute("subId", subId);
                request.setAttribute("isFiltered", true);
            } else {
                syllabusList = syllabusDAO.getAllSyllabuses();
            }

            System.out.println("Retrieved " + (syllabusList != null ? syllabusList.size() : "null") + " syllabuses");

            // Set syllabuses list and forward to list page
            request.setAttribute("syllabusList", syllabusList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("syllabus-list.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            // Handle errors
            System.err.println("Error in listSyllabus: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("errorMessage", "Failed to retrieve syllabus list: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    // Show form to create new syllabus
    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("syllabus-form.jsp");
        dispatcher.forward(request, response);
    }

    // Show form to edit existing syllabus
    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get syllabus ID from request
        int syllabusId = Integer.parseInt(request.getParameter("id"));
        // Get syllabus data from database
        Syllabus existingSyllabus = syllabusDAO.getSyllabusById(syllabusId);
        // Set syllabus data for form
        request.setAttribute("syllabus", existingSyllabus);
        RequestDispatcher dispatcher = request.getRequestDispatcher("syllabus-form.jsp");
        dispatcher.forward(request, response);
    }

    // Save uploaded file to server and return file path
    private String saveFile(Part filePart) throws IOException {
        // Get application path and create upload directory if it doesn't exist
        String applicationPath = this.getServletContext().getRealPath("/");
        String uploadPath = applicationPath + File.separator + UPLOAD_DIRECTORY;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        // Generate unique filename
        String fileName = UUID.randomUUID().toString() + "_" + getFileName(filePart);
        String filePath = uploadPath + File.separator + fileName;

        // Save file
        try (InputStream input = filePart.getInputStream()) {
            Files.copy(input, Paths.get(filePath), StandardCopyOption.REPLACE_EXISTING);
        }

        return UPLOAD_DIRECTORY + File.separator + fileName;
    }

    // Extract file name from upload part
    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        for (String item : contentDisp.split(";")) {
            if (item.trim().startsWith("filename")) {
                return item.substring(item.indexOf("=") + 2, item.length() - 1);
            }
        }
        return "unknown_file";
    }

    // Insert new syllabus into database
    private void insertSyllabus(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        try {
            // Get parameters from form
            String subId = request.getParameter("subId");
            String cmId = request.getParameter("cmId");
            String description = request.getParameter("description");
            String syllabusDate = request.getParameter("date");
            String objectives = request.getParameter("objectives");
            int duration = Integer.parseInt(request.getParameter("duration"));
            String approval = request.getParameter("approval");

            // Handle file upload
            Part filePart = request.getPart("syllabusFile");
            String filePath = null;

            if (filePart != null && filePart.getSize() > 0) {
                filePath = saveFile(filePart);
            } else {
                // File is required
                session.setAttribute("message", "Error: PDF file is required");
                session.setAttribute("messageType", "danger");
                response.sendRedirect("SyllabusController?action=new");
                return;
            }

            // Create syllabus object
            Syllabus newSyllabus = new Syllabus(subId, cmId, description, syllabusDate,
                    objectives, duration, filePath, approval);

            // Save to database
            boolean success = syllabusDAO.addSyllabus(newSyllabus);

            if (success) {
                session.setAttribute("message", "Syllabus created successfully!");
                session.setAttribute("messageType", "success");
                response.sendRedirect("SyllabusController?action=list");
            } else {
                session.setAttribute("message", "Error: Unable to create syllabus");
                session.setAttribute("messageType", "danger");
                response.sendRedirect("SyllabusController?action=new");
            }
        } catch (Exception e) {
            // Handle errors
            session.setAttribute("message", "Error: " + e.getMessage());
            session.setAttribute("messageType", "danger");
            response.sendRedirect("SyllabusController?action=new");
        }
    }

    // Update existing syllabus
    private void updateSyllabus(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        try {
            // Get parameters from form
            String syllabusId = request.getParameter("id");
            String subId = request.getParameter("subId");
            String cmId = request.getParameter("cmId");
            String description = request.getParameter("description");
            String dateStr = request.getParameter("date");

            // Parse date string to Date object
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date parsed = format.parse(dateStr);
            Date syllabusDate = new Date(parsed.getTime());

            String objectives = request.getParameter("objectives");
            int duration = Integer.parseInt(request.getParameter("duration"));
            String approval = request.getParameter("approval");

            // Get existing syllabus
            Syllabus syllabus = syllabusDAO.getSyllabusById(Integer.parseInt(syllabusId));
            
            // Update syllabus object with new values
            syllabus.setSyllabusId(syllabusId);
            syllabus.setSubId(subId);
            syllabus.setCmId(cmId);
            syllabus.setSyllabusDescription(description);
            syllabus.setSyllabusDate(dateStr);
            syllabus.setSyllabusObjectives(objectives);
            syllabus.setSyllabusDuration(duration);
            syllabus.setSyllabusApproval(approval);

            boolean success;
            // Check if new file was uploaded
            Part filePart = request.getPart("syllabusFile");

            if (filePart != null && filePart.getSize() > 0) {
                // Save new file and update syllabus with new file path
                String filePath = saveFile(filePart);
                syllabus.setSyllabusFilePath(filePath);
                success = syllabusDAO.updateSyllabusWithFile(syllabus);
            } else {
                // Update syllabus without changing file
                success = syllabusDAO.updateSyllabus(syllabus);
            }

            if (success) {
                session.setAttribute("message", "Syllabus updated successfully!");
                session.setAttribute("messageType", "success");
            } else {
                session.setAttribute("message", "Error: Unable to update syllabus");
                session.setAttribute("messageType", "danger");
            }

            response.sendRedirect("SyllabusController?action=list");
        } catch (Exception e) {
            // Handle errors
            session.setAttribute("message", "Error: " + e.getMessage());
            session.setAttribute("messageType", "danger");
            response.sendRedirect("SyllabusController?action=list");
        }
    }

    // Delete syllabus and its associated file
 // Update the deleteSyllabus method in SyllabusController.java
    private void deleteSyllabus(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        try {
            // Add debugging output
            System.out.println("Delete operation started");
            
            // Get syllabus ID from request
            String idParam = request.getParameter("id");
            System.out.println("Received ID parameter: " + idParam);
            
            if (idParam == null || idParam.trim().isEmpty()) {
                throw new IllegalArgumentException("Syllabus ID is required");
            }
            
            int syllabusId = Integer.parseInt(idParam);
            System.out.println("Parsed syllabusId: " + syllabusId);
            
            // Get syllabus to retrieve file path before deletion
            Syllabus syllabus = syllabusDAO.getSyllabusById(syllabusId);
            
            if (syllabus == null) {
                session.setAttribute("message", "Error: Syllabus not found");
                session.setAttribute("messageType", "danger");
                response.sendRedirect("SyllabusController?action=list");
                return;
            }
            
            String filePath = syllabus.getSyllabusFilePath();
            System.out.println("File path to delete: " + filePath);

            // Delete from database first
            boolean success = syllabusDAO.deleteSyllabus(syllabusId);
            System.out.println("Database deletion success: " + success);

            if (success) {
                // If database deletion successful, try to delete file
                if (filePath != null && !filePath.isEmpty()) {
                    try {
                        String fullPath = this.getServletContext().getRealPath("/") + filePath;
                        System.out.println("Attempting to delete file at: " + fullPath);
                        
                        File file = new File(fullPath);
                        if (file.exists()) {
                            boolean fileDeleted = file.delete();
                            System.out.println("File deletion result: " + fileDeleted);
                        } else {
                            System.out.println("File does not exist at: " + fullPath);
                        }
                    } catch (Exception e) {
                        System.err.println("Warning: Could not delete file: " + e.getMessage());
                        e.printStackTrace();
                    }
                }

                session.setAttribute("message", "Syllabus deleted successfully!");
                session.setAttribute("messageType", "success");
            } else {
                session.setAttribute("message", "Error: Unable to delete syllabus from database");
                session.setAttribute("messageType", "danger");
            }
        } catch (NumberFormatException e) {
            System.err.println("Error parsing ID: " + e.getMessage());
            session.setAttribute("message", "Error: Invalid syllabus ID format");
            session.setAttribute("messageType", "danger");
        } catch (Exception e) {
            System.err.println("Error in deleteSyllabus: " + e.getMessage());
            e.printStackTrace();
            session.setAttribute("message", "Error: " + e.getMessage());
            session.setAttribute("messageType", "danger");
        }

        response.sendRedirect("SyllabusController?action=list");
    }

    // Download syllabus PDF file
    private void downloadSyllabus(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get syllabus ID
        int syllabusId = Integer.parseInt(request.getParameter("id"));
        // Get syllabus to retrieve file path
        Syllabus syllabus = syllabusDAO.getSyllabusById(syllabusId);

        if (syllabus != null && syllabus.getSyllabusFilePath() != null) {
            // Get full file path
            String filePath = this.getServletContext().getRealPath("/") + syllabus.getSyllabusFilePath();
            File file = new File(filePath);

            if (file.exists()) {
                // Set response headers for file download
                response.setContentType("application/pdf");
                response.setHeader("Content-Disposition", "attachment; filename=syllabus_" + syllabusId + ".pdf");

                // Stream file to response output
                try (InputStream in = Files.newInputStream(file.toPath());
                     OutputStream out = response.getOutputStream()) {

                    byte[] buffer = new byte[4096];
                    int bytesRead;

                    while ((bytesRead = in.read(buffer)) != -1) {
                        out.write(buffer, 0, bytesRead);
                    }
                }
            } else {
                response.getWriter().println("File not found on server.");
            }
        } else {
            response.getWriter().println("No file information found for this syllabus.");
        }
    }

    // Get syllabus details as JSON

    private void getSyllabusDetails(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        try {
            // Get syllabus ID
            int syllabusId = Integer.parseInt(request.getParameter("id"));
            
            // Get syllabus from database
            Syllabus syllabus = syllabusDAO.getSyllabusById(syllabusId);

            if (syllabus != null) {
                // Set proper content type and character encoding
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                
                // Create a more robust JSON response with better escaping
                String json = String.format(
                    "{" +
                    "\"syllabusId\":\"%s\"," +
                    "\"subId\":\"%s\"," +
                    "\"cmId\":\"%s\"," +
                    "\"description\":%s," + // Using JSON.stringify equivalent in Java
                    "\"date\":\"%s\"," +
                    "\"objectives\":%s," + // Using JSON.stringify equivalent in Java
                    "\"duration\":%d," +
                    "\"filePath\":\"%s\"," +
                    "\"approval\":\"%s\"" +
                    "}",
                    escapeJsonString(syllabus.getSyllabusId()),
                    escapeJsonString(syllabus.getSubId()),
                    escapeJsonString(syllabus.getCmId()),
                    toJsonString(syllabus.getSyllabusDescription()), // Proper JSON string encoding
                    escapeJsonString(syllabus.getSyllabusDate()),
                    toJsonString(syllabus.getSyllabusObjectives()), // Proper JSON string encoding
                    syllabus.getSyllabusDuration(),
                    escapeJsonString(syllabus.getSyllabusFilePath()),
                    escapeJsonString(syllabus.getSyllabusApproval())
                );
                
                // Send JSON response
                response.getWriter().write(json);
            } else {
                // Syllabus not found
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                response.getWriter().write("{\"error\":\"Syllabus not found\"}");
            }
        } catch (Exception e) {
            // Log the error
            System.err.println("Error in getSyllabusDetails: " + e.getMessage());
            e.printStackTrace();
            
            // Send error response
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\":\"" + escapeJsonString(e.getMessage()) + "\"}");
        }
    }

    // Enhanced method for escaping basic JSON strings - for simple fields
    private String escapeJsonString(String input) {
        if (input == null) {
            return "";
        }
        
        return input.replace("\\", "\\\\")
                   .replace("\"", "\\\"")
                   .replace("\n", "\\n")
                   .replace("\r", "\\r")
                   .replace("\t", "\\t");
    }

    // More comprehensive method for properly handling multi-line text content as JSON strings
    private String toJsonString(String input) {
        if (input == null) {
            return "\"\"";
        }
        
        // First escape the string
        String escaped = input.replace("\\", "\\\\")
                             .replace("\"", "\\\"")
                             .replace("\n", "\\n")
                             .replace("\r", "\\r")
                             .replace("\t", "\\t")
                             .replace("/", "\\/");
        
        // Wrap in quotes to make it a valid JSON string
        return "\"" + escaped + "\"";
    }
}