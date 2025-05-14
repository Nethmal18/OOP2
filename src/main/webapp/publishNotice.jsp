<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
   
    %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" >
		<link rel="stylesheet" type="text/css" href="css/noticePage.css">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" ></script>
		
		<title>Create Notice</title>
		<link rel="icon" type="image/png" href="images/faviconIcon.png">
		
		<style>
		
		body, html{
	
		height : 100%;
		width : 100%;
		background-color: white;
		color : black;
		background-image: url('images/Teacher-bro.png') ;
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
		<%--this is the main DIV--%>
	
			<div class = "mainDiv">

			
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
			    <a href = "#">Exam Results</a><br>
			    <a href = "publishNotice.jsp">Notices</a><br>
			    <a href = "#">Attendance</a><br>
			    <a href = "#">Online Sessions</a><br>
			    
			  </div>
			</div>
			
			<div class = "formDiv">
		
			
			<h1>Create Notice</h1><br>
				<form action = "noticeServlet" method = "POST">
				
					<div class="mb-3">
					  <label for="teacher_id" class="form-label" >Teacher ID</label>
					  <input type="text" class="form-control" name = "teacher_id" required>
					</div>
					
					<div class="mb-3">
					  <label for="teacher_id" class="form-label">Title</label>
					  <input type="text" class="form-control"  name = "title" required>
					</div>
					
					<div class="mb-3">
					  <label for="description" class="form-label">Description</label>
					  <textarea class="form-control"  rows="5" name = "description" required></textarea>
					</div>
					
					<div class="mb-3">
					  <label for="type" class="form-label">Notice Type</label>
					  <select class="form-control" placeholder = "Type" name = "type" required>
						  <option  value = General>General</option>
						  <option value = "Urgent">Urgent</option>
					  </select>
					</div>
						
				
					<button type="submit" class="btn btn-primary btn-lg">Publish</button>
						
		
				</form>
			
			</div>	
		
			</div>
	
	
</body>

</html>