<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" >
	<link rel="stylesheet" type="text/css" href="css/paymentPage.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<title>Payment Portal</title>
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
 <h1 style = "margin : 50px 0px 50px 100px">Add Payment Method</h1><br>
 
 		<div class = "cardForm leftDiv">
			
				<form action = "AddCardServlet" method = "POST">
				
					<div class="mb-3">
					  <label for="cardNum" class="form-label" >Card Number</label>
					  <input type="text" class="form-control" name = "cardNum" required>
					</div>
					
					<div class="mb-3">
					  <label for="expDate" class="form-label">Exp. Date</label>
					  <input type="text" class="form-control"  name = "expDate" required>
					</div>
					
					<div class="mb-3">
					  <label for="cvv" class="form-label">CVV</label>
					  <input type = "text" class="form-control"  name = "cvv" required>
					</div>
					
					<div class="mb-3">
					  <label for="bank" class="form-label">Bank</label>
					  <select class="form-control" name = "bank" required>
						  <option  value = "HNB">HNB</option>
						  <option value = "Commercial Bank">Commercial</option>
						  <option value = "NDB">NDB</option>
						  <option value = "Sampath">Sampath Bank</option>
						  <option value = "BOC">BOC</option>
						     
					  </select>
					</div>
						
				
					<button type="submit" class="btn btn-primary btn-lg">Save</button>
						
		
				</form>
			
			</div>
		
				<div class = "rightDiv imageDiv" >
				
					<img src = "images/creditCard.png" width = "500px" height = "500px">
				
	
			</div>	
		
 
 
 
 
 
 
 
 

</body>
</html>