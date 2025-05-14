<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Curriculum Management Dashboard</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" >
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
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
        
        .dashboard-container {
            padding: 2rem 1.5rem;
        }
        
        .dashboard-header {
            padding: 1.5rem 0;
            margin-bottom: 2rem;
            position: relative;
        }
        
        .dashboard-header h1 {
            font-weight: 700;
            color: var(--dark);
            margin-bottom: 0.5rem;
        }
        
        .dashboard-header p {
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
        
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.12);
        }
        
        .card-header {
            font-weight: 600;
            font-size: 1.1rem;
            padding: 1rem 1.5rem;
            border-bottom: none;
        }
        
        .syllabus-card .card-header {
            background: linear-gradient(45deg, var(--primary), var(--secondary));
            color: white;
        }
        
        .create-card .card-header {
            background: linear-gradient(45deg, #36b37e, #00875a);
            color: white;
        }
        
        .ratings-card .card-header {
            background: linear-gradient(45deg, #ffbe0b, #fb5607);
            color: white;
        }
        
        .card-body {
            padding: 1.75rem;
        }
        
        .icon-container {
            height: 80px;
            width: 80px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.25rem;
            border-radius: 50%;
            font-size: 2rem;
        }
        
        .syllabus-card .icon-container {
            background-color: rgba(67, 97, 238, 0.1);
            color: var(--primary);
        }
        
        .create-card .icon-container {
            background-color: rgba(54, 179, 126, 0.1);
            color: #36b37e;
        }
        
        .ratings-card .icon-container {
            background-color: rgba(255, 190, 11, 0.1);
            color: #ffbe0b;
        }
        
        .card-title {
            font-weight: 600;
            margin-bottom: 0.75rem;
        }
        
        .card-text {
            color: #6c757d;
            margin-bottom: 1.5rem;
        }
        
        .btn {
            padding: 0.6rem 1.5rem;
            border-radius: 50px;
            font-weight: 500;
            letter-spacing: 0.5px;
            transition: all 0.3s;
            border: none;
        }
        
        .btn-primary {
            background-color: var(--primary);
            box-shadow: 0 4px 10px rgba(67, 97, 238, 0.3);
        }
        
        .btn-primary:hover {
            background-color: var(--secondary);
            box-shadow: 0 6px 15px rgba(67, 97, 238, 0.4);
        }
        
        .btn-success {
            background-color: #36b37e;
            box-shadow: 0 4px 10px rgba(54, 179, 126, 0.3);
        }
        
        .btn-success:hover {
            background-color: #00875a;
            box-shadow: 0 6px 15px rgba(54, 179, 126, 0.4);
        }
        
        .btn-warning {
            background-color: #ffbe0b;
            color: #212529;
            box-shadow: 0 4px 10px rgba(255, 190, 11, 0.3);
        }
        
        .btn-warning:hover {
            background-color: #fb8500;
            color: white;
            box-shadow: 0 6px 15px rgba(255, 190, 11, 0.4);
        }
        
        .stats-card {
            background: white;
        }
        
        .stats-card .card-header {
            background: linear-gradient(45deg, #8338ec, #3a0ca3);
            color: white;
        }
        
        .stat-item {
            padding: 1.25rem;
            border-radius: 10px;
            background-color: #f8f9fa;
            transition: transform 0.3s;
        }
        
        .stat-item:hover {
            transform: translateY(-5px);
        }
        
        .stat-item h3 {
            font-size: 1.1rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
            color: #495057;
        }
        
        .stat-item h2 {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 0;
        }
        
        .total-syllabuses h2 {
            color: var(--primary);
        }
        
        .approved-syllabuses h2 {
            color: #36b37e;
        }
        
        .pending-syllabuses h2 {
            color: #ffbe0b;
        }
        
        .alert {
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
        }
        
        @media (max-width: 768px) {
            .dashboard-header {
                text-align: center;
            }
        }
        
        /* for the navBar */
	
		
		.nav-item 
		{
			margin-right : 50px;
		}
		
		.nav-item a:hover{
			
			color : royalblue;
		}
		
		.navbar-brand {
		
		  font-size: var(--bs-navbar-brand-font-size);
		  color: var(--bs-navbar-brand-color);
		  text-decoration: none;
		  white-space: nowrap;
		  top: -23px;
		  left: -8px;
		  position:absolute;
		  height : 50px;
		  margin-top : 0px;
		}
		
		.navbar 
		{
			height : 80px !important;
		}
		
		
		.logOutDiv {
		  display: inline-block;
		  margin-right: 0px;
		  transition-duration: 0.5s;
		}
		
		
		.logOutDiv:hover 
		{
			scale : 110%;
			transition-duration: 0.5s;
		}
		
		
		.pfpDiv 
		{
			display : inline-block;
			margin-right: 60px;
		}
		
		
		.logOutIcon 
		{
			width: 70px;
		 	 height: 70px;
		}
		
		.profile-pic {
		  width: 43px;
		  height: 43px;
		  margin-right: 23px;
		}
		
		.profile-pic img {
		            width: 100%;
		            height: 100%;
		 }
		 
		 .bg-body-tertiary {
  --bs-bg-opacity: 1;
  background-color: white !important;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
}
		 
        
    </style>
</head>
<body>


<!--nav bar -->
	<nav class="navbar navbar-expand-lg bg-body-tertiary" >
		  <div class="container-fluid">
		        <a class="navbar-brand" href="curriculum-dashboard.jsp">
     				 <img src="images/LogoResized.png" alt="LOGO" width="136" height="122"> 
     		    </a>

		    <div class="collapse navbar-collapse" id="navbarSupportedContent">
		    
		      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
		        
		        
		        <li class="nav-item" style = "margin-left : 130px">
		          <a class="nav-link" href="SyllabusController">View</a>
		        </li>
		        
		        <li class="nav-item">
		          <a class="nav-link" href="syllabus-form.jsp">Add New</a>
		        </li>
		        
		        <li class="nav-item">
		          <a class="nav-link" href="syllabus-rating-form.jsp">Rating</a>
		        </li>
		        
           
		      </ul>
		
		    <div style = "margin-top : 10px" onclick = "location.href='curriculum-dashboard.jsp'"  class = "logOutDiv">
		
					<img class ="profile-pic" src = "images/notifications.png">
		      
		      </div>
		     
		      
		      <div   onclick = "location.href='home.jsp'"  class = "logOutDiv">
		
					<img class ="logOutIcon" src = "images/logout.gif">
		      
		      </div>
		   
		     
		    </div>
		  </div>
	</nav>  

    <div class="container dashboard-container">
        <div class="dashboard-header">
            <h1 class="display-4">Curriculum Management</h1>
            <p>Manage, create, and review syllabuses in one place</p>
        </div>
        
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
        
        <div class="row">
            <div class="col-md-4">
                <div class="card text-center syllabus-card">
                    <div class="card-header">
                        <i class="fas fa-book-open mr-2"></i> Manage Syllabus
                    </div>
                    <div class="card-body">
                        <div class="icon-container">
                            <i class="fas fa-eye"></i>
                        </div>
                        <h5 class="card-title">View and Manage Syllabus</h5>
                        <p class="card-text">Access, update, and organize all syllabuses in the system with powerful management tools.</p>
                        <a href="SyllabusController?action=list" class="btn btn-primary">
                            <i class="fas fa-list mr-2"></i> Manage Syllabus
                        </a>
                    </div>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="card text-center create-card">
                    <div class="card-header">
                        <i class="fas fa-plus-circle mr-2"></i> Create New
                    </div>
                    <div class="card-body">
                        <div class="icon-container">
                            <i class="fas fa-file-medical"></i>
                        </div>
                        <h5 class="card-title">Add New Syllabus</h5>
                        <p class="card-text">Create a comprehensive new syllabus with detailed information and document uploads.</p>
                        <a href="SyllabusController?action=new" class="btn btn-success">
                            <i class="fas fa-plus mr-2"></i> Create New
                        </a>
                    </div>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="card text-center ratings-card">
                    <div class="card-header">
                        <i class="fas fa-star mr-2"></i> Syllabus Ratings
                    </div>
                    <div class="card-body">
                        <div class="icon-container">
                            <i class="fas fa-star-half-alt"></i>
                        </div>
                        <h5 class="card-title">Ratings and Reviews</h5>
                        <p class="card-text">Analyze feedback and ratings from teachers and administrators for each syllabus.</p>
                        <a href="syllabus-rating.jsp" class="btn btn-warning">
                            <i class="fas fa-chart-bar mr-2"></i> View Ratings
                        </a>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="row mt-4">
            <div class="col-md-12">
                <div class="card stats-card">
                    <div class="card-header">
                        <i class="fas fa-chart-line mr-2"></i> Quick Stats
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="stat-item text-center total-syllabuses">
                                    <i class="fas fa-book mb-3" style="font-size: 2rem; color: var(--primary);"></i>
                                    <h3>Total Syllabuses</h3>
                                    <h2>${totalSyllabuses != null ? totalSyllabuses : '0'}</h2>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="stat-item text-center approved-syllabuses">
                                    <i class="fas fa-check-circle mb-3" style="font-size: 2rem; color: #36b37e;"></i>
                                    <h3>Approved Syllabuses</h3>
                                    <h2>${approvedSyllabuses != null ? approvedSyllabuses : '0'}</h2>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="stat-item text-center pending-syllabuses">
                                    <i class="fas fa-clock mb-3" style="font-size: 2rem; color: #ffbe0b;"></i>
                                    <h3>Pending Approval</h3>
                                    <h2>${pendingSyllabuses != null ? pendingSyllabuses : '0'}</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <!-- Add this script to redirect to the controller if accessed directly -->
    <script>
        // If the page is accessed directly (not through the controller)
        if (!window.location.href.includes('SyllabusController?action=dashboard')) {
            // Check if this page was loaded directly
            if (${empty totalSyllabuses}) {
                // Redirect to the controller
                window.location.href = 'SyllabusController?action=dashboard';
            }
        }
    </script>
</body>
</html>