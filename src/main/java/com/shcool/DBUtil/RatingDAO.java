package com.shcool.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.school.Controller.DBConnection;
import com.school.model.Rating;

/**
 * Data Access Object for managing syllabus ratings in the database.
 */
public class RatingDAO {
    
    /**
     * Adds a new rating for a syllabus
     * 
     * @param rating The Rating object to be added
     * @return true if successful, false otherwise
     */
    public boolean addRating(Rating rating) {
        String query = "INSERT INTO syllabus_ratings (syllabus_id, user_id, rating, comment) VALUES (?, ?, ?, ?)";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            
            pstmt.setInt(1, rating.getSyllabusId());
            pstmt.setInt(2, rating.getUserId());
            pstmt.setInt(3, rating.getRatingValue());
            pstmt.setString(4, rating.getComment());
            
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
            
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Error in addRating: " + e.getMessage());
            return false;
        }
    }
    
    /**
     * Updates an existing rating
     * 
     * @param rating The Rating object with updated values
     * @return true if successful, false otherwise
     */
    public boolean updateRating(Rating rating) {
        String query = "UPDATE syllabus_ratings SET rating = ?, comment = ? WHERE rating_id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            
            pstmt.setInt(1, rating.getRatingValue());
            pstmt.setString(2, rating.getComment());
            pstmt.setInt(3, rating.getRatingId());
            
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
            
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Error in updateRating: " + e.getMessage());
            return false;
        }
    }
    
    /**
     * Deletes a rating by its ID
     * 
     * @param ratingId ID of the rating to delete
     * @return true if successful, false otherwise
     */
    public boolean deleteRating(int ratingId) {
        String query = "DELETE FROM syllabus_ratings WHERE rating_id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            
            pstmt.setInt(1, ratingId);
            
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
            
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Error in deleteRating: " + e.getMessage());
            return false;
        }
    }
    
    /**
     * Get a specific rating by its ID
     * 
     * @param ratingId ID of the rating to retrieve
     * @return Rating object if found, null otherwise
     */
    public Rating getRatingById(int ratingId) {
        String query = "SELECT * FROM syllabus_ratings WHERE rating_id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            
            pstmt.setInt(1, ratingId);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToRating(rs);
                }
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Error in getRatingById: " + e.getMessage());
        }
        
        return null;
    }
    
    /**
     * Get all ratings for a specific syllabus
     * 
     * @param syllabusId ID of the syllabus
     * @return ArrayList of Rating objects
     */
    public ArrayList<Rating> getRatingsBySyllabusId(int syllabusId) {
        ArrayList<Rating> ratingsList = new ArrayList<>();
        String query = "SELECT * FROM syllabus_ratings WHERE syllabus_id = ? ORDER BY rating_date DESC";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            
            pstmt.setInt(1, syllabusId);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    ratingsList.add(mapResultSetToRating(rs));
                }
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Error in getRatingsBySyllabusId: " + e.getMessage());
        }
        
        return ratingsList;
    }
    
    /**
     * Check if a user has already rated a specific syllabus
     * 
     * @param syllabusId ID of the syllabus
     * @param userId ID of the user
     * @return The rating ID if user has rated, -1 otherwise
     */
    public int hasUserRated(int syllabusId, int userId) {
        String query = "SELECT rating_id FROM syllabus_ratings WHERE syllabus_id = ? AND user_id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            
            pstmt.setInt(1, syllabusId);
            pstmt.setInt(2, userId);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("rating_id");
                }
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Error in hasUserRated: " + e.getMessage());
        }
        
        return -1;
    }
    
    /**
     * Get the average rating for a syllabus
     * 
     * @param syllabusId ID of the syllabus
     * @return Average rating value (0.0 if no ratings)
     */
    public double getAverageRating(int syllabusId) {
        String query = "SELECT AVG(rating) as avg_rating FROM syllabus_ratings WHERE syllabus_id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            
            pstmt.setInt(1, syllabusId);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    double avg = rs.getDouble("avg_rating");
                    return rs.wasNull() ? 0.0 : avg;  // Handle null case when no ratings exist
                }
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Error in getAverageRating: " + e.getMessage());
        }
        
        return 0.0;
    }
    
    /**
     * Get the total number of ratings for a syllabus
     * 
     * @param syllabusId ID of the syllabus
     * @return Number of ratings
     */
    public int getRatingCount(int syllabusId) {
        String query = "SELECT COUNT(*) as count FROM syllabus_ratings WHERE syllabus_id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            
            pstmt.setInt(1, syllabusId);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("count");
                }
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Error in getRatingCount: " + e.getMessage());
        }
        
        return 0;
    }
    
    /**
     * Get the distribution of ratings for a syllabus (how many 5-star, 4-star, etc.)
     * 
     * @param syllabusId ID of the syllabus
     * @return Map with rating values as keys and counts as values
     */
    public Map<Integer, Integer> getRatingDistribution(int syllabusId) {
        Map<Integer, Integer> distribution = new HashMap<>();
        // Initialize all ratings with 0 count
        for (int i = 1; i <= 5; i++) {
            distribution.put(i, 0);
        }
        
        String query = "SELECT rating, COUNT(*) as count FROM syllabus_ratings WHERE syllabus_id = ? GROUP BY rating";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            
            pstmt.setInt(1, syllabusId);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    int rating = rs.getInt("rating");
                    int count = rs.getInt("count");
                    distribution.put(rating, count);
                }
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Error in getRatingDistribution: " + e.getMessage());
        }
        
        return distribution;
    }
    
    /**
     * Get summary statistics for all syllabuses
     * 
     * @return List of syllabuses with their average ratings and count
     */
    public ArrayList<Map<String, Object>> getAllSyllabusRatings() {
        ArrayList<Map<String, Object>> ratingStats = new ArrayList<>();
        String query = "SELECT s.syllabus_id, s.sub_id, " +
                      "AVG(r.rating) as avg_rating, " +
                      "COUNT(r.rating_id) as rating_count " +
                      "FROM syllabus s " +
                      "LEFT JOIN syllabus_ratings r ON s.syllabus_id = r.syllabus_id " +
                      "GROUP BY s.syllabus_id, s.sub_id " +
                      "ORDER BY avg_rating DESC NULLS LAST";
        
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            
            while (rs.next()) {
                Map<String, Object> syllabusRating = new HashMap<>();
                syllabusRating.put("syllabusId", rs.getInt("syllabus_id"));
                syllabusRating.put("subId", rs.getString("sub_id"));
                
                // Handle NULL values for average rating (when no ratings exist)
                double avgRating = rs.getDouble("avg_rating");
                syllabusRating.put("averageRating", rs.wasNull() ? 0.0 : avgRating);
                
                syllabusRating.put("ratingCount", rs.getInt("rating_count"));
                
                ratingStats.add(syllabusRating);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Error in getAllSyllabusRatings: " + e.getMessage());
            
            // If the NULLS LAST syntax is not supported, try alternative query
            if (e.getMessage().contains("NULLS")) {
                return getAllSyllabusRatingsAlternative();
            }
        }
        
        return ratingStats;
    }
    
    /**
     * Alternative implementation of getAllSyllabusRatings for databases 
     * that don't support NULLS LAST syntax
     */
    private ArrayList<Map<String, Object>> getAllSyllabusRatingsAlternative() {
        ArrayList<Map<String, Object>> ratingStats = new ArrayList<>();
        String query = "SELECT s.syllabus_id, s.sub_id, " +
                      "AVG(r.rating) as avg_rating, " +
                      "COUNT(r.rating_id) as rating_count " +
                      "FROM syllabus s " +
                      "LEFT JOIN syllabus_ratings r ON s.syllabus_id = r.syllabus_id " +
                      "GROUP BY s.syllabus_id, s.sub_id " +
                      "ORDER BY CASE WHEN AVG(r.rating) IS NULL THEN 0 ELSE 1 END DESC, " +
                      "AVG(r.rating) DESC";
        
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            
            while (rs.next()) {
                Map<String, Object> syllabusRating = new HashMap<>();
                syllabusRating.put("syllabusId", rs.getInt("syllabus_id"));
                syllabusRating.put("subId", rs.getString("sub_id"));
                
                // Handle NULL values for average rating
                double avgRating = rs.getDouble("avg_rating");
                syllabusRating.put("averageRating", rs.wasNull() ? 0.0 : avgRating);
                
                syllabusRating.put("ratingCount", rs.getInt("rating_count"));
                
                ratingStats.add(syllabusRating);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Error in getAllSyllabusRatingsAlternative: " + e.getMessage());
        }
        
        return ratingStats;
    }
    
    /**
     * Helper method to map ResultSet row to Rating object
     */
    private Rating mapResultSetToRating(ResultSet rs) throws SQLException {
        Rating rating = new Rating();
        rating.setRatingId(rs.getInt("rating_id"));
        rating.setSyllabusId(rs.getInt("syllabus_id"));
        rating.setUserId(rs.getInt("user_id"));
        rating.setRatingValue(rs.getInt("rating"));
        rating.setComment(rs.getString("comment"));
        rating.setRatingDate(rs.getTimestamp("rating_date"));
        return rating;
    }
}