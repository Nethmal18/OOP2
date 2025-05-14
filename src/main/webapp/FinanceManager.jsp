<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Finance Dashboard</title>
    <link rel="stylesheet" href="css/FinanceManager.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="teacherDashboard.css">
	
	<style>
	
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
		        <a class="navbar-brand" href="FinanceManager.jsp">
     				 <img src="images/LogoResized.png" alt="LOGO" width="136" height="122"> 
     		    </a>

		    <div class="collapse navbar-collapse" id="navbarSupportedContent">
		    
		      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
		        
		        
		        <li class="nav-item" style = "margin-left : 130px">
		          <a class="nav-link" href="FinanceManager.jsp">Home</a>
		        </li>
		        
		        <li class="nav-item">
		          <a class="nav-link" href="IncomeServlet">Incomes</a>
		        </li>
		        
		        <li class="nav-item">
		          <a class="nav-link" href="ExpensesServlet">Expenses</a>
		        </li>
		        
           
		      </ul>
		
		    <div style = "margin-top : 10px" onclick = "location.href='FinanceManager.jsp'"  class = "logOutDiv">
		
					<img class ="profile-pic" src = "images/notifications.png">
		      
		      </div>
		     
		      
		      <div   onclick = "location.href='home.jsp'"  class = "logOutDiv">
		
					<img class ="logOutIcon" src = "images/logout.gif">
		      
		      </div>
		   
		     
		    </div>
		  </div>
	</nav>  

  
    <div class="container">
        <div class="left-image">
            <img src="images/finance.png" alt="Finance Image" />
        </div>

        <div class="dashboard-card">
            <h1 class="dashboard-title">Finance Management</h1>

            <div class="box-container">
                <!-- Changed to redirect to servlet instead of directly to JSP -->
                <button onclick="location.href='ExpensesServlet'" class="box">Expenses</button>
                <!-- Changed to redirect to servlet instead of directly to JSP -->
                <button onclick="location.href='IncomeServlet'" class="box">Income Sources</button>
            </div>

            <div id="piechart" class="chart"></div>
        </div>
    </div>
</body>
</html>
