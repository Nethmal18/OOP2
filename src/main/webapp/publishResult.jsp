<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="css/publishResult.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
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
				    <a href = "#">Exam Results</a><br>
				    <a href = "publishNotice.jsp">Notices</a><br>
				    <a href = "#">Attendance</a><br>
				    <a href = "#">Online Sessions</a><br>
				    
				  </div>
			</div>



 	<c:if test="${empty subject}">
    	<p>No subjects available</p>
	</c:if>
	

	<!-- This form takes the subject ID -->
	<form action = "LoadStdServlet" method = "POST">
	
		<div class="form-floating">
		
		<div class = "dropdown">
			<select name = "subId" class="form-select" id="floatingSelect" >
				<c:forEach items ="${subject}" var="subject">
					<option style = "font-size : 15px" value = "${subject.subId}" <c:if test="${selectedSubId == subject.subId}">selected</c:if>>
							${subject.subId} - ${subject.subName}
					</option>
				</c:forEach>
				
			</select>
		</div>
			
			
		<div class = "btn-class"><input class = "btn btn-primary btn-lg" type = "submit" value = "Generate" ></div>
	
		</div>

	
	</form>
	
	<br><br>

	 	 
	 <div class = "tableDiv">	 
	 <form action = "publishResultServlet" method = "POST">
	 		<table class="table table-striped">
			 <thead>
			    <tr>
			      <th scope="col">#</th>
			      <th scope="col">Student</th>
			      <th scope="col">Subject</th>
			      <th scope="col">Marks</th>
			    </tr>
			  </thead>
			  
			  </table>
			  
	 	 <c:forEach items = "${student}" var = "student" varStatus="loop">
		 
			  <table class="table table-striped">
			    <tr>
			      <th scope="row">${loop.index + 1}</th>
			      <td><input type = "text" name = "Std_id[]" value = "${student.stdId}" readonly ></td>
			      <td><input type = "text" name = "examSub_id[]" value = "${student.subId}" readonly></td>
			      <td><input type = "text" name = "marks[]" required></td>
			    </tr>
			    
			  </tbody>
			</table>
			
	
	 	</c:forEach>
	 
	 	<input class = "btn btn-primary btn-lg" style = "margin : 0 auto" type = "submit" value = "Save">
	 
	 </form>
	 
	 </div>
	 	 	
	
	 
	 
	 			
	
	

	
	
	
	
	<br><br>
		
	

</body>
</html>






















