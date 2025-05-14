<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
 <%@ page import = "com.school.Controller.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" >
	<link rel="stylesheet" type="text/css" href="css/StudentDashboard.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<title>Student Dashboard</title>
	<link rel="icon" type="image/png" href="images/faviconIcon.png">
	
</head>
<body>
	
	<!--nav bar -->
	<nav class="navbar navbar-expand-lg bg-body-tertiary" >
		  <div class="container-fluid">
		        <a class="navbar-brand" href="studentDashboard.jsp">
     				 <img src="images/LogoResized.png" alt="LOGO" width="136" height="122"> 
     		    </a>

		    <div class="collapse navbar-collapse" id="navbarSupportedContent">
		    
		      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
		        
		        
		        <li class="nav-item" style = "margin-left : 130px">
		          <a class="nav-link" href="StudentDashboardServlet">Home</a>
		        </li>
		        
		        <li class="nav-item">
		          <a class="nav-link" href="viewResult.jsp">Exam</a>
		        </li>
		        
		        <li class="nav-item" >
		          <a class="nav-link" href="#">FAQ</a>
		        </li>
            
		        
		      </ul>
		
		    
		            
		      
		      <div   onclick = "location.href='home.jsp'"  class = "logOutDiv">
		
					<img class ="logOutIcon" src = "images/signOut.png">
		      
		      </div>
		      
		        
		      <div class = "profile-pic">
			   	  	
				<img class ="profile-pic img" src = "images/profilePic.png">
		      </div>
		      
		     
		    </div>
		  </div>
	</nav> 
	
	<div class = "mainDiv">
	
	
		<h1>Exam Results</h1>
		<div class = "leftDiv">
		
			<form action = "ViewResultServlet" method = "POST"  class="d-flex searchBar" >
			
	      		<input class="form-control me-2" type="search" placeholder="Student Number" name = "stdId" required>
	      		<input type="submit" class = "btn btn-success btn-lg" value="submit">
	      		<!-- <div class = "btn-class"><input class = "btn btn-primary btn-lg" type = "submit" value = "Search" ></div> -->
	
	   		 </form>
	   		 
	   		  <hr style = "margin-bottom: 35px">
	   		 
	  
	  		 <!-- displays student information -->
	  	     <c:forEach items = "${student}" var = "student">
	  	     
		  	     <span class = "regno">Registration No : </span><span class = "info">${student.stdId}</span><br>
		  	     <div style = "margin-bottom : 40px"><span class = "regno">Full Name : </span><span class = "info">${student.fName}  ${student.lName}</span></div>
		  	     
	  	     </c:forEach>
	  	     
	  	    
	  	     

	   		   <table class="table">
				  <thead>
				    <tr>
				      <th>Subject ID</th>
				      <th>Subject</th>
				      <th>Credits</th>
				      <th>Marks</th>
				      <th>Grade</th>
				    </tr>
				  </thead>
			 	</table>
	   		 	
	 
	  	 	 <!-- Displays results -->
	   		    <c:forEach items = "${result}" var = "result">
	   		    
				 <table class="table table-striped"> 
				  <tbody>
				    <tr>
				      <td>${result.subId}</td>
				      <td>${result.subName}</td>
				      <td>${result.credit}</td>
				      <td>${result.mark}%</td>
				      <td>${result.grade}</td>
				    </tr>
				   
				  </tbody>
				</table>
	   		 
	   		 
	   		 </c:forEach>
	   		 

		</div>
	
		<div class = "rightDiv">
		
		<div style = "">

				<!-- 1st Button -->
				
				<!--<a href = "statPage.jsp"></a>-->
					<div class="card" style = "background-image : linear-gradient(45deg, #9698d6, #a9abdb) !important;" onclick="location.href='statPage.jsp'">
					  <div class="card-body">
					    <h5 class="card-title">Current Statistics</h5>
					     <img class = "btnIcon" src = "images\exam.png" alt = "graduate Image" width = "45px" height = "45px">
					   
					  </div>
					</div>
					
				
				
				<!-- 2nd button -->
					
				
					<div class="card" style = "background-image: linear-gradient(45deg, #ff808b, #f79099) !important" onclick="location.href='#'">
					
					  <div class="card-body">
					     <h5 class="card-title">Time Table</h5>
					     <img class = "btnIcon" src = "images\event.png" alt = "speech-bubble.png" width = "50px" height = "50px">
					    
					  </div>
					</div>
					
				
					
				<!--  3rd button -->
				
				
				<div class="card" style = "margin-right : 0px; background-image: linear-gradient(45deg, #5e81f4, #7191f7) !important" onclick="location.href='paymentServlet'">
				  <div class="card-body">
				    <h5 class="card-title">Make Payment</h5>
				     <img class = "btnIcon" src = "images/money.png" alt = "meeting Image" width = "50px" height = "50px">
				    
				  </div>
				</div>
				
				
		
		
		 </div>
		
		
		
		
		</div>
		
	</div>


</body>
</html>