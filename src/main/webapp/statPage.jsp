<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/StudentDashboard.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<title>Student Dashboard</title>
	<link rel="icon" type="image/png" href="images/faviconIcon.png">
		


	
</head>
<body>

<!--nav bar -->
	<nav class="navbar navbar-expand-lg bg-body-tertiary" >
		  <div class="container-fluid">
		        <a class="navbar-brand" href="StudentDashboardServlet">
     				 <img src="images/LogoResized.png" alt="LOGO" width="136" height="122"> 
     		    </a>

		    <div class="collapse navbar-collapse" id="navbarSupportedContent">
		    
		      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
		        
		        
		        <li class="nav-item" style = "margin-left : 130px">
		          <a class="nav-link" href="StudentDashboardServlet">Home</a>
		        </li>
		        
		        <li class="nav-item">
		          <a class="nav-link" href="viewResult.jsp">Results</a>
		        </li>
		        
		        <li class="nav-item" >
		          <a class="nav-link" href="#">FAQ</a>
		        </li>
            
		        
		      </ul>
		
		    
		    <div style = "margin-top : 10px" onclick = "location.href='StudentDashboardServlet'"  class = "logOutDiv">
		
					<img class ="profile-pic" src = "images/notifications.png">
		      
		      </div>
		        
		     <div   onclick = "location.href='paymentPage.jsp'" class = "logOutDiv">
		
					<img class ="profile-pic" src = "images/moneyIcon.png">
		      
		      </div>
		      
		         
		      <div   onclick = "location.href='home.jsp'"  class = "logOutDiv">
		
					<img class ="logOutIcon" src = "images/logout.gif">
		      
		      </div>
		      
		      
		     
		    </div>
		  </div>
	</nav> 

		<div class = "mainDiv">
	
	
		<h1>Statistics</h1>
		
		
			<form action = "statPageServlet" method = "POST"  class="d-flex searchBar" >
			
	      		<input class="form-control me-2" type="search" placeholder="Student Number" name = "stdId" required>
	      		<div class = "btn-class"><input class = "btn btn-primary btn-lg" type = "submit" value = "Search" ></div>
	
	   		 </form>
	   		 
	   		 <hr style = "margin : 0px 40px 40px 0px">
	   		 
	   		  <!-- displays student information -->
	   		<div style = "margin-bottom : 61px">
	   		
	   		 <div class = "leftDiv">
	   		 
	   		  	  <span class = "regno">Registration No : </span>
		   		 	 <c:forEach items = "${student}" var = "student">
		  	     
			  	  	 	 <span class = "info">${student.stdId}</span><br>
			  	  	  
			  	  	 </c:forEach> 
			  	  	 
			  	  	 
			  	   <span class = "regno">Full Name : </span>
			  	   <c:forEach items = "${student}" var = "student">  
			  	   
			  	    	<span class = "info">${student.fName}  ${student.lName}</span><br><br>
			  	     
			  	   </c:forEach> 
			  
			  	   
			  </div>
	
			   
			  <div class = "rightDiv">	   
			  	     <span class = "regno">GPA : </span><span class = "info">${gpa}</span><br>
			  	     <span class = "regno">Credits : </span><span class = "info">${credits}</span><br>
			  	     
			  	     
			  	      <div style = "margin-bottom : 40px"><span class = "regno">Grade Points : </span><span class = "info">${cPoints}</span><br></div>
			  	   
	  	     </div>
	   
	  	     </div> 
	  	    

	  	     <!-- Shows the results -->
	  	    
	   		<div style = " margin : 62px 40px 0px 0px"> 
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
	   	</div>
	   	
	







</body>
</html>