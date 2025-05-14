<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" >
		<link rel = "stylesheet" type = "text/css" href = "css/updateNotice.css">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" ></script>
		
		<title>Update Notice</title>
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
			    <a href = "#">Students</a><br>
			    <a href = "#">Exam Results</a><br>
			    <a href = "publishNotice.jsp">Notices</a><br>
			    <a href = "#">Attendance</a><br>
			    <a href = "#">Online Sessions</a><br>
			    
			  </div>
			</div>


	<!--  Getting data for the relevant notice from the teacherDashboard.jsp-->
	<%
	    
	    String noticeId = request.getParameter("notice_id");
	    String teacherId = request.getParameter("teacher_id");
	    String title = request.getParameter("title");
	    String description = request.getParameter("description");
	    String type = request.getParameter("type");
	    String date = request.getParameter("date");
	%>
	
	<div class = "mainDiv">
	
		<div style = "width : 50%; float : left">
		
		<h1>Update Notice</h1>
			<!-- Form to take update information -->
			<form  class = "formDiv " action = "UpdateNoticeServlet" method = "POST">
		
			
			<input type="hidden" name="notice_id" value = "<%= noticeId %>"/> 
			
						
				<div class="mb-3">
					<label for="teacher_id" class="form-label" >Teacher ID</label>
					<input type="text" class="form-control" name = "teacher_id" value= "<%= teacherId %>" required >
				</div>
							
				<div class="mb-3">
					 <label for="teacher_id" class="form-label">Title</label>
					  <input type="text" class="form-control"  name = "title" value = "<%= title %>"required>
				</div>
							
				<div class="mb-3">
					  <label for="description" class="form-label">Description</label>
					  <textarea class="form-control"  rows="5" name = "description" required><%= description %></textarea>
				</div>
							
				<div class="mb-3">
					  <label for="type" class="form-label">Notice Type</label>
					  <select class="form-control" name = "type" value = "<%= type %>" required>
						  <option  value = General>General</option>
						  <option value = "Urgent">Urgent</option>
					  </select>
				</div>
									
				<center><button type="submit" class="btn btn-lg">Update</button></center>
		
			</form>
		
		
		</div>
		
		<!--  div on the right -->
		<div class = "rightDiv">
			
			<div class="warningDiv card"  >
				 <div class="card-body">
				 	
				 	<p>&#9888 <b>Just a heads-up</b>: This update will replace the existing data. You can update it again later, but it's best to review everything before making changes.</p>
					   
				 </div>
			</div>
			
			
			<div class="deleteDiv card"  >
				 <div class="card-body">
				 	
				 	<h5>Delete Notice</h5>
				 	
				 	<p>Before deleting this notice, please review the following:</p>
				 	<ol>
				 		<li><b>Permanent Action</b>: Deleting a notice will remove it from the system for all users (teachers, students, and parents)</li>
				 		<li><b>No Recovery</b>: Once deleted, this notice cannot be restored. If you need the information later, please ensure you have saved it elsewhere</li>
				 		<li><b>User Responsibility</b>: You are solely responsible for ensuring that this notice is no longer needed</li>
				 		<li><b>Communication Impact</b>: Make sure the notice is not still relevant or in use by the school community</li>
				 		<li><b>Confirmation Required</b>: By proceeding, you confirm that you understand and accept the consequences of this action</li>
				 		
				 	</ol>
				 	
				 	<input type = "checkbox" id = "conditions" onclick = "toggleButton()"> I have read and agree to the terms above<br>
				 	
				 	<form method = "POST" action = "DeleteNoticeServlet">
				 		
				 		<input type="hidden" name="notice_id" value = "<%= noticeId %>"/> 
				 		
				 		<button  class = "btn btnlg center " id = "deleteBtn" value = "Delete" disabled>
				 		
				 			<img src = "images/recycle-bin.png" alt = "chat image" width = "20px" height = "20px">
				 		
				 		</button>
				 		
				 	</form>
		
				 	<!-- function to disables the delete button -->
				 	<script>
				 	
				 		
				 	function toggleButton()
				 	{
				 		var condition = document.getElementById("conditions");
				 		var button = document.getElementById("deleteBtn");
				 		
				 		if(condition.checked)
				 		{
				 			button.disabled = false;
				 		}
				 		else
				 		{
				 			button.disabled = true;
				 		}
				 	
				 	}
				 	
				 	</script>
				 	
				 </div>
			</div>
		
		
		
		
		
		
		
		
		</div>
	
	
	
	
	
	</div>


</body>
</html>