package com.school.model;

/**
 * Represents a syllabus entity in the school management system.
 * This class contains all information related to a subject syllabus.
 */
public class Syllabus {
    private String syllabusId;         // Unique identifier for the syllabus
    private String subId;              // Subject identifier that this syllabus belongs to
    private String cmId;               // Course module identifier
    private String syllabusDescription; // Detailed description of the syllabus content
    private String syllabusDate;       // Date when the syllabus was created/updated
    private String syllabusObjectives; // Learning objectives of the syllabus
    private int syllabusDuration;      // Duration of the syllabus (in hours/days)
    private String syllabusFilePath;   // File path for the PDF file
    private String syllabusApproval;   // Approval status (e.g., "Approved", "Pending")

    /**
     * Default constructor
     */
    public Syllabus() {
    }

    /**
     * Constructor for creating new syllabus with all required fields
     * 
     * @param subId Subject identifier
     * @param cmId Course module identifier
     * @param description Detailed description
     * @param syllabusDate Creation/update date
     * @param syllabusObjectives Learning objectives
     * @param syllabusDuration Duration in hours/days
     * @param syllabusFilePath Path to the PDF file
     * @param syllabusApproval Approval status
     */
    public Syllabus(String subId, String cmId, String description, String syllabusDate,
                   String syllabusObjectives, int syllabusDuration, String syllabusFilePath,
                   String syllabusApproval) {
        this.subId = subId;
        this.cmId = cmId;
        this.syllabusDescription = description;
        this.syllabusDate = syllabusDate;
        this.syllabusObjectives = syllabusObjectives;
        this.syllabusDuration = syllabusDuration;
        this.syllabusFilePath = syllabusFilePath;
        this.syllabusApproval = syllabusApproval;
    }

    // Getters and Setters
    public String getSyllabusId() {
        return syllabusId;
    }

    public void setSyllabusId(String syllabusId) {
        this.syllabusId = syllabusId;
    }

    public String getSubId() {
        return subId;
    }

    public void setSubId(String subId) {
        this.subId = subId;
    }

    public String getCmId() {
        return cmId;
    }

    public void setCmId(String cmId) {
        this.cmId = cmId;
    }

    public String getSyllabusDescription() {
        return syllabusDescription;
    }

    public void setSyllabusDescription(String syllabusDescription) {
        this.syllabusDescription = syllabusDescription;
    }

    public String getSyllabusDate() {
        return syllabusDate;
    }

    public void setSyllabusDate(String syllabusDate) {
        this.syllabusDate = syllabusDate;
    }

    public String getSyllabusObjectives() {
        return syllabusObjectives;
    }

    public void setSyllabusObjectives(String syllabusObjectives) {
        this.syllabusObjectives = syllabusObjectives;
    }

    public int getSyllabusDuration() {
        return syllabusDuration;
    }

    public void setSyllabusDuration(int syllabusDuration) {
        this.syllabusDuration = syllabusDuration;
    }

    public String getSyllabusFilePath() {
        return syllabusFilePath;
    }

    public void setSyllabusFilePath(String syllabusFilePath) {
        this.syllabusFilePath = syllabusFilePath;
    }

    // Legacy method for backward compatibility
    public String getSyllabusFile() {
        return syllabusFilePath;
    }

    // Legacy method for backward compatibility
    public void setSyllabusFile(String syllabusFile) {
        this.syllabusFilePath = syllabusFile;
    }

    public String getSyllabusApproval() {
        return syllabusApproval;
    }

    public void setSyllabusApproval(String syllabusApproval) {
        this.syllabusApproval = syllabusApproval;
    }
    
    @Override
    public String toString() {
        return "Syllabus [syllabusId=" + syllabusId + ", subId=" + subId + ", cmId=" + cmId + 
               ", syllabusDescription=" + syllabusDescription + ", syllabusDate=" + syllabusDate + 
               ", syllabusObjectives=" + syllabusObjectives + ", syllabusDuration=" + syllabusDuration + 
               ", syllabusFilePath=" + syllabusFilePath + ", syllabusApproval=" + syllabusApproval + "]";
    }
}