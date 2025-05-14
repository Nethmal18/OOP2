<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Syllabus Management</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <style>
        :root {
            --primary-color: #4361ee;
            --secondary-color: #3f37c9;
            --accent-color: #4cc9f0;
            --light-bg: #f8f9fa;
            --dark-text: #212529;
            --pending-color: #ffc107;
            --approved-color: #198754;
            --rejected-color: #dc3545;
        }
        
        body {
            background-color: var(--light-bg);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .page-header {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            border-radius: 12px;
            padding: 25px;
            margin-bottom: 25px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        
        .header-actions .btn {
            border-radius: 50px;
            padding: 10px 20px;
            font-weight: 600;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: all 0.3s;
        }
        
        .header-actions .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
        }
        
        .card {
            border: none;
            border-radius: 12px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
            transition: all 0.3s;
            overflow: hidden;
            margin-bottom: 25px;
        }
        
        .card:hover {
            box-shadow: 0 10px 15px rgba(0, 0, 0, 0.1);
        }
        
        .card-header {
            font-weight: 600;
            padding: 15px 20px;
        }
        
        .search-form {
            padding: 0;
        }
        
        .search-form .form-control {
            border-radius: 8px;
            padding: 10px 15px;
            border: 1px solid #dee2e6;
            transition: all 0.3s;
        }
        
        .search-form .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.15);
        }
        
        .search-form .btn {
            border-radius: 8px;
            padding: 10px 20px;
            font-weight: 500;
        }
        
        .search-form label {
            font-weight: 500;
            color: #495057;
            margin-bottom: 5px;
        }
        
        .table-container {
            border-radius: 12px;
            overflow: hidden;
        }
        
        .table {
            margin-bottom: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .table thead th {
            background-color: #f8f9fa;
            color: var(--dark-text);
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.8rem;
            letter-spacing: 0.5px;
            padding: 15px;
            border: none;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .table tbody tr {
            transition: all 0.2s;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .table tbody tr:hover {
            background-color: rgba(67, 97, 238, 0.05);
        }
        
        .table td {
            padding: 15px;
            vertical-align: middle;
            border-bottom: 1px solid #f1f1f1;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .action-buttons .btn {
            border-radius: 50%;
            width: 36px;
            height: 36px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            margin-right: 5px;
            transition: all 0.3s;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
        }
        
        .action-buttons .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        
        .action-buttons .btn-view {
            border-radius: 50px;
            width: auto;
            padding: 5px 15px;
        }
        
        .status-badge {
            padding: 8px 12px;
            border-radius: 50px;
            font-weight: 600;
            font-size: 0.75rem;
            letter-spacing: 0.5px;
            text-transform: uppercase;
        }
        
        .status-approved {
            background-color: rgba(25, 135, 84, 0.15);
            color: var(--approved-color);
        }
        
        .status-pending {
            background-color: rgba(255, 193, 7, 0.15);
            color: var(--pending-color);
        }
        
        .status-rejected {
            background-color: rgba(220, 53, 69, 0.15);
            color: var(--rejected-color);
        }
        
        .star-rating {
            color: #ffc107;
            font-size: 1rem;
        }
        
        .star-rating i {
            margin-right: 2px;
        }
        
        .no-data {
            text-align: center;
            padding: 60px 20px;
            color: #6c757d;
        }
        
        .no-data i {
            font-size: 4rem;
            color: #dee2e6;
            margin-bottom: 20px;
        }
        
        .no-data h4 {
            font-weight: 600;
            margin-bottom: 10px;
        }
        
        .no-data p {
            max-width: 500px;
            margin: 0 auto;
            opacity: 0.8;
        }
        
        .rating-comment {
            background-color: #f8f9fa;
            border-radius: 8px;
            padding: 8px 12px;
            font-style: italic;
            margin-top: 5px;
            font-size: 0.8rem;
            color: #6c757d;
        }
        
        .id-badge {
            background-color: var(--light-bg);
            color: var(--dark-text);
            font-size: 0.8rem;
            padding: 4px 8px;
            border-radius: 4px;
            font-weight: 500;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .syllabus-description {
            max-width: 250px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
        
        .alert {
            border-radius: 10px;
            border: none;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
        }
        
        @media (max-width: 992px) {
            .header-actions {
                margin-top: 15px;
                display: flex;
                justify-content: flex-start;
            }
            
            .table-responsive {
                border-radius: 12px;
            }
        }
    </style>
</head>
<body>
    <div class="container mt-4 mb-5">
        <!-- Header -->
        <div class="page-header animate__animated animate__fadeIn">
            <div class="row align-items-center">
                <div class="col-lg-8">
                    <h2 class="mb-1"><i class="fas fa-book-open me-2"></i>Syllabus Management</h2>
                    <p class="mb-0 text-white-50">Manage, track, and evaluate your course syllabuses in one place</p>
                </div>
                <div class="col-lg-4 text-lg-end header-actions">
                    <a href="SyllabusController?action=new" class="btn btn-light text-primary me-2">
                        <i class="fas fa-plus me-2"></i> New Syllabus
                    </a>
                    <a href="SyllabusController?action=dashboard" class="btn btn-outline-light">
                        <i class="fas fa-tachometer-alt me-2"></i> Dashboard
                    </a>
                </div>
            </div>
        </div>
        
        <!-- Alert Messages -->
        <c:if test="${not empty sessionScope.message}">
            <div class="alert alert-${sessionScope.messageType} animate__animated animate__fadeIn alert-dismissible fade show" role="alert">
                <i class="fas ${sessionScope.messageType == 'success' ? 'fa-check-circle' : 'fa-exclamation-circle'} me-2"></i>
                ${sessionScope.message}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <c:remove var="message" scope="session" />
            <c:remove var="messageType" scope="session" />
        </c:if>
        
        <!-- Search Card -->
        <div class="card animate__animated animate__fadeIn">
            <div class="card-header d-flex align-items-center">
                <i class="fas fa-search me-2 text-primary"></i>
                <span>Search Syllabus</span>
                <button class="btn btn-link ms-auto p-0 text-decoration-none" type="button" data-bs-toggle="collapse" data-bs-target="#searchCollapse" aria-expanded="true" aria-controls="searchCollapse">
                    <i class="fas fa-chevron-down"></i>
                </button>
            </div>
            <div class="collapse show" id="searchCollapse">
                <div class="card-body">
                    <form action="SyllabusController" method="get" class="row g-3 search-form">
                        <input type="hidden" name="action" value="list">
                        
                        <div class="col-md-3">
                            <label for="startDate" class="form-label"><i class="far fa-calendar-alt me-1"></i> Start Date</label>
                            <input type="date" class="form-control" id="startDate" name="startDate" value="${startDate}">
                        </div>
                        
                        <div class="col-md-3">
                            <label for="endDate" class="form-label"><i class="far fa-calendar-alt me-1"></i> End Date</label>
                            <input type="date" class="form-control" id="endDate" name="endDate" value="${endDate}">
                        </div>
                        
                        <div class="col-md-3">
                            <label for="approval" class="form-label"><i class="far fa-check-circle me-1"></i> Approval Status</label>
                            <select class="form-select" id="approval" name="approval">
                                <option value="">All Statuses</option>
                                <option value="Approved" ${approval == 'Approved' ? 'selected' : ''}>Approved</option>
                                <option value="Pending" ${approval == 'Pending' ? 'selected' : ''}>Pending</option>
                                <option value="Rejected" ${approval == 'Rejected' ? 'selected' : ''}>Rejected</option>
                            </select>
                        </div>
                        
                        <div class="col-md-3">
                            <label for="subId" class="form-label"><i class="fas fa-hashtag me-1"></i> Subject ID</label>
                            <input type="text" class="form-control" id="subId" name="subId" placeholder="Enter Subject ID" value="${subId}">
                        </div>
                        
                        <div class="col-12 d-flex">
                            <button type="submit" class="btn btn-primary me-2">
                                <i class="fas fa-search me-2"></i> Search
                            </button>
                            <a href="SyllabusController?action=list" class="btn btn-outline-secondary">
                                <i class="fas fa-redo me-2"></i> Reset
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
        <!-- Results Card -->
        <div class="card animate__animated animate__fadeIn">
            <div class="card-header bg-white d-flex align-items-center">
                <i class="fas fa-list me-2 text-primary"></i>
                <span>Syllabus List</span>
                <span class="badge bg-primary rounded-pill ms-2">
                    ${empty syllabusList ? '0' : syllabusList.size()}
                </span>
            </div>
            <div class="card-body p-0">
                <c:choose>
                    <c:when test="${empty syllabusList}">
                        <div class="no-data animate__animated animate__fadeIn">
                            <i class="fas fa-file-search"></i>
                            <h4>No Syllabus Records Found</h4>
                            <p>There are no matching syllabus records to display. Try adding a new syllabus or adjusting your search criteria.</p>
                            <a href="SyllabusController?action=new" class="btn btn-primary mt-3">
                                <i class="fas fa-plus me-2"></i> Create New Syllabus
                            </a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th><i class="fas fa-hashtag me-1"></i> ID</th>
                                        <th><i class="fas fa-bookmark me-1"></i> Subject ID</th>
                                        <th><i class="fas fa-align-left me-1"></i> Description</th>
                                        <th><i class="far fa-calendar me-1"></i> Date</th>
                                        <th><i class="far fa-clock me-1"></i> Duration</th>
                                        <th><i class="fas fa-check-circle me-1"></i> Status</th>
                                        <c:if test="${showRatings == true || param.action == 'listRatings'}">
                                            <th><i class="fas fa-star me-1"></i> Rating</th>
                                        </c:if>
                                        <th><i class="fas fa-cog me-1"></i> Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="syllabus" items="${syllabusList}">
                                        <tr>
                                            <td>
                                                <span class="id-badge">#<c:out value="${syllabus.syllabusId}" /></span>
                                            </td>
                                            <td>
                                                <strong><c:out value="${syllabus.subId}" /></strong>
                                            </td>
                                            <td>
                                                <div class="syllabus-description" title="${syllabus.syllabusDescription}">
                                                    <c:out value="${syllabus.syllabusDescription}" />
                                                </div>
                                            </td>
                                            <td>
                                                <c:out value="${syllabus.syllabusDate}" />
                                            </td>
                                            <td>
                                                <span class="badge bg-light text-dark">
                                                    <c:out value="${syllabus.syllabusDuration}" /> weeks
                                                </span>
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${syllabus.syllabusApproval == 'Approved'}">
                                                        <span class="status-badge status-approved">
                                                            <i class="fas fa-check-circle me-1"></i> Approved
                                                        </span>
                                                    </c:when>
                                                    <c:when test="${syllabus.syllabusApproval == 'Pending'}">
                                                        <span class="status-badge status-pending">
                                                            <i class="fas fa-clock me-1"></i> Pending
                                                        </span>
                                                    </c:when>
                                                    <c:when test="${syllabus.syllabusApproval == 'Rejected'}">
                                                        <span class="status-badge status-rejected">
                                                            <i class="fas fa-times-circle me-1"></i> Rejected
                                                        </span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge bg-secondary">
                                                            ${syllabus.syllabusApproval}
                                                        </span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <c:if test="${showRatings == true || param.action == 'listRatings'}">
                                                <td>
                                                    <c:if test="${syllabus.rating > 0}">
                                                        <div class="star-rating">
                                                            <c:forEach begin="1" end="${syllabus.rating}">
                                                                <i class="fas fa-star"></i>
                                                            </c:forEach>
                                                            <c:forEach begin="${syllabus.rating + 1}" end="5">
                                                                <i class="far fa-star"></i>
                                                            </c:forEach>
                                                        </div>
                                                        <c:if test="${not empty syllabus.ratingComments}">
                                                            <div class="rating-comment">
                                                                "${syllabus.ratingComments}"
                                                            </div>
                                                        </c:if>
                                                    </c:if>
                                                    <c:if test="${syllabus.rating == 0 || empty syllabus.rating}">
                                                        <span class="text-muted fst-italic">Not yet rated</span>
                                                    </c:if>
                                                </td>
                                            </c:if>
                                            <td class="action-buttons">
    <a href="javascript:void(0);" onclick="viewSyllabus('<c:out value='${syllabus.syllabusId}' />')" class="btn btn-sm btn-success btn-view" title="View Details">
        <i class="fas fa-eye me-1"></i> View
    </a>
    <a href="SyllabusController?action=edit&id=<c:out value='${syllabus.syllabusId}' />" class="btn btn-sm btn-info" title="Edit">
        <i class="fas fa-edit"></i>
    </a>
    <a href="SyllabusController?action=download&id=<c:out value='${syllabus.syllabusId}' />" class="btn btn-sm btn-primary" title="Download">
        <i class="fas fa-download"></i>
    </a>
    <a href="#" onclick="confirmDelete(<c:out value='${syllabus.syllabusId}' />)" class="btn btn-sm btn-danger" title="Delete">
        <i class="fas fa-trash"></i>
    </a>
</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <script>
        // Confirm delete operation
        function confirmDelete(id) {
            if (confirm("Are you sure you want to delete this syllabus?")) {
                window.location.href = "SyllabusController?action=delete&id=" + id;
            }
        }
        
        // Document ready function
        document.addEventListener('DOMContentLoaded', function() {
            // Check if list is empty and no search has been performed
            const noData = document.querySelector('.no-data');
            const hasSearchParams = window.location.search.includes('action=list');
            
            if (noData && !hasSearchParams) {
                // Auto-load all syllabuses if no search performed yet
                window.location.href = "SyllabusController?action=list";
            }
            
            // Tooltips initialization
            const tooltipTriggerList = [].slice.call(document.querySelectorAll('[title]'));
            tooltipTriggerList.map(function (tooltipTriggerEl) {
                return new bootstrap.Tooltip(tooltipTriggerEl);
            });
            
            // Add hover effect to table rows
            const tableRows = document.querySelectorAll('tbody tr');
            tableRows.forEach(row => {
                row.addEventListener('mouseenter', () => {
                    row.classList.add('animate__animated', 'animate__pulse');
                });
                row.addEventListener('mouseleave', () => {
                    row.classList.remove('animate__animated', 'animate__pulse');
                });
            });
        });
        

// Function to view syllabus details in modal
function viewSyllabus(syllabusId) {
    // Show modal
    const modal = new bootstrap.Modal(document.getElementById('syllabusViewModal'));
    modal.show();
    
    // Show loader, hide content and error
    document.getElementById('syllabusLoader').classList.remove('d-none');
    document.getElementById('syllabusDetails').classList.add('d-none');
    document.getElementById('syllabusError').classList.add('d-none');
    
    // Set up download and edit links
    document.getElementById('syllabusDownloadLink').href = "SyllabusController?action=download&id=" + syllabusId;
    document.getElementById('syllabusEditLink').href = "SyllabusController?action=edit&id=" + syllabusId;
    
    // Fetch syllabus details using AJAX
    fetch("SyllabusController?action=getDetails&id=" + syllabusId)
        .then(response => {
            if (!response.ok) {
                throw new Error("Network response was not ok");
            }
            return response.json();
        })
        .then(data => {
            console.log("Received data:", data); // Debug log
            
            // Populate modal with data - using correct property names from the backend
            document.getElementById('viewSyllabusId').textContent = data.syllabusId || "N/A";
            document.getElementById('viewSubId').textContent = data.subId || "N/A";
            document.getElementById('viewCmId').textContent = data.cmId || "N/A";
            document.getElementById('viewDate').textContent = data.date || "N/A";
            document.getElementById('viewDuration').textContent = (data.duration || "N/A") + " weeks";
            
            // Set description and objectives with formatting
            document.getElementById('viewDescription').innerHTML = formatText(data.description);
            document.getElementById('viewObjectives').innerHTML = formatText(data.objectives);
            
            // Set approval status with appropriate styling
            const approvalElement = document.getElementById('viewApproval');
            approvalElement.textContent = data.approval || "N/A";
            approvalElement.className = "p-2 rounded";
            
            if (data.approval === "Approved") {
                approvalElement.classList.add("bg-success", "bg-opacity-10", "text-success");
            } else if (data.approval === "Pending") {
                approvalElement.classList.add("bg-warning", "bg-opacity-10", "text-warning");
            } else if (data.approval === "Rejected") {
                approvalElement.classList.add("bg-danger", "bg-opacity-10", "text-danger");
            }
            
            // Hide loader and show content
            document.getElementById('syllabusLoader').classList.add('d-none');
            document.getElementById('syllabusDetails').classList.remove('d-none');
        })
        .catch(error => {
            console.error("Error fetching syllabus details:", error);
            // Show error message
            document.getElementById('syllabusLoader').classList.add('d-none');
            document.getElementById('syllabusError').classList.remove('d-none');
            document.getElementById('syllabusError').textContent = "Error: " + error.message;
        });
}

// Helper function to format text with paragraphs - with improved error handling
function formatText(text) {
    if (!text) return "No information available";
    
    try {
        // Remove extra quotes that might be present due to JSON serialization
        if (text.startsWith('"') && text.endsWith('"')) {
            text = text.substring(1, text.length - 1);
        }
        
        return text.split('\\n')
            .filter(line => line.trim() !== '')
            .map(line => `<p class="mb-2">${line}</p>`)
            .join('');
    } catch (error) {
        console.error("Error formatting text:", error);
        return "Error displaying content";
    }
}
    </script>
 
<div class="modal fade" id="syllabusViewModal" tabindex="-1" aria-labelledby="syllabusViewModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title" id="syllabusViewModalLabel">
                    <i class="fas fa-file-alt me-2"></i>Syllabus Details
                </h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- Loader -->
                <div class="text-center py-4 d-none" id="syllabusLoader">
                    <div class="spinner-border text-primary" role="status">
                        <span class="visually-hidden">Loading...</span>
                    </div>
                    <p class="mt-2">Loading syllabus details...</p>
                </div>
                
                <!-- Error Message -->
                <div class="alert alert-danger d-none" id="syllabusError" role="alert">
                    <i class="fas fa-exclamation-triangle me-2"></i>
                    Failed to load syllabus details. Please try again later.
                </div>
                
                <!-- Syllabus Details Content -->
                <div id="syllabusDetails">
                    <div class="row mb-4">
                        <div class="col-md-6">
                            <div class="card h-100">
                                <div class="card-header bg-light">
                                    <i class="fas fa-info-circle me-2 text-primary"></i>Basic Information
                                </div>
                                <div class="card-body">
                                    <div class="mb-3">
                                        <label class="fw-bold">Syllabus ID:</label>
                                        <div id="viewSyllabusId" class="bg-light p-2 rounded"></div>
                                    </div>
                                    <div class="mb-3">
                                        <label class="fw-bold">Subject ID:</label>
                                        <div id="viewSubId" class="bg-light p-2 rounded"></div>
                                    </div>
                                    <div class="mb-3">
                                        <label class="fw-bold">Course Module ID:</label>
                                        <div id="viewCmId" class="bg-light p-2 rounded"></div>
                                    </div>
                                    <div class="mb-3">
                                        <label class="fw-bold">Date:</label>
                                        <div id="viewDate" class="bg-light p-2 rounded"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card h-100">
                                <div class="card-header bg-light">
                                    <i class="fas fa-tasks me-2 text-primary"></i>Details
                                </div>
                                <div class="card-body">
                                    <div class="mb-3">
                                        <label class="fw-bold">Duration:</label>
                                        <div id="viewDuration" class="bg-light p-2 rounded"></div>
                                    </div>
                                    <div class="mb-3">
                                        <label class="fw-bold">Approval Status:</label>
                                        <div id="viewApproval" class="p-2 rounded"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-12">
                            <div class="card mb-4">
                                <div class="card-header bg-light">
                                    <i class="fas fa-align-left me-2 text-primary"></i>Description
                                </div>
                                <div class="card-body">
                                    <div id="viewDescription" class="bg-light p-3 rounded"></div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header bg-light">
                                    <i class="fas fa-bullseye me-2 text-primary"></i>Learning Objectives
                                </div>
                                <div class="card-body">
                                    <div id="viewObjectives" class="bg-light p-3 rounded"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div class="d-flex justify-content-between w-100">
                    <div>
                        <a href="#" id="syllabusDownloadLink" class="btn btn-primary">
                            <i class="fas fa-download me-2"></i>Download PDF
                        </a>
                    </div>
                    <div>
                        <a href="#" id="syllabusEditLink" class="btn btn-info me-2">
                            <i class="fas fa-edit me-1"></i>Edit
                        </a>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script>


    // Confirm delete operation
    function confirmDelete(id) {
        if (confirm("Are you sure you want to delete this syllabus?")) {
            window.location.href = "SyllabusController?action=delete&id=" + id;
        }
    }
    
    // Document ready function
    document.addEventListener('DOMContentLoaded', function() {
        // Check if list is empty and no search has been performed
        const noData = document.querySelector('.no-data');
        const hasSearchParams = window.location.search.includes('action=list');
        
        if (noData && !hasSearchParams) {
            // Auto-load all syllabuses if no search performed yet
            window.location.href = "SyllabusController?action=list";
        }
        
        // Tooltips initialization
        const tooltipTriggerList = [].slice.call(document.querySelectorAll('[title]'));
        tooltipTriggerList.map(function (tooltipTriggerEl) {
            return new bootstrap.Tooltip(tooltipTriggerEl);
        });
        
        // Add hover effect to table rows
        const tableRows = document.querySelectorAll('tbody tr');
        tableRows.forEach(row => {
            row.addEventListener('mouseenter', () => {
                row.classList.add('animate__animated', 'animate__pulse');
            });
            row.addEventListener('mouseleave', () => {
                row.classList.remove('animate__animated', 'animate__pulse');
            });
        });
    });
</script>
</body>
</html>