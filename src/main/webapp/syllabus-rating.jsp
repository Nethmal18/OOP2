<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Syllabus Ratings Summary</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        :root {
            --primary: #4361ee;
            --secondary: #3f37c9;
            --success: #4cc9f0;
            --warning: #f72585;
            --light: #f8f9fa;
            --dark: #212529;
        }

        body {
            background-color: #f5f7fb;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .content-container {
            padding: 2rem 1.5rem;
        }

        .page-header {
            padding: 1.5rem 0;
            margin-bottom: 2rem;
        }

        .page-header h1 {
            font-weight: 700;
            color: var(--dark);
            margin-bottom: 0.5rem;
        }

        .page-header p {
            color: #6c757d;
            font-size: 1.1rem;
        }

        .card {
            border: none;
            border-radius: 12px;
            overflow: hidden;
            transition: transform 0.3s, box-shadow 0.3s;
            margin-bottom: 25px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
        }

        .card-header {
            font-weight: 600;
            font-size: 1.1rem;
            padding: 1rem 1.5rem;
            border-bottom: none;
            background: linear-gradient(45deg, #ffbe0b, #fb5607);
            color: white;
        }

        .card-body {
            padding: 1.75rem;
        }

        .table {
            margin-bottom: 0;
        }

        .table th {
            font-weight: 600;
            border-top: none;
        }

        .rating-stars {
            color: #ffc107;
        }

        .rating-count {
            font-size: 0.9rem;
            color: #6c757d;
        }

        .btn {
            padding: 0.375rem 1rem;
            border-radius: 50px;
            font-weight: 500;
            transition: all 0.3s;
        }

        .btn-primary {
            background-color: var(--primary);
            border-color: var(--primary);
            box-shadow: 0 4px 10px rgba(67, 97, 238, 0.3);
        }

        .btn-primary:hover {
            background-color: var(--secondary);
            border-color: var(--secondary);
            box-shadow: 0 6px 15px rgba(67, 97, 238, 0.4);
        }

        .alert {
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
        }

        .no-ratings {
            text-align: center;
            padding: 3rem 1rem;
            color: #6c757d;
        }

        .no-ratings i {
            font-size: 3rem;
            color: #dee2e6;
            margin-bottom: 1rem;
        }

        .syllabus-title {
            font-weight: 600;
        }

        .badge-department {
            background-color: #8338ec;
            color: white;
            font-weight: 500;
        }

        .badge-semester {
            background-color: #3a86ff;
            color: white;
            font-weight: 500;
        }
    </style>
</head>
<body>
    <div class="container content-container">
        <!-- Page Header -->
        <div class="page-header d-flex justify-content-between align-items-center">
            <div>
                <h1>Syllabus Ratings Summary</h1>
                <p>Overview of ratings for all syllabuses in the system</p>
            </div>
            <a href="curriculum-dashboard.jsp" class="btn btn-outline-primary">
                <i class="fas fa-arrow-left mr-2"></i> Back to Dashboard
            </a>
        </div>

        <!-- Flash Message -->
        <c:if test="${not empty sessionScope.message}">
            <div class="alert alert-${sessionScope.messageType} alert-dismissible fade show" role="alert">
                <i class="fas fa-info-circle mr-2"></i> ${sessionScope.message}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <c:remove var="message" scope="session" />
            <c:remove var="messageType" scope="session" />
        </c:if>

        <!-- Rate a New Syllabus Card -->
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-book mr-2"></i> Rate a New Syllabus
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-8">
                        <p>Select a syllabus to rate from the list below:</p>
                        <div class="form-group">
                            <select id="syllabusSelect" class="form-control">
                                <option value="">-- Select a Syllabus --</option>
                                <c:forEach items="${syllabusList}" var="syllabus">
                                    <option value="${syllabus.syllabusId}">${syllabus.subId} - ${syllabus.syllabusDescription}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-4 text-right align-self-end">
                        <button id="rateButton" class="btn btn-primary" disabled>
                            <i class="fas fa-star mr-1"></i> Rate Selected Syllabus
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- All Syllabuses Table -->
        <div class="card">
            <div class="card-header">
                <i class="fas fa-book mr-2"></i> All Syllabuses
            </div>
            <div class="card-body">
                <c:choose>
                    <c:when test="${empty syllabusList}">
                        <div class="no-ratings">
                            <i class="fas fa-book-open d-block"></i>
                            <h4>No syllabuses available</h4>
                            <p>There are no syllabuses in the system yet.</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Subject ID</th>
                                        <th>Title</th>
                                        <th>Department</th>
                                        <th>Semester</th>
                                        <th>Average Rating</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${syllabusList}" var="syllabus">
                                        <tr>
                                            <td><strong>${syllabus.subId}</strong></td>
                                            <td class="syllabus-title">${syllabus.syllabusDescription}</td>
                                            <td><span class="badge badge-department">${syllabus.cmId}</span></td>
                                            <td><span class="badge badge-semester">Semester ${syllabus.syllabusDuration}</span></td>
                                            <td>
                                                <div class="rating-stars">
                                                    <c:set var="avgRating" value="0" />
                                                    <c:set var="count" value="0" />
                                                    
                                                    <!-- Find the corresponding rating data for this syllabus -->
                                                    <c:forEach items="${ratingSummary}" var="rating">
                                                        <c:if test="${rating.syllabusId == syllabus.syllabusId}">
                                                            <c:set var="avgRating" value="${rating.averageRating}" />
                                                            <c:set var="count" value="${rating.ratingCount}" />
                                                        </c:if>
                                                    </c:forEach>
                                                    
                                                    <c:choose>
                                                        <c:when test="${avgRating == 0}">
                                                            <span class="text-muted">No ratings</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:forEach begin="1" end="5" var="star">
                                                                <c:choose>
                                                                    <c:when test="${star <= Math.floor(avgRating)}">
                                                                        <i class="fas fa-star"></i>
                                                                    </c:when>
                                                                    <c:when test="${star == Math.ceil(avgRating) && avgRating % 1 != 0}">
                                                                        <i class="fas fa-star-half-alt"></i>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <i class="far fa-star"></i>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </c:forEach>
                                                            <span class="ml-2">
                                                                <fmt:formatNumber value="${avgRating}" pattern="#.#" />
                                                            </span>
                                                            <span class="rating-count">(${count})</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </td>
                                            <td>
                                                <!-- Removed "View Ratings" button -->
                                                <a href="RatingController?action=add&syllabusId=${syllabus.syllabusId}" class="btn btn-sm btn-success">
                                                    <i class="fas fa-star mr-1"></i> Update Rating
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

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- JavaScript for redirection and form interaction -->
    <script>
        // Enable/disable button and set redirect on selection
        $(document).ready(function() {
            // Check if this page was loaded directly
            if (window.location.pathname.indexOf('syllabus-rating.jsp') > -1 && 
                window.location.search === '') {
                window.location.href = 'RatingController?action=summary';
            }
            
            $('#syllabusSelect').on('change', function() {
                var selectedSyllabusId = $(this).val();
                if (selectedSyllabusId) {
                    $('#rateButton').prop('disabled', false);
                    $('#rateButton').off('click').on('click', function() {
                        window.location.href = 'RatingController?action=add&syllabusId=' + selectedSyllabusId;
                    });
                } else {
                    $('#rateButton').prop('disabled', true);
                }
            });
        });
    </script>
</body>
</html>