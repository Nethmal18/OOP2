<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student List</title>
    <link rel="stylesheet" type="text/css" href="css/tables.css">
    <link rel="stylesheet" type="text/css" href="css/button.css">
    <link rel="stylesheet" type="text/css" href="css/button1.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">   
    <style>
    
    	body {
            font-family: Arial, sans-serif;
        }
        
    	table {
		  width: 95%; /* Reduced from 100% to 90% */
		  margin: 20px auto; /* Centers the table horizontally */
		  border-collapse: collapse;
		  background-color: white;
		  border-radius: 8px;
		  overflow: hidden;
		  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
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
		
    <br><br><br>
    <!-- <button class="custom-button" onclick="window.location.href='InsertStudent.jsp'">+Add New</button> -->
	 <div class="add-new-container">
	    <div class="add-new-box" onclick="window.location.href='InsertStudent.jsp'">
	  			<div class="add-new-icon">+</div>
	  			<div class="add-new-text">Add New</div>
		</div>
    </div>
    <br><br><br>
    <table class="table">
    <thead class="thead-dark">
        <tr>
            <th scope="col">ID</th>
            <th scope="col">First Name</th>
            <th scope="col">Last Name</th>
            <th scope="col">Email</th>
            <th scope="col">Phone</th>
            <th scope="col">Address</th>
            <th scope="col">NIC</th>
            <th scope="col">DOB</th>
            <th scope="col">Password</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
    <!-- Passing details from Servlet-->
        <c:forEach var="st" items="${stdDetails}">
        
        <!-- Create and assigns values to variables In purpose of display data when updating-->
        <c:set var="sid" value="${st.sid }" />
        <c:set var="fname" value="${st.fname }" />
        <c:set var="lname" value="${st.lname }" />
        <c:set var="email" value="${st.email }" />
        <c:set var="phone" value="${st.phone }" />
        <c:set var="address" value="${st.address }" />
        <c:set var="nic" value="${st.nic }" />
        <c:set var="dob" value="${st.dob }" />
         <c:set var="pass" value="${st.pass }" />
         
            <tr>
                <td >${st.sid}</td>
                <td>${st.fname}</td>
                <td>${st.lname}</td>
                <td>${st.email}</td>
                <td>${st.phone}</td>
                <td>${st.address}</td>
                <td>${st.nic}</td>
                <td>${st.dob}</td>
                <td>${st.pass}</td>
                <td>
                <!-- For Update -->
                	<c:url value="UpdateStudent.jsp" var="update">
                		<c:param name="sid" value="${sid}" />
                		<c:param name="fname" value="${fname}" />
                		<c:param name="lname" value="${lname}" />
                		<c:param name="email" value="${email}" />
                		<c:param name="phone" value="${phone}" />
                		<c:param name="address" value="${address}" />
                		<c:param name="nic" value="${nic}" />
                		<c:param name="dob" value="${dob}" />
                		<c:param name="pass" value="${pass}" />
                	</c:url>
                	<!-- For Delete -->
                	<c:url value="UpdateStudent.jsp" var="delete">
                		<c:param name="sid" value="${sid}" />
                		<c:param name="fname" value="${fname}" />
                		<c:param name="lname" value="${lname}" />
                		<c:param name="email" value="${email}" />
                		<c:param name="phone" value="${phone}" />
                		<c:param name="address" value="${address}" />
                		<c:param name="nic" value="${nic}" />
                		<c:param name="dob" value="${dob}" />
                		<c:param name="pass" value="${pass}" />
                	</c:url>
                	
                	<a href="${update}"><button class="custom-button">Update</button></a>
                	
                	<!-- Delete Button with Form (POST) -->
						<form method="post" action="DeleteStdServlet" style="display:inline;" onsubmit="return confirm('Are you sure you want to delete this student?');">
						    <input type="hidden" name="sid" value="${sid}" />
						    <input type="hidden" name="action" value="delete" />
						    <button type="submit" class="custom-button" id="ID">Delete</button>
						</form>
				</td>
            </tr>
        </c:forEach>
    </tbody>
    </table>
</body>
</html>
