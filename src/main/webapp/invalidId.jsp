<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" >
	<link rel="stylesheet" type="text/css" href="css/failedPage.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<title>Data Not Found!</title>
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
	
		<div>
			<img src="images/dataNotFound.png" alt="Centered Image" width = "450" height = "450">
		</div>
		
		<div>
			<h2>We couldn't find a match for that student ID.</h2>
		</div>

	</div>

</body>
</html>