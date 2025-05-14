<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" >
	<link rel="stylesheet" type="text/css" href= "css/publishResult.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<title>Result Management</title>
	<link rel="icon" type="image/png" href="images/faviconIcon.png">

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
		          <a class="nav-link" href="viewStdInfo.jsp">Students</a>
		        </li>
		        
		        <li class="nav-item" >
		          <a class="nav-link" href="#">FAQ</a>
		        </li>
            
		        
		      </ul>
		
		    
		    <div style = "margin-top : 10px" onclick = "location.href='teacherDashboard.jsp'"  class = "logOutDiv">
		
					<img class ="profile-pic" src = "images/notifications.png">
		      
		      </div>
		        
		     <div   onclick = "" class = "logOutDiv">
		
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
			    <a href = "https://meet.google.com/landing" target = "_blank">Online Sessions</a><br>
			    
			  </div>
			</div>
			
			<!-- search bar -->
			
			<div class = "mainDiv" >
			
				<div style = "margin : 66px 300px 70px 300px">
				
					<form action = "StdInfoServlet" method = "POST"  class="d-flex searchBar" >
					
			      		<input class="form-control me-2" type="search" placeholder="Registration No" name = "stdId" required>
			      		<div class = "btn-class"><input class = "btn btn-primary btn-lg" type = "submit" value = "Search" ></div>
			
			   		 </form>
		   		 </div>
		   		 
		   		 
		   		 
		   		 <div class = "stdDiv"  >
	
		   		 	<h2 > <img src="images/student.png" alt="LOGO" class = "headingLogo">Student Information </h2> 
		   		 	
		   		 	<c:forEach items = "${student}" var = "student">
			   		 	<div><b>Registration No :</b> ${student.stdId}</div>
			   		 	<div><b>Name : </b>${student.fName} ${student.lName}</div>
			   		 	<div style = "margin-right : 0px"><b>Email :</b> ${student.email}</div>
			   		 	<div><b>Phone :</b> ${student.phone}</div>
			   		 	<div><b>Address :</b> ${student.address}</div>
			   		 	<div><b>NIC : </b>${student.NIC}</div>
		   		 	
		   		 	</c:forEach>
		   		 
		   		 
		   		 </div>
	 
		   		 
		   		 <div  class = "acDiv" >
		   		 
		   		 	<h2><img src="images/book-alt.png" alt="LOGO" class = "headingLogo">Acadamic Performance</h2>
		   		 
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
		
		   		 
		   		  <div class = "parentDiv">
		   		 
		   		 	<h2 style = "margin-bottom : 40px"><img src="images/family.png" alt="LOGO" class = "headingLogo">Guardian Information</h2>
		   		 	
		   		 	<c:forEach items = "${student}" var = "student">
		   		 	
			   		 	<div><b>Name :</b> ${student.pName}</div>
			   		 	<div><b>Phone : </b>${student.pPhone}</div>
			   		 	<div style = "margin-right : 0px"><b>NIC :</b> ${student.pNIC}</div>
			   		 	<div><b>Occupation :</b> ${student.occupation}</div>
			   		 	<div><b>Nationality :</b> ${student.nationality}</div>
		   		 	
		   		 	</c:forEach>
		   		 
		   		 
		   		 </div>
	   		 
	   		 
	   		 
	   		 
	   		 
	   		 </div>
	   		 
	   		 
	   		 
	   		 
	   		 
	   		 
	   		 
	   		 

</body>
</html>