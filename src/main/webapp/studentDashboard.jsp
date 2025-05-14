<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
       <%
	    if (request.getAttribute("notices") == null) {
	        response.sendRedirect("StudentDashboardServlet");
	    }
     
	%>
 
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

		<div class = "leftDiv">
		
		
			<h1>Upcoming Exams</h1>
			
			<div class = "examDiv">	
			
			<c:forEach items = "${Exams}" var = "exam">
				<div class = "examInfo">
				
					
			
						<h1 >${exam.sub_id} - ${exam.type }</h1>
						
						<ul>
							<li>${exam.description}
							<li>${exam.duration} mins.
							<li>${exam.weight}
							<li>${exam.date}
						</ul>
		
				</div>
			
			</c:forEach>
	
			</div>
			
			<h1>Notices</h1>
			
	 <c:if test="${empty notices}">
    	<p>No notices available at the moment.</p>
	 </c:if>
			
	<c:forEach items = "${notices}" var = "notice">
	
		<div class = "alertDev">

				<div class="alert" >
				
				  <h4 class="alert-heading">${notice.title}</h4>
				  <p>${notice.description}</p>
				  
				  <hr>
				  
				  <div style = "display : inline-block; width : 100%">
					  <p class="mb-0">${notice.date}</p> 	  
				  </div>	  
				
				</div>
			</div>
	</c:forEach>  
			
	
		</div>
		
		<div class = "rightDiv">
		<div style = "margin-top : 102px"><!-- <a href="location.jsp"></a> -->
					<div class="card" style = "background-image: linear-gradient(45deg, rgb(77, 76, 172), rgb(90, 89, 171)" onclick="location.href='viewResult.jsp'">
					  <div class="card-body">
					    <h5 class="card-title">Exam Results</h5>
					    <img class = "btnIcon" src = "images\grade.png" alt = "graduate Image" width = "50px" height = "50px">
					   
					  </div>
					</div>
				<!-- 2nd Button -->
				<!--<a href = "statPage.jsp"></a>-->
					<div class="card" style = "background-image : linear-gradient(45deg, #9698d6, #a9abdb) !important;" onclick="location.href='statPage.jsp'">
					  <div class="card-body">
					    <h5 class="card-title">Current Statistics</h5>
					     <img class = "btnIcon" src = "images\exam.png" alt = "graduate Image" width = "45px" height = "45px">
					  </div>
					</div>
				<!-- 3rd button -->
				<!--<a href = "#"></a>--> 
					<div class="card" style = "background-image: linear-gradient(45deg, #ff808b, #f79099) !important" onclick="location.href='#'">
					
					  <div class="card-body">
					    <h5 class="card-title">Time Table</h5>
					     <img class = "btnIcon" src = "images\event.png" alt = "speech-bubble.png" width = "50px" height = "50px">
					    
					  </div>
					</div>
				<!--  4th button -->
				
				<!--<a href = paymentPage.jsp target = "_blank"></a> --> 
				<div class="card" style = "margin-right : 0px; background-image: linear-gradient(45deg, #5e81f4, #7191f7) !important" onclick="location.href='paymentPage.jsp'">
				  <div class="card-body">
				    <h5 class="card-title">Make Payment</h5>
				     <img class = "btnIcon" src = "images/money.png" alt = "meeting Image" width = "50px" height = "50px">
				    
				  </div>
				</div>
		 </div>
		</div>
	</div>
	
	
	<!-- on the right hand side -->
	<!-- Displaying exam details -->
	
</body>
</html>