<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rate Syllabus</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <!-- Add SweetAlert2 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
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

        .syllabus-info {
            background-color: #fff;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 25px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }

        .syllabus-info h3 {
            margin-bottom: 15px;
            font-weight: 600;
            color: #333;
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

        .rating-stars input[type="radio"] {
            display: none;
        }

        .rating-stars label {
            float: right;
            color: #ddd;
            font-size: 30px;
            padding: 0 5px;
            cursor: pointer;
        }

        .rating-stars input[type="radio"]:checked ~ label,
        .rating-stars label:hover ~ label,
        .rating-stars label:hover {
            color: #ffc107;
            transition: all 0.2s;
        }

        .rating-stars {
            direction: rtl;
            text-align: left;
        }

        .form-group.required .control-label:after {
            content: "*";
            color: red;
            margin-left: 4px;
        }
    </style>
</head>
<body>
    <div class="container content-container">
        <!-- Page Header -->
        <div class="page-header d-flex justify-content-between align-items-center">
            <div>
                <h1>Rate Syllabus</h1>
                <p>Share your feedback about the syllabus</p>
            </div>
            <a href="RatingController?action=summary" class="btn btn-outline-primary">
                <i class="fas fa-arrow-left mr-2"></i> Back to Ratings
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

        <!-- Syllabus Information -->
        <div class="syllabus-info">
            <h3>Syllabus Information</h3>
            <div class="row">
                <div class="col-md-6">
                    <p><strong>Subject ID:</strong> ${syllabus.subId}</p>
                    <p><strong>Title:</strong> ${syllabus.syllabusDescription}</p>
                </div>
                <div class="col-md-6">
                    <p><strong>Department:</strong> <span class="badge badge-department">${syllabus.cmId}</span></p>
                    <p><strong>Semester:</strong> <span class="badge badge-semester">Semester ${syllabus.syllabusDuration}</span></p>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-12">
                    <p><strong>Objectives:</strong> ${syllabus.syllabusObjectives}</p>
                </div>
            </div>
        </div>

        <!-- Rating Form -->
        <div class="card">
            <div class="card-header">
                <i class="fas fa-star mr-2"></i> 
                <c:choose>
                    <c:when test="${not empty existingRating}">Update Your Rating</c:when>
                    <c:otherwise>Add Your Rating</c:otherwise>
                </c:choose>
            </div>
            <div class="card-body">
                <form id="ratingForm" action="RatingController" method="post">
                    <input type="hidden" name="action" value="submitRating">
                    <input type="hidden" name="syllabusId" value="${syllabus.syllabusId}">
                    
                    <div class="form-group required">
                        <label class="control-label">Overall Rating</label>
                        <div class="rating-stars">
                            <input type="radio" id="star5" name="rating" value="5" 
                                <c:if test="${existingRating.ratingValue == 5}">checked</c:if> required>
                            <label for="star5" title="5 stars"><i class="fas fa-star"></i></label>
                            
                            <input type="radio" id="star4" name="rating" value="4" 
                                <c:if test="${existingRating.ratingValue == 4}">checked</c:if> required>
                            <label for="star4" title="4 stars"><i class="fas fa-star"></i></label>
                            
                            <input type="radio" id="star3" name="rating" value="3" 
                                <c:if test="${existingRating.ratingValue == 3}">checked</c:if> required>
                            <label for="star3" title="3 stars"><i class="fas fa-star"></i></label>
                            
                            <input type="radio" id="star2" name="rating" value="2" 
                                <c:if test="${existingRating.ratingValue == 2}">checked</c:if> required>
                            <label for="star2" title="2 stars"><i class="fas fa-star"></i></label>
                            
                            <input type="radio" id="star1" name="rating" value="1" 
                                <c:if test="${existingRating.ratingValue == 1}">checked</c:if> required>
                            <label for="star1" title="1 star"><i class="fas fa-star"></i></label>
                        </div>
                        <div class="text-muted small mt-2">Please select a rating from 1 to 5 stars</div>
                    </div>
                    
                    <div class="form-group mt-4">
                        <label for="comment">Comments (Optional)</label>
                        <textarea class="form-control" id="comment" name="comment" rows="4" 
                            placeholder="Share your thoughts about this syllabus...">${existingRating.comment}</textarea>
                    </div>
                    
                    <div class="form-group mt-4 text-right">
                        <a href="RatingController?action=summary" class="btn btn-outline-secondary mr-2">
                            Cancel
                        </a>
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-save mr-1"></i> 
                            <c:choose>
                                <c:when test="${not empty existingRating}">Update Rating</c:when>
                                <c:otherwise>Submit Rating</c:otherwise>
                            </c:choose>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- Add SweetAlert2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
    
    <script>
        $(document).ready(function() {
            // Form validation and AJAX submission
            $('#ratingForm').on('submit', function(e) {
                e.preventDefault(); // Prevent the default form submission
                
                const rating = $('input[name="rating"]:checked').val();
                
                if (!rating) {
                    Swal.fire({
                        title: 'Error!',
                        text: 'Please select a rating before submitting.',
                        icon: 'error',
                        confirmButtonText: 'OK'
                    });
                    return false;
                }
                
                // Get form data
                const formData = $(this).serialize();
                
                // Submit the form using AJAX
                $.ajax({
                    type: 'POST',
                    url: 'RatingController',
                    data: formData,
                    dataType: 'json',
                    success: function(response) {
                        // Show success message using SweetAlert2
                        Swal.fire({
                            title: 'Success!',
                            text: response.message,
                            icon: 'success',
                            confirmButtonText: 'OK'
                        }).then((result) => {
                            // Redirect after the alert is closed
                            window.location.href = response.redirectUrl;
                        });
                    },
                    error: function(xhr, status, error) {
                        let errorMessage = 'An error occurred while submitting your rating.';
                        
                        try {
                            const response = JSON.parse(xhr.responseText);
                            if (response && response.message) {
                                errorMessage = response.message;
                            }
                        } catch(e) {
                            console.error("Error parsing response: ", e);
                        }
                        
                        Swal.fire({
                            title: 'Error!',
                            text: errorMessage,
                            icon: 'error',
                            confirmButtonText: 'OK'
                        });
                    }
                });
            });
        });
    </script>
</body>
</html>