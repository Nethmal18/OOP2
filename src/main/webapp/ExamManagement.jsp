<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<link rel = "stylesheet" href = "css/ExamManagement.css">
	<title>Exam publication</title>
	<link rel="icon" type="image/png" href="images/faviconIcon.png">
	
	<style>
	
	body, html{
	
	height : 103%;
	width : 100%;
	background-color: white;
	color : black;
	background-image: url('images/Exams.png') ;
	background-repeat: no-repeat;
	background-size:500px 500px;
	background-attachment:scroll; /* Ensures the background image remains fixed */
    background-position: right bottom;
}
	
	
	</style>
	
	
</head>
<body>

<!--nav bar -->
	<nav class="navbar navbar-expand-lg bg-body-tertiary" >
		  <div class="container-fluid">
		        <a class="navbar-brand" href="teacherDashboard.jsp">
     				 <img src="images/LogoResized.png" alt="LOGO" width="136" height="122"> 
     		    </a>

		    <div class="collapse navbar-collapse" id="navbarSupportedContent">
		    
		      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
		        
		        
		        <li class="nav-item" style = "margin-left : 130px">
		          <a class="nav-link" href="teacherDashboard.jsp">Home</a>
		        </li>
		        
		        <li class="nav-item">
		          <a class="nav-link" href="ExamManagement.jsp">Exam</a>
		        </li>
		        
		        <li class="nav-item" >
		          <a class="nav-link" href="#">FAQ</a>
		        </li>
            
		        
		      </ul>
		
		    
		    <div style = "margin-top : 10px" onclick = "location.href='teacherDashboard.jsp'"  class = "logOutDiv">
		
					<img class ="profile-pic" src = "images/notifications.png">
		      
		      </div>
		        
		     <div  class = "logOutDiv">
		
					<img class ="profile-pic" src = "images/moneyIcon.png">
		      
		      </div>
		      
		         
		      <div   onclick = "location.href='home.jsp'"  class = "logOutDiv">
		
					<img class ="logOutIcon" src = "images/logout.gif">
		      
		      </div>
		      
		      
		     
		    </div>
		  </div>
	</nav> 


<button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasWithBothOptions" aria-controls="offcanvasWithBothOptions"><img src = "images/arrow-bar-right.svg" width="50" height="40"></img></button>

			<div class="offcanvas offcanvas-start" data-bs-scroll="true" tabindex="-1" id="offcanvasWithBothOptions" aria-labelledby="offcanvasWithBothOptionsLabel">
			  <div class="offcanvas-header">
			    <h5 class="offcanvas-title" id="offcanvasWithBothOptionsLabel">Menu</h5>
			   	<button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
			  </div>
			  <div class="offcanvas-body">
			    <a href = "teacherDashboard.jsp">Dashboard</a><br>
			    <a href = "#">Subjects</a><br>
			    <a href = "#">Students</a><br>
			    <a href = "LoadSubIdServlet">Exam Results</a><br>
			    <a href = "publishNotice.jsp">Notices</a><br>
			    <a href = "#">Attendance</a><br>
			    <a href = "#">Online Sessions</a><br>
			    
			  </div>
			</div>

<div class = "formDiv">
		
			
			<h1>Exam Details</h1><br>
				<form action = "ExamManagementServlet" method = "POST">
				
					<div class="mb-3">
					  <label for="sub_id" class="form-label" >Subject ID</label>
					  <input type="text" class="form-control" name = "sub_id" required>
					</div>
					
					<div class="mb-3">
					  <label for="Duration" class="form-label">Duration</label>
					  <input type="text" class="form-control"  name = "duration" required>
					</div>
					
					<div class="mb-3">
					  <label for="type" class="form-label">Type</label>
					  <input type="text" class="form-control"  name = "type" required>
					</div>
					
					<div class="mb-3">
					  <label for="weight" class="form-label">Weight</label>
					  <input type="text" class="form-control"  name = "weight" required>
					</div>
					
					
					<div class="mb-3">
					  <label for="description" class="form-label">Description</label>
					  <textarea class="form-control"  rows="5" name = "description" required></textarea>
					</div>
					
						
				
					<input type = "submit" value = "Submit" class="btn btn-primary btn-lg">
						
		
				</form>
			
			</div>	
		
	


</body>
</html>