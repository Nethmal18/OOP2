<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert Student</title>
  <!-- Bootstrap & FontAwesome CDN -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

  <style>
    body {
	  background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('images/app2.png');  
	  background-size: cover;  
	  background-position: center;  
	  background-repeat: no-repeat;  
	  min-height: 100vh; 
	  margin: 0;
	  padding: 0;
	  position: relative;
}


    .form-container {
      position: relative;
      z-index: 1;
      background-color: rgba(255, 255, 255, 0.95);
      padding: 40px;
      border-radius: 15px;
      box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2);
      max-width: 800px;
      margin: 80px auto;
    }

    .description {
      font-size: 0.9em;
      color: gray;
      margin-left: 3px;
      opacity: 0;
      visibility: hidden;
      transition: opacity 0.3s ease, visibility 0.3s ease;
    }

    .description.show {
      opacity: 1;
      visibility: visible;
    }
    /* for the navBar */


	.nav-item 
	{
		margin-right : 50px;
	}
	
	.nav-item a:hover{
		
		color : royalblue;
	}
	
	.navbar-brand {
	
	  font-size: var(--bs-navbar-brand-font-size);
	  color: var(--bs-navbar-brand-color);
	  text-decoration: none;
	  white-space: nowrap;
	  top: -23px;
	  left: -8px;
	  position:absolute;
	  height : 50px;
	  margin-top : 0px;
	}
	
	.navbar 
	{
		height : 80px !important;
	}
	
	
	.logOutDiv {
	  display: inline-block;
	  margin-right: 0px;
	  transition-duration: 0.5s;
	}
	
	
	.logOutDiv:hover 
	{
		scale : 110%;
		transition-duration: 0.5s;
	}
	
	
	.pfpDiv 
	{
		display : inline-block;
		margin-right: 60px;
	}
	
	
	.logOutIcon 
	{
		width: 70px;
	 	 height: 70px;
	}
	
	.profile-pic {
	  width: 43px;
	  height: 43px;
	  margin-right: 23px;
	}
	
	.profile-pic img {
	            width: 100%;
	            height: 100%;
	 }
  </style>
</head>
<body>

<!--nav bar -->
	<nav class="navbar navbar-expand-lg bg-body-tertiary" >
		  <div class="container-fluid">
		        <a class="navbar-brand" href="CountServlet">
     				 <img src="images/LogoResized.png" alt="LOGO" width="136" height="122"> 
     		    </a>

		    <div class="collapse navbar-collapse" id="navbarSupportedContent">
		    
		      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
		        
		        
		        <li class="nav-item" style = "margin-left : 130px">
		          <a class="nav-link" href="admin.jsp">Home</a>
		        </li>
		        
		        <li class="nav-item">
		          <a class="nav-link" href="STservlet">Students</a>
		        </li>
		        
		        <li class="nav-item">
		          <a class="nav-link" href="TeacherServlet">Teachers</a>
		        </li>
		        
		        <li class="nav-item">
		          <a class="nav-link" href="AdminServlet">Administration</a>
		        </li>
		        
		        
            
		        
		      </ul>
		    
		    <div style = "margin-top : 10px" onclick = "location.href='CountServlet'"  class = "logOutDiv">
		
					<img class ="profile-pic" src = "images/notifications.png">
		      
		      </div>
		      
		      
		      <div   onclick = "location.href='home.jsp'"  class = "logOutDiv">
					<img class ="logOutIcon" src = "images/logout.gif">
		      
		      </div>
		      
	
		    </div>
		  </div>
	</nav> 
  <div class="container">
    <div class="form-container">
      <h2 class="mb-4 text-center">Insert Student</h2>
      <form action="StudentInsert" method="POST">
        <!-- Student ID with description -->
        <div class="mb-3">
          <label for="username" class="form-label">Student ID</label>
          <input type="text" id="username" name="sid" class="form-control" value="ST" required
                 pattern="ST\d{5}" title="Student ID must start with 'ST' followed by 5 digits">
          <div id="desc" class="description">Enter 7 characters (ST + 5 digits)</div>
        </div>

        <script>
          const input = document.getElementById("username");
          const desc = document.getElementById("desc");

          input.addEventListener("focus", function () {
            desc.classList.add("show");
          });

          input.addEventListener("blur", function () {
            desc.classList.remove("show");
          });
        </script>

        <div class="mb-3">
          <label class="form-label">First Name</label>
          <input type="text" name="fname" class="form-control" required>
        </div>
        <div class="mb-3">
          <label class="form-label">Last Name</label>
          <input type="text" name="lname" class="form-control" required>
        </div>
        <div class="mb-3">
          <label class="form-label">Email</label>
          <input type="email" name="email" class="form-control" required>
        </div>
        <div class="mb-3">
          <label class="form-label">Phone</label>
          <input type="text" name="phone" class="form-control" required>
        </div>
        <div class="mb-3">
          <label class="form-label">Address</label>
          <textarea name="address" rows="2" class="form-control" placeholder="Enter your address" required></textarea>
        </div>
        <div class="mb-3">
          <label class="form-label">NIC</label>
          <input type="text" name="nic" class="form-control" required>
        </div>
        <div class="mb-3">
          <label class="form-label">Date of Birth</label>
          <input type="date" name="dob" class="form-control" required>
        </div>
        <div class="mb-4">
          <label class="form-label">Password</label>
          <input type="password" name="pass" class="form-control" required>
        </div>

        <div class="row">
          <div class="col-md-6 d-grid">
            <button type="submit" class="btn btn-primary">
              <i class="fa fa-paper-plane"></i> Submit
            </button>
          </div>
          <div class="col-md-6 d-grid">
            <button type="reset" class="btn btn-secondary">
              <i class="fa fa-rotate-left"></i> Reset
            </button>
          </div>
        </div>
      </form>
    </div>
  </div>
</body>
</html>
