<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Syllabus Management</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        :root {
            --primary-color: #4e73df;
            --secondary-color: #f8f9fc;
            --accent-color: #4e73df;
            --text-primary: #5a5c69;
            --text-secondary: #858796;
        }
        
        body {
            font-family: 'Nunito', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            background-color: #f8f9fc;
            color: var(--text-primary);
        }
        
        .page-header {
            background: linear-gradient(135deg, #4e73df 0%, #224abe 100%);
            color: white;
            padding: 2rem 0;
            margin-bottom: 2rem;
            border-radius: 0 0 10px 10px;
            box-shadow: 0 4px 20px rgba(78, 115, 223, 0.1);
        }
        
        .form-container {
            max-width: 900px;
            margin: 0 auto;
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15);
            padding: 2rem;
            margin-bottom: 2rem;
            position: relative;
            top: -30px;
        }
        
        .form-section {
            border-bottom: 1px solid #e3e6f0;
            padding-bottom: 1.5rem;
            margin-bottom: 1.5rem;
        }
        
        .form-section:last-child {
            border-bottom: none;
        }
        
        .form-section-title {
            color: var(--primary-color);
            font-weight: 700;
            margin-bottom: 1.5rem;
            position: relative;
            padding-left: 15px;
        }
        
        .form-section-title::before {
            content: "";
            position: absolute;
            left: 0;
            top: 0;
            height: 100%;
            width: 4px;
            background-color: var(--primary-color);
            border-radius: 2px;
        }
        
        .form-group label {
            font-weight: 600;
            color: var(--text-primary);
            margin-bottom: 0.5rem;
        }
        
        .form-control {
            border-radius: 10px;
            border: 1px solid #d1d3e2;
            padding: 0.75rem 1rem;
            font-size: 0.9rem;
            transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
        }
        
        .form-control:focus {
            border-color: #bac8f3;
            box-shadow: 0 0 0 0.2rem rgba(78, 115, 223, 0.25);
        }
        
        textarea.form-control {
            min-height: 100px;
        }
        
        .custom-file-label {
            border-radius: 10px;
            height: calc(1.5em + 1.5rem + 2px);
            padding: 0.75rem 1rem;
        }
        
        .custom-file-label::after {
            height: calc(1.5em + 1.5rem);
            padding: 0.75rem 1rem;
            background-color: var(--primary-color);
            color: white;
            border-radius: 0 10px 10px 0;
        }
        
        .btn-primary {
            background: linear-gradient(135deg, #4e73df 0%, #224abe 100%);
            border: none;
            border-radius: 10px;
            padding: 0.75rem 1.5rem;
            font-weight: 600;
            transition: all 0.2s;
        }
        
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(78, 115, 223, 0.4);
        }
        
        .btn-secondary {
            background-color: #eaecf4;
            border: none;
            color: var(--text-secondary);
            border-radius: 10px;
            padding: 0.75rem 1.5rem;
            font-weight: 600;
            transition: all 0.2s;
        }
        
        .btn-secondary:hover {
            background-color: #dde2f1;
            color: var(--text-primary);
        }
        
        .buttons-container {
            display: flex;
            justify-content: space-between;
            margin-top: 2rem;
        }
        
        .status-indicator {
            display: inline-block;
            width: 12px;
            height: 12px;
            border-radius: 50%;
            margin-right: 5px;
        }
        
        .status-pending { background-color: #f6c23e; }
        .status-approved { background-color: #1cc88a; }
        .status-rejected { background-color: #e74a3b; }
        
        /* Fixed styling for the approval status dropdown */
        .select-status {
            position: relative;
            width: 100%;
        }
        
        .select-status select {
            width: 100%;
            padding-left: 30px;
            height: calc(1.5em + 1.5rem + 2px);
            font-size: 0.9rem;
            padding: 0.75rem 1rem 0.75rem 30px;
            appearance: menulist; /* Shows the dropdown arrow */
        }
        
        .select-status::before {
            content: "";
            position: absolute;
            top: 50%;
            left: 15px;
            transform: translateY(-50%);
            width: 12px;
            height: 12px;
            border-radius: 50%;
            z-index: 1;
        }
        
        .select-status.status-Pending::before { background-color: #f6c23e; }
        .select-status.status-Approved::before { background-color: #1cc88a; }
        .select-status.status-Rejected::before { background-color: #e74a3b; }
        
        /* File upload styling */
        .file-upload-wrapper {
            position: relative;
            margin-bottom: 1rem;
        }
        
        .file-upload-input {
            position: relative;
            z-index: 2;
            width: 100%;
            height: calc(1.5em + 1.5rem + 2px);
            margin: 0;
            opacity: 0;
        }
        
        .file-upload-label {
            position: absolute;
            top: 0;
            right: 0;
            left: 0;
            z-index: 1;
            height: calc(1.5em + 1.5rem + 2px);
            padding: 0.75rem 1rem;
            font-weight: 400;
            line-height: 1.5;
            color: var(--text-secondary);
            background-color: #fff;
            border: 1px solid #d1d3e2;
            border-radius: 10px;
            display: flex;
            align-items: center;
        }
        
        .file-upload-button {
            position: absolute;
            top: 0;
            right: 0;
            bottom: 0;
            z-index: 3;
            display: block;
            height: calc(1.5em + 1.5rem + 2px);
            padding: 0.75rem 1rem;
            line-height: 1.5;
            color: #fff;
            background: linear-gradient(135deg, #4e73df 0%, #224abe 100%);
            border-radius: 0 10px 10px 0;
            cursor: pointer;
        }
        
        .info-icon {
            color: var(--primary-color);
            margin-left: 0.5rem;
            cursor: pointer;
        }
        
        /* Tooltip */
        .tooltip-inner {
            background-color: var(--primary-color);
            max-width: 300px;
        }
        
        .bs-tooltip-auto[x-placement^=top] .arrow::before, 
        .bs-tooltip-top .arrow::before {
            border-top-color: var(--primary-color);
        }
        
        /* Date input icon */
        .date-input-wrapper {
            position: relative;
        }
        
        .date-input-wrapper i {
            position: absolute;
            top: 50%;
            right: 15px;
            transform: translateY(-50%);
            color: var(--text-secondary);
            pointer-events: none;
        }
        
        /* Responsive adjustments */
        @media (max-width: 768px) {
            .form-row {
                flex-direction: column;
            }
            
            .form-row > .col,
            .form-row > [class*="col-"] {
                padding-right: 15px;
                padding-left: 15px;
            }
            
            .buttons-container {
                flex-direction: column-reverse;
                gap: 1rem;
            }
            
            .buttons-container .btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="page-header">
        <div class="container text-center">
            <h1 class="h2 mb-0">
                <i class="fas fa-book-open mr-2"></i>
                <c:if test="${syllabus != null}">Edit Syllabus</c:if>
                <c:if test="${syllabus == null}">Create New Syllabus</c:if>
            </h1>
            <p class="mt-2 mb-0 text-white-50">Manage course curriculum and learning objectives</p>
        </div>
    </div>

    <div class="container">
        <div class="form-container">
            <form action="SyllabusController" method="post" enctype="multipart/form-data">
                <input type="hidden" name="action" value="${syllabus != null ? 'update' : 'insert'}">
                
                <c:if test="${syllabus != null}">
                    <input type="hidden" name="id" value="<c:out value='${syllabus.syllabusId}' />">
                </c:if>
                
                <div class="form-section">
                    <h4 class="form-section-title">Basic Information</h4>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="subId">
                                Subject ID
                                <i class="fas fa-info-circle info-icon" data-toggle="tooltip" 
                                   title="Enter the unique subject identifier from the curriculum database"></i>
                            </label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-light border-right-0">
                                        <i class="fas fa-fingerprint"></i>
                                    </span>
                                </div>
                                <input type="text" class="form-control border-left-0" id="subId" name="subId" 
                                       placeholder="e.g., CS101" value="<c:out value='${syllabus.subId}' />" required>
                            </div>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="cmId">
                                Curriculum Manager ID
                                <i class="fas fa-info-circle info-icon" data-toggle="tooltip" 
                                   title="Enter the ID of the curriculum manager responsible for this syllabus"></i>
                            </label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-light border-right-0">
                                        <i class="fas fa-user-tie"></i>
                                    </span>
                                </div>
                                <input type="text" class="form-control border-left-0" id="cmId" name="cmId" 
                                       placeholder="e.g., CM123" value="<c:out value='${syllabus.cmId}' />" required>
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="date">
                                Implementation Date
                                <i class="fas fa-info-circle info-icon" data-toggle="tooltip" 
                                   title="The date when this syllabus will be implemented"></i>
                            </label>
                            <div class="date-input-wrapper">
                                <input type="date" class="form-control" id="date" name="date" 
                                       value="<c:out value='${syllabus.syllabusDate}' />" required>
                                <i class="fas fa-calendar-alt"></i>
                            </div>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="duration">
                                Duration
                                <i class="fas fa-info-circle info-icon" data-toggle="tooltip" 
                                   title="Enter the course duration in weeks"></i>
                            </label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-light border-right-0">
                                        <i class="fas fa-clock"></i>
                                    </span>
                                </div>
                                <input type="number" class="form-control border-left-0" id="duration" name="duration" 
                                       placeholder="e.g., 16" value="<c:out value='${syllabus.syllabusDuration}' />" 
                                       min="1" step="1" required>
                                <div class="input-group-append">
                                    <span class="input-group-text bg-light border-left-0">weeks</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="form-section">
                    <h4 class="form-section-title">Course Content</h4>
                    <div class="form-group">
                        <label for="description">
                            Description
                            <i class="fas fa-info-circle info-icon" data-toggle="tooltip" 
                               title="Provide a comprehensive description of the course"></i>
                        </label>
                        <textarea class="form-control" id="description" name="description" 
                                  rows="4" placeholder="Enter a detailed description of the course content and scope..." 
                                  required><c:out value='${syllabus.syllabusDescription}' /></textarea>
                    </div>
                    
                    <div class="form-group">
                        <label for="objectives">
                            Learning Objectives
                            <i class="fas fa-info-circle info-icon" data-toggle="tooltip" 
                               title="List all measurable objectives students should achieve by the end of the course"></i>
                        </label>
                        <textarea class="form-control" id="objectives" name="objectives" 
                                  rows="6" placeholder="List the specific learning outcomes and objectives..." 
                                  required><c:out value='${syllabus.syllabusObjectives}' /></textarea>
                        <small class="form-text text-muted">Use clear, action-oriented language for each objective. Each objective should be measurable.</small>
                    </div>
                </div>
                
                <div class="form-section">
                    <h4 class="form-section-title">Documentation & Approval</h4>
                    <div class="form-group">
                        <label for="syllabusFile">Syllabus Document</label>
                        <div class="file-upload-wrapper">
                            <input type="file" class="file-upload-input" id="syllabusFile" name="syllabusFile" 
                                   accept="application/pdf" ${syllabus == null ? '' : ''}>
                            <label class="file-upload-label" for="syllabusFile">
                                <span class="file-upload-text">${syllabus != null ? 'Current file: syllabus.pdf' : 'Choose file...'}</span>
                            </label>
                            <span class="file-upload-button">
                                <i class="fas fa-upload mr-1"></i> Browse
                            </span>
                        </div>
                        <small class="form-text text-muted">
                            <i class="fas fa-exclamation-circle mr-1"></i>
                            ${syllabus != null ? 'Leave empty to keep the current file.' : 'Please upload a PDF file (max 16MB).'}
                        </small>
                    </div>
                    
                    <div class="form-group">
                        <label for="approval">
                            Approval Status
                            <i class="fas fa-info-circle info-icon" data-toggle="tooltip" 
                               title="Current approval status of this syllabus"></i>
                        </label>
                        <div class="select-status status-${syllabus != null ? syllabus.syllabusApproval : 'Pending'}">
                            <select class="form-control" id="approval" name="approval" required>
                                <option value="Pending" ${syllabus.syllabusApproval == 'Pending' ? 'selected' : ''}>Pending</option>
                                <option value="Approved" ${syllabus.syllabusApproval == 'Approved' ? 'selected' : ''}>Approved</option>
                                <option value="Rejected" ${syllabus.syllabusApproval == 'Rejected' ? 'selected' : ''}>Rejected</option>
                            </select>
                        </div>
                    </div>
                </div>
                
                <div class="buttons-container">
                    <a href="SyllabusController?action=list" class="btn btn-secondary">
                        <i class="fas fa-arrow-left mr-1"></i> Back to List
                    </a>
                    <button type="submit" class="btn btn-primary">
                        <i class="fas ${syllabus != null ? 'fa-save' : 'fa-plus-circle'} mr-1"></i>
                        <c:if test="${syllabus != null}">
                            Update Syllabus
                        </c:if>
                        <c:if test="${syllabus == null}">
                            Create Syllabus
                        </c:if>
                    </button>
                </div>
            </form>
        </div>
    </div>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.0/js/bootstrap.min.js"></script>
    <script>
        $(function () {
            // Initialize tooltips
            $('[data-toggle="tooltip"]').tooltip();
            
            // Custom file input handling
            $('#syllabusFile').on('change', function() {
                var fileName = $(this).val().split('\\').pop();
                if(fileName) {
                    $('.file-upload-text').text(fileName);
                } else {
                    $('.file-upload-text').text('${syllabus != null ? "Current file: syllabus.pdf" : "Choose file..."}');
                }
            });
            
            // Update status indicator color when select changes
            $('#approval').on('change', function() {
                const selectedValue = $(this).val();
                const parentDiv = $(this).parent();
                
                parentDiv.removeClass('status-Pending status-Approved status-Rejected');
                parentDiv.addClass('status-' + selectedValue);
            });
        });
    </script>
</body>
</html>