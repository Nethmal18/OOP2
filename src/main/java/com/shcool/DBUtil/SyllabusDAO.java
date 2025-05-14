package com.shcool.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import com.school.Controller.*;
import com.school.model.Syllabus;

public class SyllabusDAO {
    private DBConnection dbConnection;

    // Constructor - initialize database connection
    public SyllabusDAO() {
        dbConnection = new DBConnection();
    }

    // Add a new syllabus to the database
    public boolean addSyllabus(Syllabus syllabus) {
        String query = "INSERT INTO syllabus (sub_id, cm_id, syllabus_description, syllabus_date, syllabus_objectives, syllabus_duration, syllabus_file, syllabus_approval) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            // Set parameters for the prepared statement
            pstmt.setString(1, syllabus.getSubId());
            pstmt.setString(2, syllabus.getCmId());
            pstmt.setString(3, syllabus.getSyllabusDescription());
            pstmt.setString(4, syllabus.getSyllabusDate());
            pstmt.setString(5, syllabus.getSyllabusObjectives());
            pstmt.setInt(6, syllabus.getSyllabusDuration());
            pstmt.setString(7, syllabus.getSyllabusFilePath());
            pstmt.setString(8, syllabus.getSyllabusApproval());

            // Execute the query and check if any rows were affected
            int rowsAffected = pstmt.executeUpdate();

            System.out.println("Success");
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

 // Get all syllabuses from the database, ordered by subject ID
    public ArrayList<Syllabus> getAllSyllabuses() {
        ArrayList<Syllabus> syllabusList = new ArrayList<>();
        String query = "SELECT * FROM syllabus ORDER BY sub_id";

        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                Syllabus syllabus = new Syllabus();
                syllabus.setSyllabusId(rs.getString("syllabus_id"));
                syllabus.setSubId(rs.getString("sub_id"));
                syllabus.setCmId(rs.getString("cm_id"));
                syllabus.setSyllabusDescription(rs.getString("syllabus_description"));
                syllabus.setSyllabusDate(rs.getString("syllabus_date"));
                syllabus.setSyllabusObjectives(rs.getString("syllabus_objectives"));
                syllabus.setSyllabusDuration(rs.getInt("syllabus_duration"));
                syllabus.setSyllabusFilePath(rs.getString("syllabus_file"));
                syllabus.setSyllabusApproval(rs.getString("syllabus_approval"));

             

                syllabusList.add(syllabus);
            }

            System.out.println("Retrieved " + syllabusList.size() + " syllabuses from database");

        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Error in getAllSyllabuses: " + e.getMessage());
        }

        return syllabusList;
    }

    // Get filtered syllabuses based on date range, approval status, and subject ID
    public ArrayList<Syllabus> getFilteredSyllabuses(String startDate, String endDate, String approval, String subId) {
        ArrayList<Syllabus> syllabusList = new ArrayList<>();
        StringBuilder queryBuilder = new StringBuilder("SELECT * FROM syllabus WHERE 1=1");
        ArrayList<Object> parameters = new ArrayList<>();

        // Add filters to query if they are provided
        if (startDate != null && !startDate.isEmpty()) {
            queryBuilder.append(" AND syllabus_date >= ?");
            parameters.add(startDate);
        }

        if (endDate != null && !endDate.isEmpty()) {
            queryBuilder.append(" AND syllabus_date <= ?");
            parameters.add(endDate);
        }

        if (approval != null && !approval.isEmpty()) {
            queryBuilder.append(" AND syllabus_approval = ?");
            parameters.add(approval);
        }

        if (subId != null && !subId.isEmpty()) {
            queryBuilder.append(" AND sub_id LIKE ?");
            parameters.add("%" + subId + "%");
        }

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(queryBuilder.toString())) {

            // Set parameters for prepared statement
            for (int i = 0; i < parameters.size(); i++) {
                pstmt.setObject(i + 1, parameters.get(i));
            }

            // Execute query and process results
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Syllabus syllabus = new Syllabus();
                    syllabus.setSyllabusId(rs.getString("syllabus_id"));
                    syllabus.setSubId(rs.getString("sub_id"));
                    syllabus.setCmId(rs.getString("cm_id"));
                    syllabus.setSyllabusDescription(rs.getString("syllabus_description"));
                    syllabus.setSyllabusDate(rs.getString("syllabus_date"));
                    syllabus.setSyllabusObjectives(rs.getString("syllabus_objectives"));
                    syllabus.setSyllabusDuration(rs.getInt("syllabus_duration"));
                    syllabus.setSyllabusFilePath(rs.getString("syllabus_file"));
                    syllabus.setSyllabusApproval(rs.getString("syllabus_approval"));

                    syllabusList.add(syllabus);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Error in getFilteredSyllabuses: " + e.getMessage());
        }

        return syllabusList;
    }

    // Get a specific syllabus by ID
    public Syllabus getSyllabusById(int syllabusId) {
        String query = "SELECT * FROM syllabus WHERE syllabus_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setInt(1, syllabusId);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Syllabus syllabus = new Syllabus();
                    syllabus.setSyllabusId(rs.getString("syllabus_id"));
                    syllabus.setSubId(rs.getString("sub_id"));
                    syllabus.setCmId(rs.getString("cm_id"));
                    syllabus.setSyllabusDescription(rs.getString("syllabus_description"));
                    syllabus.setSyllabusDate(rs.getString("syllabus_date"));
                    syllabus.setSyllabusObjectives(rs.getString("syllabus_objectives"));
                    syllabus.setSyllabusDuration(rs.getInt("syllabus_duration"));
                    syllabus.setSyllabusFilePath(rs.getString("syllabus_file"));
                    syllabus.setSyllabusApproval(rs.getString("syllabus_approval"));

                    return syllabus;
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Error in getSyllabusById: " + e.getMessage());
        }

        return null;
    }

    // Update syllabus without changing the file
    public boolean updateSyllabus(Syllabus syllabus) {
        String query = "UPDATE syllabus SET sub_id = ?, cm_id = ?, syllabus_description = ?, syllabus_date = ?, syllabus_objectives = ?, syllabus_duration = ?, syllabus_approval = ? WHERE syllabus_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, syllabus.getSubId());
            pstmt.setString(2, syllabus.getCmId());
            pstmt.setString(3, syllabus.getSyllabusDescription());
            pstmt.setString(4, syllabus.getSyllabusDate());
            pstmt.setString(5, syllabus.getSyllabusObjectives());
            pstmt.setInt(6, syllabus.getSyllabusDuration());
            pstmt.setString(7, syllabus.getSyllabusApproval());
            pstmt.setInt(8, Integer.parseInt(syllabus.getSyllabusId()));

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Error in updateSyllabus: " + e.getMessage());
            return false;
        }
    }

    // Update syllabus including the file
    public boolean updateSyllabusWithFile(Syllabus syllabus) {
        String query = "UPDATE syllabus SET sub_id = ?, cm_id = ?, syllabus_description = ?, syllabus_date = ?, syllabus_objectives = ?, syllabus_duration = ?, syllabus_file = ?, syllabus_approval = ? WHERE syllabus_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, syllabus.getSubId());
            pstmt.setString(2, syllabus.getCmId());
            pstmt.setString(3, syllabus.getSyllabusDescription());
            pstmt.setString(4, syllabus.getSyllabusDate());
            pstmt.setString(5, syllabus.getSyllabusObjectives());
            pstmt.setInt(6, syllabus.getSyllabusDuration());
            pstmt.setString(7, syllabus.getSyllabusFilePath());
            pstmt.setString(8, syllabus.getSyllabusApproval());
            pstmt.setInt(9, Integer.parseInt(syllabus.getSyllabusId()));

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Error in updateSyllabusWithFile: " + e.getMessage());
            return false;
        }
    }
    
    

    // Delete syllabus
    public boolean deleteSyllabus(int syllabusId) {
        String query = "DELETE FROM syllabus WHERE syllabus_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setInt(1, syllabusId);

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Error in deleteSyllabus: " + e.getMessage());
            return false;
        }
    }
}
