package com.school.model;

import java.sql.Timestamp;

/**
 * Represents a rating for a syllabus in the school management system.
 */
public class Rating {
    private int ratingId;          // Unique identifier for the rating
    private int syllabusId;        // ID of the syllabus being rated
    private int userId;            // ID of the user who provided the rating
    private int ratingValue;       // Rating value (1-5)
    private String comment;        // Optional comment with the rating
    private Timestamp ratingDate;  // Date when the rating was submitted
    
    // Default constructor
    public Rating() {
    }
    
    /**
     * Constructor with all fields except ratingId and ratingDate (which are auto-generated)
     * 
     * @param syllabusId ID of the syllabus being rated
     * @param userId ID of the user providing the rating
     * @param ratingValue Rating value (1-5)
     * @param comment Optional comment with the rating
     */
    public Rating(int syllabusId, int userId, int ratingValue, String comment) {
        this.syllabusId = syllabusId;
        this.userId = userId;
        this.ratingValue = ratingValue;
        this.comment = comment;
    }
    
    // Full constructor
    public Rating(int ratingId, int syllabusId, int userId, int ratingValue, 
                 String comment, Timestamp ratingDate) {
        this.ratingId = ratingId;
        this.syllabusId = syllabusId;
        this.userId = userId;
        this.ratingValue = ratingValue;
        this.comment = comment;
        this.ratingDate = ratingDate;
    }
    
    // Getters and Setters
    public int getRatingId() {
        return ratingId;
    }
    
    public void setRatingId(int ratingId) {
        this.ratingId = ratingId;
    }
    
    public int getSyllabusId() {
        return syllabusId;
    }
    
    public void setSyllabusId(int syllabusId) {
        this.syllabusId = syllabusId;
    }
    
    public int getUserId() {
        return userId;
    }
    
    public void setUserId(int userId) {
        this.userId = userId;
    }
    
    public int getRatingValue() {
        return ratingValue;
    }
    
    public void setRatingValue(int ratingValue) {
        // Validate rating is between 1 and 5
        if (ratingValue < 1 || ratingValue > 5) {
            throw new IllegalArgumentException("Rating value must be between 1 and 5");
        }
        this.ratingValue = ratingValue;
    }
    
    public String getComment() {
        return comment;
    }
    
    public void setComment(String comment) {
        this.comment = comment;
    }
    
    public Timestamp getRatingDate() {
        return ratingDate;
    }
    
    public void setRatingDate(Timestamp ratingDate) {
        this.ratingDate = ratingDate;
    }
    
    @Override
    public String toString() {
        return "Rating [ratingId=" + ratingId + 
               ", syllabusId=" + syllabusId + 
               ", userId=" + userId + 
               ", ratingValue=" + ratingValue + 
               ", comment=" + comment + 
               ", ratingDate=" + ratingDate + "]";
    }
}