<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
    
    <!-- this check the database all the time whenever the user comes to the dashboard -->
    <%
    if (request.getAttribute("notices") == null) {
        response.sendRedirect("TeacherDashBoardServlet"); 
    }
	%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" >
	<link rel="stylesheet" type="text/css" href="css/teacherDashboard.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<title>Teacher Dashboard</title>
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



	<!--this is the main DIV-->
	
		<div class = "mainDiv">

			<!--  off canvas menu -->
			<button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasWithBothOptions" aria-controls="offcanvasWithBothOptions"><img src = "images/arrow-bar-right.svg" width="50" height="40"></img></button>

			<div class="offcanvas offcanvas-start" data-bs-scroll="true" tabindex="-1" id="offcanvasWithBothOptions" aria-labelledby="offcanvasWithBothOptionsLabel">
			  <div class="offcanvas-header">
			    <h5 class="offcanvas-title" id="offcanvasWithBothOptionsLabel">Menu</h5>
			   	<button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
			  </div>
			  <div class="offcanvas-body">
			    <a href = "teacherDashboard.jsp">Dashboard</a><br>
			    <a href = "#">Subjects</a><br>
			    <a href = "viewStdInfo.jsp">Students</a><br>
			    <a href = "LoadSubIdServlet">Exam Results</a><br>
			    <a href = "publishNotice.jsp">Notices</a><br>
			    <a href = "">Attendance</a><br>
			    <a href = "https://meet.google.com/landing" target = "_blank">Online Sessions</a><br>
			    
			  </div>
			</div>
			
			<!-- main content -->
			
			<div style = "margin: 20px 100px 70px 100px;">
			
				<!-- 1stButton -->
				
				<!--  this StudentNoticeServlet is temporary. it should be removed once the login part is done -->
				
				<a href = "viewStdInfo.jsp">
					<div class="card" style = "background-image: linear-gradient(45deg, rgb(77, 76, 172), rgb(90, 89, 171)" >
					  <div class="card-body">
					    <h5 class="card-title">Student Information</h5>
					    <img class = "btnIcon" src = "images\graduated.png" alt = "graduate Image" width = "50px" height = "50px">
					   
					  </div>
					</div>
					
					
				</a>
					
				<!-- 2nd Button -->
				
				<a href = "ExamManagement.jsp">
					<div class="card" style = "background-image : linear-gradient(45deg, #9698d6, #a9abdb) !important;">
					  <div class="card-body">
					    <h5 class="card-title">Exam Management</h5>
					     <img class = "btnIcon" src = "images\exam.png" alt = "graduate Image" width = "45px" height = "45px">
					   
					  </div>
					</div>
					
				</a>
				
				<!-- 3rd button -->
					
				<a href = "publishNotice.jsp"> 
					<div class="card" style = "background-image: linear-gradient(45deg, #ff808b, #f79099) !important">
					
					  <div class="card-body">
					    <h5 class="card-title">Create Notice</h5>
					     <img class = "btnIcon" src = "images\chat.png" alt = "speech-bubble.png" width = "50px" height = "50px">
					    
					  </div>
					</div>
					
					</a>
					
				<!--  4th button -->
				
				<a href = "LoadSubIdServlet"> 
				<div class="card" style = "margin-right : 0px; background-image: linear-gradient(45deg, #5e81f4, #7191f7) !important">
				  <div class="card-body">
				    <h5 class="card-title">Enter Results</h5>
				     <img class = "btnIcon" src = "images/grade.png" alt = "meeting Image" width = "50px" height = "50px">
				    
				  </div>
				</div>
				
				</a>
			
			</div>
	
		<!-- Notices will be displayed -->
			
	
			<c:if test="${empty notices}">
    			<p>No notices available at the moment.</p>
			</c:if>
	    
	   
	   
	    <!-- attribute name and items name should be the same -->
	        <c:forEach items ="${notices}" var="notice">
	 
			<div class = "alertDev">

				<div class="alert" >
				
				  <h4 class="alert-heading">${notice.title}</h4>
				  <p>${notice.description}</p>
				  
				  <hr>
				  
				  <div style = "display : inline-block; width : 100%">
					  <p class="mb-0">${notice.date}</p> 
					  
					   <form style = "float : right" action="updateNotice.jsp" method="post">
					   	
					   	<!--  passing values to the updateNotice.jsp -->
			    			<input type="hidden" name="notice_id" value="${notice.noticeId}">
			    			<input type="hidden" name="teacher_id" value="${notice.tid}">
		                    <input type="hidden" name="title" value="${notice.title}">
		                    <input type="hidden" name="description" value="${notice.description}">
		                    <input type="hidden" name="type" value="${notice.type}">
		                    <input type="hidden" name="date" value="${notice.date}">
					    			
			   				<button style = "float : right" type="submit" class="btn btn-primary btn-lg"><img src = "images/settings.png" alt = "icon" width = "25px" height = "25px"></button>	 
						</form>
				  </div>
				  </div>
				  
				
			</div>

		</c:forEach>
		
		
		</div>
	
	
		


</body>
</html>