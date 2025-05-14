<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Admin Dashboard</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap CSS & Icons -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

  <!-- Chart.js -->
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

  <style>
    body {
      background-color: #f8f9fa;
      background-image: url('images/admin1.jpg'); /* Add your background image URL here */
      background-size: cover;
      background-position: center;
    }

    .sidebar {
      height: 100vh;
      width: 220px;
      background-color: #fff;
      padding-top: 9rem; /* Increased top padding to move content below toggle */
      border-right: 1px solid #dee2e6;
      position: fixed;
      left: 0;
      top: 0;
      transition: transform 0.3s ease;
      z-index: 1000;
    }

    .sidebar a {
      text-decoration: none;
      color: #495057;
      font-weight: 500;
      display: block;
      padding: 0.75rem 1rem;
      border-radius: 0.375rem;
    }

    .sidebar a:hover {
      background-color: #f1f3f5;
    }

    .sidebar.collapsed {
      transform: translateX(-100%);
    }

    .main-content {
      margin-left: 220px;
      padding: 2rem;
      transition: margin-left 0.3s ease;
    }

    .main-content.full {
      margin-left: 0;
    }

    .toggle-btn {
      position: fixed;
      top: 75px;
      left: 15px;
      z-index: 1101; /* Higher than sidebar */
      font-size: 1.5rem;
      cursor: pointer;
      background-color: #fff;
      padding: 5px 10px;
      border-radius: 5px;
      box-shadow: 0 0 5px rgba(0,0,0,0.1);
    }

    .card {
      border-radius: 10px;
      margin-top: 20px;
    }

    .card-body {
      padding: 1.5rem;
    }
    
    /* Animation on page load */
@keyframes fadeInUp {
  	from {
    	opacity: 0;
    	transform: translateY(20px);
  	}
  	to {
    	opacity: 1;
    	transform: translateY(0);
  	}
}

	.animated-card {
  		animation: fadeInUp 0.8s ease-in-out;
	}

	/* Hover effect on icons */
	.icon-hover:hover {
	  transform: scale(1.2);
	  transition: transform 0.3s ease;
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

  </style>
</head>
<body>
<!--nav bar -->
	<nav class="navbar navbar-expand-lg bg-body-tertiary" >
		  <div class="container-fluid">
		        <a class="navbar-brand" href="CountServlet">
     				 <img src="images/LogoResized.png" alt="LOGO" width="136" height="122"> 
     		    </a>

		    <div class="collapse navbar-collapse" id="navbarSupportedContent">
		    
		      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
		        
		        
		        <li class="nav-item" style = "margin-left : 130px">
		          <a class="nav-link" href="admin.jsp">Home</a>
		        </li>
		        
		        <li class="nav-item">
		          <a class="nav-link" href="STservlet">Students</a>
		        </li>
		        
		        <li class="nav-item">
		          <a class="nav-link" href="TeacherServlet">Teachers</a>
		        </li>
		        
		        <li class="nav-item">
		          <a class="nav-link" href="AdminServlet">Administration</a>
		        </li>
		        
		        
            
		        
		      </ul>
		    
		    <div style = "margin-top : 10px" onclick = "location.href='CountServlet'"  class = "logOutDiv">
		
					<img class ="profile-pic" src = "images/notifications.png">
		      
		      </div>
		      
		      
		      <div   onclick = "location.href='home.jsp'"  class = "logOutDiv">
					<img class ="logOutIcon" src = "images/logout.gif">
		      
		      </div>
		      
	
		    </div>
		  </div>
	</nav>
<!-- Sidebar -->
<div id="sidebar" class="sidebar">
  <h4 class="px-3">Menu</h4>
  <a href="CountServlet">Admin Dashboard</a>
  <a href="#">General Settings</a>
  <a href="#">Classes</a>
  <a href="#">Subjects</a>
  <a href="STservlet">Manage Students</a>
  <a href="TeacherServlet">Manage Teachers</a>
  <a href="CMServlet">Manage CR Managers</a>
</div>

<!-- Toggle Button -->
<div class="toggle-btn text-dark">
  <i class="bi bi-list" id="menuToggle"></i>
</div>

<!-- Main Content -->
<div id="mainContent" class="main-content">
  <br><br><h2> Welcome</h2>
  <p class="text-muted">Here's an overview of our school system activities.</p>

  <!-- Stats Cards -->
<div class="row mb-4">
  <div class="col-md-3 animated-card">
    <div class="card text-white bg-primary">
      <div class="card-body">
        <div class="d-flex align-items-center">
          <i class="bi bi-people-fill fs-1 me-3 icon-hover" onclick="window.location.href='STservlet'"></i>
          <div>
            <h5 class="card-title">Total Students</h5>
            <p class="card-text"><b>${totalStudents}</b> Students are Currently Studying</p>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="col-md-3 animated-card">
    <div class="card text-white bg-success">
      <div class="card-body">
        <div class="d-flex align-items-center">
          <i class="bi bi-person-workspace fs-1 me-3 icon-hover" onclick="window.location.href='TeacherServlet'"></i>
          <div>
            <h5 class="card-title">Teachers</h5>
            <p class="card-text"><b>${totalteachers}</b> Overall</p>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="col-md-3 animated-card">
    <div class="card text-white bg-danger">
      <div class="card-body">
        <div class="d-flex align-items-center">
          <i class="bi bi-shield-lock-fill fs-1 me-3 icon-hover" onclick="window.location.href='AdminServlet'"></i>
          <div>
            <h5 class="card-title">Administrators</h5>
            <p class="card-text"><b>${totaladmins}</b> Are Currently Working</p>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="col-md-3 animated-card">
    <div class="card text-white bg-info">
      <div class="card-body">
        <div class="d-flex align-items-center">
          <i class="bi bi-journal-bookmark-fill fs-1 me-3 icon-hover" onclick="window.location.href='CMServlet'"></i>
          <div>
            <h5 class="card-title">Curriculum Manager</h5>
            <p class="card-text"><b>${totalcm}</b> Are Currently Working</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>


  <!-- Graph Section (Replaces Admin Info Section) -->
  <div class="card shadow-sm">
    <div class="card-body">
      <h5 class="card-title">School DataBase Overview</h5>
      <canvas id="overviewChart"></canvas>
    </div>
  </div>

</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
  const sidebar = document.getElementById('sidebar');
  const mainContent = document.getElementById('mainContent');
  const menuToggle = document.getElementById('menuToggle');

  menuToggle.addEventListener('click', () => {
    sidebar.classList.toggle('collapsed');
    mainContent.classList.toggle('full');
  });

  // Chart.js Example
  const ctx = document.getElementById('overviewChart').getContext('2d');
  const overviewChart = new Chart(ctx, {
    type: 'bar', // Can change to 'pie', 'line', etc.
    data: {
      labels: ['Students', 'Teachers', 'Admins', 'Curriculum Managers'],
      datasets: [{
        label: 'Total Staff & Students',
        data: [
          ${totalStudents}, 
          ${totalteachers}, 
          ${totaladmins}, 
          ${totalcm}
        ], // Dynamic data from your server-side variables
        backgroundColor: ['#007bff', '#28a745', '#dc3545', '#17a2b8'],
        borderColor: ['#007bff', '#28a745', '#dc3545', '#17a2b8'],
        borderWidth: 1
      }]
    },
    options: {
      responsive: true,
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  });
</script>

</body>
</html>
